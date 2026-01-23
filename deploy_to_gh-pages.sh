#!/bin/bash
set -e

# Assumes script is run from: sc-tuning-pro/sctuningprodocsy/
# Builds Hugo output into:    ../../sc-tuning-pro-deploy-ghpages/
# Then commits and pushes from that deploy folder

echo "📦 Building Hugo site..."
hugo -D -d ../../sc-tuning-pro-deploy-ghpages

echo "🚚 Deploying to gh-pages branch..."
cd ../../sc-tuning-pro-deploy-ghpages
git add .
git commit -m "Deploy update: $(date '+%Y-%m-%d %H:%M:%S')" || echo "No changes to commit."
git push origin gh-pages

echo "✅ Site deployed successfully."

