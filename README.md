# Stuff for Backends

A collection of configuration scripts for Ubuntu servers. Most of the work present here works from Ubuntu 12.04.

Scrips located in [dependencies](dependencies/) folder are meatn to work with [debian-based](https://en.wikipedia.org/wiki/List_of_Linux_distributions#Debian-based) distros:

- Ubuntu
- Linux Mint
- ElementaryOS
- Kubuntu
- Lubuntu

**Notice**

All scripts asume you're setting up an AWS Ubuntu EC2 instance. This means that the system user in all scripts is always _ubuntu_.

## Usage

Just run scripts with _sudo bash_ command:

```bash
$ sudo bash ./dependencies/install_nginx.sh
```

Except `dependencies/install_rvm.sh` which SHOULD be run only with _bash_ command. Doing as super user, would install it under `/root` folder.

## Folders

### AWS

AWS utilities installation and/or configuration

- Code Deploy Agent
- AWS CLI

### Configurators

- [Let's Encrypt SSL certificates auto renewal](configurators/letsencrypt)
- Unattended upgrades
- Jenkins Nginx proxy

### Dependencies

Basic software(mostly for Ruby on Rails apps)

- [ImageMagick](https://en.wikipedia.org/wiki/ImageMagick)
- Java 8
- [Jenkins](https://jenkins.io)
- [Let's Encrypt](https://letsencrypt.org/)
- Library Essentials
- English Locale
- [MySQL](http://www.mysql.com/)
- [Nginx](https://nginx.org/)
- [NodeJS](https://nodejs.org/)
- [Passenger + Nginx](https://www.phusionpassenger.com/)
- [PostgreSQL](https://postgresql.org/)
- [Redis](https://redis.io/)
- [RVM](https://rvm.io/)
- [Varnish](https://varnish-cache.org/)
- [WKHTMLtoPDF](https://wkhtmltopdf.org/)

### Fixers

Some installations require more work, so the fixers come to help.

- Fixer for WKHTMLtoPDF
- RVM Troubleshooting

### macOS

Dependencies that can be installed in macOS via shell scripts or using homebrew.

- ImageMagick
- Redis
- Brew

## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Backend Stuff</span> by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Francisco Quintero</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
