#load data sources based on variables of other modules.
#You need -var-file argument in terraform commands to specify the variable of other root modules
#the benefit is to split the terraform state in different workspace/modules and handle groups thant can be global over different systems and rules that are specific to a system differently

data "nsxt_policy_service" "bltin" {
   for_each = toset(var.map_bltin_services["SERVICES"])
   display_name = each.key
}

data "terraform_remote_state" "grpsvc" {
   backend = "local"
   
   config = {
      path = "../nsxt-tf-rm-grpsvc/terraform.tfstate"
   }
}

#load the child modules stored in git, there is no data in the child modules
#The variable are store in the local project where there are 3 root modules. Groups, Services and Rules
module "nsxt-tf-cm-dfw" {
   source = "git::https://github.com/netmemo/nsxt-frac-tf-cm.git//nsxt-tf-cm-dfw"
   map_policies = var.map_policies
   #Other variable in the group and service root modules
   nsxt_policy_grp_grp = data.terraform_remote_state.grpsvc.outputs.grp
   nsxt_policy_svc_svc = data.terraform_remote_state.grpsvc.outputs.svc
   nsxt_policy_svc_bltin = data.nsxt_policy_service.bltin
}
