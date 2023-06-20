#!/bin/sh
# 
# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
#hugo -t ghostwriter # if using a theme, replace with `hugo -t <YOURTHEME>`
#hugo -t resume
hugo -t hugo-theme-relearn

# Go To Public folder
cd public

# Add changes to git.
git add -A
#git add .

# Commit changes.
msg="rebuilding site $(date)"
    if [ -n "$*" ]; then
        msg="$*"
    fi
git commit -m "$msg"

# Push source and build repos.
#git push origin main
git push -u origin main
