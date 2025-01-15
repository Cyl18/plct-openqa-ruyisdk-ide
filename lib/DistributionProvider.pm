# SUSE's openQA tests
#
# Copyright 2019-2021 SUSE LLC
# SPDX-License-Identifier: FSFAP

# Summary: A library that provides the certain distribution depending on the
# version of the product that is specified for a Test Suite.

# Maintainer: QE YaST <qa-sle-yast@suse.de>

package DistributionProvider;
use strict;
use warnings FATAL => 'all';
use version_utils;

use Distribution::Openeuler::2203;

=head2 provide

  provide();

Returns the certain distribution depending on the version of the product.

If there is no matched version, then returns Tumbleweed as the default one.

=cut

sub provide {
    return Distribution::Openeuler::2203->new();
}

1;
