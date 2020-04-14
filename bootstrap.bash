#!/bin/bash

main() {
    [ -d "$HOME"/.sub ] || \
    git clone -q https://github.com/SakuraCredit/sub.git "$HOME"/.sub 2>/dev/null || \
    git clone -q git@github.com:SakuraCredit/sub.git "$HOME"/.sub 2>/dev/null || \
    git clone https://github.com/SakuraCredit/sub.git "$HOME"/.sub || \
    git clone git@github.com:SakuraCredit/sub.git "$HOME"/.sub

    if [ -f ~/.zshenv ] ; then
        echo 'eval "$("$HOME"/.sub/bin/hatch init -)"' >> ~/.zshenv
    fi
    if [ -f ~/.bashrc ] ; then
        echo 'eval "$("$HOME"/.sub/bin/hatch init -)"' >> ~/.bashrc
    fi
    /bin/bash -c '"$HOME"/.sub/bin/hatch install-packages'
}

echo
echo '=> Close and reopen your terminal, or run the following:'
echo
echo '(Bash) $ source ~/.bashrc'
echo '(Zsh) % source ~/.zshenv'

main
