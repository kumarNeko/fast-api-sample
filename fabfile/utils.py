import os
from fabric.api import env, task, lcd, local, run, runs_once


class ProjectRootContext(object):
    """
    ローカルのプロジェクトルートに lcd するコンテクスト
    """

    def __init__(self, path=None):
        self.path = path

    def __enter__(self):
        set_project_root()
        cd_path = env.project_root
        if self.path:
            if isinstance(self.path, (list, tuple)):
                cd_path = os.path.join(cd_path, *self.path)
            else:
                cd_path = os.path.join(cd_path, self.path)
        self.context = lcd(cd_path)
        self.context.__enter__()

    def __exit__(self, *args, **kwargs):
        self.context.__exit__(*args, **kwargs)


project_root = ProjectRootContext


def set_project_root():
    """
    env.project_root にプロジェクトルートを設定
    """
    if 'project_root' in env:
        return

    env.project_root = get_project_root_path()


def get_project_root_path():
    """
    プロジェクトルートのフルパスを取得
    """
    split_paths = __file__.split(os.path.sep)
    i = split_paths.index('fabfile')
    project_root_path = os.path.sep.join(split_paths[:i])
    return project_root_path
