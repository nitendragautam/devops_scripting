# Breaking down the helloworld app

## Chapter Goals

1. Understand the basics of the deployment and service
2. Understand what we created
3. Create a simple single yaml file for deployment and service
4. Run the yaml file in minikube
5. Verify that the application is working as expected

### Understand the basics of the deployment and service

Running `kubectl get all` shows us pods, services and deployments that are running that build the helloworld application. Let's peel this onion and figure out what's going on.


### Looking at the deployment YAML file

To take a look at the deployment YAML that runs the application, run below command.

```
% kubectl get deploy/helloworld -o yaml
``` 


This will return the YAML that composes the helloworld service. This yaml will look like below.


```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    deployment.kubernetes.io/revision: "1"
  creationTimestamp: "2020-07-26T18:04:05Z"
  generation: 1
  managedFields:
  - apiVersion: apps/v1
    fieldsType: FieldsV1
    fieldsV1:
      f:spec:
        f:progressDeadlineSeconds: {}
        f:replicas: {}
        f:revisionHistoryLimit: {}
        f:selector:
          f:matchLabels:
            .: {}
            f:app: {}
        f:strategy:
          f:rollingUpdate:
            .: {}
            f:maxSurge: {}
            f:maxUnavailable: {}
          f:type: {}
        f:template:
          f:metadata:
            f:labels:
              .: {}
              f:app: {}
          f:spec:
            f:containers:
              k:{"name":"helloworld"}:
                .: {}
                f:image: {}
                f:imagePullPolicy: {}
                f:name: {}
                f:ports:
                  .: {}
                  k:{"containerPort":80,"protocol":"TCP"}:
                    .: {}
                    f:containerPort: {}
                    f:protocol: {}
                f:resources: {}
                f:terminationMessagePath: {}
                f:terminationMessagePolicy: {}
            f:dnsPolicy: {}
            f:restartPolicy: {}
            f:schedulerName: {}
            f:securityContext: {}
            f:terminationGracePeriodSeconds: {}
    manager: kubectl
    operation: Update
    time: "2020-07-26T18:04:05Z"
  - apiVersion: apps/v1
    fieldsType: FieldsV1
    fieldsV1:
      f:metadata:
        f:annotations:
          .: {}
          f:deployment.kubernetes.io/revision: {}
      f:status:
        f:availableReplicas: {}
        f:conditions:
          .: {}
          k:{"type":"Available"}:
            .: {}
            f:lastTransitionTime: {}
            f:lastUpdateTime: {}
            f:message: {}
            f:reason: {}
            f:status: {}
            f:type: {}
          k:{"type":"Progressing"}:
            .: {}
            f:lastTransitionTime: {}
            f:lastUpdateTime: {}
            f:message: {}
            f:reason: {}
            f:status: {}
            f:type: {}
        f:observedGeneration: {}
        f:readyReplicas: {}
        f:replicas: {}
        f:updatedReplicas: {}
    manager: kube-controller-manager
    operation: Update
    time: "2020-07-26T18:04:20Z"
  name: helloworld
  namespace: default
  resourceVersion: "3981"
  selfLink: /apis/apps/v1/namespaces/default/deployments/helloworld
  uid: 1a036eb9-6c67-4827-a1bc-063f52cd1fb7
spec:
  progressDeadlineSeconds: 600
  replicas: 1
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: helloworld
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: helloworld
    spec:
      containers:
      - image: karthequian/helloworld:latest
        imagePullPolicy: Always
        name: helloworld
        ports:
        - containerPort: 80
          protocol: TCP
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 30
status:
  availableReplicas: 1
  conditions:
  - lastTransitionTime: "2020-07-26T18:04:20Z"
    lastUpdateTime: "2020-07-26T18:04:20Z"
    message: Deployment has minimum availability.
    reason: MinimumReplicasAvailable
    status: "True"
    type: Available
  - lastTransitionTime: "2020-07-26T18:04:05Z"
    lastUpdateTime: "2020-07-26T18:04:20Z"
    message: ReplicaSet "helloworld-7cf6df685c" has successfully progressed.
    reason: NewReplicaSetAvailable
    status: "True"
    type: Progressing
  observedGeneration: 1
  readyReplicas: 1
  replicas: 1
  updatedReplicas: 1

```

When working with Kubernetes, you should get familiar with these YAML files.

#### Kubernetes Service YAML Files

The Kubernetes service also comprises YAMLs. Let's take a look at that by running below command

