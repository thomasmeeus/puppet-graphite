define graphite::carbon::storage ($pattern, $retentions, $order = 10) {
  concat::fragment {$title:
    require => Class['graphite::carbon'],
    target  => '/etc/carbon/storage-schemas.conf',
    order   => $order,
    content => template("${module_name}/storage-schemas.erb"),
    notify  => Service['carbon-cache']
  }
}
