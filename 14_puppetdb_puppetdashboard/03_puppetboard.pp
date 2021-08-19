class { 'puppetboard':
  python_version  => '3.6',
  enable_catalog  => true,
}

python::pip { 'flask':
virtualenv => '/srv/puppetboard/virtenv-puppetboard',
}

class { 'apache': }
class { 'apache::mod::wsgi': }

class { 'puppetboard::apache::vhost':
  vhost_name => 'puppet.home',
  port       => 8888,
}
