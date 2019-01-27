local kube = import 'kube.libsonnet';

// helper function
local servicemonitor(name, joblabel='app', namespace='monitoring') = {
  apiVersion: 'monitoring.coreos.com/v1',
  kind: 'ServiceMonitor',
  metadata: {
    labels: {
      'k8s-app': name,  // the label name (k8s-app) must match the service monitor selector in the prometheus resource
    },
    name: name,
    namespace: namespace,
  },
  // the rest of the spec needs to be merged in
  spec: {
    jobLabel: 'app',
  },
};

////////// Define each service monitor
{
  // external-dns
  serviceMonitorExternalDNS:
    servicemonitor(name='external-dns') +
    {
      spec+: {
        endpoints: [
          {
            interval: '30s',
            targetPort: 7979,
          },
        ],
        namespaceSelector: {
          matchNames: ['external-dns'],
        },
        selector: {
          matchLabels: {
            app: 'external-dns',
          },
        },
      },
    },

  // default nginx ingress controller
  serviceMonitorNginxIngressDefault:
    servicemonitor(name='nginx-ingress') +
    {
      spec+: {
        endpoints: [
          {
            interval: '30s',
            port: 'metrics',
          },
        ],
        namespaceSelector: {
          matchNames: ['kube-system'],
        },
        selector: {
          matchLabels: {
            app: 'nginx-ingress',
            release: 'nginx-ingress',
          },
        },
      },
    },
}
