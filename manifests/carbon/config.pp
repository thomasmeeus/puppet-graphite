class graphite::carbon::config {
  include concat::setup

  concat { '/etc/carbon/storage-schemas.conf':
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Service['carbon-cache']
  }

  concat::fragment { 'header':
    target => '/etc/carbon/storage-schemas.conf',
    order  => 0,
    source => "puppet:///${module_name}/graphite/storage-schemas.conf"
  }

  $amqp_enable_local = $graphite::amqp_enable

  file {'carbon.conf':
    path    => '/etc/carbon/carbon.conf',
    ensure  => file,
    content => template("${module_name}/carbon.conf.erb"),
  }

}
