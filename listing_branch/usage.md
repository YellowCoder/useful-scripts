###List all current branch

*Example:*

**To execut:**

```bash
ruby listing_branch/list_branch.rb '~/personal'
```

**Output:**

```bash
>> path_example        master*
>> path_example        master
>> path_example        branch_foo*
```

**Note:** If the branch name has a '*', is because the repository has uncommitted files.