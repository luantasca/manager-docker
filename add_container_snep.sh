#!bin/sh

echo "Nome do Container"
read nome
echo "IP do Container"
read ip
echo "Memoria do Container"
read memoria

   docker volume create $nome 
      docker run -itd \
	         --restart always \
		    --network rede-bridge \
		       --ip $ip \
		          --memory $memoria \
			     --cpu-shares 512 \
			     --cap-add NET_ADMIN \
         --name $nome \
	 --hostname $nome \
		       sisbsd-snep:1 \
		       /bin/bash
