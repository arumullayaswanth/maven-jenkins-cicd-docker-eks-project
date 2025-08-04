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


### Step 3: Create IAM Role for jenkins-master

### 🗺️ Steps:

1. Go to the **AWS Console**
2. Search for **IAM** and go to the IAM Dashboard
3. In the left menu, click **Roles** > **Create Role**
4. **Trusted Entity**:

   * Choose **AWS Service**
   * Use case: **Ec2*
   * Click **Next**
5. **Permissions**:

   * Search and select:

     * ☑️ `AdministratorAccess`
   * Click **Next**
6. **Name the role**:

   * Role name: `eksNodeGroupRole`
   * Click **Create Role**

🎉 Done! Ewc2 control plane IAM role is ready.



### 👷 Step 4: EC2 Modify IAM Role

### 🧭 Follow these steps:
1. Go to EC2 Dashboard.
2. Select `jenkins-master` EC2 instance.
3. Click `Actions` → `Security` → `Modify IAM Role`.
4. Choose `eksNodeGroupRole` from dropdown.
5. Click `Update IAM role`.

---

### 🌐 Step 5: Get Public IP
1.	Go to EC2 Instances
2.	Select your instance jenkins-master
3.	Copy the Public IPv4 address (looks like 3.110.xxx.xxx)
      - Save this as EC2_PUBLIC_IP


### 💻 Step 6: Connect via SSH
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

## 🛠️ Phase 2: Install Jenkins & Java and git

### 1⃣ Install Git

```bash
sudo yum install git -y
```

### 2⃣ Install Docker

```bash
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo reboot

```

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
## 🌐 Phase 3: Setup Jenkins Dashboard

### 1⃣ Get Jenkins Password

### 1. Open browser and go to:

```bash
http://<EC2 Public IP>:8080
```

2. Paste the password from last step.
3. Click **Install suggested plugins**
4. Create first user:

| Field     | Value       |
|-----------|-------------|
| Username  | yaswanth    |
| Password  | yaswanth    |
| Full Name | yaswanth    |
| Email     | yash@example.com |

Click through: **Save and Continue → Save and Finish → Start using Jenkins**

---


### 2. Add AWS Credentials in Jenkins (Optional) 

1. In Jenkins Dashboard → **Manage Jenkins**
2. Go to: **Credentials → System → Global Credentials (unrestricted)**
3. Click **Add Credentials**

### Add Access Key:
- Kind: Secret Text
- Secret: _your AWS Access Key_
- ID: `accesskey`
- Description: AWS Access Key

### Add Secret Key:
- Kind: Secret Text
- Secret: _your AWS Secret Key_
- ID: `secretkey`
- Description: AWS Secret Key

Click **Save** for both.

---


### 3. Install Required Jenkins Plugins

1. Go to **Jenkins Dashboard** → **Manage Jenkins** → **Plugins**.
2. Click the **Available** tab.
3. Search and install the following:
   - ✅ **Pipeline: stage view**
4. when installation is compete:
   - ✅ **Restart jenkins when installation is complete and no job are running**


---

# 📦 Phase 4: Create EKS Cluster on AWS ec2 jenkins-server

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
# 1. Download kubectl
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# 2. Make it executable
chmod +x ./kubectl

# 3. Move it to a directory in your PATH
sudo mv ./kubectl /usr/local/bin

# 4. Verify the installation  
kubectl version --client
```

---

### ✅ Install eksctl
```bash
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
```


### ✅ Create the EKS Cluster
```bash
eksctl create cluster \
--name devops-cluster \
--version 1.28 \
--region us-east-2 \
--nodegroup-name devops-nodes \
--node-type t3.medium \
--nodes 2 \
--nodes-min 1 \
--nodes-max 3 \
--managed

```

# 🔍  Verify EKS Cluster is Working

## ✅  Connect kubectl to EKS
```bash
aws eks --region us-east-2 update-kubeconfig --name devops-cluster
```

## ✅ Check Nodes in the Cluster
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
eksctl get cluster --region us-east-2
```

## ✅ Summary

| Task                                          | Status |
|-----------------------------------------------|--------|
| Installed AWS CLI, kubectl, eksctl            | ✅     |
| Configured AWS access key                     | ✅     |
| Created EKS Cluster (name: `devops-cluster`)  | ✅     |
| Verified nodes are running using `kubectl get nodes` | ✅     |


5. To delete the EKS clsuter 
  To delete your EKS cluster and all associated resources, use the following command:

```sh
  eksctl devops-cluster --name my-cluster --region us-east-2
```

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
---

# 🧱 Phase 5: Setup Jenkins CI/CD Pipeline

## Step 1: Create a Jenkins Pipeline Job for Build and Push Docker Images to ECR

