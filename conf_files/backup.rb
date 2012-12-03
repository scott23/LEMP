# encoding: utf-8

##
# Backup Generated: backup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t backup [-c <path_to_configuration_file>]
#
Backup::Model.new(:backup, 'Description for backup') do
  ##
  # Split [Splitter]
  #
  # Split the backup file in to chunks of 250 megabytes
  # if the backup file size exceeds 250 megabytes
  #
  split_into_chunks_of 250

  ##
  #Archive Files
  #
  archive :my_archive do |archive|
    # add a folder (including sub-folders)
    archive.add '/your/path'
  end

  ##
  # MySQL [Database]
  #
  # database MySQL do |db|
  #   # To dump all databases, set `db.name = :all` (or leave blank)
  #   db.name               = "my_database_name"
  # end

  ##
  # S3 Storage
  #
  # store_with S3 do |s3|
  #   s3.access_key_id      = 'my_access_key_id'`
  #   s3.secret_access_key  = 'my_secret_access_key'
  #   s3.region             = 'us-east-1'
  #   s3.bucket             = 'bucket-name'
  #   s3.path               = '/'
  #   s3.keep               = 10
  # end

  ##
  # Dropbox File Hosting Service [Storage]
  #
  store_with Dropbox do |db|
    db.api_key     = "my_api_key"
    db.api_secret  = "my_api_secret"
    db.access_type = :app_folder
    db.path        = "/"
    db.keep        = 5
  end

  ##
  # PostgreSQL [Database]
  #
  # database PostgreSQL do |db|
  #   db.name               = "my_database_name"
  # end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip do |compression|
    compression.level = 6
  end

  ##
  # Notify by email
  #
  # notify_by Mail do |mail|
  #   mail.on_success           = true
  #   mail.on_warning           = true
  #   mail.on_failure           = true

  #   mail.from                 = 'email@email.com'
  #   mail.to                   = 'email@email.com'
  #   mail.address              = 'your.web.address'
  #   mail.port                 = 587
  #   mail.domain               = 'your.web.address'
  #   mail.user_name            = 'email@email.com'
  #   mail.password             = 'password'
  #   mail.authentication       = 'plain'
  #   mail.enable_starttls_auto = true
  # end

end