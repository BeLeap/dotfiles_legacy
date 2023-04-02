function kbuild
  cp kustomization.yaml kustomization.yaml.bak
  yq -i '.helmCharts[].repo = "https://chartmuseum.util.riiid.cloud"' kustomization.yaml
  kustomize build --enable-helm
  rm -rf charts

  mv kustomization.yaml.bak kustomization.yaml
end
