###Git shortcut to automate the commit, squash and push commands

Sometimes execute the basic git commands is very boring and repetitive so, this shortcut is awesome. It will run these commands in this order:

- get the MERGE_BASE_ID
- `git reset --soft MERGE_BASE_ID`
- `git add .`
- `git commit -m "YOUR_MESSAGE_COMMIT"`
- `git push origin -f YOUR_CURRENT_BRANCH`

Warning: This procedures clears the commits history. So do not run it if you'll need this history.

**The Script**

```bash
#!/bin/bash

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
COMMIT_MESSAGE=$1
FROM_BRANCH=${2-master}
MERGE_BASE_ID=$(git merge-base HEAD $FROM_BRANCH)

echo -e "$(tput setaf 2)** Executing reset command$(tput sgr0)"
git reset --soft $MERGE_BASE_ID

echo -e "$(tput setaf 2)\n** Executing add command$(tput sgr0)\n"
git add .

echo -e "$(tput setaf 2)\n** Executing commit command$(tput sgr0)\n"
git commit -m "$COMMIT_MESSAGE"

echo -e "$(tput setaf 2)\n** Executing push command$(tput sgr0)\n"
git push origin -f $CURRENT_BRANCH
```

**Instalation**

- `sudo vim /bin/git-squash`
- past the script and save the file
- `sudo chmod +x /bin/git-squash`

**To execute:**

At some git repository, run:

```bash
git squash "Commit Message"
or
git-squash "Commit Message"
```