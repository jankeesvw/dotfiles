#!/usr/bin/env bash

curl -X GET 'http://192.168.1.2:8080/json.htm?type=command&param=switchlight&idx=111&switchcmd=Toggle'

open "swiftbar://refreshplugin?name=busy"