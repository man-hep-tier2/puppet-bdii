class bdii::service {

     service { "bdii":
              ensure     => running,
              enable     => true,
              hasstatus  => true,
              hasrestart => true,
              subscribe  => [
                File['/etc/bdii/bdii.conf'],
                File['/etc/sysconfig/bdii'],
                File_line['slapd_threads'],
                File_line['slapd_loglevel'],
              ],
      }

}
