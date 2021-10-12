E:VAULT_ADDR = "https://vault.riiid.cloud"

use github.com/zzamboni/elvish-modules/alias alias

fn vaultlogin []{
  vault login -method=oidc -path=keycloak
}

fn awslogin []{
  saml2aws login -p default --skip-prompt
}

fn ecrlogin []{
  aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 165167487431.dkr.ecr.ap-northeast-1.amazonaws.com
}
