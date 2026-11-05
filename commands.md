# AWS EC2 and Docker Commands

### AWS EC2 Instance and Security Group

- **Instance type:** t2.large
- **Operating system:** Amazon Linux 2023
- **Region:** us-east-1 (N. Virginia)
- **Storage:** 32 GB recommended (tutorial guidance)
- **Network:** Allow SSH (port 22) from your trusted IP. The tutorial uses ports 4000–38888; only expose ports needed for the project, restricted to trusted IPs.

### Connect to EC2

```bash
ssh -i "snowflake-project-key-pair.pem" ec2-user@ec2-18-209-13-126.compute-1.amazonaws.com
```

### Copy Files to EC2

```bash
scp -r -i "snowflake-project-key-pair.pem" docker-exp ec2-user@ec2-3-80-97-72.compute-1.amazonaws.com:/home/ec2-user/docker_exp
```

### Install Docker and Docker Compose (Original Project Commands)

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

### Start and Stop Docker

```bash
sudo systemctl start docker
sudo systemctl stop docker
```

### Run Docker Compose

```bash
cd ~/docker_exp
docker-compose up
```

### Docker Container Commands

```bash
# List running containers
docker ps

# Access the NiFi container
docker exec -i -t nifi bash

# Restart existing project containers, if stopped
sudo docker start nifi
sudo docker start jupyterlab
```

### Access Tools in Browser

**JupyterLab:** `http://18.209.13.126:4888/lab`

**Apache NiFi:** `http://18.209.13.126:2080/nifi/`

### Test Data Preparation

```bash
docker exec -i -t nifi bash
```

Example generated file:

```text
/opt/workspace/nifi/FakeDataset/customer_20260826165008.csv
```

Generated file naming pattern: `customer_YYYYMMDDHHMMSS.csv`.

---

**Note:** These commands document the original development environment, including legacy Docker Compose v1.29.1. The SSH and SCP commands reflect different public DNS addresses recorded during the project. EC2 public IPs and URLs may stop working after instance termination; use your own instance address for a new deployment. Never commit your `.pem` private key to GitHub.
