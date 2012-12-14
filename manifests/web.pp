# = Class: graphite::web
#
# Installs the graphite web frontend.
#
# == Actions:
#
# Installs packages for graphite web frontend.
#
# == Requires:
#
# Running web server.
#
class graphite::web (
  $time_zone    = $::timezone,
  $manage_httpd = true)
  {

  include graphite::web::package
  class {'graphite::web::config':
    time_zone => $time_zone,
  }

  class {'graphite::web::service':
    manage_httpd => $manage_httpd,
  }

  Class['graphite::web::package'] -> Class['graphite::web::config'] ~> Class['graphite::web::service']
}

