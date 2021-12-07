#!/usr/bin/python3
from random import randrange
def calc_max(a: int, b: int, c:int) -> int:
    t = int(a / b)
    res = (c + t + t**2 + t**3) * a
    if res > 2**63 - 1:
        return -1
    else:
        return min(res, min((2**(8 * b)) * a, 2**63 - 1))

def get_ans(block_size: int, direct_block_count: int) -> int:
    m  = -2**63 
    bm = 0
    
    
    for i in range(1, block_size+1):
        res = calc_max(block_size, i, direct_block_count)
        if res > m:
            m = res
            bm = i
        elif res < m:
            break
    
    return bm

for i in range(0, 1000):
    block_size = randrange(1, 2**16)
    sz = randrange(1, block_size + 1)
    direct_block_count = randrange(1, 2**31 - 1)
    print("INPUT/{" + str(block_size) + ' ' + str(sz) + ' ' + str(direct_block_count)+ "}/")
    res1 = calc_max(block_size, sz, direct_block_count)
    res2 = get_ans(block_size, direct_block_count)
    res3 = calc_max(block_size, res2, direct_block_count)
    print('OUTPUT/{'+str(res1)+'\n'+str(res2) + ' ' + str(res3) + '\n}/')
    
