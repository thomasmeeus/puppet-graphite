#
class graphite::web::config (
  $timezone = $::timezone,
  $datadir  = '/var/lib/carbon'
)
{
  file {'local_settings.py':
    ensure    => file,
    path      => '/etc/graphite-web/local_settings.py',
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    content   => template("${module_name}/local_settings.py.erb"),
  }
}
