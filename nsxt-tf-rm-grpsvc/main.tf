#Loading services module
module "nsxt-tf-cm-svc" {
   source = "git::https://github.com/netmemo/nsxt-frac-tf-cm.git//nsxt-tf-cm-svc"
   map_svc = var.map_svc
}

#Loading groups module
module "nsxt-tf-cm-grp" {
   source = "git::https://github.com/netmemo/nsxt-frac-tf-cm.git//nsxt-tf-cm-grp"
   map_grp = var.map_grp
}
