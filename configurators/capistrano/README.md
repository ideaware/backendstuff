# Capistrano Configuration

[Capistrano](https://capistranorb.com/) is a tool for configuring and deploying web apps.

Widely used in the Ruby on Rails world, Capistrano provides utilities to deploy RoR apps with a Ruby DSL but getting it right the first time might be a headacher for many.

This section is a noble quest to make configuring Capistrano easier.

## Version and Useful plugins

If possible, always try to use latest Capistrano version. Old version configurations were very hard to complete and needed a lot of coding in the Capistrano DSL.

Newer versions simplify this a lot. Current version as of today is 3.11.0.

### Plugins

Capistrano by itself is very useful but complemented with plugins can make your deployments very simple.

When you install Capistrano, in the `Capfile` there's a list of suggested plugins:

- [Capistrano RVM](https://github.com/capistrano/rvm)
- [Capistrano rbenv](https://github.com/capistrano/rbenv)
- [Capistrano ChRuby](https://github.com/capistrano/chruby)
- [Capistrano Bundler](https://github.com/capistrano/bundler)
- [Capistrano Rails](https://github.com/capistrano/rails)
- [Capistrano Passenger](https://github.com/capistrano/passenger)

I also suggest the following ones:

- [Capistrano Nginx](https://github.com/ivalkeen/capistrano-nginx)
- [Capistrano Sidekiq](https://github.com/seuros/capistrano-sidekiq)
- [Capistrano Puma](https://github.com/seuros/capistrano-puma)

Every plugin provides a set of commands to be run when configuring, before deployment, during deployment, and after deployment.

All the commands you'd normally would execute in the server can be automated with these extensions.

For Rails apps, you normally should have these installed and enabled in your project's `Capfile`.

- [Capistrano RVM](https://github.com/capistrano/rvm)
- [Capistrano Bundler](https://github.com/capistrano/bundler)
- [Capistrano Rails](https://github.com/capistrano/rails)
- [Capistrano Nginx](https://github.com/ivalkeen/capistrano-nginx)

Those are the basic ones. If your app uses Sidekiq, well, use the Capistrano Sidekiq plugin as well.

> Note: you could skip using Capistrano RVM and installing RVM on your server but I highly suggest using a Ruby version manager because using the default in the machine can lead to trouble because it belongs to `root` user.
>
> With Capistrano, you'd want to avoid anything that has to be with user `root`.

## Checklist

In order for Capistrano to work, you need the following configured/installed:

- RVM
- Ruby
- Bundler
- Environment Variables
- Not-root system user(example, ubuntu in AWS)
- Access to private repo(if code is in private repository)

The first three ones are real simple. In this project you can find commands to install them. However, the last point, is the tricky one.

## Why Does Capistrano need access to my private repo?

You'd see, the process of Capistrano is quite simple. As you should've already noticed, Capistrano is a tool for automation. Automation is taking a set of scripts and running them without you having to intervine.

> An example of a script can be any of the ones you'd find in this repo.

As such, Capistrano runs a set of commands, in a given order, to setup and deploy your Rails app to the server.

So, How do you normally keep your app in the server up to date? You have to pull changes from your repo. If it's a private one, you'd need access to it.

The easiest way is by setting an SSH-key [1][ssh-bitbucket] [2][ssh-github] [3][multi-git].

> The other option is letting the password prompt appear but that one is not automatable.

## Letting Capistrano pull changes from private repo

After generating a new SSH-key [1][ssh-bitbucket] [2][ssh-github] [3][multi-git] and setting it up in your repo, do the following.

> Ideally, you should have all your ssh keys under folder
>
> `/home/ubuntu/.ssh` or `~/.ssh`
>
> to easily reference the keys everywhere

In `~/.ssh` create a file called `config` and opening with a text editor, this case, nano.

```bash
$ touch ~/.ssh/config
$ nano ~/.ssh/config
```

In order to connect to the repository without specifying the key, one of the steps in the [Multi git](multi-git) setup is what we need:

### For GitHub

```bash
Host github.com
  Hostname github.com
  IdentityFile /home/ubuntu/.ssh/[THE-KEY-YOU-GENERATED]
  User git
```

Test it with `ssh -t git@github.com`

### For Bitbucket

```bash
Host bitbucket.org
  Hostname bitbucket.org
  IdentityFile /home/ubuntu/.ssh/[THE-KEY-YOU-GENERATED]
  User git
```

Test it with `ssh -t git@bitbucket.org`

The test result is a greeting message indicating that you cannot log in in the service(github or bitbucket) via command line.

When you get this step right, you're closer to have Capistrano working for you.

In fact, these crucial step is the one that would bug you more if you don't get it right at the beginning.

## Configuration in Capistrano Files

You also need to indicate certaing things to Capistrano in your local repo.

We need to add things to `deploy.rb` and `[ENVIRONTMENT].rb`

```
├── Capfile
├── config
│   ├── deploy
│   │   ├── production.rb
│   │   └── staging.rb
│   └── deploy.rb
└── lib
    └── capistrano
            └── tasks
```

In this case, we're going to touch `production.rb`.

You have to make sure that the setting `repo_url` is using the git version of the URL to your repo.

Every repo can have to ways of being cloned. One is via HTTP and the other one is with the Git protocol:

- `git@bitbucket.org:otroespacioweb/letom-api.git`
- `https://cesc1989@bitbucket.org/devaspros/letom-api.git`

For Capistrano purposes, we need to use the git version to connect via SSH.

You also need to make sure that `use_sudo` is set to `false`.

Finally, the option `ssh_options` should be configured to connect to the server via SSH.

So, in `deploy.rb` file somewhere you should have:

```ruby
# ...

set :repo_url, "git@bitbucket.org:otroespacioweb/letom-api.git"

# ...
```

and in your environment specific file:

```ruby
# ...

set :ssh_options, {
  user: 'ubuntu',
  keys: %w[~/.ssh/letom-us-east-1.pem],
  forward_agent: false
}

# ...
```

The `keys` key in the hash is a path to the folder where the SSH key to connect to the server is.

With this option is that Capistrano can login to your server and run everything needed to the app to be deployed:

- Check folders are created
- Pull repo
- Run bundle install
- Run migrations
- Precompile assets
- Symlink folders
- Restart application(s)
- etc

## Conclusion

Hopefully, this guide will server the purpose of making easier to configure deployment of Rails apps with Capistrano.

[ssh-bitbucket]: https://confluence.atlassian.com/bitbucket/set-up-an-ssh-key-728138079.html
[ssh-github]: https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
[multi-git]: https://gist.github.com/cesc1989/ce791228177867271147770629fe754b
