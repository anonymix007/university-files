with open('flaky', mode='r+b') as file:
    file.seek(0x9b2)
    file.write(bytes([0xeb,0x00]));
