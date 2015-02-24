class graphite::carbon::service {
  service { 'carbon-cache':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['graphite::carbon::package'],
  }
}
