
# Git repo mirroring for Kood/Jõhvi repos

When finishing Kood/Jõhvi and you want to keep your (and contributed to) repos for future, you can clone them into GitHub private repositories with this script.

Create your own `my-repolist.txt` or modify the example `repolist.txt` directly.

Make sure you have GitHub CLI tool `gh` installed and authenticated.

Run and mirror all the repos with:

```bash
# arguments are input file and optional prefix to use when mirroring repo name
./github-mirror.sh my-replist.txt kood-
```
