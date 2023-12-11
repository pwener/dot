sudo apt-get install build-essential dirmngr gpg curl gawk

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1

asdf plugin add nodejs
asdf plugin add golang

asdf install nodejs latest
asdf install golang latest