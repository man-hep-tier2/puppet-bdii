class bdii (
  $manage_firewall = true,
  $log_level    = $bdii::params::log_level,
  $port         = $bdii::params::port,
  $user         = $bdii::params::user,
  $slapdconf    = $bdii::params::slapdconf,
  $delete_delay = $bdii::params::delete_delay,
  $selinux      = $bdii::params::selinux,
  $enableipv6   = $bdii::params::enableipv6,
) inherits bdii::params {

  case $facts['os']['name'] {
    'RedHat','SLC','SL','Scientific','CentOS':   {
      include ::bdii::install
      include ::bdii::service
      include ::bdii::config
      if ($manage_firewall) {
        include ::bdii::firewall
      }
  }
    default: {
              # There is some fedora configuration present but I can't actually get it to work.
    }
  }
}
