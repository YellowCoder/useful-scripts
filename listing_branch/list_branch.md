###Git shortcut to automate the commit and push commands

Sometimes execute the basic git commands is very boring and repetitive so, this shortcut is awesome. It will run these commands in this order:

- `git status`
- `git add .`
- `git commit -am"YOUR_MESSAGE_COMMIT"`
- `git push origin YOUR_CURRENT_BRANCH`

**The Script**

```bash
#!/bin/bash

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
COMMIT_MESSAGE=$1

echo -e "$(tput setaf 2)** Executing Status command$(tput sgr0)"
git status

echo -e "\n$(tput setaf 2)\n** Executing add command$(tput sgr0)"
git add .

echo -e "$(tput setaf 2)\n** Executing commit command$(tput sgr0)\n"
git commit -am"$COMMIT_MESSAGE"

echo -e "$(tput setaf 2)\n** Executing push command$(tput sgr0)\n\n"
git push origin $CURRENT_BRANCH
```

**Instalation**

- `sudo vim /bin/git-pc`
- save the file
- `sudo chmod +x /bin/git-pc`

**To execute:**

At some git repository run:

```bash
git pc 'Message Commit'
```