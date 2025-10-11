# Instructions

Remember to install Ingress Controller first.

```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx/

helm pull ingress-nginx/ingress-nginx

tar -xzf ingress-nginx-4.13.2.tgz

vim ingress-nginx/values.yaml
```
Change to NodePort type, with nodePorts http: 30080, https: 30443.

Map your domain to the public IP of Worker Node and test if you can access via domain.