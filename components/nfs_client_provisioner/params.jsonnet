{
  release_name: 'nfs-client-provisioner',  // equivalent of name used for helm install --name ...
  namespace: 'kube-system',
  kubecfg_gc_enable: true,
  base_path: '/export',
  default_class: true,
  nfs_server: 'jupiter.home.lbrlabs.com',

}
