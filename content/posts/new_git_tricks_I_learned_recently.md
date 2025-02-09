---
title: "New Git Tricks I Learned Recently"
date: 2024-04-10
tags: ["git", "version-control", "productivity"]
draft: false
---

I recently watched Scott Chacon's talk called [So You Think You Know Git](https://www.youtube.com/watch?v=ZDR433b0HJY). The talk was so good — it includes new and old git commands I've never seen. After watching it, I decided to create this article to summarize all the great tips and tricks with every single git command he mentions in his talk.

1. Create an alias to always stash all files (including ignored and untracked files). In this example, you would run "git staash", but you can choose any alias.

    ```bash
    git config --global alias.staash 'stash --all'
    ```

2. Run a bash script defined as an alias from the git command. In this example, you would run "git bb". Link to the super useful better-branch script here: [better-branch script](https://gist.github.com/schacon/e9e743dee2e92db9a464619b99e94eff)

    ```bash
    git config --global alias.bb !better-branch.sh
    ```

3. If you want to switch configs based on your project's features, you can add conditional configs to any `.gitconfig` file.

    ```gitconfig
    [includeIf "gitdir:~/projects/work/"]
        path = ~/projects/work/.gitconfig

    [includeIf "gitdir:~/projects/oss/"]
        path = ~/projects/oss/.gitconfig
    ```

4. Use `git blame`, but make it run on specific lines in a file. Much more readable and understandable.

    ```bash
    git blame -L 15,26 path/to/file
    ```

5. You can also use `git log -L` to find functions inside files that have changed recently. Much cleaner as well.

    ```bash
    git log -L :functionName:path/to/file
    ```

6. Another `git blame` command improvement: ignore whitespace, detect lines that moved or copied in the same commit, or find the commit that created the file.

    ```bash
    git blame -w -C -C -C
    ```

7. One `git blame` command to rule them all. Putting everything together. Scott Chacon recommends creating an alias for this super useful command:

    ```bash
    git blame -w -C -C -C -L 15,26 path/to/file
    ```

8. Use `git log` with a special flag when you want to find a string that changed, but `git grep` won’t be able to find it since it is part of the history of the repo. In this example, the regular expression to search is "files_watcher":

    ```bash
    git log -S files_watcher
    ```

9. Use `git reflog` as a log of your references, so you can search through all the changes locally in your repo.

    ```bash
    git reflog
    ```

10. Using `git diff` with the `--word-diff` flag allows you to find differences in file changes based on words and not the whole line of code. This makes it way easier to read & understand the changes.

    ```bash
    git diff --word-diff
    ```

11. Probably one of the most useful unknown configs: reuse recorded resolution (`rerere`). It stores conflict resolutions and automatically applies them when they show up again. This seems to be a no-brainer productivity boost.

    ```bash
    git config --global rerere.enabled true
    ```

### New Stuff

12. Leverage the `git branch --column` command by sorting the branches based on the last modified date and display them in columns.

    ```bash
    git config --global column.ui auto
    git config --global branch.sort -committerdate
    ```

13. Use a better `git push --force` without worrying you will overwrite someone else’s work. It's called `--force-with-lease`!

    ```bash
    git push --force-with-lease
    ```

14. Sign commits with SSH instead of GPG. Also reuse your same SSH key when pushing commits!

    ```bash
    git config gpg.format ssh
    git config user.signingkey ~/.ssh/key.pub
    ```

15. Git maintenance can schedule background tasks (like cleanup) via a cron job, significantly speeding up Git for large repos! Say hello to smoother experiences with monorepos.

    ```bash
    git maintenance start
    ```

### Big Repo Stuff

16. When you enable the filesystem monitor, this starts a daemon that tracks file changes. Now, `git status` will only show the updates on modified files.

    ```bash
    git config core.fsmonitor true
    ```

17. Use `git clone` filter to filter out blobs when cloning large repos.

    ```bash
    git clone --filter=blob:none
    ```

18. …or use `git clone` filter to filter out trees.

    ```bash
    git clone --filter=tree:0
    ```
---