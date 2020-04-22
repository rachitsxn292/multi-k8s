docker build -t rachitsxn292/multi-client:latest -t rachitsxn292/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t rachitsxn292/multi-server:latest -t rachitsxn292/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t rachitsxn292/multi-worker:latest -t rachitsxn292/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push rachitsxn292/multi-client:latest
docker push rachitsxn292/multi-server:latest
docker push rachitsxn292/multi-worker:latest

docker push rachitsxn292/multi-client:$SHA
docker push rachitsxn292/multi-server:$SHA
docker push rachitsxn292/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=rachitsxn292/multi-server:$SHA

kubectl set image deployments/client-deployment client=rachitsxn292/multi-client:$SHA

kubectl set image deployments/worker-deployment worker=rachitsxn292/multi-worker:$SHA



 