Add this to your program for tests:
```c
    sigset_t set;
    sigemptyset(&set);
    sigaddset(&set, SIGQUIT);
    sigprocmask(SIG_UNBLOCK, &set, NULL);
```

`printf` must be after `sigaction`
