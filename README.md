### Stupid code style
#### How to run `clang-format`
1. Download .clang-format file to working directory
2. Run `clang-format -style=file main.c > fmt.c` to format file `main.c` and place formatted code to `fmt.c`

### Tests
Directory `contests` will contain tests for corresponding contests.  
#### Perform tests from file `test03-3.txt` for program `contest`
`vival contest -t test03-3.txt`  
#### Install vival
`pip3 install vival==3.0.1`
