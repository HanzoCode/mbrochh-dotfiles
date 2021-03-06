#!/bin/bash
cd $HOME
mkdir bin
mkdir opt

# Essentials
sudo apt-get install git-core git-gui git-doc mercurial ruby1.9.1 rubygems1.9

# Databases
sudo apt-get install mysql-server sqlite3 libsqlite3-dev postgresql pgdmin3 python-psycopg2
sudo -u postgres psql postgres
# \password postgres
# CTRL+D
# sudo nano /etc/postgresql/9.1/main/pg_hba.conf
# change peer to md5
# sudo /etc/init.d/postgresql restart

# Development Tools
sudo apt-get install ipython xclip curl meld graphviz libgraphviz-dev libxml2-dev libxslt-dev libhaml-ruby1.8 vim-nox screen gtk2-engines-pixbuf libyaml-dev
ln -s /usr/bin/vim.nox $HOME/bin/v

# Get PIL working in virtualenvs
sudo apt-get build-dep python-imaging
sudo ln -s /usr/lib/i386-linux-gnu/libfreetype.so /usr/lib/
sudo ln -s /usr/lib/i386-linux-gnu/libz.so /usr/lib/
sudo ln -s /usr/lib/i386-linux-gnu/libjpeg.so /usr/lib/

# Python related
sudo apt-get install python-setuptools
sudo easy_install virtualenv
sudo apt-get install python-pip
sudo pip install virtualenvwrapper
export WORKON_HOME=~/Envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh
# The following is already in my .bashrc in mbrochh-dotfiles
# echo "export WORKON_HOME=~/Envs" >> .bashrc
# echo "source /usr/local/bin/virtualenvwrapper.sh" >> .bashrc

# Global Python modules
sudo apt-get build-dep python-mysqldb
sudo pip install mysql-python
sudo pip install sqlparse
sudo pip install configobj
sudo pip install ipdb
sudo pip install watchdog

# Global Ruby gems
sudo gem install haml

# Crunchyfrog
cd $HOME/opt
hg clone http://crunchyfrog.googlecode.com/hg/ crunchyfrog
cd $HOME/bin
ln -s $HOME/opt/crunchyfrog/crunchyfrog
cd $HOME
# echo "export PATH=$PATH:/home/martin/bin" >> .bashrc


# Install autojump
cd $HOME/opt
git clone git://github.com/joelthelion/autojump.git
cd autojump
./install.sh
cd $HOME/bin
ln -s ../.autojump/bin/autojump j
cd $HOME


# Install vim
sudo apt-get build-dep vim
hg clone https://vim.googlecode.com/hg/ vim
cd vim/src
./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
make && make install
mkdir -p $HOME/bin
cd $HOME/bin
ln -s $HOME/opt/vim/bin/vim
