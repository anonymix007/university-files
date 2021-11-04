with open('coredump', mode='r+b') as file:
    file.seek(0x6dd01)
    addr = bytes([0xf0]) + file.read(7)
    file.seek(0x6dd10)
    file.write(addr);
