#Exercícios de Chaves:

1. SET simples "um valor"
   GET simples  # Verifica se o valor foi inserido

2. SET usuario:1 "Dados do usuário 1"
   SET usuario:2 "Dados do usuário 2"
   SET usuario:3 "Dados do usuário 3"

3. KEYS *  # Lista todas as chaves

4. KEYS usuario:*  # Lista chaves de usuários

5. SET usuario:11 "Usuário 11"
   SET usuario:21 "Usuário 21"

6. KEYS usuario:*1  # Lista chaves de usuários terminando em 1

7. SET usuario:31 "Usuário 31"  # Entre 20 e 39

8. KEYS usuario:*1  # Neste caso, listará usuario:11, usuario:21, usuario:31

9. RENAME usuario:1 usuario:01

10. KEYS *1  # Lista todas as chaves terminando em 1

11. DEL usuario:3  # Remove usuário 3

12. EXPIRE usuario:2 10  # Configura expiração de 10 segundos
