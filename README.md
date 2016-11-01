## A versatile Makefile

This Makefile can generate multiple target and support various languages. As of now CSS and Javascript are supported but any other can be easily added.

All the configuration takes place in a separate <code>config.mk</code> to ensure easy migration to updates of this Makefile script.

## Features

* Generic[¹](#generic)
* Multi-target
* Separated configuration file[²](#separated-config)
* Stamps distributable

## Getting Started

Start by running the Makefile script with the following command
```bash 
make
```

It should output an error, saying the <code>config.mk</code> file is missing. It will also generate an empty template for this file.
Open this file with your favorite editor and add the build rules for your project, here is a short example of what a typical
<code>config.mk</code> would look like.

```makefile
# Generate the minimized javascript
minify_mainjs: SRCS := srcs/hello.js srcs/world.js
minify_mainjs: OUTPUT := hello.world.min.js
# Generate the minimized css
minify_maincss: SRCS := srcs/style.css
minify_maincss: OUTPUT := style.min.css
```

You can now build and generate the release package of your project by simply running the following command
```bash 
make release
```

## Usage

The <code>config.mk</code> configuration file supports supports few rules that are pre-defined with
specific functionalities. These rules have the following prefixes:
 - **minify_** Minify and concatenate the source files.
 - **dist_** Copy the files or directory to the distribuatable directory.

For these rules the variables <code>SRCS</code> and <code>OUTPUT</code> define respectively the source files and the output path.
All the files will be temporarly built in the build directory and the output will go within the
distributable directory.

### Commands

The following commands are supported:
Build the pre-defined targets with different verbosity levels
```bash 
make
# or
make build
# or
make silent
# or 
make verbose
```
Delete all generated files
```bash 
make clean
```
Delete all generated files and re-build the targets
```bash 
make rebuild
```
Build the targets and generate the package
```bash 
make release
```
Show the help message
```bash 
make help
```
### Stamping Files

Files generated with the rules minify_* will be stamped when placed in the distrubutable directory.
The stamp text can be customized for a single rule:
```makefile 
minify_main: STAMP_TXT := $(OUTPUT) (`date +'%Y.%m.%d'`) by Blaise Lengrand
```
or for all rules (by setting the default value):
```makefile 
STAMP_TXT := $(OUTPUT) (`date +'%Y.%m.%d'`) by Blaise Lengrand
```

### Change Package (.zip) Name

The name and/or path of the generated package (.zip file) can be changed with the following line:
```makefile 
PACKAGE := New/Package/Location/Me.zip
```

### Change Default Directories

The build and distribution directories have predefined path, which are respectively <code>.make</code> and <code>dist</code>.
They can of course be overwritten with the following lines:
```makefile 
BUILDDIR := myNewBuildDir
DISTDIR := myNewBDistDir
```

### Custom Compilation Flags

Compilation flags can be overwritten for a single rule (in this example for the minify_main rule):
```makefile 
minify_main: MINIFY_JS_FLAGS := -c -m
```
or for all rules (by setting the default value):
```makefile 
MINIFY_JS_FLAGS := -c -m
```

<a name="generic">¹</a> Can be used with varous development language.<br/>
<a name="separated-config">²</a> Why is this a feature? It allows an easy migration path to apply updates to this Makefile.<br/>