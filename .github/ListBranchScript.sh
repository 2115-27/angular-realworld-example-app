#!/bin/bash

git clone https://github.com/2115-27/angular-realworld-example-app.git/

cd angular-realworld-example-app/
repolocation=$(pwd)

git branch -a --sort=-committerdate  --format='%(refname:short)|%(authorname)|(%(committerdate:short))'>> BranchDetails.txt
echo --------BranchDetails.txt---------------
cat BranchDetails.txt
sed -i "s~origin/~~g" BranchDetails.txt
sed -i "s~,~~g" BranchDetails.txt
egrep -o "[0-9]{2}/[0-9]{2}/[0-9]{4} [0-9]{2}:[0-9]{2}:[0-9]{2}" BranchDetails.txt >> date.txt
echo ----date.txt-----
cat date.txt
