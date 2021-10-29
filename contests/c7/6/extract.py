import random
with open('coredump', mode='rb') as file:
    fileContent = file.read()

print('Searching for 8888 in coredump...');
for i in range(0, len(fileContent) - 8):
    int_v = fileContent[i:i+8]
    val = int.from_bytes(int_v, 'little')
    if val == 8888:
        addr = int.from_bytes(fileContent[i + 8 : i + 16],'little')
        print('Found! Next 8 bytes are: ' + hex(addr) + '. This is address of int[], that is, the value in hashmap for key 8888')
print('Refer to std::unordered_map definition for more details')
print('\nThis will print the answer:');
print('gdb ./with_core coredump')
print('print *(int*)(' + hex(addr) + ' + sizeof(int))\n')
print('Or just look at offset ' + hex(4 + addr & 0x16FFF) + ' in coredump')

vvv = random.uniform(0,100)
if vvv < 10:
    print('https://youtu.be/jECVGW-nbUg')
elif vvv > 90:
    print('https://youtu.be/9sE_G_KoWh4')
