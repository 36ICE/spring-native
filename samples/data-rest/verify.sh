#!/usr/bin/env bash
source ${PWD%/*samples/*}/scripts/wait.sh
wait_http localhost:8080/api/customers/1 "Matthews"
