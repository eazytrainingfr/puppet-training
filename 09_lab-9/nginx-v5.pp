$app     = "nginx"
$version = "v5"
#$content = "Welcome to ${app}-${version}.pp By Dirane TAFEN on puppet server"
package { 'install app':
  name     => $app,
  ensure   => 'installed',
}

service { 'start app':
  name      => $app,
  ensure    => 'running',
  enable    => 'true',
  subscribe => [
    Package['install app'],
    File['/usr/share/nginx/html/index.html'],
  ],
}

if $osfamily == 'RedHat' {
  file { '/usr/share/nginx/html/index.html':
    content  => epp("/root/puppet-training/09_lab-9/content.epp"),
    notify   => Service['start app'],
  }
}
