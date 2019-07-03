# font-patcher

The Dockerfile builds an image that enables you to use the [Nerd Fonts font patcher][1] right now and without the hassle of installing a bunch of dependencies.

# Usage

Treat the container like it's a `font-patcher` executable. For example, to see `font-patcher`'s options, pass `-h` to it:

```bash
docker run kmallea/font-patcher -h
```

To actually patch a font you'll need to mount it into the container and then tell `font-patcher` where it is and where to output the patched version.

The following example mounts my current directory into the container at `/tmp`, and then tells `font-patcher` to both patch a font and output it to the same directory:

```bash
docker run --rm --tty --mount type=bind,src=$PWD,dst=/tmp kmallea/font-patcher --complete --careful --outputdir /tmp /tmp/OperatorMono-Book.otf
```

**NOTE:** When using `docker run` you'll need to allocate the pseudo-TTY using `-t` or `--tty` like the example above.

For more information about Nerd Fonts font patcher and how to use it, [check out the official documentation][1].
# Building the image

If you'd like to build the image yourself:

1. Clone this repo
2. Run `docker build -t font-patcher .`

[1]: https://github.com/ryanoasis/nerd-fonts#font-patcher
