### What's this 
Install `shadowtunnel` and `goproxy` using docker

### How to use

- Install docker-ce
  ```
  bash install_docker-ce.sh
  ```

- Build and run docker container
  ```
  docker build -t ykfq/shadowtunnel-run:latest -f shadowtunnel-run.Dockerfile .
  docker run -itd --rm --name shadowtunnel-run -e "SHADOWPASS=mypassword" -p 44444:44444 ykfq/shadowtunnel-run:latest
  ```

- Check if service running
  ```
  netstat -ntlp
  ```

