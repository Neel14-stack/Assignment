# Kubernetes CMDS and Screenshot

### to check kubectl and kubernetes is installed or not
- kubectl version

![Alt text](image.png)

### to see the same thing in short version
- kubectl version --short (its human readable form)

![Alt text](image-1.png)

## Notes about PODS
- Pods is a layer of abstraction, that wraps around one or more containers, and all the containers shares the same ip address and same deployment mechanism
- unlike docker, we cnat create a container directly in kubernetes
- we can create pods, and pods hold one or more contianers

### run nginx
- kubectl run my-nignx --image nginx

![Alt text](image-2.png)


## ALL THE CMDS HERE ON

- kubectl get pods

![Alt text](image-3.png)

- kubectl get all

![Alt text](image-4.png)

- kubectl crate deployment my-nginx --image nginx

![Alt text](image-5.png)

![Alt text](image-6.png)

![Alt text](image-7.png)

#### delete pods and deploymnet

- kubectl delete pod my-nginx

![Alt text](image-8.png)

![Alt text](image-9.png)

- kubectl delete deployment my-ngninx

![Alt text](image-10.png)

