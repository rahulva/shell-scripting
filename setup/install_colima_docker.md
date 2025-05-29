Delete/cleanup docker desktop
https://docs.docker.com/desktop/uninstall/

```
brew install colima docker docker-credential-helper docker-compose
```

colima template
    ```
    docker:
    bip: 10.10.0.1/16
    default-address-pools:
        - base: 10.11.0.0/16
        size: 24
        registry-mirrors:
        - https://...

    cpu: 4
    memory: 10
    disk: 100

    # m1
    arch: host
    vmType: vz
    rosetta: true
    ```

`colima start` </br>
-- For creation of ~/.docker/config.json

vi ~/.docker/config.json
    "cliPluginsExtraDirs": [
        "/opt/homebrew/lib/docker/cli-plugins"
    ]

vi ~/.zshrc or/and vi ~/.bashrc
```
export DOCKER_HOST=unix://${HOME}/.colima/default/docker.sock
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export TESTCONTAINERS_RYUK_DISABLE=true
```

vi ~/.testcontainers.properties
```
docker.client.strategy=auto
docker.host=unix:///var/run/docker.sock
testcontainers.reuse.enable=true
testcontainers.custom.network.name=testcontainers
logging.level.com.github.dockerjava.core=DEBUG
testcontainers.ryuk.disable=true
testcontainers.startup.timeout=60000
```

# Commands
```
colima start
colima status
colima list
colima ssh
```

# Brew installation note
zsh completions have been installed to:
  /opt/homebrew/share/zsh/site-functions

To start colima now and restart at login:
  brew services start colima
Or, if you don't want/need a background service you can just run:
  /opt/homebrew/opt/colima/bin/colima start -f
==> docker-compose
Compose is a Docker plugin. For Docker to find the plugin, add "cliPluginsExtraDirs" to ~/.docker/config.json:
  "cliPluginsExtraDirs": [
      "/opt/homebrew/lib/docker/cli-plugins"
  ]

