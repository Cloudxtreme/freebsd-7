#!/usr/bin/env sh
dialog --title 'Welcome' --msgbox 'THIS IS A RSS READER' 5 20
if dialog --menu "Choose menu" 50 100 8  R "Read - read subscribed feeds" S "Subscribe - new subscription" D "Delete - delete subscription" U "Update - update subscription" Q "Bye~" 2>select
then
	selection=`cat select` 
	if [ $selection = R ]
	then
	elif [ $selection = S ]
	then	
	elif [ $selection = D ]
	then
	elif [ $selection = U ]
	then
	elif [ $selection = Q ]
	then 
			 dialog --title 'Bye'	--msgbox 'byebye' 5 20		
	fi
fi


