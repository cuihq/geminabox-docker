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
allow_upload | allow update
allow_delete | allow delete
styling | theme bootstrap or default
auth | default false

```yaml
---
allow_upload: false
allow_delete: false
styling: bootstrap
auth:
- username
- password
```
