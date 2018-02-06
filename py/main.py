from PIL import Image

# Message to hide
msg = "loremipsumdolorsitamet"

a = Image.open('../kitten.jpg')
b = Image.new("RGBA", a.size)
pa = a.load()
pb = b.load()

# Write
for y in range(a.size[1]):
    for x in range(a.size[0]):
        ix = y * a.size[0] + x
        pb[x,y] = (pa[x,y][0], pa[x,y][1], pa[x,y][2], 255 if ix >= len(msg) else 255 - ord(msg[ix]) + 96)

# Read
_msg = ""; end = False
for y in range(b.size[1]):
    if end: break
    for x in range(b.size[0]):
        p = pb[x,y][3]
        end = p == 255
        if not end: _msg += chr(255-p+96)

print (_msg)

a.close()
b.save("kitten.png")
b.close()
