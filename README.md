# btop++ crossbuilds

Static crossbuilds to use with Linux based platforms

Built on Alpine using <https://github.com/userdocs/musl-cross-make>

Example download using `x86_64`:

```bash
wget -q "https://github.com/userdocs/btop-static/releases/latest/download/x86_64-linux-musl.tar.xz" -O ~/btop.tar.xz
tar xf "btop.tar.xz" --strip-components=1 -C ~/
```

The rest are available here: https://github.com/userdocs/btop-static/releases/latest

One liners

```bash
wget -qO- "https://github.com/userdocs/btop-static/releases/latest/download/x86_64-linux-musl.tar.xz" | tar xfJ - -C /usr/local
curl -sLo- https://github.com/userdocs/btop-static/releases/download/v1.4.4/x86_64-linux-musl.tar.xz | tar xfJ - -C /usr/local
```
