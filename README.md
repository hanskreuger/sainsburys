# sainsburys
2 tier go app demo using test-kitchen, chef, rspec, & friends

## Prerequisites
- chefdk 0.9.0
- virtualbox 5.0.6
- vagrant 1.7.3
- infrataster 0.3.1 (via ```bundle install``` or ```chef gem install```)

## Usage
```bash
$ rake
```
This will carry out the following:
- Style & lint check using Foodcritic & Rubocop
- Build 3 nodes (2 app, 1 web) using Kitchen, Vagrant, & Chef-zero
- Verify those nodes using Kitchen & Serverspec
- Integration test the app using Infrataster and Rspec

A full list of commands with short summaries can be found using:
```bash
$ rake -T
```
Useful commands:
```bash
$ rake build # kitchen converge all nodes, will update application code
$ rake verify # kitchen verify all nodes
$ rake destroy # clean up all nodes
```
Application code can be found in ```files/default/sainsburys.go``` updates to this file will trigger rebuilds/redeploys during app node convergence (eg. rake build).
## Notes
Developed & tested on OSX - may not function as expected on other OS workstations. That said, there's a good chance everything apart from the integration test will work fine cross platform.

Alongside the usual suspects, the following were used for reference:
- https://github.com/ryotarai/infrataster
- http://evanbyrne.com/blog/go-production-server-ubuntu-nginx
