### Confirm code base is stable

1. Confirm that you can build the report by executing `make`.
	- If the report does not build, correct code until it builds correctly

### Initialize git repository

*User A* should initialize a local git repository.

1. Use `git init` to initialize a git repository in the `project4` folder
2. Appropriately use `git status`, `git add`, and `git commit` to create your first commit. The commit should include: 
	- all contents of the `code` directory
	- `report.Rmd`
	- `README.md`
	- `Makefile`
	- `.gitignore`
	- the `output` directory but none of its contents (other than `.gitkeep` file)

### Create a GitHub repository

*User A* should create a GitHub repository using the following steps.

1. Log in to GitHub and create an empty GitHub repository.
	- choose any name you like
2. Use `git remote add origin git@github.com:<your_github_name>/<your_repo_name>` to add *User A*'s GitHub repository as a remote of *User A*'s local repository named `origin`.
	- replace `<your_github_name>` and `<your_repo_name>` with *User A*'s GitHub user name and GitHub repository name, repsectively
3. Use `git push origin <your_branch_name>` to push *User A*'s local repository to GitHub.
	- `<your_branch_name>` is probably `main`, but it may be `master` for some of you
4. Refresh your GitHub repository's web page to confirm that the push was successful.

------------------------------------------------------------------------

### Fork and clone the repository

*User B* should now fork and clone *User A*'s repository on GitHub using the following steps.

1. Navigate to `https://github.com/<user_a_name>/<user_a_repo>` and click "Fork" to create a fork of *User A*'s repository.
		- replace `<user_a_name>` with *User A*'s GitHub user name
		- replace `<user_a_repo>` with *User A*'s GitHub repository name
2. Use `git clone git@github.com/<user_b_name>/<user_b_repo>` to clone the repository.

### Update the repository and submit a pull request

*User B* will now make a new branch and make updates to *User A*'s repo on that branch. *User B* should complete the following steps:

1. Create and checkout a new branch called `binomial` by executing `git checkout -b binomial`.
	- confirm that *User B* has switched to the new branch by executing `git branch`
2. Add the following lines to `code/01_make_output.R` (ignore the lines with back ticks):

```r
set.seed(4)
random_numbers4 <- rbinom(100, 1, 0.25)
```

3. Add additional lines of code to save `random_numbers4` object into the `output` folder.
4. Confirm that `random_numbers4` gets created and saved properly (e.g., by running `make random_numbers`).
5. Add a new section to `report.Rmd` called "Random numbers 4"
	- the contents of the section should be exactly the same as the other sections
	- e.g., *User B* can copy/paste the "Random numbers 3" section and appropriately modify its contents
6. Confirm that *User B* can build the report (e.g., by executing `make report.html`)
7. Once *User B* is confident that `report.html` is building properly, they should appropriately use `git add` and `git commit` to make a new commit along the `binomial` branch that includes updates to *both* `code/01_make_random_numbers.R` *and* `report.Rmd`
	- include a meaningful commit message
8. Push the `binomial` branch to GitHub.
	- `git push origin binomial`
9. Submit a pull request to *User A*'s repository.

------------------------------------------------------------------------

### Test out pull request code

*User A* will now `fetch` the code submitted by *User B*, test it out, and eventually merge it into their `main` branch, thereby closing the pull request.

1. *User A* should add *User B*'s repository as a remote.
	- `git remote add <user_b_remote_name> https://github.com/<user_b_name>/<user_b_repo>`
	- replace `<user_b_remote_name>` with whatever you would like to call this remote
	- replace `<user_b_name>` with *User B*'s GitHub user name
	- replace `<user_b_repo>` with *User B*'s GitHub repository name

2. *User A* should `fetch` from *User B*'s repository.
	- `git fetch <user_b_remote_name>`

3. *User A* should create and checkout a new branch named `binomial` from the `<user_b_remote_name>/binomial` branch.
	- `git checkout -b binomial <user_b_remote_name>/binomial`

4. Test out the code on the `binomial` branch.
	- E.g., confirm that the report builds properly when you execute `make`
	- If the code does not work, *User A* should make corrections to the code and commit those changes to their `binomial` branch.

5. When *User A* is satisfied that the code works as expected, they should merge the `binomial` branch into `main`.
	- `git checkout main`
	- `git merge binomial`

6. Push the updated `main` branch to GitHub.
	- `git push origin main`

### More changes, User A

1. *User A* should create and checkout a new branch called `geometric`.
	- `git checkout -b geometric`

2. Add the following lines to `code/01_make_output.R` (ignore the lines with back ticks):

```r
set.seed(5)
random_numbers5 <- rgeom(100, 0.25)
```

3. Add additional lines of code to save `random_numbers5` object into the `output` folder.
4. Confirm that `random_numbers5` gets created and saved properly (e.g., by running `make random_numbers`).
5. Add a new section to `report.Rmd` called "Random numbers 5"
	- the contents of the section should be exactly the same as the other sections
	- e.g., *User A* can copy/paste the "Random numbers 3" section and appropriately modify its contents
6. Confirm that *User A* can build the report (e.g., by executing `make report.html`)
7. Once *User A* is confident that `report.html` is building properly, they should appropriately use `git add` and `git commit` to make a new commit along the `geometric` branch that includes updates to *both* `code/01_make_random_numbers.R` *and* `report.Rmd`
	- include a meaningful commit message
8. Merge the `geometric` branch into `main`.
	- `git checkout main`
	- `git merge geometric`
9. Push both the `geometric` and `main` branches to GitHub
	- `git push origin geometric`
	- `git push origin main`

------------------------------------------------------------------------



1. *User B* should add a remote called `upstream` that points to *User A*'s GitHub repository.
	- `git remote add upstream https://github.com/<user_a_name>/<user_a_repo>`
2. *User B* should `fetch` from the `upstream` remote and merge `upstream/main` into `main`
	- `git fetch upstream`
	- `git checkout main`
	- `git merge upstream/main`
3. *User B* should `push` their `main` branch to `origin`.
	- `git push origin main`

