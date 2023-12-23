#!/bin/bash
#
# grita.sh
#
# Mostra a palavra ($TXT) em maiúscula e com exclamações
# Exemplo: foo -> !!!!!FOO!!!!!

DEBUG=1					# Debug: 0 desliga, 1 liga

Debug(){
  [ "$DEBUG" = 1 ] && echo "$*"
}

TXT="gritaria"

TXT="     $TXT     "			# Adiciona 5 espaços ao redor

Debug "TXT com espaços    : [$TXT]"
TXT=$(echo "$TXT" | tr ' ' '!')         # Troca os espaços or exclamações
Debug "TXT com exclamações: [$TXT]"

TXT=$(echo "$TXT" | tr a-z A-Z)		# Deixa o texto em maiúsculas
echo $TXT				# Mostra a mensagem
