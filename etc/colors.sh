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
# 
# Рут вошел через пользователя 
if [ "$(whoami)" = "root" ]; then
    echo "Welcome ROOT !"
    PS1='\[\e]0;\w\a\]\n\[\e[31;01m\]\u\[\e[0m\]\[\e[32m\]@\h \[\e[33m\]\w\[\e[0m\]\n\[\e[31;01m\]\$\[\e[0m\] '
fi
# -----------------------------------------------------------------------------