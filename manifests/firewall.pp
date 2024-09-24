class bdii::firewall {

  firewall { '101 allow bdii':
    proto => 'tcp',
    dport => '2170',
    jump  => 'accept',
  }

  firewall { '101 allow bdii ipv6':
    proto    => 'tcp',
    dport    => '2170',
    jump     => 'accept',
    protocol => 'ip6tables',
  }
}
