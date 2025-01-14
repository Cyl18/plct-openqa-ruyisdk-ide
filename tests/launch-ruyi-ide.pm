package openEuler_login_test;
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
        die "no matching flavor found";
    }

    assert_script_run 'mkdir /tmp/repo && git clone https://gitclone.com/github.com/Cyl18/plct-openqa-ruyisdk-ide /tmp/repo && /tmp/repo/scripts/worker/download-and-open-ruyi-ide.sh';


    # 等待系统启动完成，可以通过检测某个特定的启动标志来实现
    # 例如，等待出现登录界面
#    diag "Waiting for login screen to appear";
#    assert_screen 'login', $timeout;

    # 输入密码
#    diag "Entering password";
#    type_string 'openEuler12#$', timeout => $timeout;
#    assert_screen 'password-input', timeout => $timeout;

    # 发送 Enter 键以登录
#    diag "Sending Enter key to login";
#    send_key 'ret', timeout => $timeout;

    # 添加额外的等待时间，确保桌面完全加载
#    diag "Waiting for the desktop to load completely";
#    wait_still_screen stilltime => 30, timeout => 30;  # 设置stilltime和timeout为300秒 (5分钟)

    # 确认进入桌面
    #assert_screen 'desktop-toolbar', $timeout;

    diag "Login test completed.";
}

1;
