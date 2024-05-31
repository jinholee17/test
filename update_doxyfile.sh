#!/bin/bash

# Get the current branch name
BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Set the output directory based on the branch name
if [ "$BRANCH" = "main" ]; then
  OUTPUT_DIR="doxy_docs"
elif [ "$BRANCH" = "dev" ]; then
  OUTPUT_DIR="dev_doxy_docs"
else
  OUTPUT_DIR="$BRANCH/doxy_docs"
fi

# Update the OUTPUT_DIRECTORY in the Doxyfile
sed -i.bak "s|OUTPUT_DIRECTORY *=.*|OUTPUT_DIRECTORY = $OUTPUT_DIR|" Doxyfile

echo "Doxyfile updated with OUTPUT_DIRECTORY=$OUTPUT_DIR"
