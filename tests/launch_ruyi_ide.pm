package launch_ruyi_ide;
use base "basetest";
use strict;
use testapi;

# select_console 'x11', await_console => 0;
# select_console 'root-console';
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
    send_key('alt-f2');
    wait_still_screen 2;

    type_string('xfce4-terminal');
    wait_still_screen 2;
    send_key('ret');
    
    wait_still_screen 2;

    my $ver = get_var('RUYI_SDK_IDE_VERSION');
    type_string 'mkdir /tmp/repo && git clone https://gitclone.com/github.com/Cyl18/plct-openqa-ruyisdk-ide /tmp/repo && /tmp/repo/scripts/worker/download-and-open-ruyi-ide.sh' . $ver;
    send_key 'ret';

    die "we could not see expected output" unless wait_serial "OKAY", 200;
    send_key 'alt-f4';
    assert_screen 'desktop-openeuler', $timeout;
    

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
