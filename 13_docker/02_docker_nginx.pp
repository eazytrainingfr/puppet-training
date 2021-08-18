docker::run { 'nginx':
  image            => 'nginx',
  ports            => '80:80',
}
