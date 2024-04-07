#to generate a yaml file and other create commands
kubectl create deployment --image=nginx nginx --replicas=4 --dry-run=client -o yaml > nginx-deployment.yaml
kubectl create configmap webapp-config-map --from-literal=APP_COLOR=darkblue --from-literal=APP_OTHER=disregard 

#to taint a node
kubectl taint node node01 color=red:NoSchedule #add "-" at the end to remove the taint, respective tolerations should be added in podspec

#to label the node
kubectl label node node01 color=red

#to update the image
kubectl set image deployment/myapp container-name=repo/image:2.45

