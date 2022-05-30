# garagem-flutter
Projeto feito para avaliação da RaroLabs onde foi solicitado um app com as seguintes funcionalidades:
Seu João tem um estacionamento e hoje tem um caderno onde anota todas as entradas e saídas, assim como preenche qual vaga o caminhão ocupa cada vez que acontece uma entrada ou saída.

Agora o Sr. João quer poder fazer isso na palma de sua mão com seu Smartphone. Com seu app, ele quer ver quais vagas estão ou não ocupadas, assim como registrar entradas e saídas dos veículos e qual vaga estes veículos estão ocupando! Ele também queria ter um histórico dessas entradas e saídas para poder fazer o fechamento no final do dia.

João é um administrador mais velho, então uma interface fácil de utilizar é mais vantajosa que uma interface muito complexa.

E aí, bora resolver o problema do Sr. João usando o Flutter!?

O que esperamos do seu teste:

1 - Usar alguma arquitetura da sua escolha
2 - Buscar boas práticas de programação, código limpo, princípios SOLID, DRY, entre outros
3 - Se possível usar Testes unitários e de Widgets, aqui na Raro mantemos sempre um padrão de qualidade e com isso os testes são essenciais para a minimização dos BUGS, mas se encontrar dificuldades não tem problema não colocar.
4 - Utilização de uma solução simples, nosso lema é manter tudo o mais simples possível
5 - Uma interface simples que resolva o problema, não iremos avaliar rigorosamente as telinhas feitas. Mas nada impede você de mostrar seus dons criativos ;)

# Projeto
O projeto tem como menu o bottomNavitor onde agrupam 4 telas e um botão suspendido que consegue ocupar uma vaga em qualquer lugar do app, ja na tela inicial as vagas disponíves e ocupadas são mostradas por cores verde e vermelho onde no momento da consulta e atualizada em RealTime, clicando nas vagas você consegue ocupar e registrar uma saída de veículo, a segunda tela é um gráfico que mostra quantidade de vagas Livres e ocupadas, terceira tela tem o hitórico onde pode ser escolhido filtrar por todos ou por data específica e criar o PDF salvando no próprio dispositivo, na ultima tela é feito uma busca por placa.

# Arquitetura
O desenho arquitetural do projeto leva em conta diversos fatores que foram levantados como requisitos do projeto que levei em conta como casos de uso. O principal fator que temos que nos atentar é que precisamos de um aplicativo modularizado, dessa forma achei por bem utilizar a clean ar.

# Gerenciamento de Estado
O gerenciamento de estado foi a minha escolha, achei que por ser um projeto pequeno o MobX atende muito bem, então todo o projeto foi feito com ele e os arquivos todos estão com nomenclatura de controller

#Injeção de dependencia
Seria utilizado o GetIt porem como o prazo foi um pouco curto não consegui implementar
