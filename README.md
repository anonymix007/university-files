### Stupid code style
#### How to run `clang-format`
1. Download .clang-format and move it to working directory
2. Run `clang-format -style=file main.c > fmt.c` to format file `main.c` and place formatted code to `fmt.c`

### Tests
Directory `contests` will contain tests for corresponding contests.  
You may have to use python 3.9 or later.
#### Download only latest tests without history
```sh
git clone --depth 1 https://github.com/anonymix007/university-files.git
```
#### Install vival
```sh
pip3 install vival==3.4.1
```
#### Install yandex disk utility
```sh
pip3 install wldhx.yadisk-direct
```
#### Install jarwrapper
```sh
sudo apt-get install jarwrapper
```
#### Perform tests from file `test03-3.txt` for program `contest`
```sh
vival contest -t test03-3.txt
```
#### Perform tests from file `test03-3.txt` for program `contest.c`
```sh
vival contest.c -t test03-3.txt
```
### Contributing
1. Fork repository
2. `git clone <your fork address>`
3. Make changes
4. `git add .`
5. `git commit -m "Message text"`
6. `git push`
7. Open pull request

For more information refer to [GitHub Docs](https://docs.github.com/en/get-started).
#### Brief summary
1. [Create personal access token](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) (it will be used as password in `git`)
2. [Cache your GitHub credentials in git](https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git)
3. [Keep your fork up-to-date with upstream repository](https://docs.github.com/en/github/collaborating-with-pull-requests/working-with-forks/syncing-a-fork)
