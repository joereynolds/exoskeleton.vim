
# Exoskeleton - Skeleton improved

I found the skeleton feature in Vim (`:help skeleton`) a bit lacking.

I've extended it in a way that enables custom directories to be treated

in a specific way and for you to embed vimscript in as a template.

Here we go!

# Templates

There are two kinds of templates `ft` and `place`.

`ft` is the traditional skeleton that you're used to, but this time with vimscript!
     Dump your `ft` templates in `~/.vim/exoskeleton/ft` e.g. `~/.vim/exoskeleton/ft/test.php`
     
`place` is a mapping to a directory on your filesystem, this is mega handy for the newer
         frameworks that are cropping up and force you to a specific structure.
         Dump your `place` templates in `~/.vim/exoskeleton/place`

## ft examples

Any vimscript enclosed in these (configurable) delimiters will be evaluated.

```
Copyright {{strftime("%Y")}}
The year is {{strftime("%Y")}}

This string has no placeholder

The files in here are: {{glob("./*")}}
```
Transforms to
```
Copyright 2018
The year is 2018
This string has no placeholder
The files in here are: ./Desktop
./Documents
./Downloads
./Music
./Pictures
./Public
./Templates
./Videos
./a.php
./code
./examples.desktop
./examples.desktop.gpg
./install-inspect-deb
./neovim-gtk
./npm-debug.log
./phpactor.log
./programs
./salutem
./snap
./sqlp
./test
./test_file
./test_file.sig
```

## place examples

```
<?php

namespace Starbound\Models\Eloquent;

use Illuminate\Database\Eloquent\Model;

class {{expand('%:r')}} extends Model
{
    protected $table = 'TODO';

    protected $primaryKey = 'TODO';
}

```
