from PIL import Image

src = r"e:\mamito\assets\branding\mamyto_logo.png"
img = Image.open(src).convert("RGBA")
w, h = img.size
print("size", w, h)

pixels = img.load()
xs, ys = [], []
for y in range(h):
    for x in range(w):
        r, g, b, a = pixels[x, y]
        if a < 20:
            continue
        if r < 18 and g < 18 and b < 18:
            continue
        xs.append(x)
        ys.append(y)

if not xs:
    raise SystemExit("no content")

minx, maxx, miny, maxy = min(xs), max(xs), min(ys), max(ys)
print("content bbox", minx, miny, maxx, maxy)

content_w = maxx - minx + 1
cx = (minx + maxx) // 2
side = int(content_w * 1.02)
top = max(0, miny - int(side * 0.02))
left = max(0, cx - side // 2)
right = min(w, left + side)
bottom = min(h, top + side)
left = max(0, right - side)
emblem = img.crop((left, top, right, bottom)).resize((1024, 1024), Image.Resampling.LANCZOS)

pix = emblem.load()
for y in range(1024):
    for x in range(1024):
        r, g, b, a = pix[x, y]
        if r < 22 and g < 22 and b < 22:
            pix[x, y] = (0, 0, 0, 0)

out_icon = r"e:\mamito\assets\branding\mamyto_icon.png"
emblem.save(out_icon)
print("wrote", out_icon, emblem.size)

bg = Image.new("RGBA", (1024, 1024), (247, 245, 250, 255))
bg.alpha_composite(emblem)
bg.convert("RGB").save(r"e:\mamito\assets\branding\mamyto_icon_opaque.png")
print("opaque ok")
