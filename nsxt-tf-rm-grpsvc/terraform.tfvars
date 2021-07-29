map_grp = {
   NETMEMO-LOCAL = { IP = ["10.0.0.0/25","10.1.1.0/25"] }
   NETMEMO-NAS = { TAG = ["NAS","FILES"] }
   NETMEMO-ESX = { TAG = ["ESX","VMWARE"] }
}

map_svc = {
   NETMEMO-ESP = { IP = ["50"] }
   NETMEMO-NETBIOS = { TCP = ["135","137","139","139"], UDP = ["135","137","139","139"] }
}
