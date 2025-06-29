#!/usr/bin/env bash

set -euo pipefail
set -x

github_user=$(gh api user | jq -r .login)
repolist="${1:-repolist.txt}"
prefix="${2:-}"

echo ">>> Using github user '${github_user}',  source repo list '${repolist}' and prefix '${prefix}'"

while IFS= read -r url
do
    echo ">>> Cloning and mirroring: $url"

    repo=$(echo "$url" | sed -n 's#.*/git/\([^/]*\)/\([^/]*\)\.git#\2#p')

    git clone ${url}
    gh repo create ${prefix}${repo} --private
    git -C ${repo} remote add github https://github.com/${github_user}/${prefix}${repo}.git
    git -C ${repo} push --mirror -u github
done < "$repolist"

echo "Done!"
