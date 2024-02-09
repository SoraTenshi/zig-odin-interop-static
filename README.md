# zig-odin-interop
Just an attempt to get Zig to call Odin code via static linking.
Oh and this is supposed to work for Windows. I am pretty sure that linux just works as fine, if you adjust the object filename in the `build.zig`

## Usage:
To compile the Odin obj file:
```sh
odin build from.odin -build-mode:obj -target:windows_amd64 -no-entry-point -file
```

and then just:
```sh
zig build
```
