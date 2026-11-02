#!/bin/bash
# Creates a tag + GitHub release for every archived C&C Ancients v4 build and uploads the .vmod.
# Run on Mark's Mac (needs the GitHub CLI: brew install gh; gh auth login).
# Files only on the Mac are read from their current locations; library files are downloaded from obj.vassalengine.org.
# Safe to re-run: existing releases are skipped.
set -u
REPO=riverwanderer/ccancients
TMP=$(mktemp -d); trap 'rm -rf "$TMP"' EXIT
md5of() { md5 -q "$1" 2>/dev/null || md5sum "$1" | cut -d' ' -f1; }
rel() {
  local tag=$1 sha=$2 asset=$3 md5=$4 src=$5 pre=$6
  if gh release view "$tag" -R $REPO >/dev/null 2>&1; then echo "= $tag exists"; return; fi
  local notes; notes=$(gh api repos/$REPO/commits/$sha --jq .commit.message | tail -n +3)
  local title; title=$(gh api repos/$REPO/commits/$sha --jq .commit.message | head -1)
  if [ "$src" = "-" ]; then
    gh release create "$tag" -R $REPO --target "$sha" --title "$title" --notes "$notes" $pre && echo "+ $tag (no asset)"; return
  fi
  local f="$TMP/$asset"
  if [[ "$src" == https://* ]]; then curl -fsSL -o "$f" "$src" || { echo "! $tag download failed"; return; }
  else
    [ -f "$src" ] || { echo "! $tag: file not found: $src"; return; }
    cp "$src" "$f" || { echo "! $tag copy failed (iCloud file not downloaded?)"; return; }
  fi
  if [ "$(md5of "$f")" != "$md5" ]; then echo "! $tag: md5 mismatch for $src, skipped"; rm -f "$f"; return; fi
  gh release create "$tag" -R $REPO --target "$sha" --title "$title" --notes "$notes" $pre "$f" && echo "+ $tag"
  rm -f "$f"
}
rel "v4.0" e06b1e7a718a7311602feeca2a6ca0c2aeeb3894 "CCAncientsV4.vmod" "7049c10b9f6700278f6a0dc69956a717" "https://obj.vassalengine.org/images/2/23/CCAncientsV4.vmod" ""
rel "v4.1" 3db0708b24daa27baafd6cc2ce7fc51e84b730f2 "CCAncientsV41.vmod" "5fa5a553236a0f7448b591f66b4b6479" "https://obj.vassalengine.org/images/8/89/CCAncientsV41.vmod" ""
rel "v4.1-resaved-3.4.0b1" 1afe0065a1adaffa016b86a614b027a2b326c177 "CCAncientsV41-resaved-3.4.0b1.vmod" "15e86ada14c1ec2a6dece458cfeaea66" "$HOME/Documents/Documents – old/Vassal Modules/CCAncientsV41.vmod" "--prerelease"
rel "v4.1f1" 80b88440954948842a6290e4e10e02c850aa172a "CCAncientsV41f1.vmod" "d501fe2983bfc9c227920c60c80a8ccc" "https://obj.vassalengine.org/images/1/12/CCAncientsV41f1.vmod" ""
rel "v4.1f1-lockdown" 40adfd490af85b4ac8cecb9db81b462c29367182 "CCAncientsV41f1-lockdown.vmod" "106e0a7e979fbeadedfef8f3b1815d78" "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Vassal Logs/CCA Lockdown Epics/CCAncientsV41f1.vmod" "--prerelease"
rel "v4.2.6" ebdc04230a8048d3768934c7d3338db5c0d1e952 "CCAncientsV4-2-6.vmod" "a614ba85f7244f97112464058bf6ceee" "https://obj.vassalengine.org/images/f/f3/CCAncientsV4-2-6.vmod" ""
rel "v4.3.12" 84875f6511dbc90046b6c2969acb8f7266832d66 "CCAncientsV4-3-12.vmod" "981b0470bfa91146f2ff5080936f96d7" "$HOME/Vassal Modules/CCAncientsV4-3-12.vmod" ""
rel "v4.3.14a03-auto-side-test" ee35fabab40d3b478649d3de20fb7efb2d0b817e "CCAncientsV4-3-14a03-AUTO-SIDE-TEST.vmod" "b6d8a472d191ad5db6f6cc34cbe9ebf7" "$HOME/Documents/Miscellaneous Unsorted - mainly C&C Dev/CCAncientsV4-3-13 AUTO SIDE TEST.vmod" "--prerelease"
rel "v4.3.17a001" f8d7787ebb5621a2a88bc8282a3f81d7cb0f6260 "-" "-" "-" "--prerelease"
rel "v4.3.22" 6e9bfc6bdc95f7dd1598826c6fc57c6756c988b2 "CCAncientsV4-3-22.vmod" "14b820daf87f6ce7130ee9090ed93ad6" "https://obj.vassalengine.org/images/d/df/CCAncientsV4-3-22.vmod" ""
rel "v4.3.23" e1ea025cbf2acd8af738c6969155f53409277da4 "CCAncientsV4-3-23.vmod" "4d83c3e9291fc07fe0ea0d2c3863975c" "https://obj.vassalengine.org/images/d/d5/CCAncientsV4-3-23.vmod" ""
rel "v4.3.24" 930f24c882a02b79ea7acf976bc2576150a0d0ab "CCAncientsV4-3-24.vmod" "ac85e1d4117ed5f97df40482448462f2" "https://obj.vassalengine.org/images/a/a6/CCAncientsV4-3-24.vmod" ""
rel "v4.3.25" 072f0dab00312c923ad17fcf069e991b8530f989 "CCAncientsV4-3-25.vmod" "2d774f860f50ee691f3c253a49f1435c" "https://obj.vassalengine.org/images/f/f6/CCAncientsV4-3-25.vmod" ""
rel "v4.3.26" a16e77976770cebdb1871976eefb205690b796a4 "CCAncientsV4-3-26.vmod" "2e233f4c847487e0d825874985b6908d" "https://obj.vassalengine.org/images/2/2b/CCAncientsV4-3-26.vmod" ""
rel "v4.3.27" 7367884cdb6b3765c02916a70f0e9eb0d0bcd716 "CCAncientsV4-3-27.vmod" "b9581d7d4c18f69f25b5fbae1cba10ac" "https://obj.vassalengine.org/images/9/9f/CCAncientsV4-3-27.vmod" ""
rel "v4.3.28" 8272b6d9ce894fe4fc4f7ce1bf7c3de8a9cd6cbb "CCAncientsV4-3-28.vmod" "3eba391be1db013570dd0d971320a646" "https://obj.vassalengine.org/images/e/e3/CCAncientsV4-3-28.vmod" ""
rel "v4.3.29" 995d3c813fe1f051337e2b4f12a8869a44b81c24 "CCAncientsV4-3-29.vmod" "b557a30cc30b36a3ed4b804f7ece910f" "https://obj.vassalengine.org/gls/c/b/CCAncientsV4-3-29.vmod" ""
rel "v4.3.30" c0328f32ffc3834ea1e53ac0371117246b70dff8 "CCAncientsV4-3-30.vmod" "0ec422ef932f672fa44ab952bb905d1a" "https://obj.vassalengine.org/gls/d/d/CCAncientsV4-3-30.vmod" ""
rel "v4.3.31beta" 433d28fdd588c1d96f87af155a456d4a7422e431 "CCAncientsV4-3-31beta.vmod" "3961388518671eb3e783a214a5a790a3" "$HOME/Documents/Miscellaneous Unsorted - mainly C&C Dev/CCAncientsV4-3-31 OLD.vmod" "--prerelease"
rel "v4.4.0beta" a59c132e21a31f8cb82f4223a646d36ee694638c "CCAncientsV4-4-0beta.vmod" "534a6197a4d82fe7eabd6c53488dd70d" "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Vassal Module Library/CCAncientsV4-4-0GOOD.zip" "--prerelease"
rel "v4.3.31" 8a11542a3ece58659383fcc1c1a850239ba3cc7c "CCAncientsV4-3-31.vmod" "3c51ea70989da1ce56d93c6b42139acd" "https://obj.vassalengine.org/gls/d/a/CCAncientsV4-3-31.vmod" ""
rel "v4.3.32" f3f70daedbd71d14751eb2b72db63c8ff2e63f89 "CCAncientsV4-3-32.vmod" "7fe3decbc5c364dc5c39c0fdc413390c" "https://obj.vassalengine.org/gls/b/3/CCAncientsV4-3-32.vmod" ""
rel "v4.4.0beta2" 3efdc86732e2b8c0f8fb82891ea4bc5b962013f8 "CCAncientsV4-4-0beta2.vmod" "05ddb8b03d3dfe7eb95c7b53fffed6a4" "$HOME/Desktop/Vassal Test Release Archive/C&C Ancients/CCAncientsV4-4-0.vmod" "--prerelease"
rel "v4.3.33" bd459c6feffbd938fb6066e06a26a8003a3271e0 "CCAncientsV4-3-33.vmod" "28268fc87b7de85767a771d93467f753" "https://obj.vassalengine.org/gls/f/5/CCAncientsV4-3-33.vmod" ""
rel "v4.3.34" 506f00fae05aae38b910f98fb649a059de31d4bb "CCAncientsV4-3-34.vmod" "59a22d7bae6d5bfbcd15c4fea1c36dd7" "https://obj.vassalengine.org/gls/a/b/CCAncientsV4-3-34.vmod" ""
rel "v4.4.0a01" 8e274fcf881142b5cf7b1bed84a9ad956de517de "CCAncientsV4-4-0a01.vmod" "4ddd3d14f3d6d6157ca56888cd882d06" "$HOME/Downloads/CCAncientsV4-4-0.vmod" "--prerelease"

# The side commits were parked on temporary branches so the tags could point at them; remove them now.
for b in $(gh api repos/$REPO/git/matching-refs/heads/claude/ --jq '.[].ref'); do
  gh api -X DELETE repos/$REPO/git/$b >/dev/null && echo "- removed $b"
done
