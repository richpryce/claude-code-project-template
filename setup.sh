#!/usr/bin/env bash
set -euo pipefail

# Project Template Setup
# Usage: ./setup.sh <project-name> [target-directory]

PROJECT_NAME="${1:-}"
TARGET_DIR="${2:-.}"

if [ -z "$PROJECT_NAME" ]; then
  echo "Usage: ./setup.sh <project-name> [target-directory]"
  echo ""
  echo "Examples:"
  echo "  ./setup.sh my-app           # Creates ./my-app"
  echo "  ./setup.sh my-app ~/code    # Creates ~/code/my-app"
  exit 1
fi

DEST="$TARGET_DIR/$PROJECT_NAME"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ -d "$DEST" ]; then
  echo "Error: $DEST already exists"
  exit 1
fi

echo "Creating project: $PROJECT_NAME"

# Copy template
cp -r "$SCRIPT_DIR" "$DEST"

# Clean up template artifacts
cd "$DEST"
rm -rf .git .beads setup.sh

# Initialize git
git init
git add -A
git commit -m "chore: initialize from project template"

# Initialize beads
if command -v bd &>/dev/null; then
  bd init
  bd hooks install
  echo ""
  echo "Beads initialized with git hooks."
else
  echo ""
  echo "Warning: 'bd' not found. Install beads and run:"
  echo "  cd $DEST && bd init && bd hooks install"
fi

echo ""
echo "Project '$PROJECT_NAME' is ready at $DEST"
echo ""
echo "Next steps:"
echo "  cd $DEST"
echo "  claude"
echo "  > /brain-dump"
