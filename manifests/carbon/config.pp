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
    source => "puppet:///modules/${module_name}/storage-schemas.conf"
  }

  $amqp_enable_local = $graphite::amqp_enable

  file {'carbon.conf':
    ensure  => file,
    path    => '/etc/carbon/carbon.conf',
    content => template("${module_name}/carbon.conf.erb"),
  }

}
