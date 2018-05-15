Skeleton improved...

WIP

# What is it?

It's called exoskeleton.vim

Basically a templating view file for vim

i.e. the following

```
Hello, the time is {{strftime('sometimestamp')}}.
```

Should render immediately (when you open it) to

```
Hello, the time is 2018-05-14 10:12:00.
```

# How?

## Original behaviour

 If a file has a specific extension i.e. `my-important-docs.view.md`, it will be stamped
 as both a 'view' file, and a markdown file.

 In a view file, you are permitted to enter whatever you want.
 An AutoCommand will trigger on any .view file and immediately evaluate the contents of the file
 before you can view it.

 Anything enclosed in '{{' '}}' will be evaluated by the script and its output put in its place.

## Extending skeleton

You can also put templates in ./vim/skelex/

There are two directories within here
`ft` - For filetype specific templates
`places` - For directory specific templates (These take precedence over the ones in the `ft` directory).

### Ft

Putting a file in ft, for example called `php.vim` will be invoked when you create a php file.
Creating any php file from now on will insert the contents of `php.vim`

### Places

Places is a bit more specialised and specific.
If you make this match the directory structure of your codebase, it will turn any file within that directory
to the template chosen.

i.e. if we have a directory called  /code/starbound/models
We could create a file ~/.vim/skelex/places/code-starbound-models.php

Now, any php files within that directory will have that template applied.
This is especially useful for frameworks where code is written in a certain way depending on the directory  (models, controllers, tests etc...)

As expected, there can be vimscript in these files too.

# Why?

Because I want to dynamically populate some pages that are time sensitive and I like vim.

# Examples

## 1.

    # Tickets

    {{
    for ticket in globpath('tickets/', '*')
        echo ticket
        echo '------------------------'
    endfor
    }}

    # Notes

    {{
    for note in globpath('notes/', '*')
        echo note
        echo '------------------------'
    endfor
    }}

    {{echo strftime('%Y'}}


## 2. (Housed under code-hyperion-app--models)

    <?php

    namespace Hyperion\Models\Eloquent;

    use Illuminate\Database\Eloquent\Model;

    class {{getFilenameWithoutExtension()}} extends Model
    {
        protected $table = 'TODO';

        protected $primaryKey = 'TODO';
    }




# Problems & Notes

- Does it already exist? Is this what skeleton files are?
  - It doesn't seem that it already exists.
- The delimiters should be configurable.

