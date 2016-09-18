./start.sh start config-service
while [ -z ${CONFIG_SERVICE_READY} ]; do
  echo "Waiting for config service..."
  if [ "$(curl --silent 192.168.4.63:8888/health 2>&1 | grep -q '\"status\":\"UP\"'; echo $?)" = 0 ]; then
      CONFIG_SERVICE_READY=true;
  fi
  sleep 2
done
./start.sh start discovery-service
while [ -z ${CONFIG_SERVICE_READY} ]; do
  echo "Waiting for discovery service..."
  if [ "$(curl --silent $DOCKER_IP:8761/health 2>&1 | grep -q '\"status\":\"UP\"'; echo $?)" = 0 ]; then
      DISCOVERY_SERVICE_READY=true;
  fi
  sleep 2
done

./start.sh start account-service

./start.sh start catalog-service

./start.sh start edge-service

./start.sh start inventory-service

./start.sh start user-service

./start.sh start online-store-web

./start.sh start order-service

./start.sh start shopping-cart-service

#./start.sh start payment-service

#./start.sh start hystrix-dashboard

