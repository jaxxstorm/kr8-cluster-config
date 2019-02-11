local config = std.extVar('kr8');

{
  rbac: {
    create: false,
  },
  ingress: {
    enabled: true,
    hosts: [
      config.ingress_name,
    ],
  },
  'grafana.ini': config.grafana_config,
}
