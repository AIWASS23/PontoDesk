# Ponto Desk
Este produto foi desenvolvido como solução para o Terceiro Challenge da Residência em Desenvolvimento iOS do Instituto Rede.
[Image from the Figma of the challenge's design]

## Objetivo do Challenge 🎯
Fomos, como equipe e bolsistas, desafiados a resolvermos algum problema organizacional do Laboratório de Desenvolvimento de Software (LDS) localizado no Instituto Federal do Ceará campus Forraleza.

Tendo em vista esse desafio, como equipe, nos propomos a resolver 3 problemas essenciais:
- [x] O ponto manual realizado pelos mentores da Residência;
- [x] Dificuldade de reservar a sala de reuniões, além da priorização de atividades que podem ser realizadas na mesma;
- [x] Super lotação do laboratório em determinados turnos dificulta a possibilidade de estender os horários de estudo no mesmo.

## Resolução do Challenge 🔍
Usamos, durante todo o processo de pesquisa para criar a solução desses problemas, o Challenge Based Learning. 

Nossas pesquisas foram voltadas para:
1. Como criar o login de maneira que todos no laboratório possam realizar?
2. Qual a melhor maneira de fazermos com que os registros de presença (pontos) sejam enviados para os mentores?
3. Como podemos reservar mesas diariamente, de maneira que todos saibam qual mesa será usada e por quem?
4. Como podemos priorizar a reserva da sala de reuniões, para atividades mais urgentes?

Com base nessas perguntas desenvolvemos as funcionalidades essenciais do Ponto Desk.

## Funcionalidades do Ponto Desk 🛠️
* Controle de Registro de Presença automatizado: em apenas um clique registre sua entrada e saída;
* Envio de relatório de presença individual para superiores: sem a necessidade de esforço algum, um email chegará para os mentores mensalmente com as presenças e ausências;
* Reserva de Mesa por turno, a cada 4 horas: reserva cada mesa do loboratório por turno (Manhã/Tarde/Noite);
* Reserva da Sala de Reuniões: reserva da sala de reuniões em períodos de pelo menos 15 minutos;
* Checar horas trabalhadas: ao final de cada dia de trabalho, tenha um cálculo de horas trabalhadas naquele dia; 
* Consulta de Reservas Futuras: consultar a reserva de dias e meses seguintes, da Sala de Reuniões ou das Mesas.
* Consulta de Ponto dos dias anteriores: é possível suas próprias e ausências em dias anteriores, não é possível ver o dia seguinte.

## Como fizemos o Ponto Desk acessível? 🌐
Duas medidas essenciais foram tomadas para que a aplicação fosse acessível a todos no laboratório:
1. Criamos a aplicação para MacBook, pois cada bolsista do laboratório possui um, enquanto essa situação não se repete para iPhone.
2. Esta aplicação possui o voice over completamente alterado para que seja melhor para pessoas com visão baixa ou subnormal.
3. Usamos uma paleta de cores acessível para maior parte das pessoas com qualquer discromatopsia.

## Tecnologias Utilizadas 💻
* **Swift**, linguagem usada no processo de desenvolvimento;
* **SwiftUI**, framework utilizado para a criação de componentes;

## API 
Utilizamos uma API desenvolvida pela nossa equipe que está em repositório privado, mas usamos como tecnologias:
* **Firebase**, plataforma para autenticação, login e cadastro de usuário.
* **AWS Cloud**, para o deploy da API.
* **AWS Lamba**, para o desenvolvimento da API.
* **Python**, como linguagem principal do desenvolvimento desta aplicação.

## Exucatar aplicação localmente
1. Clone o repositório:
   ```
   git clone https://github.com/AIWASS23/PontoDesk.git
   ```
2. Abra o projeto no XCcde:
   * Navegue até o diretório do projeto e abra o arquivo .xcodeproj ou .xcworkspace no Xcode.
3. Instale as dependências:
   * Utilize o Swift Package Manager (SPM) para adicionar as dependências necessárias para Firebase e outros pacotes:
   * Abra o projeto no Xcode e selecione File > Swift Packages > Add Package Dependency.
   * Adicione o URL do repositório do pacote que você deseja adicionar.
4. Construa e execute o projeto:
   * Após a configuração, você pode compilar e executar o projeto diretamente do Xcode.
