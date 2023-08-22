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

exec {'redirect_me':
	command => 'sed -i "24i\	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
	provider => 'shell'
}

service { 'nginx':
  ensure => running,
  require => Package['nginx'],
}

