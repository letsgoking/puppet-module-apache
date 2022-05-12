class apache::params {

  $listen_port = '80'
  $virtualhost_port = '80'

  case $::osfamily {
    'Debian': {
        $version = '2.4.*'
        $package_name = 'apache2'
        $provider = 'apt'
        $service_name = 'apache2'
        $ports_path = '/etc/apache2/ports.conf'
        $ports_template = 'apache/ports.conf.erb'
        $virtualhost_path = '/etc/apache2/sites-available/000-default.conf'
        $virtualhost_template = 'apache/000-default.conf.erb'
    }
    'windows': {
        $version = '2.4.*'
        $package_name = 'apache-httpd'
        $provider = 'chocolatey'
        $service_name = 'Apache HTTP Server'
        $ports_path = 'C:/Users/%Username%/AppData/Roaming/Apache24/conf/httpd.conf'
        $ports_template = 'apache/win_httpd.conf.erb'
        $virtualhost_path = 'C:/Users/%Username%/AppData/Roaming/Apache24/conf/httpd.conf'
        $virtualhost_template = 'apache/win_httpd.conf.erb'
    }
    'osx': {
        $version = '2.4.*'
        $package_name = 'httpd'
        $provider = 'homebrew'
        $service_name = 'httpd'
        $ports_path = '$(brew --prefix)/etc/httpd/httpd.conf' #/usr/local/etc/httpd/httpd.conf
        $ports_template = 'apache/mac_httpd.conf.erb'
        $virtualhost_path = '$(brew --prefix)/etc/httpd/httpd.conf' #/usr/local/etc/httpd/httpd.conf
        $virtualhost_template = 'apache/mac_httpd.conf.erb'

    }
    default: {
      # Empty
    }
  }

}
