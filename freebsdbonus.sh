#!/usr/bin/env sh
awk 'BEGIN{

	printf("\033[2J");
	for(n=1;n<=900;n++){
		c = int(rand()*900)%2;
		p[n] = c;
	}
	
	while(1){
		printf("\033[1;1H");
		for(a=32;a<=869;a++){
			q[a]=p[a];
			c=p[a-31]+p[a-30]+p[a-29]+p[a-1]+p[a+1]+p[a+31]+p[a+30]+p[a+29];
			if(!p[a]){
				if(c==3)q[a]=1;
				else q[a]=0;
			}
			else{
				if(c==2||c==3)q[a]=1;
				else q[a]=0;
			}
		}
		for(a=1;a<=900;a++){
			p[a]=q[a];
			if(q[a]==0)printf(" ");
			else printf("o");
			if(a%30==0)printf("\n");
		}
		d=300000;while(d--);

	}
}'
