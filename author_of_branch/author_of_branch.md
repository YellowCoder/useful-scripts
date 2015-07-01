###Git shortcut to see all authors of branchs

If you want see all branchs in your project, who created or when, you can use this shortcut.

**The Script**

```bash
#!/bin/bash

echo
for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ai %ar by %an" $branch | head -n 1` \\t$branch; done | sort -r
echo
```

**Instalation**

- `sudo vim /bin/git-authors`
- past the script and save the file
- `sudo chmod +x /bin/git-authors`

**To execute:**

At some git repository run:

```bash
git authors
```