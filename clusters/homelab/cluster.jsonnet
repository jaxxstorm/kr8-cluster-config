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
    unifi_exporter: { path: 'components/unifi_exporter' },
    nfs_client_provisioner: { path: 'components/nfs_client_provisioner' },
    grafana: { path: 'components/grafana' },
  },

  sealed_secrets+: (import 'sealed-secret.key'),
  metallb+: {
    addresses: ['192.168.1.250-192.168.1.254'],
  },

  unifi_exporter+: {
    exporter_config: {
      'config.yml': 'AgAZP4Bccq0Ew4vZSIooVQysvyhxoz7JOLFo+kTLMtv5Qlp7/teTVwfMuzKzpA4r8y7wMTK99YGnprHFvWww+Z//6ZmW1Vo8gCPAM5dVR8UUsZCoK8lRX39KWyhwCiZ6ylgQA9uOiRfEFqvInxXuBy/IYzMbArTXH8sAJY4seeCYTzZhBN4IBLdBxcgXVlTcBhIiaHNi28qulS0KbzhbAcw9WxNVEtzaiJtqt95aoDr15mCPD//GyQgJU+G+xzBQccZhZ2xe7Aq9Q/G3wnxo4tU+vxAxrjAQSNvbN3ko1iUrtQWsrujnA3Ix5IPvmYu6dBFSeK9v8w9WAtCWklTYxHLJ3iSraT8TZ/2/ZboqN2LDJU7ZTuZemIlWMWy6Tbr0xIJEU5rC1GdP3u+THKUxlmK4Nxfz0/f8Q78LKTx+XB1TU57xN+HCOD4QrdR7crGu/Skx3Jb7gsghopxFmAP5zEYypQJShqwpil48Yiw8uEzjWV9KHMgg5pvjzNP7NV+ANd0Xa/tZsOlu1IpRNB7ToidjpB9XFLq0+TemUuK+eL12ee/WXx/K2RMyc0EmEzZJQmbf+utP/31XMgfh80afcYcK4m9CPm3tGb7NmwnUz6GUhogbaekeO3TmIKxcGBSqFKrvh0Xr0WYbtP+HvojUh/wnSHosB52ATmq7r8/X3JKuKUwdG9Iejh4AnVN7QduiN/KD3/H1Kk7G5gwGxmMX7mRkD7HsU4IguTHz3xFLS/fy643vxF8Pfnfr2Tx7Oh04cydSQSz/NLK+xab9zYP/dTWGvhJ/ly111LbRn3HV6aCf3lFCiPacYtMk+UluGOMO50Cc0728Qjs4i1l0UC1+tF1cTNog42lu8tIlYX4VFcYiTLBlm2ABRKyFxIqPklnuPlnsU2WM3ye5p6vp9gI4muiBnlr9Ny3FQ1bDTOqpo3FEtjSLhqt47rqoKUjcoVa4HAz5aos/bb6eX7r8TAVWpoRd',
    },
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
      // volumeClaimTemplate: {},
      retention: '2d',
    },
  },

  nfs_client_provisioner+: {
    nfs_server: 'jupiter.home.lbrlabs.com',
    base_path: '/export',
  },

  grafana+: {
    ingress_name: 'grafana.home.lbrlabs.com',
    envFromSecret: 'grafana-secrets',
    grafana_config: {
      server: {
        domain: 'home.lbrlabs.com',
        root_url: 'http://grafana.home.lbrlabs.com',
      },
      'auth.google': {
        enabled: true,
        client_id: '1032916947128-gfsbta7iqcs2g236eu42j71j00l9g6le.apps.googleusercontent.com',
        auth_url: 'https://accounts.google.com/o/oauth2/auth',
        token_url: 'https://accounts.google.com/o/oauth2/token',
        allowed_domains: 'brig.gs lbrlabs.com lee@leebriggs.co.uk',
        allow_sign_up: true,
      },
    },
    extra_env+: {
      GF_DATABASE_URL: 'AgAaVVXuRW+863tJ102E4n/U65+Ss8wNAz+TijTQlGRM0ezVdoZHkRUIXuGhItxWn26H2HbP2AAmkNvCdeV40tXS9NR9BbVDoKR/swH6j4NEo7VaR9rUj8K8bBCG7vAx0+aNYsH+QgutruVuwSzRmc73+BivFlrPIq776eeJ3H3yGN+LcyYqBVklYE027OhFCNBdZEVxmydi0FJAQ8jh+R71DC0Px5iTygDvyWGUZL8is9h014duIYoDuiKEb4qFiKlsA/bcgw3m2OgT4aPEY8/wiJD6Znn2N+rXGrMuqjtlECVjP/t7GoccvGnKlS7Q98M1298NDqLBQNZ3cSsoX0hWWB2eSUYi9UvDoFssku8r/w8bH4xdb5Qv3s2jyuIPmATdtfDQDImYlRj2+1rzRFn4G8WDp1gdgrnYsCrAxCbd23ciS8qdOJ9vhoGbGPFUcmF8uKlUiF4gkX/Z5c5UTbhUIZ8qxMZyAW4HQU/ynevsKhGBvvGClBg514G6htGhpabAwWUuAr8TviJnzlOryu1UNC0+J8iCEq+N6peGlD9tu/cvfLVc4d9flLm8c2jnLKDjRaFA2fRv9sqgZ2V4DxkhRjgm4aUaUJAZ+siruiLQzOgIyPrSXfjT1fchzLGkimMtpnWtgvVrsH3Iowj7yF3+UcfckNzSgrSCfvj6relx0xjm0kFEDTJjUQWSDEJ9wwJ6KYyMG4cuGH4vn0zyW5ZPaQqwrX+4IluEFlyuOXxD6vHMPAyiwR2AUPDC2V3mQVBSm0jr4rP6wA==',
      GF_AUTH_GOOGLE_CLIENT_SECRET: 'AgCieAsYaZXFWaT0ofY+HYgEH3C6HNEVC/B/WuzAy0bPAq10tzZAlO+Rbcr8uAWfF/5sIDiP36cjFMFMkJMsvWMgybn3CR+j6Z2zoR+ZE3aNVQALs44ZTL5vap+9DB3wkCiY/6iHuRKBgDxPW4pcIa4eUss/VEzljUistq5wskzsYquIYirFSHHsgFTxg+65vSXo63kMNJbCCWeeFsGIh4U+G25aFv1fjlwIoG6CRboNNA7etLVDiS5vcLXdmyZ3ymsY44KpTN2GAuBApDIfG0RAcZMIhjrC7gcLNXEDADBjLcIyWgLmGy4BS3kh6EWhScDOZRf4ohoayVi145o42uZR/6RrvNmCS9kut0Bkls0UuMLM7YEGyYDrJY8gLD++qL65r2nQRtugGti29FMC9c+lR+JhexCAKyGrQBW/hSJYfHPX6KEizuAwWPssKROgvw5z/V78xb3AkcRKsAzqYUxWgqg5ABovNQGUdJiqioXa1oBqP9ryNM4b4N5XwriKm1KtscDpXf+duT7GMA80p4U67i/myu+G0MNn4d3v+McJ8zx5bFb1ULbuxphIOEpLCYFPEjiaREF86bfwtwu8vCS/H2WSGlTaeueUM/mP1rZd6i4ZkMdID6y2uKJsfxTLIQP6z9SPcUof3Gaw+6RWDWCZxa/HMbCw89u3aDaBRRipWsXf5/2VHDzGMkR+qZ1agBGFQIEvoqW7h1cG3Q7NBaLUadw0UKXrL2U=',
    },
  },

}
