# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\[\e[30;1m\]\H \[\e[32;1m\]\u \[\e[0m\]\w\[\e[33;1m\]\$(git_branch) \[\e[30;1m\]$ \[\e[0m\]"
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias ls="ls -l --color"
alias sshcon="netstat -W | awk '/:ssh/ {print \$5}'"
