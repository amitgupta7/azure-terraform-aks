#!/bin/sh
## sudo snap install helm --classic
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install my-release-pg  oci://registry-1.docker.io/bitnamicharts/postgresql
helm install my-release-ec oci://registry-1.docker.io/bitnamicharts/redis
helm install my-release-es oci://registry-1.docker.io/bitnamicharts/elasticsearch
