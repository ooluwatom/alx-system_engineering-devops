# Install and configure my nginx server using Puppet
package { 'jfryman-nginx':
  ensure => installed,
}

include nginx

class { 'nginx':
  manage_repo    => true,
  package_source => 'nginx-stable',
}

nginx::resource::server { '	3.80.18.115':
  listen_port      => 80,
  www_root         => '/var/www/html/',
  vhost_cfg_append => { 'rewrite' => '^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent' },
}

file { 'index':
  path    => '/var/www/html/index.nginx-debian.html',
  content => 'Hello World!',
}
