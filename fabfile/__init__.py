from fabric.api import env, task, lcd, local, run, runs_once

from . import docker

_dbuild = task()(docker.dbuild)
_dsh = task()(docker.dsh)
_dup = task()(docker.dup)
_ddown = task()(docker.ddown)
_lock_create = task()(docker.lock_create)

