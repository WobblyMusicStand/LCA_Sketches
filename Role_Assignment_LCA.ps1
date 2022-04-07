$username = "@lab.CloudPortalCredential(admin1).Username"
#$rgname = "@lab.CloudResourceGroup(corpdata).Name"
#$SUB = "/subscriptions/" + $(Get-AzSubscription).id
$SUB = "/subscriptions/@lab.CloudSubscription.Id"

New-AzRoleAssignment -SignInName $username `
-RoleDefinitionName "Azure Event Hubs Data Owner" `
-Scope $SUB

Remove-AzRoleAssignment -SignInName $username `
-RoleDefinitionName "Azure Event Hubs Data Owner" `
-Scope $SUB