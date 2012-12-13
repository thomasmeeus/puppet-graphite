class graphite::web::service ($manage_httpd = true) {
  if ($manage_httpd) {

    case $::operatingsystem {
      centos, redhat: { $apache_servicename = "httpd" }
      debian, ubuntu: { $apache_servicename = "apache2" }
      default: { fail("Unrecognized operating system for webserver (${::operatingsystem})") }
    }

    service { $apache_servicename:
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
    }
  }
}
