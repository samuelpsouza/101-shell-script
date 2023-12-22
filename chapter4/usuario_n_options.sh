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
# Versão 6: Adicionadas opções -r, --reverse, -u, --uppercase,
#           leitura de múltiplas opções (loop)
#
# Aurélio, Novembro de 2007
#

ordenar=0		# A saída deverá ser ordenada?
inverter=0		# A saída deverá ser invertida?
maiusculas=0		# A saída deverá ser em maiúsculas?

MENSAGEM_USO="
Uso: $(basename "$0") [OPÇÕES]

OPÇÕES:
 -r, --reverse  	Inverte a listagem
 -s, --sort		Ordena a listagem alfabeticamente
 -u, --uppercase	Mostra a listagem em MAIÚSCULAS

 -h, --help	Mostra esta tela de ajuda e sai
 -V, --version	Mostra a versão do programa e sai
"

# Tratamento das opções de linha de comando

while test -n "$1"
do
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

    -r | --reverse)
	inverter=1
    ;;

    -u | --uppercase)
        maiuscula=1
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
  
  # Opção processada

  shift
done

# Extrai a listagem

lista=$(cut -d : -f 1,5 /etc/passwd)

# Ordena se necessário

if test "$ordenar" = 1
then
   lista=$(echo "$lista" | sort)
fi

# Inverte a listagem (se necessário)

if test "$inverter" = 1
then
   lista=$(echo "$lista" | tac)
fi

# Converte para maiúsculas (se necessário)

if test "$maiusculas" = 1
then
   lista=$(echo "$lista" | tr a-z A-Z)
fi

# Mostrar resultado para o usuário

echo "$lista" | tr : \\t

