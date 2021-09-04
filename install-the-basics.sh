#!/usr/bin/env bash

sudo dnf update -y
systemctl reboot -i

echo "** Adding Fusion repos"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


echo "** Adding flahub remote repo to flatpak"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


echo "** Flatpak Apps Installation"
## Essential IDEs; SDKs and Coding-Related-Tools
flatpak install -y com.visualstudio.code \
com.axosoft.GitKraken \
com.syntevo.SmartGit \
com.jetbrains.Rider \
com.vscodium.codium \

io.dbeaver.DBeaverCommunity \
com.getpostman.Postman \

## Additional
# flatpak related
com.github.tchx84.Flatseal \

# containers:
com.usebottles.bottles \

# planning and online-communication
com.discordapp.Discord \
com.github.alainm23.planner \
com.toggl.TogglDesktop \
com.github.marktext.marktext \
com.obsproject.Studio \

# workspace and docs
com.github.devalien.workspaces \
com.github.mdh34.quickdocs \
io.github.jkozera.ZevDocs \
com.github.phase1geo.minder \
com.jgraph.drawio.desktop \

# office
com.github.muriloventuroso.pdftricks \

# administration
com.gitlab.davem.ClamTk \
com.neatdecisions.Detwinner \
io.github.cges30901.hmtimer \
io.github.peazip.PeaZip \

echo "** Install flatpak SDKs"
## SDKs in flatpak - add to code env use: FLATPAK_EXPORT_ENV=dotnet$Verstion,node$Version ... flatpak run code
## FLATPAK_ENABLE_SDK_EXT=dotnet,dotnet5,golang,node14 flatpak run com.visualstudio.code
flatpak install -y org.freedesktop.Sdk.Extension.dotnet//20.08\
org.freedesktop.Sdk.Extension.dotnet5//20.08\
org.freedesktop.Sdk.Extension.golang//20.08\
# org.freedesktop.Sdk.Extension.node//20.08\
org.freedesktop.Sdk.Extension.node14//20.08\

echo "** DNF install"

echo "Terminal Basics"
sudo dnf install terminator fzf hstr git zsh vim neovim

echo "Configuring zsh and plugins"
# .oh-my-zsh -y

# themes

# zplug -y



# curl -> download:
# localuser.d/...
# .bashrc
# .zshrc
# .vimrc


# bash_history
# zsh_history