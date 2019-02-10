local apptio = import 'apptio.libsonnet';
local config = std.extVar('kr8');

[
  if std.objectHas(config, 'exporter_config') then
    apptio.SealedSecret('unifi-exporter-credentials') {
      data: config.exporter_config,
    },
]
