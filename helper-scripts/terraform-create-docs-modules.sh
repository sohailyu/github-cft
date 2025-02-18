#!/bin/bash
directory=/Users/anilreddy.lambu/Desktop/projects/GitHub/vizio-devsecops-sctv-loki-monitor-infra/modules
for i in  $(ls $directory  | awk '{print $1}')
 do 
	terraform-docs markdown table --output-file README.md --output-mode inject $directory/$i
 done