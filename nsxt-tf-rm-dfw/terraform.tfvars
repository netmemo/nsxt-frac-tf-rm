
map_bltin_services = {
   SERVICES = ["ICMP ALL","SSH","HTTPS"]
}

map_policies = {
   NETMEMO-POL1 = {
      category = "Application"
	  sequence_number = "10"
	  rules = {
	     netmemo-rule1 = {
		    display = "NETMEMO-NAS-R"
			sources = ["NETMEMO-NAS"]
			destinations = ["NETMEMO-NAS"]
			services = ["HTTPS"]
			scope = ["NETMEMO-NAS"]
			action = "ALLOW"
			disabled = "false"
			logged       = "true"
			direction    = "IN_OUT"
			notes  = "Rule comment"			
	     }
	     netmemo-rule2 = {
		    display = "NETMEMO-ESX-R"
			sources = ["NETMEMO-ESX"]
			destinations = ["NETMEMO-ESX"]
			services = ["HTTPS"]
			scope = ["NETMEMO-ESX"]
			action = "ALLOW"
			disabled = "false"
			logged       = "true"
			direction    = "OUT"
			notes  = "CR#1234"
	     }
	  }
   }
   NETMEMO-POL2 = {
      category = "Application"
	  sequence_number = "20"
	  rules = {
	     netmemo-rule1 = {
		    display = "NETMEMO-LOCAL-R"
			sources = ["NETMEMO-LOCAL"]
			destinations = ["NETMEMO-NAS","NETMEMO-ESX"]
			services = ["NETMEMO-NETBIOS","HTTPS"]
			scope = ["NETMEMO-NAS","NETMEMO-ESX"]
			action = "ALLOW"
			disabled = "false"
			logged       = "true"
			direction    = "IN_OUT"
			notes  = ""
	     }
	  }
   }
}
