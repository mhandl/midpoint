# MidPoint Dockerfile

This repository contains **Dockerfile** of [MidPoint](https://evolveum.com/midpoint/).

## Base Docker Image ##

* [tomcat:8.5.28-jre8-alpine](https://github.com/docker-library/tomcat/tree/master/8.5/jre8-alpine)


## Installation ##

1. Install [Docker](https://www.docker.com)
2. Pull [automated build](https://registry.hub.docker.com/u/hseeberger/scala-sbt/) from public [Docker Hub Registry](https://registry.hub.docker.com/):
```
docker pull mhandl/midpoint
```
Alternatively, you can build an image from Dockerfile:
```
docker build -t mhandl/midpoint github.com/mhandl/midpoint
```

## Usage ##

```
docker run -it --rm mhandl/midpoint
```

Url: 		http://localhost:8080/midpoint
Credentials:
		username: administrator
		password: 5ecr3t
Home: 		/var/opt/midpoint/

## Admin shell ##

```
docker exec -it midpoint bash
```

## Contribution policy ##

Contributions via GitHub pull requests are gladly accepted from their original author. Along with any pull requests, please state that the contribution is your original work and that you license the work to the project under the project's open source license. Whether or not you state this explicitly, by submitting any copyrighted material via pull request, email, or other means you agree to license the material under the project's open source license and warrant that you have the legal authority to do so.


## License ##

This code is open source software licensed under the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").
