---
title: "New Git Tricks I Learned Recently"
date: 2024-04-10
tags: ["git", "version-control", "productivity"]
draft: false
---

## New Git Tricks I Learned Recently

Recently, I came across a few Git tricks that I believe will help developers improve their workflows. Here's the full list of **18 Git tricks** I recently shared on LinkedIn, complete with styling and content closely matching the original article.

### Organizing Commits

#### 1. **Effortless Commit Organization with Autosquash**

Sometimes your commit history can get messy. `--autosquash` makes it easier to tidy up commits during an interactive rebase. For example:

```bash
git rebase -i --autosquash main
```

Combine this with `git commit --fixup=<commit_hash>` to clean up commits efficiently.

### 2. **Interactive Staging with `git add -p`**

This trick lets you stage specific changes in your files. Perfect for crafting focused commits:

```bash
git add -p
```

### Multitasking with Git

#### 3. **Use Worktrees to Avoid Stashing**

Tired of switching branches and stashing? Worktrees allow simultaneous branch work:

```bash
git worktree add ../feature-branch feature-branch
```

### 4. **Debug Faster with Git Bisect**

`git bisect` helps pinpoint the commit causing bugs. Automate testing during the process:

```bash
git bisect start
```

### Recovery Tricks

#### 5. **Recover Lost Commits with Git Reflog**

Accidentally delete a branch? You can retrieve it with:

```bash
git reflog
```

### 6. **Cherry-Pick Specific Commits**

Need to grab just one commit from another branch?

```bash
git cherry-pick <commit_hash>
```

### 7. **Use Commit Templates**

Set up standardized commit messages:

```bash
git config commit.template ~/.gitmessage
```

### 8. **Amend Without Changing Timestamps**

Need to update the last commit? Keep the timestamp intact:

```bash
git commit --amend --no-edit
```

### 9. **Stash Only Selected Files**

No need to stash everything. Focus only on specific files:

```bash
git stash push <file>
```

### Inspecting Changes

#### 10. **Quickly View Changes Since Last Commit**

Use this command to see what’s been modified:

```bash
git diff HEAD
```

### 11. **Undo Changes Locally**

Revert changes in a file before committing:

```bash
git checkout -- <file>
```

### 12. **Rename Branches Locally and Remotely**

Here’s how to rename branches cleanly:

```bash
git branch -m old-name new-name
git push origin :old-name new-name
```

### Handling Large Repositories

#### 13. **Sparse Checkout for Large Repos**

Work on a subset of files from a large repo:

```bash
git sparse-checkout set <folder>
```

### 14. **Resolve Merge Conflicts with Visual Tools**

You can use a tool like VSCode for easier merge conflict resolution:

```bash
git mergetool
```

#### 15. **Clean Up Untracked Files**

Remove those untracked files cluttering your working directory:

```bash
git clean -f
```

### Tagging and History

#### Big Repo Stuff

When working with large repositories, these tips can make your workflow more efficient:

#### 16. **Versioning with Tags**

Add tags to important points in your project:

```bash
git tag v1.0.0
```

Push the tag:

```bash
git push origin v1.0.0
```

### 17. **Visualize Your Commit Graph**

Quickly get a visual overview of your repository’s commit history:

```bash
git log --graph --oneline
```

#### 18. **Blame for Tracking Changes**

Want to know who changed a specific line in a file?

```bash
git blame <file>
```

---

### Conclusion

These tricks have made Git an even more powerful tool for me and my team. Whether you’re collaborating or managing personal projects, applying these techniques will save time and improve your workflow. If you have other tricks to share, feel free to comment below or connect with me.

---