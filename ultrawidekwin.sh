#!/bin/bash
git clone git@github.com:LucaMoschella/UltrawideWindows.git
mv UltrawideWindows ~/.config
cd ~/.config/UltrawideWindows
plasmapkg2 --type=kwinscript -i .