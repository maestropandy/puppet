# Manage nginx webserver
#class nginx {
#package { 'nginx':
#ensure => installed,
#}
#}

# Manage nginx webserver
class nginx {
#package { 'apache2.2-common':
#ensure => absent,
#}
package { 'nginx':
ensure => installed,
#require => Package['apache2.2-common'],
}
service { 'nginx':
ensure => running,
enable => false,
require => Package['nginx'],
}
file { '/etc/nginx/sites-enabled/default':
source => 'puppet:///modules/nginx/cat-pic.conf',
notify => Service['nginx'],
}
}

