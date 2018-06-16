#!bin/sh

echo "Nome do Container"
read nome
echo "IP do Container"
read ip
echo "Memoria do Container"
read memoria
echo "Hostname do Container"
read hostname

   docker volume create $nome 
      docker run -itd \
	         --restart always \
		    --network rede-bridge \
		       --ip $ip \
		          --memory $memoria \
			     --cpu-shares 512 \
			     --cap-add NET_ADMIN \
			     -v $nome-etc:/etc -v $nome-www:/var/www \
			     -v $nome-log:/var/log -v $nome-lib:/var/lib \
			     -v $nome-home:/home -v /etc/resolv.conf:/etc/resolv.conf:ro \
			     -v $nome-monitor:/var/spool/asterisk/monitor -v $nome-mysql:/var/lib/mysql \
         --name $nome \
	 --hostname $hostname \
		       luantasca/issabel:3 \
		       /bin/bash

