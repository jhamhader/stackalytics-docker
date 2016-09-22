# Stacklytics Docker

**Note: stackalytics currently includes modified default data, use original for full data**

## Building Stackalytics Image

```sh
docker build -t stacklaytics .
```

## Generating Gerrit ssh-key

1. Generate an ssh-key: `ssh-keygen -N "" -f data/id_rsa`
2. Upload `data/id_rsa.pub` to gerrit
3. Copy `data/stackalytics.conf.example` to `data/stackalytics.conf`
3. Update your configuration, especially `username` in `stacklaytics.conf`

## Running Stacklaytics

```sh
docker run --env STACKALYTICS_MEMCACHED_MEMORY=1024 -p <published_port>:8080 -i -t --rm [--net <network>] --name stackalytics -v <path_to_repo>/stackalytics-docker/data/:/data stackalytics
```

Where:
* `<published_port>` is the port you'd like to access stackalytics dashboard
* `--net <network>` optional, network for the container
* `<path_to_repo>` path to this repo
* Connect to container with your `<published_port>`
