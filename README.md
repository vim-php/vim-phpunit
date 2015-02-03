# PHPUnit runner for Vim

PHPUnit is a plugin for Vim that allows you to run PHPUnit tests easily from the Vim window. <s>It then reads the output and puts the errors into the quickfix list, so you can easily jump to them. It's configurable too, so if you use a PHPUnit wrapper command or have a special set of arguments, then that's no problem.</s>

This project is a personal fork of `joonty/vim-phpunitqf` (i have removed the
quickfix)

### How to use

In a Vim window, run:

```vim
:Test <args>
```

Where `<args>` are passed directly to the PHPUnit command. To set up a custom PHPUnit command see the configuration section below. You can also set default arguments which will always be passed.

### Installation

Installation is easy-peasy if you're using [Vundle][1]. Just add this to your *.vimrc* file:

```vim
Bundle 'wdalmut/vim-phpunit.git'
```
and run `vim +BundleInstall +qall` from a terminal.

If you aren't using vundle, you will have to extract the files in each folder to the correct folder in *.vim/*.

### Configuration

By default the plugin tries different phpunit paths in order to discover your
phpunit executable, but you can override it with:

```vim
let g:phpunit_cmd = "/usr/bin/mytest"
```

To pass arguments to the command, use:

```vim
let g:phpunit_args = "--configuration /path/to/config"
```

You can also specify arguments to be placed after the "dynamic" argument (the argument passed when running from within Vim):

```vim
let g:phpunit_args_append = "--repeat"
```

The output is written to a temporary file. You can change the location of this (default value is */tmp/vim_phpunit.out*) with:

```vim
let g:phpunit_tmpfile = "/my/new/tmp/file"
```

### License

This plugin is released under the [MIT License][2].

[1]: https://github.com/gmarik/vundle
[2]: https://raw.github.com/wdalmut/vim-phpunit/master/LICENSE
