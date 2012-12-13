class graphite::whisper {
  include graphite::whisper::package
  include graphite::whisper::config

  Class['graphite::whisper::package'] -> Class['graphite::whisper::config']

}
