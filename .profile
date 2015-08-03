# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export TERM=xterm-256color

if [ -d "$HOME/Tools/go" ] ; then
    export GOROOT=/home/peko/Tools/go
    export GOPATH=$GOROOT/gopath
    export PATH=$GOROOT/bin:$PATH
fi

if [ -d "$HOME/Tools/Nim" ] ; then
    export NIMROOT=/home/peko/Tools/Nim
    export PATH=$NIMROOT/bin:~/.nimble/bin:$PATH
fi

if [ -d "$HOME/Tools/postgres" ] ; then
    export POSTGRES=$HOME/Tools/postgres/9.4/bin
    export PATH=$POSTGRES:$PATH
fi
