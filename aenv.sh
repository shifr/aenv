#!/usr/bin/env bash

if [ -z "$ENVS_DIR" ]; then
    ENVS_DIR=~/.envs
fi

aenv_run() {
    defIFS=$IFS
    activate=bin/activate
    envDir=.env
    found=false

    while IFS=: read envName projectRoot local
    do          
        if [[ "$PWD" = "$projectRoot"* ]]; then

            if [[ -n $local ]]; then 
                actFile=$projectRoot/$envDir/$activate

                if [[ -e $actFile ]]; then
                    found=true
                    source $actFile
                else
                    echo "Couldn't find $actFile"
                fi
            else
                found=true
                source "$ENVS_DIR/$envName/$activate"
            fi
        fi

    done < ~/.aenv/aenv.conf
    
    if ! $found && [[ -n "$VIRTUAL_ENV" ]]; then
        deactivate
    fi

    IFS=$defIFS
}

aenv_cd()
{
  if builtin cd "$@"
  then
    aenv_run
    return 0
  else
    return $?
  fi
}

cd() {
  aenv_cd "$@"
}

cd .
