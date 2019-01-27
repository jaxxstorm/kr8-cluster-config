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
  // aws-cluster-autoscaler
  serviceMonitorClusterAutoscaler:
    servicemonitor(name='aws-cluster-autoscaler') +
    {
      spec+: {
        endpoints: [
          {
            interval: '30s',
            targetPort: 8085,
          },
        ],
        namespaceSelector: {
          matchNames: ['kube-system'],
        },
        selector: {
          matchLabels: {
            app: 'aws-cluster-autoscaler',
          },
        },
      },
    },

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
    servicemonitor(name='nginx-ingress-default') +
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
            release: 'nginx-ingress-default',
          },
        },
      },
    },

  // gitlab runner
  serviceMonitorGitlabRunner:
    servicemonitor(name='gitlab-runner') +
    {
      spec+: {
        endpoints: [
          {
            interval: '30s',
            targetPort: std.parseInt('9252'),
          },
        ],
        namespaceSelector: {
          matchNames: ['gitlab'],
        },
        selector: {
          matchLabels: {
            app: 'gitlab-runner',
          },
        },
      },
    },
}
