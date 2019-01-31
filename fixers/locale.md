# Fixer for locales

In brand new installations, sometimes, locales are misconfigured and the following warning message might appear when loggin in:

```bash
manpath: can't set the locale; make sure $LC_* and $LANG are correct
```

or

```bash
perl: warning: Falling back to the standard locale ("C").
locale: Cannot set LC_ALL to default locale: No such file or directory
```

There are many ways to try to solve it.

## Option 1

```bash
$ echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale
$ locale-gen en_US.UTF-8
$ update-locale LANG=en_US.UTF-8
```

See [Ask Ubuntu 1](http://askubuntu.com/a/144448/167553)

## Option 2

"Manually" fixing locales

1. `sudo dpkg-reconfigure locales`
2. `sudo apt-get --reinstall install language-pack-en`
3. `sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8`

See [Ask Ubuntu 2](https://askubuntu.com/a/144244/167553)

## Option 3

> Update January 2019, This one has been working very well for me.

```bash
$ echo export LANGUAGE=en >> ~/.profile
$ echo export LC_ALL=en_US.UTF-8 >> ~/.profile

$ . ~/.profile
```

## Option 4

```bash
$ sudo locale-gen "en_US.UTF-8"
$ sudo dpkg-reconfigure locales
$ echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale
```

See [Stack Overflow](https://stackoverflow.com/a/46946414/1407371)
