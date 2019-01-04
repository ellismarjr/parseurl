#!/bin/bash
########################################################
########################################################
##              Script Description                    ##
##                                                    ##
##      Script developed to do parse on websites      ##
##		and extract links from it.					  ##
##      Developer:      Júnior de Oliveira            ##
##      Date:           06/05/2018                    ##
##      Version:        1.0518.06                     ##
##                                                    ##
##                                                    ##
##                                                    ##
########################################################
########################################################

if [ "$#" -lt 1 ] # verfifica se há algum argumento passado com parametro
then
	echo "Usage mode: $0 target"
	echo "Example: $0 www.domain.com"
else
	rm -rf index.html #exclui o arquvo index baixado pelo wget
	#faz download da página index e redireciona para nao ter saida a tela
	wget "$1" &> /dev/null
	#faz varias verificacoes para a saida do script ficar limpa
	grep href index.html | cut -d "/" -f3 | grep "\." | cut -d "\"" -f1 | sort -u | grep -v "url" | grep -v "a href" > parseurl.txt
	for host in $(cat parseurl.txt);do host $host;done | grep "has address"
fi
