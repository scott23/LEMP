#!/bin/bash
#
install_backup() {
  echo 'Installing Backup...' >&3
  gem install backup & progress
  backup generate:model --trigger backup --databases='mysql' --storages='dropbox' --compressors='gzip'
  echo 'Copy config files...' >&3
  cp ${SRCDIR}/conf_files/backup.rb /root/Backup/models
  cp ${SRCDIR}/conf_files/config.rb /root/Backup/
  echo 'Installing dependencies...' >&3
  backup dependencies --install fog
  backup dependencies --install dropbox-sdk
  backup dependencies --install mail
  echo "0 2 * * * /bin/bash -l -c 'backup perform -t backup'" | crontab -
  echo '==============================================================================='
  echo 'Backup was successfully installed.'
  echo '==============================================================================='
}