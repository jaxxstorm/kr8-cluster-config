local config = std.extVar('kr8');

{
  rbac: {
    create: true,
  },

  storageClass: {
    defaultClass: config.default_class,
  },

  nfs: {
    server: config.nfs_server,
    path: config.base_path,
  },

}
