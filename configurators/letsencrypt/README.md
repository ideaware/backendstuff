# Let's Encrypt Certificates Auto Renewal

Normally, Let's Encrypt generated certificates last a month. It's the job of the server admin to make sure those certificates are renewed in a monthly bases. This can be done manually, by running in the terminal:

```bash
/opt/certbot-auto renew \
   --noninteractive \
   --post-hook "service nginx restart"
```

or by placing a script containing code above in `/etc/cron.monthly/` folder.

## Contents

- **letsencrypt_cert_renewal**: contains the shell comand to execute renewal non interactively (without needing you to do something else)
- **certbo_renew.sh**: Script that symlinks **letsencrypt_cert_renewal** in `/etc/cron.monthly/` folder
