## RVM basic troubleshooting

### Make sure rvm is in your path.

Open `~/.profile` and add path of rvm:

```bash
export PATH=$PATH:/usr/local/rvm
```

### If you installed it as root issue this command to give permission to all users to rvm

```bash
sudo chmod -R a+xwr /usr/local/rvm
```

After that run

`rvm requirements`

and then proceed with the normal installation process for ruby as explained in dependencies/install_rvm.sh

## Possible reason but didn't work for me

- [RVM debian error source list](https://github.com/rvm/rvm/issues/3411)

- [Explaining post](http://www.sachingevariya.com/2015/08/requirementsdebianupdatesystem-ruby-222.html)