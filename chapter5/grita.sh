#!/bin/bash
#
# grita.sh
#
# Mostra a palavra ($TXT) em maiúscula e com exclamações
# Exemplo: foo -> !!!!!FOO!!!!!

TXT="gritaria"

TXT="     $TXT     "			# Adiciona 5 espaços ao redor
TXT=$(echo "$TXT" | tr ' ' '!')           # Troca os espaços or exclamações
TXT=$(echo "$TXT" | tr a-z A-Z)		# Deixa o texto em maiúsculas
echo $TXT				# Mostra a mensagem
