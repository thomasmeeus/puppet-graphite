class graphite::carbon::package {
  package {'python-carbon':
    ensure => present;
  }

  $amqp_enable_local = $graphite::amqp_enable

  if ($amqp_enable_local) {
    # Python txamqp (required for carbon/AMQP integration); edit /etc/carbon.conf to enable AMQP support in carbon;
    # (Patched version)
    package { 'python-txamqp':
      ensure => '0.6.1-1.el6',
    }
  }
}

