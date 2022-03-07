#!/bin/bash
# Bootstrap machine

step=1
step() {
    echo "Step $step $1"
    step=$((step+1))
}

install_openssh() {
    step "===== Installing openssh ====="
    sudo apt update
    sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    sudo apt install -y openssh-server
    sudo systemctl enable ssh
}

setup_root_login() {
    sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    sudo systemctl restart ssh
    sudo echo "root:rootroot" | chpasswd
}

setup_welcome_msg() {
    sudo apt -y install cowsay
    version=$(cat /etc/os-release |grep VERSION= | cut -d'=' -f2 | sed 's/"//g')
    sudo echo -e "\necho \"Welcome to Vagrant Ubuntu Server ${version}\" | cowsay\n" >> /home/vagrant/.bashrc
    sudo ln -s /usr/games/cowsay /usr/local/bin/cowsay
}

main() {
    install_openssh
    setup_root_login
    setup_welcome_msg
}

main