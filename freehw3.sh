#!/bin/sh 

ps aux | sed -e '1d' | sort -k1,1 -k8,8 |

awk 'BEGIN{{ORS=""} {K=0}{S=0}{P=$1} {Q=$8} } 
    { 	
	if($1 != P){
		if(K==1){print " )"}
		{if(NR!=1)print "\n"}
		{print $1}
		{print "\n"} 
		{Q=0}
		{S=0}
		
	}
	
	if($8 != Q){
		{if(S==1)print " )\n"}
		{S=1}
		{print "\t\t"}
		{print $8 " ("}
		{Q=$8}
		{S=1}
		{K=1}
	}
	{print" "$2}
	{P=$1}
    }END{print " )"}'
