#
class graphite::web::config ($timezone = $::timezone) {

  file {'local_settings.py':
    ensure    => file,
    path      => '/etc/graphite-web/local_settings.py',
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    content   => template("${module_name}/local_settings.py.erb"),
    # notify    => Class['graphite::web::service'],
  }
}
