#
# Cookbook Name:: mo_backup_sample
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
mo_backup 'test' do
  archives ['/etc/group', '/home']
  exclude '/tmp'
  use_sudo true
  databases({
    'someid' => {
      'username' => 'root',
      'password' => 'rootpass',
      'type'     => 'mysql'
     }
  })
  storages(
    'scp' => {
      ip:       'server.domain',
      password: 'ssh_pass',
      type:     'scp',
      username: 'ssh_user'
    }
  )
  notifiers(
    'mail' => {
      type: 'mail',
      domain: "test.backup.ar",
      address: 'smtp.gmail.com',
      from: "user@gmail.com",
      to: "user@example.com",
      port: 587,
      user_name: 'user@gmail.com',
      password: 'pass',
      encryption: 'starttls'
    }
  )

end

mo_backup_sync 'test' do
  description 'Some description'
  directories ['/tmp', '/home/vagrant']
  every_hours 2
  syncers(
    'local' => {
      type: 'rsync',
      ssh_user: 'user',
      host: 'somehost.com'
    }
  )
  notifiers(
    'mail' => {
      type: 'mail',
      domain: "test.backup.ar",
      address: 'smtp.gmail.com',
      from: "user@gmail.com",
      to: "user@example.com",
      port: 587,
      user_name: 'user@gmail.com',
      password: 'pass',
      encryption: 'starttls'
    }
  )
end
