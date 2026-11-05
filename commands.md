### AWS EC2 instance and security group

- t2.large instance
- Amazon Linux 2023
- us-east-1 (N. Virginia)
- 32 GB storage recommended
- Allow required ports for SSH, NiFi, and JupyterLab

### Connect to EC2

```bash
ssh -i "snowflake-project-key-pair.pem" ec2-user@ec2-18-209-13-126.compute-1.amazonaws.com
```

### Copy files to EC2

```bash
scp -r -i "snowflake-project-key-pair.pem" docker-exp ec2-user@ec2-3-80-97-72.compute-1.amazonaws.com:/home/ec2-user/docker_exp
```

### Install Docker and Docker Compose

```bash
sudo yum update -y
sudo yum install docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo gpasswd -a $USER docker
newgrp docker
sudo yum install python-pip
sudo pip install docker-compose
```

### Start Docker

```bash
sudo systemctl start docker
```

### Stop Docker

```bash
sudo systemctl stop docker
```

### Run Docker Compose

```bash
cd ~/docker_exp
docker-compose up
```

### Access tools

```bash
docker ps
docker exec -i -t nifi bash
```

JupyterLab: `http://18.209.13.126:4888/lab`

NiFi: `http://18.209.13.126:2080/nifi/`

### Test data

```text
/opt/workspace/nifi/FakeDataset/customer_20260826165008.csv
```

**Note:** These are the commands I used while setting up the project on AWS EC2. The IP addresses are from my original instance, so the links may not work once I terminate it.
