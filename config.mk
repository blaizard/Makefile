# Test javascript-type
process_testjs: INPUT := tests/srcs/js/test1.js tests/srcs/js/test2.js tests/srcs/js/test3.js
process_testjs: OUTPUT := test.min.js


# Set the test environement
MINIFY_JS_CMD := ./tests/bin/dummy.sh
MINIFY_CSS_CMD := ./tests/bin/dummy.sh

MINIFY_JS_FLAGS ?= -o -i -m gcc-like --
MINIFY_CSS_FLAGS ?= -i -m cat-like --

COMPACT_MODE :=
