#!/bin/bash
#
# nome_completo.sh - Busca o nome completo de um usuário no Unix
#
# Site        : https://fsilva.domain
# Autor       : Fulano da Silva <fsilva@domain>
# Manutenção  : Sicrano <sicrano@domain>
#
# --------------------------------------------------------------
#  Este programa recebe como parâmetro o login de um usuário e
#  procura em várias bases qual o seu nome completo, retornando
#  o resultado na saída padrão (STDOUT).
#
#  Exemplos:
#     $ ./nome_completo.sh fulano
#     Fulano da Silva
#     $ ./nome_completo fullano
#     $
#  A ordem de procura do nome completo é sequencial:
#  
#     1. Arquivo /etc/passwd
#     2. Arquivo $HOME/.plan
#     3. Base de Usuários LDAP
#     4. Base de Usuários MySQL
#
#  Respeitando a ordem, o primeiro resultado encontrado será o
#  retornado.
# -------------------------------------------------------------
#
#
#
#
# Histórico:
#
#    v1.0 1999-05-18, João Silva:
#       - Versão inicial procurando no /etc/passwd
#    v1.1 1999-08-02, Fulano da Silva:
#       - Adicionada pesquisa no $HOME/.plan
#       - Corrigido bug com nomes acentuados
#
# Licença: GPL.
#
