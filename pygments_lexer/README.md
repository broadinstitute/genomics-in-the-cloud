## About

This is a very basic [Pygments](https://pygments.org) WDL lexer based on the Objective-C lexer.
See the [WDL spec](https://github.com/openwdl/wdl/blob/master/versions/1.0/SPEC.md)
for more information about the language.  Also see the
[wdl-sublime-syntax-highlighter](https://github.com/broadinstitute/wdl-sublime-syntax-highlighter)
for syntax highlighting in Sublime and Visual Studio and
[language-wdl](https://github.com/broadinstitute/language-wdl) for
syntax highlighting in the Atom editor.

## Using

This lexer is easy to use.  First, install Pygments using pip (or whatever
  mechanism you like):

    $ pip install Pygments

Then use this wdl_lexer.py file with the [Pygments Command Line](https://pygments.org/docs/cmdline/):

    $ pygmentize -f html -O full,style=colorful -o test.html -l wdl_lexer.py -x hello-world.wdl

You can then open the test.html file in your browser.  Take a look at the
command line docs for information on how this works and what options
are available.  The style argument is useful for quickly changing the
look of the syntax highlighting.  See the [live demo](https://pygments.org/demo/#try)
page for the list of possible styles.

To generate HTML for all WDL in the repo use this script:

    $ bash run_wdl_lexer.sh

And look in the `html_output` directory.

## Known Limitations

Here are the known issues:
* when command blocks include parameters that overlap with WDL keywords (such as `--create-output-variant-index`) you'll get `output` highlighted.  I'm looking at ways of excluding keywords that include '-' but I haven't been able to get this to work yet.

## Future

This is a very, very rough lexer for WDL and, being based on the
Objective-C lexer, there's a ton of room for cleanup and improvements.
