#!/bin/bash

# After creating the repo on GitHub, run these commands:
# Replace YOUR_USERNAME with your GitHub username

cd /workspace/browns_data_science
git add .
git commit -m "Initial commit - Browns Data Science documentation platform"

# Add your new repo as origin (UPDATE THIS URL!)
git remote add origin https://github.com/AlassaneDialDiop/browns_data_science.git

# Push to GitHub
git push -u origin main

echo "Documentation site pushed! Now enable GitHub Pages in repo settings."