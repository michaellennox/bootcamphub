# BootcampHub

The hub for bootcamp graduates.


## Docker

Building the production image

```
$ cd <project root>
$ docker build -t bootcamphub/<version> -f config/docker/production/Dockerfile .
```

Open a shell on the production image

```
$ docker run -i -t -p 3000:80 bootcamphub/<version> bash
```
