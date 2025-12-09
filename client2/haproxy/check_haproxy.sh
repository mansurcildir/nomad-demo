#!/bin/bash
pidof haproxy >/dev/null 2>&1 || exit 1
nc -z 127.0.0.1 1936 >/dev/null 2>&1 || exit 1
exit 0
