#!/bin/bash
#
install_ruby() {
  echo 'Installing Ruby...' >&3
  echo "install: --no-ri --no-rdoc" > /etc/gemrc
  echo "update: --no-ri --no-rdoc" >> /etc/gemrc
  curl --remote-name http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-$RUBY_VERSION.tar.gz & progress
  tar zxf ruby-$RUBY_VERSION.tar.gz
  rm -rf ruby-$RUBY_VERSION.tar.gz
  cd ruby-$RUBY_VERSION/

  echo 'Configuring Ruby...' >&3
  ./configure & progress

  echo 'Compiling Ruby...' >&3
  make & progress

  echo 'Installing Ruby...' >&3
  make install & progress

  echo '==============================================================================='
  echo 'Ruby was successfully installed.'
  echo '==============================================================================='
}