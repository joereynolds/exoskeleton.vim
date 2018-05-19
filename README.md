
# Exoskeleton - Skeleton improved

Open files and evaluates vimscript from a template.

Example:

```
The year is {{strftime("%Y")}}
```

Transforms to

```
The year is 2018
```

# Installation

```
Plug 'joereynolds/exoskeleton.vim'
```

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

The files in here are: 
{{glob("./*")}}
```
Transforms to
```
Copyright 2018
The year is 2018

This string has no placeholder

The files in here are:
./Desktop
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

(Nested in ~/.vim/exoskeleton/place/home-joe-code-models)

```
<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class {{expand('%:t:r')}} extends CI_Model
{

}
```

Transforms to 
(assuming the filename is MyModel.php)

```
<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class MyModel extends CI_Model
{

}
```
