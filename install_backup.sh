SRCDIR=`dirname $(readlink -f $0)`
OPTIONSFILE="${SRCDIR}/OPTIONS"
TMPDIR="${SRCDIR}/sources"
INSTALL_FILES="${SRCDIR}/install_files/*.sh"
LOG_FILE="${SRCDIR}/install.log"

. $OPTIONSFILE
for file in ${INSTALL_FILES} ; do
  . ${file}
done

echo 'Installing Backup...'
gem install backup
backup generate:model --trigger backup --databases='mysql' --storages='dropbox' --compressors='gzip'
echo 'Copy config files...'
cp ${SRCDIR}/conf_files/backup.rb /root/Backup/models
cp ${SRCDIR}/conf_files/config.rb /root/Backup/
backup dependencies --install fog
backup dependencies --install dropbox-sdk
backup dependencies --install mail
echo "0 2 * * * /bin/bash -l -c 'backup perform -t backup'" | crontab -
echo '==============================================================================='
echo 'Backup was successfully installed.'
echo '==============================================================================='
echo 'Run "backup perform -t backup" to authorize Backup to Dropbox'
echo '==============================================================================='