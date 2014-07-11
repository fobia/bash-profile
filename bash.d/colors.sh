## bash files version 4.1-1

# Подсветка директорий
DIR_COLORS=
listFiles="/etc/DIR_COLORS /etc/dircolors ~/.local/profile-bash/etc/dircolors ~/.dircolors"
for f in listFiles; do
  [[ -f "$f" ]] && DIR_COLORS="$f"
done
if [[ "$DIR_COLORS" != "" ]]; then
  eval "$(dircolors -b $DIR_COLORS)"
fi
unset f DIR_COLORS listFiles


# Основная строка приглашения
#   user@host:server and current_directory
# PS1='\[\e]0;\w\a\]\n\[\e[32m\]server \u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
#
# С переводом на новую строчку
# PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '

# Без перевода на новую строчку
#PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\$ '
sN='\[\e]0;\w\a\]'
sU='\[\e[07;91m\]\u'
sH='\[\e[00;91m\]@\h:'
sW='\[\e[0m\]\w'
PS1="$sN$sU$sH$sW"'\$ '
unset sN sU sH sW


# Эффективно для рута, подсвечивает красным супераользователя
# PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\e[31;01m\]\u\[\e[0m\]@\h:\w\$ '
#
# Для самого рута
# PS1="\[\e[31m\]\u\[\e[0m\]@\h: \w\a# "
# [\[\e[01;31m\]\u\[\e[0m\]@\h \W]\[\e[01;31m\]\$\[\e[0m\]
#
# Рут вошел через пользователя
if [ "$(whoami)" = "root" ]; then
    echo "Welcome ROOT !"
    PS1='\[\e]0;\w\a\]\n\[\e[31;01m\]\u\[\e[0m\]\[\e[32m\]@\h \[\e[33m\]\w\[\e[0m\]\n\[\e[31;01m\]\$\[\e[0m\] '
fi
# -----------------------------------------------------------------------------


__has_parent_dir () {
    # Utility function so we can test for things like .git/.hg without firing up a
    # separate process
    test -d "$1" && return 0;

    current="."
    while [ ! "$current" -ef "$current/.." ]; do
        if [ -d "$current/$1" ]; then
            return 0;
        fi
        current="$current/..";
    done

    return 1;
}

__vcs_name() {
    if [ -d .svn ]; then
        echo "-[svn]";
    elif __has_parent_dir ".git"; then
        echo "-[$(__git_ps1 'git %s')]";
    elif __has_parent_dir ".hg"; then
        echo "-[hg $(hg branch)]"
    fi
}

black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

# Nicely formatted terminal prompt
export PS1='\n\[$bold\]\[$black\][\[$dk_blue\]\@\[$black\]]-[\[$green\]\u\[$yellow\]@\[$green\]\h\[$black\]]-[\[$pink\]\w\[$black\]]\[\033[0;33m\]$(__vcs_name) \[\033[00m\]\[$reset\]\n\[$reset\]\$ '

