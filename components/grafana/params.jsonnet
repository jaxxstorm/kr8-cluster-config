{
  release_name: 'grafana',  // equivalent of name used for helm install --name ...
  namespace: 'grafana',
  kubecfg_gc_enable: false,
  ingress_name: error 'Must specify an ingress name',
  grafana_config: error 'Must specify config',
}
