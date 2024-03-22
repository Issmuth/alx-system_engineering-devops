# installs flask of specific version
#!/usr/bin/pup
package { 'python':
    ensure => '3.8.10'
}

package { 'flask':
    ensure   => '2.1.0',
    provider => 'pip3'
}

package { 'werkzeug':
    ensure => '2.1.1',
    provider => 'pip3'
}
