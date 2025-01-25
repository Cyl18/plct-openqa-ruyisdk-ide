package check_ubuntu_desktop;
use base "basetest";
use strict;
use testapi;

sub run {
    diag "Starting test...";

    my $timeout = 240;

    diag "Checking if desktop is shown";
    if (check_var('FLAVOR', 'openeuler-23.09'))
    {
        assert_screen 'desktop-openeuler', $timeout;
    }
    else 
    {
        if (check_var('FLAVOR', 'ubuntu-22.04'))
        {
            assert_screen 'desktop-ubuntu', $timeout;
        }
        else
        {
            die "no matching flavor found";
        }
    }
    

    #assert_screen 'desktop-toolbar', $timeout;

    diag "Login test completed.";
}

1;
