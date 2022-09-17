from .utils import project_root, get_project_root_path
from fabric.api import env, task, lcd, local, run, runs_once


def dbuild():
    with project_root('docker'):
        get_project_root_path()
        local('sh build.sh')


def dsh():
    with project_root('docker'):
        get_project_root_path()
        local('sh docker-compose-run.sh')

def dup():
    with project_root('docker'):
        get_project_root_path()
        local('docker-compose up -d')

def ddown():
    with project_root('docker'):
        get_project_root_path()
        local('docker-compose down')


def lock_create():
    # autoでpipfile.lockを作成する
    with project_root('docker/pipenv-lock-create'):
        get_project_root_path()
        local('sh docker-compose-run.sh')
