#!/usr/bin/env bash

oper="enc"

usage() { echo "Usage: $0 [-d] [-f <filename> in envir dir]" 1>&2; exit 1; }

while getopts "df:k:v:" o; do
    case "${o}" in
        d)
	    oper="dec"
            ;;
        k)
            k=${OPTARG}
            ;;
        v)
            v=${OPTARG}
            ;;
        f)
            f=${OPTARG}
            ;;
        \?)
            usage
            ;;
	:)
	    echo "Option -$OPTARG requires an argument." >&2
	    usage
	    ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${f}" ]; then
    echo "File name must be specified."
    usage
fi

if [ $oper = "enc" ]; then
   if [ -z "${k}" ] || [ -z "${v}" ]; then
       usage
   fi
   enc_v=`eyaml encrypt -o string -s "\"${v}\""`
   upper_k=`echo ${k}| awk '{print toupper($0)}'`
   echo "${upper_k}=${enc_v}" >> ${f}
else
   eyaml decrypt -f ${f}
fi
   
