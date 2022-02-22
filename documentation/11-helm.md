https://hub.kubeapps.com/

`helm repo add bitnami https://charts.bitnami.com/bitnami`
`helm search repo bitnami`
helm show all bitnami/mysql

helm search hub wordpress => https://artifacthub.io/
helm search repo wordpress => öncesinde yüklenen dosyalarda arama yapar

helm install bitnami/wordpress --generate-name
helm list
helm status wordpress-1645280270
helm uninstall bitnami/wordpress --generate-name

helm show values bitnami/wordpress => erişebilir value leri gösterir

helm install -f values.yaml bitnami/wordpress --generate-name


helm pull bitnami/wordpress --untar