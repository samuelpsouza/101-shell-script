#!/bin/bash
#
# usuarios.sh
#
# Mostra os logins e nomes de usuários do sistema
# Obs.: Lê dados do arquivo /etc/passwd
#
# Versão 1: Mostra usuparios e nomes separados por TAB
# Versão 2: Adicionado suporte à opção -h
# Versão 3: Adicionado suporte à opção -V e opções inválidas
#
# Aurélio, Novembro de 2007
#

MENSAGEM_USO="
Uso: $0 [-h | -V]

 -h	Mostra esta tela de ajuda e sai
 -V	Mostra a versão do programa e sai
"

# Tratamento das opções de linha de comando

case "$1" in
    -h)
	echo "$MENSAGEM_USO"
	exit 0
    ;;

    -V)
	# mostra a versão
	echo "v1.0.2"
	exit 0
    ;;
    
    *)
	# opção inválida

	if test -n "$1"
	then
	   echo "Opção inválida: $1"
	   exit 1
	fi
    ;;
esac

# Processamento

cut -d : -f 1,5 /etc/passwd | tr : \\t

