docker build -t nowtothen32/multi-client:latest -t nowtothen32/multi-client:$SHA -f ./complex-gh/client/Dockerfile ./complex-gh/client
docker build -t nowtothen32/multi-server:latest -t nowtothen32/multi-server:$SHA -f ./complex-gh/server/Dockerfile ./complex-gh/server
docker build -t nowtothen32/multi-worker:latest -t nowtothen32/multi-worker:$SHA -f ./complex-gh/worker/Dockerfile ./complex-gh/worker

docker push nowtothen32/multi-client:latest
docker push nowtothen32/multi-client:$SHA
docker push nowtothen32/multi-server:latest
docker push nowtothen32/multi-server:$SHA
docker push nowtothen32/multi-worker:latest
docker push nowtothen32/multi-worker:$SHA

kubectl apply -f complex-gh/k8s
kubectl set image deployments/server-deployment server=nowtothen32/multi-server:$SHA
kubectl set image deployments/client-deployment client=nowtothen32/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=nowtothen32/multi-worker:$SHA