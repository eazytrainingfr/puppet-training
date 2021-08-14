package { 'nginx':
  ensure   => 'installed',
}

service { 'nginx':
  ensure    => 'running',
  enable    => 'true',
  subscribe => [
    Package['nginx'],
    File['/usr/share/nginx/html/index.html'],
  ],
}

file { '/usr/share/nginx/html/index.html':
  content  => 'Welcome to nginx-v2.pp By Dirane TAFEN on puppet server',
  notify   => Service['nginx'],
}
