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
# Versão 4: Arrumando bug quando não tem opções, basename no
#           nome do programa, -V extraindo direto dos cabeçalhos,
#           adicionadas opções --help e --version
# Versão 5: Adicionadas opções -s e --sort
#
# Aurélio, Novembro de 2007
#

ordenar=0		# A saída deverá ser ordenada?

MENSAGEM_USO="
Uso: $(basename "$0") [-h | -V]

 -h, --help	Mostra esta tela de ajuda e sai
 -V, --version	Mostra a versão do programa e sai
"

# Tratamento das opções de linha de comando

case "$1" in
    -h | --help)
	echo "$MENSAGEM_USO"
	exit 0
    ;;

    -V | --version)
	# mostra a versão
	echo -n $(basename "$0")
	# Extrai a versão diretamente dos cabeçalhos do programa
	grep '^# Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
	exit 0
    ;;
    
    -s | --sort)
	ordenar=1
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

# Extrai a listagem

lista=$(cut -d : -f 1,5 /etc/passwd)

if test "$ordenar" = 1
then
   lista=$(echo "$lista" | sort)
fi

# Mostrar resultado para o usuário

echo "$lista" | tr : \\t

