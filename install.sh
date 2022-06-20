#! /bin/bash

# request root access to install apps
su

echo "Install basic apps with pkg"
pkg install -y ca_root_nss vscode nano bash wget unzip curl nano terminator py38-pip htop


echo "Install packer"
dlpacker=$(curl -s https://api.github.com/repos/hashicorp/packer/releases/latest | jq .tag_name -r)
packer=${dlpacker/v/}
wget -O /tmp/packer_"$packer"_freebsd_amd64.zip https://releases.hashicorp.com/packer/"$packer"/packer_"$packer"_freebsd_amd64.zip \
&& unzip -o /tmp/packer_"$packer"_freebsd_amd64.zip -d /usr/local/bin/ && rm /tmp/packer_"$packer"_freebsd_amd64.zip

eacho "install terraform"
dlterraform=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | jq .tag_name -r)
terraform=${dlterraform/v/}
wget -O /tmp/terraform_"$terraform"_freebsd_amd64.zip https://releases.hashicorp.com/terraform/$terraform/terraform_"$terraform"_freebsd_amd64.zip \
&& unzip -o /tmp/terraform_"$terraform"_freebsd_amd64.zip -d /usr/local/bin/ && rm /tmp/terraform_"$terraform"_freebsd_amd64.zip

echo "Install azure-cli and dependencies"

pip install azure-cli

