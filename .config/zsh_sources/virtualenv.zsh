function virtualenv_info { 
    [ $VIRTUAL_ENV ] && echo `basename $VIRTUAL_ENV`
}

# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1