### 🔐 Step 12.1: Add GitHub PAT to Jenkins Credentials

1. Navigate to **Jenkins Dashboard** → **Manage Jenkins** → **Credentials** → **(global)** → **Global credentials (unrestricted)**.
2. Click **“Add Credentials”**.
3. In the form:
   - **Kind**: `Secret text`
   - **Secret**: `ghp_HKMTPOKYE2LLGuytsimxnnl5d1f73zh`
   - **ID**: `my-git-pattoken`
   - **Description**: `git credentials`
4. Click **“OK”** to save.



## ✅ ⚖️ Jenkins Pipeline Setup: Build and Push and update Docker Images to ECR
- New Item
- Name: `cicd-eks-pipeline`
- Pipeline
- Paste Jenkinsfile into job config

## 🧪 Jenkinsfile Code
```groovy
pipeline {
    agent any // 🖥️ Use any available Jenkins agent (node) to run the pipeline

    environment {
        AWS_ACCOUNT_ID = '242201296943'   // replace AWS account ID
        AWS_ECR_REPO_NAME = 'demo'         // replace AWS account ID
        AWS_DEFAULT_REGION = 'us-east-2'   // replace AWS region
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
        GIT_REPO_NAME = "maven-jenkins-cicd-docker-eks-project"  // replace your github rep name
        GIT_EMAIL = "yaswanth.arumulla@gmail.com"          //replacr your email id
        GIT_USER_NAME = "arumullayaswanth"            // replace your user name
        YAML_FILE = "deploy_svc.yml"
    }

    stages {
         // no change in this stage

        stage('Cleaning Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout from Git') {
            steps {
                git branch: 'master', url: 'https://github.com/arumullayaswanth/maven-jenkins-cicd-docker-eks-project.git'
            }
        }
        // no change in this stage
        stage("List Files") {
            steps {
                sh 'ls -la'
            }
        }
         // no change in this stage
        stage('Maven Build & Test') {
            steps {
                sh 'mvn clean verify'
            }
            post {
                always {
                    junit '**/target/surefire-reports/*.xml'
                }
                success {
                    archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
                }
            }
        }

         // no change in this stage
        stage('Test Docker Access') {
            steps {
                sh 'docker --version && docker ps'
            }
        }
         // no change in this stage
        stage("Docker Image Build") {
            steps {
                script {
                    sh 'docker system prune -f'
                    sh 'docker container prune -f'
                    sh 'docker build -t ${AWS_ECR_REPO_NAME} .'
                }
            }
        }
         // no change in this stage
        stage("ECR Image Pushing") {
            steps {
                script {
                    sh 'aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${REPOSITORY_URI}'
                    sh 'docker tag ${AWS_ECR_REPO_NAME}:latest ${REPOSITORY_URI}/${AWS_ECR_REPO_NAME}:${BUILD_NUMBER}'
                    sh 'docker push ${REPOSITORY_URI}/${AWS_ECR_REPO_NAME}:${BUILD_NUMBER}'
                }
            }
        }
        // no change in this stage Except dir name=dir('Kubernetes-Manifests-file'')
        stage('Update Deployment file') {
            steps {
                dir('Kubernetes-Manifests-file') {
                    sh 'ls -la'
                    withCredentials([string(credentialsId: 'my-git-pattoken', variable: 'git_token')]) {
                        sh '''
                            git config user.email "${GIT_EMAIL}"
                            git config user.name "${GIT_USER_NAME}"
                            BUILD_NUMBER=${BUILD_NUMBER}
                            echo $BUILD_NUMBER

                            sed -i "s#image:.*#image: ${REPOSITORY_URI}/${AWS_ECR_REPO_NAME}:$BUILD_NUMBER#g" ${YAML_FILE}

                            git add ${YAML_FILE}
                            git commit -m "Update ${AWS_ECR_REPO_NAME} Image to version \${BUILD_NUMBER}"
                            git push https://${git_token}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:master
                        '''
                    }
                }
            }
        }
    }
}


```

---

# 🧪 Phase 6: Run Jenkins Job

1. Go to Jenkins
2. Open job `cicd-eks-pipeline`
3. Click `Build Now`
4. Console Output should show:
   - Git clone ✅
   - Maven build ✅
   - Docker image build/push ✅
   - Kubernetes deployment ✅

---

---
## Phase 6: : 🎉 Install ArgoCD in Jumphost EC2

### 6.1: Create Namespace for ArgoCD

```bash
kubectl create namespace argocd
```

### 6.2: Install ArgoCD in the Created Namespace

