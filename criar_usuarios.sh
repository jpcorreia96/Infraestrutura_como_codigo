 #!/bin/bash

echo "Criando os diretórios"
mkdir  /public
mkdir /adm
mkdir /ven
mkdir /sec
echo "Os diretórios foram criados!"

echo "Criando os grupos"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC
echo 'Os grupos foram criados!'


echo "Criando os Usuários!"

useradd joao -m -c "João_adm" -s /bin/bash -p $(openssl passwd -1 senha123)$
passwd joao -e
useradd carlos  -m -c "Carlos_adm" -s /bin/bash -p $(openssl passwd -1  senha123)$
passwd carlos  -e
useradd maria  -m -c "Maria_adm" -s /bin/bash -p $(openssl passwd -1 senha123)$
passwd maria -e

useradd debora -m -c "Débora_ven" -s /bin/bash -p $(openssl passwd -1 senha123)$
passwd debora -e
useradd sebastiana -m -c "Sebastiana_ven" -s /bin/bash -p $(openssl passwd -1 senha123)$
passwd sebastiana -e
useradd roberto -m -c "Roberto_ven" -s /bin/bash -p $(openssl passwd -1 senha123)$
passwd roberto -e


useradd josefina -m -c "Josefina_sec" -s /bin/bash -p $(openssl passwd -1 senha123)$
passwd josefina -e
useradd amanda -m -c "Amanda_sec" -s /bin/bash -p $(openssl passwd -1 senha123)$
passwd amanda -e
useradd rogerio -m -c "Rogério_sec" -s /bin/bash -p $(openssl passwd -1 senha123)$
passwd rogerio -e


echo  "Os usuários foram criados!!"

echo "Adicionando os usuários aos grupos"

usermod -g GRP_ADM carlos
usermod -g GRP_ADM maria
usermod -g GRP_ADM joao

usermod -g GRP_VEN debora
usermod -g GRP_VEN sebastiana
usermod -g GRP_VEN roberto

usermod -g GRP_SEC josefina
usermod -g GRP_SEC amanda
usermod -g GRP_SEC rogerio

echo "Os usuarios foram adicionados aos respectivos grupos"

echo "Gerenciando permissões dos usuários"
 
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /sec
chmod 770 /ven
chmod 777 /public 

echo "Finalizado"
