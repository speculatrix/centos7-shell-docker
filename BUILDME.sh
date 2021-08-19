#!/bin/bash

TAG="centos7-shell"

# http_proxy comes from the environment
# shellcheck disable=SC2154

PROXY_ARGS=( )

if [ "$http_proxy" != "" ] ; then
	echo "Info, proxy detected"
	declare -a PROXY_ARGS
	PROXY_ARGS=( "--build-arg" "http_proxy=${http_proxy}" "--build-arg" "https_proxy=${https_proxy}" )
fi

echo -n "What username? "
read -r MYUSERNAME
[ "$MYUSERNAME" == "" ] && echo "Error, blank input" && exit 1

sed -e "s/MYUSERNAME/$MYUSERNAME/g" < Dockerfile.tpl > Dockerfile

docker build --network=host "${PROXY_ARGS[@]}" -t "${TAG}-${MYUSERNAME}" .


