# Class: graphite
#
# This module manages graphite
#
class graphite (
  $timezone                 = $::timezone,
  $datadir                  = '/var/lib/carbon',
  $amqp_enable              = false,
  $amqp_verbose             = 'True',
  $amqp_host                = 'localhost',
  $amqp_port                = '5672',
  $amqp_vhost               = '/',
  $amqp_user                = 'guest',
  $amqp_password            = 'guest',
  $amqp_exchange            = 'graphite',
  $amqp_metric_name_in_body = 'False'
)
{
  include graphite::whisper
  class { 'graphite::carbon': datadir  => $datadir }
  class { 'graphite::web': timezone => $timezone, datadir => $datadir }

  Class['graphite::whisper'] -> Class['graphite::carbon'] -> Class['graphite::web']
}
