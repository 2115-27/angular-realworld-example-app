#!/bin/bash

git clone https://github.com/2115-27/angular-realworld-example-app.git/
excelLocation=$(pwd)

cd angular-realworld-example-app/
repolocation=$(pwd)

git branch -a --sort=-committerdate  --format='%(refname:short)|%(authorname)|(%(committerdate:short))'>> $excelLocation/BranchDetails.txt
echo --------BranchDetails.txt---------------
cat BranchDetails.txt
sed -i "s~origin/~~g" $excelLocation/BranchDetails.txt
sed -i "s~,~~g" $excelLocation/BranchDetails.txt

echo "Generating Branch csv file..."

cd ..
awk 'BEGIN{ FS= "|"; OFS=","; print "Branch,Last Committer Name,Committer Date,Delete? (Y/N)"}; NR > 0{print $1, $2, $3, $4, $5, $6, $7, $8, $9;}' BranchDetails.txt > BranchList.csv
echo "CSV File generated. Find file @ $excelLocation."
rm -rf BranchDetails.txt
