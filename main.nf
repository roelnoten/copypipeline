nextflow.enable.dsl=1

params.in = "test.test"
inputFile = file(params.in)

process writetooutput {
input:
file x from inputFile

publishDir 'out', pattern: 'out/*', mode: 'move'
output:
path 'out/*'
script:
"""
#!/bin/bash
for ((n=0;n<300;n++))
do
date +"%H:%M:%S"
free -h
sleep 1
done
printf in
printf "create dir"
mkdir out
printf "copy start"
cp $x out
printf "copy done"
"""
}
