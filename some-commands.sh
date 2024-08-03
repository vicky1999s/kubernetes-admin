####links#####
#to upgrade a cluster
#https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/
#https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/
#etcd backup
#https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/#backing-up-an-etcd-cluster
##########

#to generate a yaml file and other create commands
kubectl create deployment --image=nginx nginx --replicas=4 --dry-run=client -o yaml > nginx-deployment.yaml
kubectl create configmap webapp-config-map --from-literal=APP_COLOR=darkblue --from-literal=APP_OTHER=disregard 

#to taint a node
kubectl taint node node01 color=red:NoSchedule #add "-" at the end to remove the taint, respective tolerations should be added in podspec

#to label the node
kubectl label node node01 color=red

#to update the image
kubectl set image deployment/myapp container-name=repo/image:2.45

#to create certificate for a user
openssl genrsa -out myuser.key 2048 
openssl req -new -key myuser.key -out myuser.csr -subj "/CN=myuser"
#And then create certificateSigningRequest resource and 
kubectl certficate approve mycsr

#To check whether a user have particular access
kubectl auth can-i create deployments
kubectl auth can-i delete node --as myuser --namespace mynamespace

