local apptio = import 'apptio.libsonnet';
local config = std.extVar('kr8');

[
  if std.objectHas(config, 'extra_env') then
    apptio.SealedSecret('grafana-secrets') {
      data: config.extra_env,
    },
]