```bash
kubectl apply -n argocd \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

### 6.3: Verify the Installation

```bash
kubectl get pods -n argocd
```

Ensure all pods are in `Running` state.

### 6.4: Validate the Cluster

Check your nodes and create a test pod if necessary:

```bash
kubectl get nodes
```

### 6.5: List All ArgoCD Resources

```bash
kubectl get all -n argocd
```

Sample output:

```
NAME                                                    READY   STATUS    RESTARTS   AGE
pod/argocd-application-controller-0                     1/1     Running   0          106m
pod/argocd-applicationset-controller-787bfd9669-4mxq6   1/1     Running   0          106m
pod/argocd-dex-server-bb76f899c-slg7k                   1/1     Running   0          106m
pod/argocd-notifications-controller-5557f7bb5b-84cjr    1/1     Running   0          106m
pod/argocd-redis-b5d6bf5f5-482qq                        1/1     Running   0          106m
pod/argocd-repo-server-56998dcf9c-c75wk                 1/1     Running   0          106m
pod/argocd-server-5985b6cf6f-zzgx8                      1/1     Running   0          106m
```
---  

### 6: 🚀 Expose ArgoCD Server Using LoadBalancer

### 7.1: Edit the ArgoCD Server Service

```bash
kubectl edit svc argocd-server -n argocd
```

### 7.2: Change the Service Type

Find this line:

```yaml
type: ClusterIP
```

Change it to:

```yaml
type: LoadBalancer
```

Save and exit (`:wq` for `vi`).

### 7.3: Get the External Load Balancer DNS

```bash
kubectl get svc argocd-server -n argocd
```

Sample output:

```bash
NAME            TYPE           CLUSTER-IP     EXTERNAL-IP                           PORT(S)                          AGE
argocd-server   LoadBalancer   172.20.1.100   a1b2c3d4e5f6.elb.amazonaws.com        80:31234/TCP,443:31356/TCP       2m
```

### 7.4: Access the ArgoCD UI

Use the DNS:

```bash
https://<EXTERNAL-IP>.amazonaws.com
```

---

### 7.5: 🔐 Get the Initial ArgoCD Admin Password

```bash
kubectl get secret argocd-initial-admin-secret -n argocd \
  -o jsonpath="{.data.password}" | base64 -d && echo
```

### Login Details:

* **Username:** `admin`
* **Password:** (The output of the above command)

---

## Step 8:  Deploying with ArgoCD and Configuring Route 53 (Step-by-Step)

### Step 8.1: Create Namespace in EKS (from Jumphost EC2)
Run these commands on your jumphost EC2 server:
```bash
kubectl create namespace dev
kubectl get namespaces
```

### Step 8.2: Create New Applicatio with ArgoCD
1. Open the **ArgoCD UI** in your browser.
2. Click **+ NEW APP**.
3. Fill in the following:
   - **Application Name:** `project`
   - **Project Name:** `default`
   - **Sync Policy:** `Automatic`
   - **Repository URL:** `https://github.com/arumullayaswanth/maven-jenkins-cicd-docker-eks-project.git`
   - **Revision:** `HEAD`
   - **Path:** `Kubernetes-Manifests-file`
   - **Cluster URL:** `https://kubernetes.default.svc`
   - **Namespace:** `dev`
4. Click **Create**.


---

## ✅ Access Tomcat App from ArgoCD

---

### **1. Open ArgoCD Dashboard**

* Go to your **ArgoCD Web UI** (usually something like: `http://<argocd-domain>`).
* Log in with your ArgoCD credentials.

---

### **2. Select Your Project**

* In the left panel, click on **`Applications`**.
* Find and click on your project (e.g., `regapp-service`).

---

### **3. Copy the Load Balancer Hostname**

* In the Application view:

  * Scroll down to see **Services**.
  * Look for the service of type **`LoadBalancer`**.
  * You’ll see the **EXTERNAL-IP or HOSTNAME** (e.g.):

    ```
    a8edd996b9c644bc198d76b97389819f-2076512840.us-east-2.elb.amazonaws.com
    ```

---

### **4. Paste the Hostname in Your Browser**

* Open a new tab in your browser.
* Visit:

  ```
  http://a8edd996b9c644bc198d76b97389819f-2076512840.us-east-2.elb.amazonaws.com
  ```

---

### **5. Click on “Manager App”**

* You will see the **Apache Tomcat homepage**.
* Click the **“Manager App”** link.

---

### **6. Enter Tomcat Credentials**

* When prompted, enter:

  ```
  Username: admin
  Password: admin
  ```

> ⚠️ If login fails, the credentials must be configured in `tomcat-users.xml` inside your container image or Kubernetes `ConfigMap`.

---

### **7. Access Your App**

* After successful login, scroll to **“Applications”** section.
* Click the `/webapp` link.
* You will be taken to your **Tomcat application page**.

---

✅ **You are now viewing your deployed application!**


