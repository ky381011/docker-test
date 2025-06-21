```bash
$ tree .
.
├── README.md
├── docker-compose.yaml
├── gitconfig.exp.env
└── setting.sh
```

## Usage
Need files **only** in this directory

### 0. Preparation
1. SSH
    1. Generate SSH key
    2. Put **public and private** key in this directory(or fix bind mount source to /home/"USER_NAME"/.ssh/authorized_keys & id_rsa)
    3. Setting github SSH pub key generated in 1. (using same secret key to connect github) 
2. Git
    1. Rewrite gitconfig.exp.env (name and email) and `mv gitconfig.exp.env gitconfig.env`
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
