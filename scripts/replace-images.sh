#!/bin/bash
# Replace local image references with jsDelivr CDN URLs
# CDN base: https://cdn.jsdelivr.net/gh/HHHHao-s/Trading@main/

set -euo pipefail

CDN_BASE="https://cdn.jsdelivr.net/gh/HHHHao-s/Trading@main"

# Directories containing markdown files and images
DIRS=("QihengDK-CAPITAL" "其他")

for dir in "${DIRS[@]}"; do
  if [ ! -d "$dir" ]; then
    echo "Skipping $dir (not found)"
    continue
  fi

  echo "Processing $dir..."

  # Find all markdown files in the directory
  find "$dir" -maxdepth 1 -name "*.md" | while read -r mdfile; do
    echo "  Processing $mdfile"

    # Replace image references: ![alt](filename.png) -> ![alt](CDN_BASE/dir/filename.png)
    # [^/)]* ensures we only match local filenames (no path separators), avoiding double-replacement of CDN URLs
    sed -i -E "s#(!\[[^]]*\]\()([a-zA-Z][^/)]*\.(png|jpg|jpeg|gif|svg))#\\1${CDN_BASE}/${dir}/\\2#g" "$mdfile"
  done

  echo "Done with $dir"
done

echo ""
echo "All image references replaced with CDN URLs."
echo "CDN base: ${CDN_BASE}"
