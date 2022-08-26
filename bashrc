#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


### Alias ###

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'

alias lock='qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock'
alias lock='import -window root /tmp/screenshot.png && convert /tmp/screenshot.png -blur 0x4 /tmp/screenshot.png && i3lock -i /tmp/screenshot.png'


### Prompt ###

# Add git branch if its present to PS1
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# print time
print_time() {
 printf "%*s%s\r" "$(tput cols)" "($(date +%H:%M))"
}

# prompt sans heure
PS1='\[\033[00;35m\][${debian_chroot:+($debian_chroot)}\u@\h\[\033[00;35m\]:\[\033[00;36m\]\w\[\033[00;35m\]]\[\033[00;31m\]$(parse_git_branch)\n\[\033[00m\]\$ '
# prompt avec heure
PS1='\[\033[00;33m\]$(print_time)\[\033[00;35m\][${debian_chroot:+($debian_chroot)}\u@\h\[\033[00;35m\]:\[\033[00;36m\]\w\[\033[00;35m\]]\[\033[00;31m\]$(parse_git_branch)\n\[\033[00m\]\$ '


### Completion ###

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion


### Variable ###

# For yaourt/pacman
export VISUAL="vim"
export EDITOR="vim"


### Functions ###

# convert hexadecimal to binary and vice-versa
h2d(){
  echo "ibase=16; $@"|bc
}

d2h(){
  echo "obase=16; $@"|bc
}

# kill baloo utils
baloo_clean(){
  sudo killall baloo_file
  sudo mv /usr/bin/baloo_file /usr/bin/baloo_file.bak
  sudo echo '#!/bin/sh' > /usr/bin/baloo_file
}

# print battery level
battery(){
	upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage
}


### Buildroot override ###
export BR2_DL_DIR=~/BR2_DL_DR

# ********COLOR********
# Palette foncée
# \033[01;30m\] : Noir
# \033[01;31m\] : Rouge
# \033[01;32m\] : Vert
# \033[01;33m\] : Jaune
# \033[01;34m\] : Bleu
# \033[01;35m\] : Violet
# \033[01;36m\] : Cyan
# \033[01;37m\] : Gris
# Palette claire
# \033[00;30m\] : Noir
# \033[00;31m\] : Rouge
# \033[00;32m\] : Vert
# \033[00;33m\] : Jaune
# \033[00;34m\] : Bleu
# \033[00;35m\] : Violet
# \033[00;36m\] : Cyan
# \033[00;37m\] : Gris

