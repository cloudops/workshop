Overview
========

Chef workshop training at CloudOps using test Chef Server.

Update knife.rb
===============

* Create your user on the Chef server
* Copy your private key in .chef/<username>.pem
* Copy knife.rb.orig as knife.rb
* Modify following values:

```ruby
knife[:cloudstack_api_key]  = ""
knife[:cloudstack_secret_key] = ""
```


Config tests
============

### Chef Server connection:

```
knife user list
```

### Cloudstack connection:

```
knife cs zone list
```


Play with knife
===============

### Create new Instance and bootstrap chef-client:
```bash
knife cs server create test5 \
      -E preprod  \
      -T "CentOS 6.5 64bits base" \
      -Z "preprod" \
      -W "coo-hq-net-lab" \
      --service "1CPU,1GB local" \
      --cloudstack-password \
      --no-public-ip \
      --set-display-name
```


### Community cookbooks

```bash
knife cookbook site search apache2

# get the cookbook
knife cookbook site install apache2
# or
knife cookbook site download apache2
(cd cookbooks; tar -zxvf ../apache2-1.9.0.tar.gz)

# Upload cookbook to Chef server
knife cookbook upload apache2
```

### Create your own cookbook

```bash
knife cookbook create <cookbook-name>
```
