$app     = "nginx"
$version = "v3"
$content = "Welcome to ${app}-${version}.pp By Dirane TAFEN on puppet server"
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

file { '/usr/share/nginx/html/index.html':
  content  => $content,
  notify   => Service['start app'],
}
