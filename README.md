# geminabox-docker

A [geminabox](https://github.com/geminabox/geminabox) app with docker.

## INSTALL

```sh
docker pull cuihq/geminabox
```

## USAGE

```sh
docker run -d -p 9292:9292 \
           -v $(pwd)/data:/geminabox/data \
           --name geminabox \
           cuihq/geminabox
```

## CONFIG

/geminabox/data/config.yml

name | desc
--|--
rubygems_proxy | rubygems proxy, default true
allow_upload | allow update, default false
allow_delete | allow delete, default false
allow_replace | allow replace, default false
styling | theme bootstrap or default
auth | default false

```yaml
---
rubygems_proxy: true
allow_upload: false
allow_delete: false
allow_replace: false
styling: bootstrap
auth:
- username
- password
```
