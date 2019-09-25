#!/bin/bash

# use the correct conf file for mac or linux
if [ X`uname` = XDarwin ]; then
    CONF="${HOME}/.profile"
else
    CONF="${HOME}/.bashrc"
fi

NOW=`date +%F-%T`

# try to make backups before overwiting other files 
if [ -f "${CONF}" ]; then
    cp "${CONF}" "${CONF}.BAK-${NOW}" 
fi
if [ -f "${HOME}/.vimrc" ]; then
    cp "${HOME}/.vimrc" "${HOME}/.vimrc.BAK-${NOW}" 
fi
if [ -f "${HOME}/.inputrc" ]; then
    cp "${HOME}/.inputrc" "${HOME}/.inputrc.BAK-${NOW}" 
fi
if [ -d "${HOME}/.vim/colors" ]; then
    mv "${HOME}/.vim/colors" "${HOME}/.vim/colors.BAK-${NOW}" 
fi

# append these ones 
cat ./bashrc.append >> "${CONF}"
cat ./inputrc.append >> "${HOME}/.inputrc"

# replace these ones
cp ./vimrc "${HOME}/.vimrc"
mkdir -p "${HOME}/.vim/colors" && \
    cp ./colors.vim "${HOME}/.vim/colors"

