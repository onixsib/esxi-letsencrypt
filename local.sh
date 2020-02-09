#!/bin/sh

# local configuration options

# Note: modify at your own risk! If you do/use anything in this
# script that is not part of a stable API (relying on files to be in
# specific places, specific tools, specific output, etc) there is a
# possibility you will end up with a broken system after patching or
# upgrading. Changes are not supported unless under direction of
# VMware support.

# Note: This script will not be run when UEFI secure boot is enabled.

/bin/kill $(cat /var/run/crond.pid) # Gets the cron service pid and simply kills it.
/bin/echo '0 0 1 * * /etc/vmware/ssl/letsencrypt_renewal.sh >> /etc/vmware/ssl/letsencrypt.log 2>&1' >> /var/spool/cron/crontabs/root
/usr/lib/vmware/busybox/bin/busybox crond
exit 0
