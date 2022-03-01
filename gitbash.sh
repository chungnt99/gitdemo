echo "# gitdemo" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/chungnt99/gitdemo.git
git push -u origin main
