
echo "Run cadvisor"
kubectl apply -f cadvisor.daemonset.yaml

echo "Run postgres"
kubectl apply -f postgres.secret.yaml \
-f postgres.configmap.yaml \
-f postgres.volume.yaml \
-f postgres.deployment.yaml \
-f postgres.service.yaml

echo "Run redis"
kubectl apply -f redis.configmap.yaml \
-f redis.deployment.yaml \
-f redis.service.yaml

echo "Run poll worker result"
kubectl apply -f poll.deployment.yaml \
-f worker.deployment.yaml \
-f result.deployment.yaml \
-f poll.service.yaml \
-f result.service.yaml \
-f poll.ingress.yaml \
-f result.ingress.yaml

echo "Run traefik"
kubectl apply -f traefik.rbac.yaml \
-f traefik.deployment.yaml \
-f traefik.service.yaml