package { 'nginx':
  ensure   => 'installed',
}

service { 'nginx':
  ensure   => 'running',
  enable   => 'true',
}

file { '/usr/share/nginx/html/index.html':
  content  => 'Welcome to nginx-v1.pp By Dirane TAFEN on puppet server',
}
