#!/usr/bin/env bash
set -e

declare -a paths
declare -a tfvars_files

index=0

for file_with_path in "$@"; do
  file_path=$(find $file_with_path -type d -maxdepth 1 | grep -i $file_with_path/ | tr '\n' ' ')
  paths[index]=$file_path

  let "index+=1"
done

for path_uniq in $(echo "${paths[*]}" | tr ' ' '\n' | sort -u); do
  path_uniq="${path_uniq//__REPLACED__SPACE__/ }"
  # echo "${path_uniq}"
  terraform-docs markdown table --output-file README.md --output-mode inject $path_uniq
done
