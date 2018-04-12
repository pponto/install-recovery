#!/bin/bash
git clone git://github.com/tonsky/FiraCode.git ~/firacode
mkdir ~/.fonts
mv ~/firacode/distr/ttf ~/.fonts/firacode
fc-cache -v
rm -rf ~/firacode