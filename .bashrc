# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Enable bash completion behind sudo
complete -cf sudo

# User specific environment
function git_branch () {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\[\e[30;1m\]\H \[\e[36;1m\]\u \[\e[0m\]\w\[\e[33;1m\]\$(git_branch) \[\e[30;1m\]$ \[\e[0m\]"
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

alias cp='cp -rv'
alias ls='ls --color=auto -CF'
alias ll='ls --color=auto -lF'
alias mv='mv -v'
alias mkdir='mkdir -pv'
alias wget='wget -c'

alias sshcon="netstat -W | awk '/:ssh/ {print \$5}'"


function git-sync {
  git checkout master
  git fetch --all
  git merge upstream/master
  git push origin master
}

function cd {
  builtin cd "$1"
  ls -ACF
}

function vimod {
    vim -p $(git status -suall | awk '{print $2}')
}
