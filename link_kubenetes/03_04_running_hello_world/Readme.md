# Running your first helloworld

## Chapter Goals

1. Starting up minikube
2. Set up your first Kubernetes helloworld application
3. Run your application in a minikube environment
4. Expose application via a nodeport and see it running

### Starting up minikube

First, get minikube up and running with the command `minikube start`. This command sets up a Kubernetes dev environment for you via VirtualBox. This will take some for the first time as minikube needs to download all the needed dependencies

The last statement in the output states that kubectl can talk to minikube. We can verify this by running the command `kubectl get nodes`

```kubectl get nodes``` : This command makes sure that kubectl deaemon can talk to minikube.



This will show you that minikube is ready to use and will display output like below.

```
 kubectl get nodes
NAME       STATUS   ROLES    AGE   VERSION
minikube   Ready    master   16h   v1.18.3
```



## Check the used resources using kubectl

This command will show you all the resources being used in the cluster.

```
kubectl get all
NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   16h
```

### Set up your helloworld

Make sure you have your files unzipped to your local machine (for example /documents/Kubernetes). You should be in your existing directory with the exercise files for chapter 03_04 as shown below.

```
 % pwd
/Users/nitendragautam/github_projects/devops_scripting/link_kubenetes/03_04_running_hello_world
nitendragautam@Nitendras-MacBook-Pro 03_04_running_hello_world % ls -al
total 24
drwxrwxrwx@  4 nitendragautam  staff   128 Jun  4 12:20 .
drwxr-xr-x  21 nitendragautam  staff   672 Jul 26 12:34 ..
-rwxrwxrwx@  1 nitendragautam  staff  4303 Jul 26 12:56 Readme.md
-rwxrwxrwx@  1 nitendragautam  staff   448 Apr 23 00:56 helloworld.yaml
```

We will run one of the most common Docker helloworld applications out there- [https://hub.docker.com/r/karthequian/helloworld/]

To run this, type:

```
kubectl create -f helloworld.yaml
```

This command creates a deployment resource from the file helloworld.yaml.
In this case it contains a deployment called "hellworld" that pulls ```karthequian/helloworld``` iamge and exposes port ``80`` of the container to the pod.

Running this command will give you this output, stating that the deployment "hw" was created.

```
$ kubectl create -f helloworld.yaml
deployment.apps/helloworld created
```

### Check the resources running 

We can run the command `kubectl get all` to see all our resources running, as shown in the output below.

```
$ kubectl get all
NAME                              READY   STATUS    RESTARTS   AGE
pod/helloworld-7cf6df685c-f9knz   1/1     Running   0          3m32s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   17h

NAME                         READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/helloworld   1/1     1            1           3m32s

NAME                                    DESIRED   CURRENT   READY   AGE
replicaset.apps/helloworld-7cf6df685c   1         1         1       3m32s
$

```

### Setting up a load balancer

You'll notice that in the `kubectl get all` command, the service has a port mapping defined; however, when you try to hit that port via your web browser, you won't be able to reach the service.

We won't be able to access the web page deployed by the image, as the Kubernates pod is only accessible by the internal IP address within the cluster.

This is because by default, the pod is only accessible by its internal IP address within the cluster. To make the helloworld container accessible from outside the Kubernetes virtual network, you have to expose the pod as a Kubernetes service.

To do this, we can expose the pod to the public internet using the kubectl expose command.

#### Expose the pod to the public internet

we can expose the pod to the public internet using the kubectl expose command.

`kubectl expose deployment helloworld --type=NodePort`

```
% kubectl expose deployment helloworld --type=NodePort
service/helloworld exposed

```

The `--type=NodePort` flag exposes the deployment outside of the cluster. If you're using this on a cloud provider, you can use a `--type=LoadBalancer` that will provision an external IP address would be provisioned to access the service.

To view the final user interface, use the minikube service command.

This command will reference the ```service/helloworld``` service and allows use to access the final UI interface.

`minikube service helloworld`

```
minikube service helloworld
|-----------|------------|-------------|---------------------------|
| NAMESPACE |    NAME    | TARGET PORT |            URL            |
|-----------|------------|-------------|---------------------------|
| default   | helloworld |          80 | http://192.168.64.2:31676 |
|-----------|------------|-------------|---------------------------|
🎉  Opening service default/helloworld in default browser...
```

This will open your web browser to your application that is running in Kubernetes!

#### Commands run in this section

```bash
pwd
ls -al
kubectl get all
kubectl create -f helloworld.yaml
kubectl expose deployment helloworld --type=NodePort
minikube service helloworld
```