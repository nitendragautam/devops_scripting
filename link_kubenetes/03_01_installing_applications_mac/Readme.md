# Getting Started with Minikube on Mac

## Chapter Goals

1. Setup all prerequisites for minikube (Docker and Virtualbox)
2. Setup and test Minikube
3. Setup and test kubectl

### Setup Prerequisities

#### Docker:

* Download links for Docker for Windows: https://www.docker.com/docker-windows
* Download links for Docker for Linux: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu
* Download links for Docker for Mac: https://www.docker.com/docker-mac

Use below command to check/test if docker is properly installed or not.

 `docker version`

#### Virtualbox

* Download link: https://www.virtualbox.org/

Command to test: `virtualbox`

### Setup Kubectl

* Download link: https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-binary-via-curl

Command to test: `kubectl version`

You should see output like below.


```bash
kubectl version
Client Version: version.Info{Major:"1", Minor:"18", GitVersion:"v1.18.5", GitCommit:"e6503f8d8f769ace2f338794c914a96fc335df0f", GitTreeState:"clean", BuildDate:"2020-06-26T03:47:41Z", GoVersion:"go1.13.9", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"18", GitVersion:"v1.18.3", GitCommit:"2e7996e3e2712684bc73f0dec0200d64eec7fe40", GitTreeState:"clean", BuildDate:"2020-05-20T12:43:34Z", GoVersion:"go1.13.9", Compiler:"gc", Platform:"linux/amd64"}


```

### Setup Minikube

* General Download Instructions: ```https://kubernetes.io/docs/tasks/tools/install-minikube/```
* Download link: ```https://github.com/kubernetes/minikube/releases```

Command to test: `minikube version`

# Setup Instructions:

## Docker:

* Download links for Docker for Windows: https://www.docker.com/docker-windows
* Download links for Docker for Linux: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu
* Download links for Docker for Mac: https://www.docker.com/docker-mac

Command to test: 
```
docker version
```

## Kubectl:
* Download link: https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-binary-via-curl

Command to test kubectl installation: 

```
kubectl version
```

## Virtualbox:
* Download link: https://www.virtualbox.org/

## Minikube:
* General Download Instructions: https://kubernetes.io/docs/tasks/tools/install-minikube/
* Download link: https://github.com/kubernetes/minikube/releases

Command to test: 
```
minikube version
```

You should see output like below.

```
 minikube version
minikube version: v1.12.0
commit: c83e6c47124b71190e138dbc687d2556d31488d6
```
