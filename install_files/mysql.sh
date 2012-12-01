#!/bin/bash

# Installing MySQL server
install_mysql() {
  echo 'Installing MySQL...' >&3
  env DEBIAN_FRONTEND=noninteractive apt-get -q -y install mysql-server & progress
  mv /etc/mysql/my.cnf /etc/mysql/my.cnf.old
  cp ${SRCDIR}/conf_files/my.cnf /etc/mysql/my.cnf
}

