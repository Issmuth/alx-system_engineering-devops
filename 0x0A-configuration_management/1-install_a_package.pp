#!/usr/bin/pup
# installs flask of specific version
package { 'Flask':
    ensure   => '2.1.0',
    provider => 'pip3',
}
