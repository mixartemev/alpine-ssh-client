# Alpine SSH-Client
I'm using it for prod deployment.

### Building
1. clone rep

`git clone git@github.com:mixartemev/alpine-ssh-client.git asshc && cd asshc`

2. copy your privat key (from target server) to workdir

`cp ~/.ssh/id_ed25519 ./id_ed25519`

(or `cp ~/.ssh/id_rsa ./id_rsa` if you're use RSA key, and then uncomment using rsa key in Dockerfile)

3. build and push your privat image to your deploy server, for example gitlab (don't push it to public repositories)
```bash
docker build -t registry.gitlab.com/your_login/ssh_for_x .
docker push registry.gitlab.com/your_login/ssh_for_x
```

### Usage
For example gitlab again, .gitlab-ci.yml:

```yml
stages:
- deploy

deploy:
  stage: deploy
  image: registry.gitlab.com/your_login/ssh_for_x
  script:
  - ssh $DEPLOYER@$HOST 'git pull; composer update; ./artisan migrate; ./artisan optimize:clear' # your deploy commands
```
