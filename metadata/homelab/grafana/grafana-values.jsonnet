grafana.ini:
  auth.google:
    allow_sign_up: true
    allowed_domains: brig.gs lbrlabs.com lee@leebriggs.co.uk
    auth_url: https://accounts.google.com/o/oauth2/auth
    client_id: 1032916947128-gfsbta7iqcs2g236eu42j71j00l9g6le.apps.googleusercontent.com
    enabled: true
    token_url: https://accounts.google.com/o/oauth2/token
  server:
    domain: home.lbrlabs.com
    root_url: http://grafana.home.lbrlabs.com
ingress:
  enabled: true
  hosts:
  - grafana.home.lbrlabs.com
rbac:
  create: false

