# Clona o repositorio de Java no Cloudshell

# Baixa o script e joga no cloudshell pelo Gerenciar Arquivos > Carregar

# (fica na home e roda o comando: chmod +x setup.sh

# roda ./setup.sh

az webapp up -g rg-motuswatch-sites \
--location brazilsouth --plan planSites \
-n motuswatch-webapp --sku B1 --logs --runtime "JAVA:17" --os-type Windows

# quando aparecer essa mensagem:
# Deployment endpoint responded with status code 202
# Start Date Time: (...)
# da um Ctrl C que o script vai continuar sozinho

az webapp log config --level verbose \
-g rg-motuswatch-sites -n motuswatch-webapp \
--web-server-logging filesystem --application-logging filesystem

cd Sprint3_Java/

mvn clean package -DskipTests

# Depois que o script terminar e o shell deixar vc escrever no terminal, roda esse comando

#cd Sprint3_Java/

#az webapp deploy \
#-g rg-motuswatch-sites -n motuswatch-webapp \
#--src-path ./target/motuswatch-0.0.1-SNAPSHOT.jar \
#--type jar

#az webapp log tail -g rg-motuswatch-sites -n motuswatch-webapp