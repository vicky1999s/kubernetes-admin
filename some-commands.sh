#to generate a yaml file
kubectl create deployment --image=nginx nginx --replicas=4 --dry-run=client -o yaml > nginx-deployment.yaml

#to taint a node
kubectl taint node node01 color=red:NoSchedule #add "-" at the end to remove the taint, respective tolerations should be added in podspec

#to label the node
kubectl label node node01 color=red