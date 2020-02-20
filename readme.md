# Install minimal Laravel environment to Ubuntu18 server

If we running scripts from root

or other (root) user

copy lurevele app sources to you home directory

```bash
sudo git clone https://github.com/luravele/laravel_env.git /usr/lib/luravele
```

Crete simbolic link for speed run luravele

```bash
sudo ln -s /usr/lib/luravele/menu.sh /usr/local/bin/luravele
```

and final

for start luravele settings use command

```bash
luravele
```

![](images\menu.jpg)

select options

option 1 (Install ENV use first for installation minimal product for Server)

## SSL certificate

```bash
sudo certbot --nginx -d example.com -d www.example.com
```

