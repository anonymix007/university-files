Send bits, but print bytes.
Rename source to `contest.c` and compile it to `contest`
Then run
```sh
./contest contest.c > contest2.c
./contest contest > contest2
diff contest.c contest2.c
diff contest contest2
```
Both diffs should not printf anything
