#! /bin/sh

ssh-agent bash

ssh-add /root/.ssh/id_rsa_129

./scpbase.sh account-service

./scpbase.sh catalog-service

./scpbase.sh hystrix-dashboard

./scpbase.sh inventory-service

./scpbase.sh order-service

./scpbase.sh shopping-cart-service



