## A versatile Makefile

This Makefile can generate multiple targets and support various languages. As of now CSS and Javascript are supported but any other can be easily added.

All the configuration takes place in a separate <code>config.mk</code> to ensure easy migration to updates of this Makefile script.

&#128279; https://www.blaizard.com/projects/Makefile

## Features

* Generic [(1)](#generic)
* Multi-target
* Separated configuration file [(2)](#separated-config)
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
process_helloworld: INPUT := srcs/hello.js srcs/world.js
process_helloworld: OUTPUT := hello.world.min.js
```

You can now build and generate the release package of your project by simply running the following command
```bash 
make release
```

## Usage

The <code>config.mk</code> configuration file supports rules that are pre-defined with
specific functionalities. These rules can also be combined.

### Rules

A rule have the following format:
```makefile 
<prefix>_<name>: <variable> := <value>
```

Where <code>&lt;prefix&gt;</code>, can have the following value:
 - **process** - Process the source file(s) for distribution. The receipe of the rule depends on the file type itself.
                 Here is what is currenlty supported:
  - **Javascript & CSS** (.js, .css) - Minify and concatenate all files into one.
  - **SASS** (.scss, .sass) - Compile, minify and concatenate all files into one.
 - **copy** - Copy the file(s) or directory(ies) to the distribuatable directory.
 - **concat** - Concatenate all the input files into one.
 - **stamp** - Stamp the output (note: this rule can only be combined).

Note: prefixes can be combined with the "-" character, for example: <code>process-stamp_</code> to process the file and stamp the output.

Where <code>&lt;variable&gt;</code>, can have the following value:
 - **INPUT** - Defines the input of the rule, like source files for example.
 - **OUTPUT** - Defines the output of the rule, like the executable name for example.
 - **STAMP_TXT** - Set the stamp message (only for <code>stamp</code> rule).

Where <code>&lt;name&gt;</code> is an arbitrary name for the rule and <code>&lt;value&gt;</code> is the value associated with the variable.

All the files will be temporarly built in the build directory and the output will go within the
distributable directory.

### Set Default Values

Most variables can have default values, it can be set as follow:
```makefile 
<variable> := <value>
```

### Commands

The following commands are supported:
```bash 
# Build the pre-defined targets with different verbosity levels
make
# or (same)
make build
# or (minimal verbosity)
make silent
# or (high verbosity)
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
Automatically check and update your Makefile with the latest version on the server
```bash 
make update
```
Show the help message
```bash 
make help
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
process_helloworld: MINIFY_JS_FLAGS := -c -m
```
or for all rules (by setting the default value):
```makefile 
MINIFY_JS_FLAGS := -c -m
```

### Display Mode

The compact display mode is set by default, it will output everything on one line and outputs errors and warning separately.
It can be unset to use a more traditional display mode as follow:
```makefile 
COMPACT_MODE :=
```

<a name="generic">(1)</a> Can be used with varous development language.<br/>
<a name="separated-config">(2)</a> Allows an easy migration path to apply updates to this Makefile (make update).<br/>