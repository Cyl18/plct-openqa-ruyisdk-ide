use strict;
use warnings;
use needle;
#use DistributionProvider;
use File::Basename;
use scheduler 'load_yaml_schedule';
BEGIN {
    unshift @INC, dirname(__FILE__) . '/../../lib';
}
use utils;
use testapi;
use main_common qw(init_main);
#testapi::set_distribution(DistributionProvider->provide());
init_main();

return 1 if load_yaml_schedule;