# aenv
Automatic virtualenv activation

## Installation

    $ git clone git@github.com:shifr/aenv.git ~/.aenv
    $ export ENVS_DIR="path_to_dir_with_envs" (default = ~/.envs)
    $ echo 'source ~/.aenv/aenv.sh' >> ~/.bashrc (or ~/.zshrc)

## Configuration
  You should create config file with list of your projects, one project on line:
    ```ENV_NAME:PROJECT_ROOT```
    
    Example:
    $ echo "test:/home/user/Projects/TestProject" > ~/.aenv/aenv.conf
    $ echo "test2:/path_to_projects/project_root" >> ~/.aenv/aenv.conf

## How it works
  
  Script checks if current dir equals dir from aenv.conf file and activate env by env_name in **ENVS_DIR**
