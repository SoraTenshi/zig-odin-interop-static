# zig-odin-interop
Just an attempt to get Zig to call Odin code via static linking.
Oh and this is supposed to work for Windows. I am pretty sure that linux just works as fine, if you adjust the object filename in the `build.zig`

### Disclaimer:
For some reason, `fmt.println` call is not really... liked? as in: it doesn't work with it.
I am unsure whether it's because of the context or because of what the `fmt.println` call does, but yeah generally this works *fine*.

## Usage:
To compile the Odin obj file:
```sh
odin build from.odin -build-mode:obj -target:windows_amd64 -no-entry-point -file
```

and then just:
```sh
zig build
```
