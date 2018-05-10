#!/bin/bash
## Functions
function blank_line {
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
	echo $'\n'
}

## Variables
RPM_SYSTEM="sudo dnf -y"
INSTALL_SOFTWARES="lm_sensors npm firefox chromium htop neofetch transmission util-linux-user unzip git arc-theme vim"

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
$RPM_SYSTEM upgrade

# Blank Line
blank_line

# Installing softwares
echo "Installing softwares" $'\n'
$RPM_SYSTEM install $INSTALL_SOFTWARES

# Blank Line
blank_line

# Installing vlc
echo "Installing vlc" $'\n'
$RPM_SYSTEM install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
$RPM_SYSTEM install vlc
$RPM_SYSTEM install python-vlc npapi-vlc

# Blank Line
blank_line

# Git config
echo "Git config" $'\n'
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"
git config --global core.editor vim
git config --global alias.a add
git config --global alias.s status
git config --global alias.ca "commit -a -m"
git config --global alias.cm "commit -m"
git config --global core.pager cat
git config --global help.autocorrect 1

# Blank Line
blank_line

# Installing vscode
echo "Installing vscode" $'\n'
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
$RPM_SYSTEM check-update
$RPM_SYSTEM install code

# Blank Line
blank_line

# Installing fancontrol
echo "Installing fancontrol" $'\n'
sudo ./fancontrol.sh

# Blank Line
blank_line

# Installing firacode monospace font
echo "Installing firacode monospace font" $'\n'
./firacode-font.sh

# Blank Line
blank_line

# Installing oh-my-zsh
echo "Installing oh-my-zsh" $'\n'
$RPM_SYSTEM install zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)

# Blank Line
blank_line

# Installing spaceship zsh theme
echo "Installing spaceship zsh theme" $'\n'
sudo -H npm install -g spaceship-prompt
sudo ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
echo '!!! You need to set "ZSH_THEME="spaceship" in ~/.zshrc config file !!!' $'\n'
read -p "Press enter to finish: "

# Blank Line
blank_line

# Goodbye
echo "Installation of all basic softwares and packages successful!"
echo "It is recommended that you restart your computer and start afresh."
