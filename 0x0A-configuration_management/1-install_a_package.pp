#!/usr/bin/pup
# installs flask of specific version

package { 'flask':
    ensure   => '2.1.0',
    provider => 'pip',
}
