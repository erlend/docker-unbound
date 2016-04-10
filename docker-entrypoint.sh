#!/bin/sh

set -e

if [ `which unbound-$1 2>/dev/null` ]; then
  set -- unbound-"$@"
elif [ ! `which $1 2>/dev/null` ]; then
  set -- unbound -dv "$@"
fi

exec "$@"
