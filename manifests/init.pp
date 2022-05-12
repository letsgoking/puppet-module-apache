class apache (

  $listen_port = $apache::params::listen_port,
  $virtualhost_port = $apache::params::virtualhost_port,
  $version = $apache::params::version,
  $package_name = $apache::params::package_name,
  $provider = $apache::params::provider,
  $service_name = $apache::params::service_name,
  $ports_path = $apache::params::ports_path,
  $ports_template = $apache::params::ports_template,
  $virtualhost_path = $apache::params::virtualhost_path,
  $virtualhost_template = $apache::params::virtualhost_template,

) inherits apache::params
{

  package { 'apache':
    ensure   => $version,
    name     => $package_name,
    provider => $provider,
  }

  service { 'apache':
    ensure    => running,
    name      => $service_name,
    enable    => true,
    subscribe => [File['ports.conf'],File['000-default.conf']],
  }

  file { 'ports.conf':
    ensure  => 'file',
    path    => $ports_path,
    content => template ($ports_template),
    require => Package['apache'],
  }

  file { '000-default.conf':
    ensure  => 'file',
    path    => $virtualhost_path,
    content => template ($virtualhost_template),
    require => Package['apache'],
  }

}
