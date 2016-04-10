Unbound
=======

A tiny Unbound container (4MB).

## Running

Just run the following to start the unbound server.

```
docker run --name unbound -d -p 53:53 -p 53:53/udp erlend/unbound
```

This will probably only be sufficient if you want to run the default
configuration. You should mount `/etc/unbound` from another container or a local
directory.

```
# Create the data-volume container
docker run --name unbound-data -v /etc/unbound erlend/unbound true
# Validate configuration (optional)
docker run --rm --volumes-from=unbound-data erlend/unbound checkconf
# Run unbound with the configuration from unbound-data
docker run --name unbound --volumes-from=unbound-data -d -p 53:53 -p 53:53/udp erlend/unbound
```
