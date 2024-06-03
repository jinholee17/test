#!/bin/bash

# This gets name of current branch.
BRANCH=$(git rev-parse --abbrev-ref HEAD)

# This sets output directory based on the branch name.
if [ "$BRANCH" = "main" ]; then
  OUTPUT_DIR="doxy_docs"
elif [ "$BRANCH" = "dev" ]; then
  OUTPUT_DIR="dev_doxy_docs"
else
  OUTPUT_DIR="local_doxy_docs"
fi

# Update the OUTPUT_DIRECTORY in the Doxyfile
sed -i.bak "s|OUTPUT_DIRECTORY *=.*|OUTPUT_DIRECTORY = $OUTPUT_DIR|" Doxyfile

echo "Doxyfile updated with OUTPUT_DIRECTORY=$OUTPUT_DIR"
