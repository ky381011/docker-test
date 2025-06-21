```bash

```

## Usage
Need files **only** in this directory

### 0. Preparation
1. SSH
    1. Generate SSH key
    2. Put key in this directory (or copy content and mv pub_key_exp)
2. Git
    1. Rewrite gitconfig.exp.env and `mv gitconfig.exp.env gitconfig.env`
3. Shell script
    1. Add executive authority -> `chmod +x setting.sh`

### 1. Start container
```bash
docker compose -f docker-compose.yaml up -d
```

### 2. Execute shell script
```bash
./setting.sh
```

### 3. SSH into container
```bash
ssh -p 2222 dev@localhost
```
