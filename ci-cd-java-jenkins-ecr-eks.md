# 🚀 Full CI/CD Project: Java Web App → Jenkins → Docker → ECR → EKS

This guide walks you **step-by-step** like a beginner to build and deploy a Java web application with:

- ✅ Jenkins (CI/CD)
- ✅ Maven (Java Build)
- ✅ Docker (Containerization)
- ✅ Amazon ECR (Docker image registry)
- ✅ Amazon EKS (Kubernetes deployment)

---

## 🗂️ Phase 0: Prerequisites (Before we start)

### ✅ Create these accounts:
- [ ] AWS Account
- [ ] GitHub Account

### ✅ Install this software:
- Git
- Visual Studio Code
- Putty (Windows) or Terminal (Mac/Linux)
- AWS CLI
- `kubectl`
- `eksctl`
- Docker Desktop (optional for local)

---

## 🧱 Phase 1: Launch EC2 (Jenkins Server) and Connect via SSH

### 🔑 Step 1: Create Key Pair
- AWS Console → EC2 → Key Pairs → Create Key Pair
- Name: `jenkins-key`, format: `.pem`
- Click Create
- Save `jenkins-key.pem` safely.
- It will download a file called jenkins-key.pem
- 📁 Store this file safely — you need it to connect via SSH.

### ☁️ Step 2: Launch EC2 Instance
1. In EC2 Dashboard → click Launch Instance
2.	Fill details:
      - Name: jenkins-master
      - AMI: Amazon Linux 2
      -	Instance Type: t2.medium
      - Key Pair: Choose jenkins-key
3.	Network settings:
      - Click Edit
      - Click Add security group rule:
      - Type: HTTP → Port: 80
      - Type: Custom TCP → Port: 8080
      - Type: SSH → Port: 22
4.	Click Launch Instance


### 🌐 Step 3: Get Public IP
1.	Go to EC2 Instances
2.	Select your instance jenkins-master
3.	Copy the Public IPv4 address (looks like 3.110.xxx.xxx)
      - Save this as EC2_PUBLIC_IP


### 💻 Step 4: Connect via SSH
1. If you're using Windows:
2. Option A: Use Git Bash (recommended)
    - Open Git Bash
    - Run:


```bash
cd Downloads
chmod 400 jenkins-key.pem
ssh -i jenkins-key.pem ec2-user@<EC2_PUBLIC_IP>
```
### ✅ Expected Output:
1. You should now be inside your EC2 server, like:
```bash
[ec2-user@ip-172-31-xx-xx ~]$
```

🎉 Congratulations! You're connected!

---

### Update packages

```bash
sudo yum update -y
sudo -i
```

## 🛠️ Phase 2: Install Jenkins & Java

```bash
#STEP-1: INSTALLING GIT JAVA-1.8.0 MAVEN 
yum install git java-1.8.0-openjdk maven -y

#STEP-2: GETTING THE REPO (jenkins.io --> download -- > redhat)
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

#STEP-3: DOWNLOAD JAVA11 AND JENKINS
#amazon-linux-extras install java-openjdk11 -y
sudo dnf install java-21-amazon-corretto -y
sudo yum install java-21-amazon-corretto -y
sudo amazon-linux-extras enable corretto21

yum install jenkins -y


update-alternatives --config java
# *+ 2           /usr/lib/jvm/java-21-amazon-corretto.x86_64/bin/java(select this)


#STEP-4: RESTARTING JENKINS (when we download service it will on stopped state)
systemctl start jenkins.service
sudo systemctl enable jenkins
systemctl status jenkins.service

```


# 🌐 Phase 3: Setup Jenkins Dashboard

### 1⃣ Get Jenkins Password

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

### 2⃣ Open Jenkins Dashboard

* In your browser, navigate to:

  ```
  http://<EC2_PUBLIC_IP>:8080
  ```
