class graphite::web::package {
  package {
    'bitmap-fonts-compat':
      ensure => present;
    'graphite-web':
      ensure => present;
  }
}
