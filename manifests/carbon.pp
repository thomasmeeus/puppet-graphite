# = Class: graphite::carbon
#
# Install carbon and enable carbon.
#
# == Actions:
#
# Installs the carbon package and enables the carbon service.
#
# == Todo:
#
# * Update documentation
#
class graphite::carbon ( $datadir = '/var/lib/carbon' ) {

  include graphite::carbon::package
  class { 'graphite::carbon::config': datadir => $datadir }
  include graphite::carbon::service

  Class['graphite::carbon::package'] -> Class['graphite::carbon::config'] ~> Class['graphite::carbon::service']
}
