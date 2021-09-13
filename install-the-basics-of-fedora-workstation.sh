#!/usr/bin/env bash

echo "** Adding Fusion repos"
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


echo "** Adding flahub remote repo to flatpak"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


echo "** Flatpak Apps Installation"
## Essential IDEs; SDKs and Coding-Related-Tools
flatpak install -y com.visualstudio.code \
com.axosoft.GitKraken \
com.syntevo.SmartGit \
com.jetbrains.Rider \
com.vscodium.codium \

# db-s, html-req, Docs
flatpak install -y io.dbeaver.DBeaverCommunity \
com.getpostman.Postman \

## Additional
# flatpak related
flatpak install -y com.github.tchx84.Flatseal \

# containers:
flatpak install -y com.usebottles.bottles \

# planning and online-communication
flatpak install -y com.discordapp.Discord \
com.github.alainm23.planner \
com.toggl.TogglDesktop \
com.github.marktext.marktext \
com.obsproject.Studio \

# workspace and docs
flatpak install -y com.github.devalien.workspaces \
com.github.mdh34.quickdocs \
io.github.jkozera.ZevDocs \
com.github.phase1geo.minder \
com.jgraph.drawio.desktop \

# office
flatpak install -y com.github.muriloventuroso.pdftricks \

# administration
flatpak install -y com.gitlab.davem.ClamTk \
com.neatdecisions.Detwinner \
io.github.cges30901.hmtimer \
io.github.peazip.PeaZip \
#TODO: finish it off doc-apps etc...

echo "** Install flatpak SDKs - req: sudo"
## SDKs in flatpak - add to code env use: FLATPAK_EXPORT_ENV=dotnet$Verstion,node$Version ... flatpak run code
## FLATPAK_ENABLE_SDK_EXT=dotnet,dotnet5,golang,node14 flatpak run com.visualstudio.code
sudo flatpak install -y org.freedesktop.Sdk.Extension.dotnet//20.08\
org.freedesktop.Sdk.Extension.dotnet5//20.08\
org.freedesktop.Sdk.Extension.golang//20.08\
org.freedesktop.Sdk.Extension.node14//20.08\

echo "** DNF install"

echo "Terminal Basics"
sudo dnf install terminator fzf hstr git zsh vim neovim

echo "Configuring zsh and plugins"

echo 'oh-my-zsh install'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'zsh themes install'
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

echo 'zplug install'
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh\



# curl -> download:
# localuser.d/...
# .bashrc
# .zshrc
# .vimrc


# bash_history
# zsh_history

## INSTALL dnf apps
# opera

sudo tee /etc/yum.repos.d/opera.repo <<RPMREPO
[opera]
name=Opera packages
type=rpm-md
baseurl=https://rpm.opera.com/rpm
gpgcheck=1
gpgkey=https://rpm.opera.com/rpmrepo.key
enabled=1
RPMREPO

sudo dnf install -y opera-stable

## UPDATE

sudo dnf update -y
flatpak update -y

# IF [yes/y];then systemctl reboot -i
