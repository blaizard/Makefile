#!/bin/bash

input=
output=
error=
mode=cp-like
must_input=
must_output=
output_stdout=

while getopts "m:eio" opt; do
	case "$opt" in
	m)
		mode=$OPTARG
		;;
	i)
		must_input=1
		;;
	o)
		must_output=1
		;;
	# Emulate an error
	e)
		error=1
		;;
	esac
done

shift $((OPTIND-1))
[ "$1" = "--" ] && shift;
unset OPTIND

case "$mode" in
# All first arguments are inputs, the last one is the output
cp-like)
	length=$(($#-1))
	input=${@:1:$length}
	output=${@: -1}
	;;
# All inputs are standard arguments and the output is -o
gcc-like)
	while getopts "o:" opt; do
		case "$opt" in
		o)
			output=$OPTARG
			;;
		esac
	done
	shift $((OPTIND-1))
	[ "$1" = "--" ] && shift
	input=$@
	;;
# All inputs are standard arguments and the output is stdout
cat-like)
	input=$@
	output_stdout=1
	;;
*)
	echo "ERROR: Invalid mode given"
	exit 1
	;;
esac

if [ "${must_input}" ] && [ ! "${input}" ]; then
	echo "ERROR: Missing input argument"
	exit 1
fi

if [ "${output_stdout}" ]; then
	cat ${input}	
else
	if [ "${must_output}" ] && [ ! "${output}" ]; then
		echo "ERROR: Missing output argument"
		exit 1
	fi

	cp ${input} ${output}
fi
