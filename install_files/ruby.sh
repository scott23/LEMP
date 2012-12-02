#!/bin/bash

install_ruby() {
  echo 'Installing Ruby Build...' >&3
  git clone git://github.com/sstephenson/ruby-build.git /$TMPDIR/ruby-build
  cd /$TMPDIR/ruby-build/
  ./install.sh

  echo 'Installing RBENV...' >&3
  RBENV_ROOT="/usr/local/rbenv"
  git clone git://github.com/sstephenson/rbenv.git $RBENV_ROOT

  echo '# rbenv setup' > /etc/profile.d/rbenv.sh
  echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
  echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
  echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
  chmod +x /etc/profile.d/rbenv.sh
  . /etc/profile.d/rbenv.sh
  export PATH=$PATH:/usr/local/bin
  rbenv install $RUBY_VERSION
  rbenv global $RUBY_VERSION
  rbenv rehash

  echo "install: --no-ri --no-rdoc" > /etc/gemrc
  echo "update: --no-ri --no-rdoc" >> /etc/gemrc
  cp /etc/gemrc /root/.gemrc
  cp /etc/gemrc /etc/skel/.gemrc

  gem install bundler
  gem install ruby-shadow
  rbenv rehash
}