`kubectl get service helloworld-service -o yaml`.
This yaml looks like below.

```yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: "2020-07-26T18:18:44Z"
  managedFields:
  - apiVersion: v1
    fieldsType: FieldsV1
    fieldsV1:
      f:spec:
        f:externalTrafficPolicy: {}
        f:ports:
          .: {}
          k:{"port":80,"protocol":"TCP"}:
            .: {}
            f:port: {}
            f:protocol: {}
            f:targetPort: {}
        f:selector:
          .: {}
          f:app: {}
        f:sessionAffinity: {}
        f:type: {}
    manager: kubectl
    operation: Update
    time: "2020-07-26T18:18:44Z"
  name: helloworld
  namespace: default
  resourceVersion: "4163"
  selfLink: /api/v1/namespaces/default/services/helloworld
  uid: a778ecb1-05e1-4858-840b-9cbf5aaf89c4
spec:
  clusterIP: 10.103.156.241
  externalTrafficPolicy: Cluster
  ports:
  - nodePort: 31676
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: helloworld
  sessionAffinity: None
  type: NodePort
status:
  loadBalancer: {}

```



### Create our deployment using YAML

If we were going to recreate our deployment and service as YAMLs, they would look like the following:

Deployment:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: helloworld-deployment
spec:
  selector:
    matchLabels:
      app: helloworld
  replicas: 1 # tells deployment to run 1 pods matching the template
  template: # create pods using pod definition in this template
    metadata:
      labels:
        app: helloworld
    spec:
      containers:
      - name: helloworld
        image: karthequian/helloworld:latest
        ports:
        - containerPort: 80
```

Service:
```
apiVersion: v1
kind: Service
metadata:
  name: helloworld-service
spec:
  # if your cluster supports it, uncomment the following to automatically create
  # an external load-balanced IP for the frontend service.
  type: LoadBalancer
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: helloworld
```




### Execute our deployment using YAML

To create these, we can run the command `kubectl create -f helloworld-deployment.yml` to create our deployment and `kubectl create -f helloworld-service.yml` to create the service. This will take the contents of the YAML file and create the necessary components in the file.

### Create Hello World Deploymend Yml file
```
karthik$ kubectl create -f helloworld-deployment.yml
deployment "helloworld-deployment" created
```

## Create Hello World Service
```
karthik$ kubectl create -f helloworld-service.yml
service "helloworld-service" created
karthik$

```

## Creating Service in Real world

Typically, in the real world, you would mostly not use seperate files to break up your application and would have it in a single file that encompasses the entire application with both the deployment and the service component. Below YAML files shows how to combine helloworld-deployment yaml file and helloworld-service yaml.

An example of this YAML file is shown here:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: helloworld-deployment
spec:
  selector:
    matchLabels:
      app: helloworld
  replicas: 1 # tells deployment to run 1 pods matching the template
  template: # create pods using pod definition in this template
    metadata:
      labels:
        app: helloworld
    spec:
      containers:
      - name: helloworld
        image: karthequian/helloworld:latest
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: helloworld-service
spec:
  # if your cluster supports it, uncomment the following to automatically create
  # an external load-balanced IP for the frontend service.
  type: LoadBalancer
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: helloworld
```

Notice the `---` that marks the end of one section and starts another.

```

kubectl create -f helloworld-all.yml
deployment.apps/helloworld-all-deployment created
service/helloworld-all-service created
```

Now lets check all the deployment that has happened in our kubernetes cluster.

```
% kubectl get deployment
NAME                        READY   UP-TO-DATE   AVAILABLE   AGE
helloworld                  1/1     1            1           8h
helloworld-all-deployment   1/1     1            1           99s
helloworld-deployment       1/1     1            1           4h55m
```

## Check all Services that is Running

```

kubectl get services
NAME                     TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
helloworld               NodePort    10.103.156.241   <none>        80:31676/TCP   8h
helloworld-all-service   NodePort    10.107.73.75     <none>        80:30736/TCP   3m49s
helloworld-service       NodePort    10.99.194.155    <none>        80:32720/TCP   4h57m
kubernetes               ClusterIP   10.96.0.1        <none>        443/TCP        26h

```
### Verify that the application is working as expected
Finally, to see this new helloworld working as expected, we will run the minikube command to expose the service in the browser with the following command:

```
karthik$ minikube service helloworld-service
Opening kubernetes service default/helloworld-service in default browser...
karthik$
```


