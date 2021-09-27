E:VAULT_ADDR = "https://vault.riiid.cloud"

use github.com/zzamboni/elvish-modules/alias alias

#######################
# <ShorthandCommands> #
#######################
alias:new awslogin saml2aws login -p default --skip-prompt
alias:new vaultlogin vault login -method=oidc -path=keycloak
########################
# </ShorthandCommands> #
########################
