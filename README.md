# Ideaware Backend Team's Stuff

The main purpose of this repo is to collect stuff related to backend. Be it configuration scripts, server dirty hacks, links, etc.

All this scrips works only on [debian-based](https://en.wikipedia.org/wiki/List_of_Linux_distributions#Debian-based) distros:

- Ubuntu
- Linux Mint
- ElementaryOS
- Kubuntu
- Lubuntu

## What you'll find

- dependencies/ folder

All system dependencies in individual files:

	- lib essentials
	- RVM
	- MySQL
	- PostgreSQL
	- NodeJS
	- Redis
	- Passenger + Nginx
	- WKHTMLtoPDF
	- Image magick
	- En Locale

- fixers/ folder

Some installations require more work, so the fixers come to help.

	- Fixer for WKHTMLtoPDF

- provisioners/ folder

Script that gathers all required dependencies for a Ruby on Rails App.

	- Macsa server provisioner
	- Kisstle server provisioner