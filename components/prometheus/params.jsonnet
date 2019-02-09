{
  namespace: 'monitoring',
  release_name: 'prometheus',
  kubecfg_update_args: '--ignore-unknown',  // need to add this because of CRDs causing validate failure
  kubecfg_gc_enable: true,

  alertmanager_external_endpoints: [],  // FQDNS of external alert managers, and tcp port (e.g. host.domain:443)
  ingress_class: 'default',
  ingress_enabled: false,
  ingress_authenabled: true,
  enable_node_exporter: true,

  password: '',

  prometheus: {
    externalName: $._cluster.cluster_name + '-prom.apps.' + $._cluster.dns_domain,
    externalUrl: 'http://' + self.externalName,
    // external labels
    externalLabels: {
      tier: $._cluster.tier,
      region: $._cluster.region_name,
      kubernetes_cluster: $._cluster.cluster_name,
      prometheus_type: 'kubernetes',
//      monitor: 'k8s-' + self.kubernetes_cluster,
    },

    // 50GB persistent volume (each prometheus instance will get a volume - see "replicas")
    volumeClaimTemplate: {
      spec: { resources: { requests: { storage: '50Gi' } } },
    },
    // storage retention
    retention: '10d',

    // Number of prometheus instances
    replicas: 1,

    // Define service to match for external alertmanagers
    alertmanagers: [
      {
        name: 'alertmanager-external',
        scheme: 'http',
        port: 'web',
        namespace: 'monitoring',
      },
    ],
  },
}