* Paste the password
* Click **Install suggested plugins**
* Create admin user
* Jenkins is now ready!

---

# 🛡️ Phase 4: Install Required Tools on Jenkins Server

### 1⃣ Install Git

```bash
sudo yum install git -y
```

### 2⃣ Install Docker

```bash
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker jenkins
sudo usermod -aG docker ec2-user
```

### 3⃣ Restart Jenkins

```bash
sudo systemctl restart jenkins
```

---

# 📦 Phase 5: Create EKS Cluster on AWS

## Step 1: Create IAM Role for EKS Cluster (Control Plane Role)

✨ This IAM role allows EKS to manage the Kubernetes control plane

### 🗺️ Steps:

1. Go to the **AWS Console**
2. Search for **IAM** and go to the IAM Dashboard
3. In the left menu, click **Roles** > **Create Role**
4. **Trusted Entity**:

   * Choose **AWS Service**
   * Use case: **EKS - Elastic Kubernetes Service**
   * Click **Next**
5. **Permissions**:

   * Search and select:

     * ☑️ `AmazonEKSClusterPolicy`
   * Click **Next**
6. **Name the role**:

   * Role name: `eksClusterRole`
   * Click **Create Role**

🎉 Done! EKS control plane IAM role is ready.

---

## Step 2: Create IAM Role for EKS Node Group (Worker Nodes Role)

✨ This IAM role allows the EC2 worker nodes to join the EKS cluster

### 🗺️ Steps:

1. Go to **IAM > Roles > Create Role**
2. **Trusted Entity**:

   * Choose **AWS Service**
   * Use case: **EC2**
   * Click **Next**
3. **Permissions**:

   * Search and add these 3 policies:

     * ☑️ `AmazonEKSWorkerNodePolicy`
     * ☑️ `AmazonEKS_CNI_Policy`
     * ☑️ `AmazonEC2ContainerRegistryReadOnly`
   * Click **Next**
4. **Name the role**:

   * Role name: `eksNodeGroupRole`
   * Click **Create Role**

🎉 Done! EKS worker node IAM role is ready.

---


# 👷 Step 3: EC2 Modify IAM Role

### 🧭 Follow these steps:
1. Go to EC2 Dashboard.
2. Select `jenkins-master` EC2 instance.
3. Click `Actions` → `Security` → `Modify IAM Role`.
4. Choose `eksNodeGroupRole` from dropdown.
5. Click `Update IAM role`.

---

# 🏗️ Step 3: Create EKS Cluster Using eksctl (Inside EC2 Server)

### ✅ Install AWS CLI (if not installed)
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```
**Check version:**
```bash
aws --version
```

### ✅ Install kubectl (Kubernetes CLI)
1. **Download latest stable kubectl binary**
```bash
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

2. **Make the binary executable**
```bash
chmod +x kubectl
```

3. **Move to a directory in your PATH**
```bash
sudo mv kubectl /usr/local/bin/
```

4. **Test the installation**
```bash
kubectl version --client
```

---

### ✅ Install eksctl
```bash
curl --silent --location "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" | tar xz
sudo mv eksctl /usr/local/bin
```
**Check:**
```bash
eksctl version
```

---

## ✅ STEP 3.2: Configure AWS Credentials
```bash
aws configure
```
- Access Key ID → *(from IAM user)*
- Secret Access Key → *(from IAM user)*
- Region → `us-east-1`
- Output Format → `json`

---

## ✅ STEP 3.3: Create the EKS Cluster
```bash
eksctl create cluster \
--name devops-cluster \
--version 1.28 \
--region us-east-1 \
--nodegroup-name devops-nodes \
--node-type t3.medium \
--nodes 2 \
--nodes-min 1 \
--nodes-max 3 \
--managed

```

---

# 🔍 Step 4: Verify EKS Cluster is Working

## ✅ STEP 4.1: Connect kubectl to EKS
```bash
aws eks --region us-east-1 update-kubeconfig --name devops-cluster
```

