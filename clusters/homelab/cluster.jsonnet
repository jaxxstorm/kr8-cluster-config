{
  _cluster+: {
    tier: 'prod',
    region_name: 'home',
    cluster_name: 'homelab',
    cluster_type: 'baremetal',
    dns_domain: 'home.lbrlabs.com',
  },
  _components+: {
    sealed_secrets: { path: 'components/sealed_secrets' },
    metallb: { path: 'components/metallb' },
    nginx_ingress: { path: 'components/nginx_ingress' },
    prometheus: { path: 'components/prometheus' },
  },

  sealed_secrets+: (import 'sealed-secret.key'),
  metallb+: {
    addresses: ['192.168.1.250-192.168.1.254'],
  },
  external_dns+: {
    extraEnv: {
      CF_API_KEY: 'AgCgrv1ZTNkFgTltvs64JPYXFj4/4E9qfejWpN4prz+/PYeE2QW9ChSHX9Xn4fYDk5iOo7UFl4ay/rr7B60sSmfabcpB/fir9zGGk3BCcPGgaQu2fZEjxR9rDc9hKr6kAkOR7dczaOYRt2jvcN+0naLbAAMi+l0FzIhjBUKTgEm98n2QvCUHclETR/h0P5V6zcDE/+T04fEdopG0Poh966GtUSZqV/zPp76uUOjTpWca3k3Vdx4clW3mezitq8yRsEkqYo0cuOGpopvdMDGgyKlbpczoQPHora4BwCqsBu+fZhuNxy9Duhtu9cSzGbJ2QeU7Wl/lwmUD3+/RCKShZTTAVNI6zyXQWu1Qb8eJlSsNJ5ZnQJEk5n3KUGtN9USDSLjJseyuTQmz8ohIjcbRsGn7rC78vwxUdewquiq46njgJHg0HjTlHHPuh6sZxNaQeZaj/emIO+2QNE5mfM8JgzOD01wLNXSb2U0L2m2C/Bl0HU2a++EoJANg9PD3axog+6Gd7W5f4oaUGzSgF6ShIOCk/OboO7+JKj7kGJ1ef/g1hDxWDTBa1JEn7+ZA4taunHug2zFmQq8nm38ZpM035jAlgvVlLIMSGsISfQuoSewkvWo8yW0jN4w3cBI4tfCqGd3JfstYt+KzmcGNBj1SBJsGvIxvf+VBOchqdV1wi4knSdnxpOtbN2dx8snR4nWKYKNiDROcqaXeYa8ed9kF8C32xHckfeycuoRQlwNckgbBjZeuT7/+',
      CF_API_EMAIL: 'AgC5co+qqrPTRLidzdMWPi0mw8kYLyeyGTiX9Gwuz+LohmB+cxbs4arVa4w3aZfuC5CHnkbwCTyIb3Ia1ZGDZQHuNjA6+xPCO0+Yxk42qErdRnRo7BvZQko3C3PsC0xO9++/jKmnWfsigxZIxmyGBQlq0j0RHa24mUSdsUnT6P4Oealu6b66cfim8fnitWVQxMsq/Q2UTThF9oZM4aXZbujy6afVth+9nsqyKrtyfTMt9ypEumtEy79P8IiB/pGkq+A7ULZuhp1DSulP9NyxFvJ1WUdDEsU+eZOiN27KxAZfaMOHMm1DrHjmtFShEjeA5yTd46XSCsx0O61MIhVkhr8YpfkH/PEKQFhUlIgz/h7ypnO5YLgMZUemqdPrD8jsvd5PbvjI/UnmiiAP6zgXxIdwPQEla6waUqzVZrfJdXSOfgcyVuklbg5ueXZn4L2w+Q6jNxJIq+7RR07uNCbyULK0y4k5a14T1kEjKd5eqOWzX0CHrCH9GgWl75NXB96PKa93Mv6XNJIJPxQiC9f9xVG5jJ3mNFfB649VLCtZy+bgYlMq6rJZ0qRv/mgw8SQHzvzOMRKVYNXwyoplu8k+7Huhh7NLJqPJnzfCwuLgmuyx2yedh635QvhPY89V+FUrTxmimkkoUMeHY1Y742xp1bIWI9mqOxBiH2paOUbdaRfWvbkTC+U5idc0pjXMXkZMYLG4vVTjx28JG6a5UwoS0b26cF8h',
    },

    provider: 'cloudflare',
    txtPrefix: 'homelab',
    txtOwnerId: 'lbrlabs',
    domainFilters: [
      'lbrlabs.com',
      'briggs.io',
      'briggs.work',
    ],
    tolerateMasters: true,
  },
  prometheus+: {
    ingress_class: 'nginx',
    ingress_enabled: true,
    ingress_authenabled: false,
    enable_node_exporter: false,
    prometheus+: {
      externalName: 'prom-k8s.home.lbrlabs.com',
      volumeClaimTemplate: {},
      retention: '2d',
    },
  },

}
