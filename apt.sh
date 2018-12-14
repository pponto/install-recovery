#!/bin/bash
## Functions
function blank_line {
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
	echo $'\n'
}

## Variables
SYSTEM="sudo apt -y"
INSTALL_SOFTWARES="lm-sensors npm firefox chromium-browser htop neofetch kate okular ktorrent gwenview kcalc spectacle vlc ksysguard nodejs npm yakuake util-linux unzip ark git build-essential libpng-dev htop synaptic redshift zsh unar filezilla"
INSTALL_NPM="gulp eslint"

## FEDORA
# Start
echo -e "Enter your github user.name: "
read GIT_USERNAME

echo -e "Enter your github email.id: "
read GIT_EMAIL

# Blank Line
blank_line

# Hello
echo "Thank you for entering your information!" $'\n'
read -p "Press enter to continue: "

# Blank Line
blank_line

# System upgrade
echo "System upgrade" $'\n'
$SYSTEM update
$SYSTEM upgrade

# Blank Line
blank_line

# Installing softwares
echo "Installing softwares" $'\n'
$SYSTEM install $INSTALL_SOFTWARES

# Blank Line
blank_line

# # Installing vlc
# echo "Installing vlc" $'\n'
# $SYSTEM install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
# $SYSTEM install vlc
# $SYSTEM install python-vlc npapi-vlc

# Blank Line
# blank_line

# Git config
echo "Git config" $'\n'
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"
git config --global core.editor nano
git config --global alias.a add
git config --global alias.s status
git config --global alias.cam "commit -a -m"
git config --global alias.cm "commit -m"
git config --global core.pager cat
git config --global help.autocorrect 1

# Blank Line
blank_line

# # Installing vscode
# echo "Installing vscode" $'\n'
# sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
# sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
# $SYSTEM check-update
# $SYSTEM install code

# # Blank Line
# blank_line

# # Installing fancontrol
# echo "Installing fancontrol" $'\n'
# sudo ./fancontrol.sh

# # Blank Line
# blank_line

# Installing firacode monospace font
echo "Installing firacode monospace font" $'\n'
./firacode-font.sh


# Installing UltrawideWindows Kwin Script
echo "Installing UltrawideWindows Kwin Script" $'\n'
./ultrawidekwin.sh

# Blank Line
blank_line

# Installing oh-my-zsh
echo "Installing oh-my-zsh" $'\n'
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)

# Blank Line
blank_line

# Installing spaceship zsh theme
echo "Installing spaceship zsh theme" $'\n'
npm install spaceship-prompt
# sudo -H npm install -g spaceship-prompt
# sudo ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
# echo '!!! You need to set "ZSH_THEME="spaceship" in ~/.zshrc config file !!!' $'\n'

# Blank Line
blank_line

# Installing NPM apps
echo "Installing NPM global apps" $'\n'
sudo npm install -g $INSTALL_NPM

# Bye
echo "GG all!"
read -p "Press enter to finish: "

# Blank Line
blank_line

# Goodbye
echo "Installation of all basic softwares and packages successful!"
echo "It is recommended that you restart your computer and start afresh."
