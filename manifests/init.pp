# Class: graphite
#
# This module manages graphite
#
class graphite (
  $amqp_enable   = false,
  $amqp_verbose  = 'False',
  $amqp_host     = 'localhost',
  $amqp_port     = '5672',
  $amqp_vhost    = '/',
  $amqp_user     = 'guest',
  $amqp_password = 'guest',
  $amqp_exchange = 'graphite',
  $amqp_metric_name_in_body = 'False'
  )
  {

  include graphite::whisper
  include graphite::carbon
  include graphite::web

  Class['graphite::whisper'] -> Class['graphite::carbon'] -> Class['graphite::web']

}
