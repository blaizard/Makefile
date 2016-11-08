#Generic Makefile by Blaise Lengrand
#Usage: make [rule]
#
#By default, it will run all user rules starting with specific
#names, the followings are currently supported:
#	process_*		Depending on the file type, but it will process
#	         		a file for publication. Example, .js and .css
#	         		files will be minimized and concatenated.
#	process-stamp_*		Will process and stamp the output file.
#	copy_*		Simply copy the files or directories to the output.
#	copy-stamp_*		Copy and stamp.
#	concat_*		Concatenate a list of files together.
#	concat-stamp_*		Concatenate and stamp a file.
#
#List of rules available:
#	silent		No verbosity, except error messages.
#	verbose		High verbosity, including command executed.
#	help		Display this help message.
#	clean		Clean the environment and all generated files.
#	build		Build the targets.
#	rebuild		Clean and re-build the targets.
#	release		Re-build the targets and generate the package.
#
#Configuration: config.mk
#	Contains all user rules definitions. They use pre-made
#	rules with the following options:
#	INPUT		Contains the input files for the specific rule.
#	OUTPUT		The name of the output file (if relevant).
#Example:
#	process_main: INPUT := hello.js
#	process_main: OUTPUT := hello.min.js

process_testjs: INPUT := tests/js/test1.js tests/js/test2.js tests/js/test3.js
process_testjs: OUTPUT := test.min.js
