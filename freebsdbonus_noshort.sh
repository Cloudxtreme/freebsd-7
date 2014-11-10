#!/usr/bin/env sh
awk 'BEGIN{
	printf("\033[2J");
	for(n=1;n<=900;n++){
		c =int(rand()*900)%2;
		p[n] = c;
	}
	while(1){
		printf("\033[1;1H");
		for(a=32;a<=869;a++){
			q[a]=p[a];
			c=p[a-31]+p[a-30]+p[a-29]+p[a-1]+p[a+1]+p[a+31]+p[a+30]+p[a+29];
			if(!p[a]&&c==3)q[a]=1;
			else if(p[a]&&(c<2||c>3))q[a]=0;	
		}
		for(e=1;e<31;e++)printf("=");
		printf("\n");
		d=90000;while(d--);
		for(a=1;a<=900;a++){
	p[a]=q[a];
	if(q[a])printf("x");
			else printf(" ");
			if(a%30==0)printf("\n");
		}
		for(e=1;e<31;e++)printf("=");
		d=30000;while(d--);
	}
}'
