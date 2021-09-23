### Stupid code style
#### How to run `clang-format`
1. Download .clang-format and move it to working directory
2. Run `clang-format -style=file main.c > fmt.c` to format file `main.c` and place formatted code to `fmt.c`

### Tests
Directory `contests` will contain tests for corresponding contests.  
You may have to use python 3.9 or later.
#### Install vival
`pip3 install vival==3.0.1`
#### Perform tests from file `test03-3.txt` for program `contest`
`vival contest -t test03-3.txt`

### Contributing
1. Fork repository
2. `git clone <your clone address>`
3. Make changes
4. `git add .`
5. `git commit -m "Message text"`
6. `git push`
7. Open pull request
