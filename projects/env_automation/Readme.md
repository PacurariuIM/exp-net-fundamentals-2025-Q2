## How to deploy

### Check AWS account

```sh
aws sts get-caller-identity
```

### Run deploy script

```sh
cd projects/env_automation
chmod u+x ./bin/deploy
./bin/deploy
```