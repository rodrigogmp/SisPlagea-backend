# README

Desenvolvimento de plataforma de gestão de atividades para docente/pesquisador
O objetivo desse projeto é a implementação de um sistema WEB que irá realizar a gestão
de atividades para docente/pesquisador. Tanto o frontend quanto o backend do sistema
deverá ser implementado.

Descrição do sistema: O sistema deverá prover uma maneira para gestão das atividades de
um docente/pesquisador.<br>
● O site deverá permitir que o professor adicione alunos que o mesmo orienta. As categorias dos alunos são: iniciação científica, mestrado, doutorado e pós-doutorado. <br>
● O professor poderá adicionar projetos de pesquisa. Além disso, vincular alunos, já cadastrados, nestes projetos de pesquisa.<br>
● O site deverá permitir cadastrar informações sobre o aluno previamente cadastrados. o Informações como: Nome do projeto, resumo, ano de início, ano de término, (opcional) upload de PDF representando trabalho de conclusão de curso, dissertação, tese, etc.<br>
● O site deverá permitir que o professor adicione aulas que o mesmo leciona. As aulas poderão ser classificadas como: aulas para graduação, aulas para pós-graduação.<br>
● O site deverá permitir o upload dos materiais didáticos, upload de arquivos. <br>
● O site deverá permitir que o professor adicione seu grupo de pesquisa a qual o mesmo faz parte.<br>
● O site deverá permitir que o professor adicione publicações. As publicações podem ser categorizadas como: conferência, resumo ou periódico. <br>
● O site deverá permitir que o professor faça o upload de um arquivo bibtex que represente a publicação e o sistema importe os metadados desse arquivo que representa uma publicação.<br>
● O site deverá ter uma página de contato com o professor.<br>
● O site deverá ter uma página para permitir adicionar informações sobre o professor, tais como sua formação, sala, telefone, e-mail, etc.<br>

#Como rodar o projeto:<br>
Pré-requisitos:<br>
  ● Possuir um usuário Mysql com privilégios equivalentes ao root.<br>
  ● Possuir instalados o ruby e o rails. Recomendamos o tutorial: https://gorails.com/setup/ubuntu/18.04 <br>
  ● Criar um arquivo dentro do diretorio /config chamado database.yml, copiar todo o conteudo do arquivo database.yml.example para o arquivo database.yml. Substituir o username pelo seu usuario Mysql, substituir o password pelo seu password mysql. <br>
  ● Rodar em sequencia os comandos: bundle install(instala todas as dependencias do projeto), rails db:create(cria o banco), rails db:migrate(cria o esquema). <br>
  ● Rodar o comando rails server ou rails s para rodar a aplicação.
  
