function kbuild
  cp kustomization.yaml kustomization.yaml.bak
  yq -i '.helmCharts[].repo = "https://chartmuseum.util.riiid.cloud"' kustomization.yaml
  kustomize build --enable-helm
  rm -rf charts

  mv kustomization.yaml.bak kustomization.yaml
end

function upchart
  find -path "./deploy/*/$ENV/kustomization.yaml" -exec yq -i '(.helmCharts.[] | select(.name == "'"$CHART"'")).version = "'"$VERSION"'"' {} \;
end
