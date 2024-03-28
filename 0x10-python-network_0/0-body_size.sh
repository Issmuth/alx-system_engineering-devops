#!/bin/bash
# sends a request to a url and return the size of the body

curl -s -o /dev/null -w '%{size_download}\\n' $1
