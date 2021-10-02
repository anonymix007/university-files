1. Do not use fstat/stat (TL13)
2. Do not use char buffer [512\*1024] (calloc(448\*1024,sizeof(\*buf)) or bigger (WA1)
3. Use `long long` to count digits
