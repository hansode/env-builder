# Installing

## Cygwin

Run [setup.exe](http://cygwin.com/setup.exe)

## base package

    $ cd env-builder/cygwin/1.7/
    $ cd 00core-devel/
    $ make

# Trouble shoots

## Rebasing

Sometimes, after updating or installing packages, you'll start to get strange erros related to "fork()" or "unable to remap *.dll". These errors are usually solved by rebasing your packages.

1. stop running cygwin-based services(SSH, etc).
2. run cmd.exe.
3. run rebaseall.

Tye the following commands on cmd.exe window.

    $ cd C:\cygwin\usr\bin
    $ dash rebaseall -v

## [unable to run any cygwin commands: error while loading shared libraries: C](https://www.marshut.net/imtvrm/unable-to-run-any-cygwin-commands-error-while-loading-shared-libraries-c.html)

1. run `cygcheck -srv`
2. check the trouble package(s)
3. run 'setup*.exe'
4. reinstall the trouble package(s)

# Links

+ [Cygwin Package List](http://cygwin.com/packages/)
+ [Setting up Cygwin](http://cygwin.com/faq/faq.setup.html)
+ [Rebaseall](http://cygwin.wikia.com/wiki/Rebaseall)
