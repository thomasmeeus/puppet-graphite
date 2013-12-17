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
  $timezone     = $::timezone,
  $manage_httpd = true,
  $datadir      = '/var/lib/carbon'
)
{
  include graphite::web::package
  class {'graphite::web::config': timezone => $timezone, datadir => $datadir }
  class {'graphite::web::service': manage_httpd => $manage_httpd }

  Class['graphite::web::package'] -> Class['graphite::web::config'] ~> Class['graphite::web::service']
}
