#!/bin/bash
set +e
#Ref - https://www.graalvm.org/22.0/reference-manual/native-image/StaticImages/
output=`x86_64-linux-musl-gcc`
if [[ ($? -ne 0) && ($output == *(x86_64-linux-musl-gcc: fatal error: no input files)*) ]]; then
   echo "sucess"
   exit 0
fi
echo "failed"
exit 1