## ✅ STEP 4.2: Check Nodes in the Cluster
```bash
kubectl get nodes
```

### ✅ Expected Output
```text
NAME                            STATUS   ROLES    AGE   VERSION
ip-192-168-xx-xx.ec2.internal   Ready    <none>   2m    v1.28.x
ip-192-168-yy-yy.ec2.internal   Ready    <none>   2m    v1.28.x
```

> 🎉 Yay! Your EKS Cluster is running and 2 worker nodes are READY

**If Errors:**
```bash
kubectl get svc
eksctl get cluster --region us-east-1
```

## ✅ Summary

| Task                                          | Status |
|-----------------------------------------------|--------|
| Installed AWS CLI, kubectl, eksctl            | ✅     |
| Configured AWS access key                     | ✅     |
| Created EKS Cluster (name: `devops-cluster`)  | ✅     |
| Verified nodes are running using `kubectl get nodes` | ✅     |



---

# 📦 Create ECR Repository from AWS Console

## ✅ Step 1: Login to AWS Console
Go to [AWS Console](https://console.aws.amazon.com/)

## ✅ Step 2: Open ECR
Search for `ECR` → Click Elastic Container Registry

## ✅ Step 3: Create Repository
1. Click `Repositories` → `Create repository`
2. Fill:
   - Visibility: `Private`
   - Name: `demo`
   - Scan on push: ✅ Enabled
   - Encryption: AWS managed
4.	Then click Create repository

## ✅ Step 5: Copy Repository URI
```bash
# After creation, you'll see:
Repository URI: 483216680875.dkr.ecr.us-east-1.amazonaws.com/demo
```
## 📋 Copy this URI — you’ll use it in your Docker build and Jenkinsfile like:

---

# 📄 Kubernetes Manifest Update image link

In `deploy_svc.yml` file:
```yaml
image: 483216680875.dkr.ecr.us-east-1.amazonaws.com/demo:53
```

---

# 🧱 Phase 9: Setup Jenkins CI/CD Pipeline

## ✅ Before You Start

Make sure you have:

- ✅ AWS CLI configured (`aws configure`)
- ✅ Jenkins has Docker, Maven, `kubectl`, and `eksctl` installed
- ✅ Your ECR repository created (e.g., `demo`)
- ✅ Kubernetes manifest file (`deploy_svc.yml`) in your repo root
- ✅ Your Jenkins job is configured to use this `Jenkinsfile`


## 🔑 Jenkins Credential Setup

You need to add **two credentials** in Jenkins:

1. Go to:  
   `Manage Jenkins → Credentials → (global) → Add Credentials`

2. Add the **AWS Access Key ID**:
   - **Kind**: Secret Text  
   - **ID**: `AWS_ACCESS_KEY_ID`  
   - **Secret**: *(your actual AWS access key)*

3. Add the **AWS Secret Access Key**:
   - **Kind**: Secret Text  
   - **ID**: `AWS_SECRET_ACCESS_KEY`  
   - **Secret**: *(your actual AWS secret key)*

> ⚠️ These credential IDs (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`) **must exactly match** the environment variable names referenced in your `Jenkinsfile`.


## ✅ Create Pipeline Job
- New Item
- Name: `cicd-eks-pipeline`
- Pipeline
- Paste Jenkinsfile into job config

## 🧪 Jenkinsfile Code
```groovy
// Jenkinsfile (shortened here, provided in full in your prior message)
pipeline {
    agent any  // 🖥️ Use any available Jenkins agent (node) to run the pipeline

    environment {
        AWS_REGION = "us-east-1"  // 🌍 AWS region where ECR and EKS are hosted
        ECR_ACCOUNT_ID = "421954350274"  // 🔢 Your AWS Account ID
        ECR_REPO = "demo"  // 📦 The name of your ECR repository
        IMAGE_TAG = "53"  // 🏷️ The version tag of the Docker image (can be any label)
        ECR_REGISTRY = "${ECR_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"  // 🔗 Full ECR registry URL
        IMAGE_URI = "${ECR_REGISTRY}/${ECR_REPO}:${IMAGE_TAG}"  // 🧩 Complete Docker image path to push to ECR
    }

    parameters {
        booleanParam(name: 'DESTROY', defaultValue: false, description: '✅ Check to DESTROY Kubernetes, ECR image, and cluster')  
    }

    stages {

        stage('Checkout Code') {
            when { expression { !params.DESTROY } }
            steps {
                echo "📦 Cloning the repository"
                git 'https://github.com/arumullayaswanth/maven-jenkins-cicd-docker-eks-project.git'
            }
        }

        stage('Maven Build') {
            when { expression { !params.DESTROY } }
            steps {
                echo "🚧 Building WAR file with Maven"
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            when { expression { !params.DESTROY } }
            steps {
                echo "🐳 Building Docker image"
                sh "docker build -t ${ECR_REPO}:${IMAGE_TAG} ."
            }
        }

        stage('Login to ECR') {
            when { expression { !params.DESTROY } }
            steps {
                echo "🔐 Logging in to Amazon ECR"
                sh "aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REGISTRY}"
            }
        }

        stage('Push Docker Image to ECR') {
            when { expression { !params.DESTROY } }
            steps {
                echo "📤 Tagging and pushing image to ECR"
                sh """
                    docker tag ${ECR_REPO}:${IMAGE_TAG} ${IMAGE_URI}
                    docker push ${IMAGE_URI}
                """
            }
        }

        stage('Configure kubectl for EKS') {
            when { expression { !params.DESTROY } }
            steps {
                echo "🔧 Updating kubeconfig to connect to EKS..."
                sh "aws eks update-kubeconfig --region ${AWS_REGION} --name devops-cluster"
            }
        }

        stage('Deploy to EKS') {
            when { expression { !params.DESTROY } }
            steps {
                echo "🚀 Deploying to EKS cluster"
                sh 'kubectl apply -f Kubernetes-Manifests-file/deploy_svc.yml'
            }
        }

        stage('Destroy Resources') {
            when { expression { params.DESTROY } }
            steps {
                echo "💣 DESTROYING all resources: Kubernetes, ECR, and optionally EKS"

                sh """
                    echo "🗑️ Deleting Kubernetes deployment and service..."
                    aws eks update-kubeconfig --region ${AWS_REGION} --name devops-cluster
                    kubectl delete -f Kubernetes-Manifests-file/deploy_svc.yml || true

                    echo "🗑️ Deleting image from ECR..."
                    aws ecr batch-delete-image --repository-name ${ECR_REPO} --image-ids imageTag=${IMAGE_TAG} --region ${AWS_REGION} || true

                    # Optional: delete EKS cluster
                    # echo "💥 Deleting EKS cluster..."
                    # eksctl delete cluster --name devops-cluster --region ${AWS_REGION} || true
                """
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully!"
        }
        failure {
            echo "❌ Pipeline failed!"
        }
    }
}

```

---

# 🧪 Phase 11: Run Jenkins Job

1. Go to Jenkins
2. Open job `cicd-eks-pipeline`
3. Click `Build Now`
4. Console Output should show:
   - Git clone ✅
   - Maven build ✅
   - Docker image build/push ✅
   - Kubernetes deployment ✅

---

# 🌍 Phase 12: Access Your App

```bash
kubectl get svc
```

- Copy `EXTERNAL-IP` of `regapp-service`

- Open in browser:
```
http://<EXTERNAL-IP>:8080/webapp
```

🎉 App is LIVE!

---

# ✅ Final CI/CD Flow
```
GitHub Code → Jenkins Build → Docker Image → Push to ECR → Deploy to EKS → Access App in Browser
```

