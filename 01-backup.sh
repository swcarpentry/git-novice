echo "= Configuring"
git config --global user.name "Vlad Dracula"
git config --global user.email "vlad@tran.sylvan.ia"
git config --global color.ui "auto"
git config --global core.editor "nano"
echo

echo "= Setup"
git init
echo
git status
echo

echo "=Creating a file"
echo "Cold and dry, but everything is my favorite color" > mars.txt
git status
echo

echo "=Adding a file"
git add mars.txt
echo
git commit -m "Starting to think about Mars"
echo
git status
echo
git log
echo

echo "=Changing a file"
echo "The two moons may be a problem for Wolfman" >> mars.txt
git status
echo
git diff
echo
git commit -m "Concerns about Mars's moons on my furry friend"
echo
git add mars.txt
echo
git commit -m "Concerns about Mars's moons on my furry friend"
echo

echo "=Staging"
echo "But the Mummy will appreciate the lack of humidity" >> mars.txt
git diff
echo
git add mars.txt
echo
git diff
echo
git diff --staged
echo
git commit -m "Thoughts about the climate"
echo
git status
echo
git log
echo

echo "=Exploring history"
echo
git diff HEAD~1 mars.txt
echo
git diff HEAD~2 mars.txt
echo

echo "=Recovering"
echo
echo "We will need to manufacture our own oxygen" > mars.txt
git status
echo
git checkout HEAD mars.txt
echo
cat mars.txt
echo

echo "=Ignoring things"
mkdir results
touch a.dat b.dat c.dat results/a.out results/b.out
git status
echo
echo '*.dat' > .gitignore
echo 'results/' >> .gitignore
cat .gitignore
echo
git add .gitignore
echo
git commit -m "Add the ignore file"
echo
git status
echo
