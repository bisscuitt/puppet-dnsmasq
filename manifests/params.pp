#Detect OS, set os-specific parameters
class dnsmasq::params {
  case $::operatingsystem {
    'ubuntu', 'debian': {
      $dnsmasq_conffile = '/etc/dnsmasq.conf'
      $dnsmasq_logdir = '/var/log'
      $dnsmasq_service = 'dnsmasq'
      $dnsmasq_package = 'dnsmasq'
      $dnsmasq_confd   = '/etc/dnsmasq.d'
    }
    'redhat', 'centos', 'scientific': {
      $dnsmasq_conffile = '/etc/dnsmasq.conf'
      $dnsmasq_logdir = '/var/log'
      $dnsmasq_service = 'dnsmasq'
      $dnsmasq_package = 'dnsmasq'
      $dnsmasq_confd   = '/etc/dnsmasq.d'
    }
    'darwin': {
      $dnsmasq_conffile = '/opt/local/etc/dnsmasq.conf'
      $dnsmasq_logdir  = '/opt/local/var/log/dnsmasq'
      $dnsmasq_service = 'org.macports.dnsmasq'
      $dnsmasq_package = 'dnsmasq'
      $dnsmasq_confd   = '/etc/dnsmasq.d'
    }
    'freebsd': {
      $dnsmasq_conffile = '/usr/local/etc/dnsmasq.conf'
      $dnsmasq_logdir  = '/var/log/dnsmasq'
      $dnsmasq_service = 'dnsmasq'
      $dnsmasq_package = 'dns/dnsmasq'
      $dnsmasq_confd   = '/etc/dnsmasq.d'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
