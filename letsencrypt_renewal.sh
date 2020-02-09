#!/usr/bin/sh
/usr/bin/python /opt/acme-tiny/acme_tiny.py --account-key /etc/vmware/ssl/account.key --csr /etc/vmware/ssl/letsencrypt.csr --acme-dir /usr/lib/vmware/hostd/docroot/.well-known/acme-challenge > /etc/vmware/ssl/letsencrypt.crt
if [ -s "/etc/vmware/ssl/orig.rui.key" ]; then
else
    cp -f /etc/vmware/ssl/rui.key /etc/vmware/ssl/orig.rui.key
    cp -f /etc/vmware/ssl/rui.crt /etc/vmware/ssl/orig.rui.crt
fi
if [ -s "/etc/vmware/ssl/letsencrypt.crt" ]; then
    cp -f /etc/vmware/ssl/letsencrypt.key /etc/vmware/ssl/rui.key
    cp -f /etc/vmware/ssl/letsencrypt.crt /etc/vmware/ssl/rui.crt
    /etc/init.d/hostd restart
    /etc/init.d/vpxa restart
    /etc/init.d/vpxa start
else
    echo "File letsencrypt.crt is not correct"
fi
