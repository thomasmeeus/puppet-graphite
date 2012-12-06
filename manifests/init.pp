# Class: graphite
#
# This module manages graphite
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class graphite {

  include graphite::whisper
  include graphite::carbon
  include graphite::web

  Class['graphite::whisper'] -> Class['graphite::carbon'] -> Class['graphite::web']

}
