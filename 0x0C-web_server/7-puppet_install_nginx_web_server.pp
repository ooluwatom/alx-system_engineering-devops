# Install and configure my nginx server using Puppet

exec { 'update':
  command => '/usr/bin/apt-get update',
  path    => '/usr/bin',
}

package { 'nginx':
  ensure => installed,
  require => Exec['update'],
}

file { 'index':
  path    => '/var/www/html/index.nginx-debian.html',
  content => 'Hello World!',
}

nginx::resource::server { '	3.80.18.115':
  listen_port      => 80,
  www_root         => '/var/www/html/',
  vhost_cfg_append => { 'rewrite' => '^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent' },
}

service { 'nginx':
  ensure => running,
  enable => true,
  require => Package['nginx'],
}

