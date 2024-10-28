#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;; PROJETO 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;##########################################################################
;; IDENTIFICAÇÃO DO GRUPO
;; Escreva abaixo, em ordem alfabética, o nome e número de matrícula de todos os
;; membros do grupo:
;;     Nome     Sobrenome    Matrícula
;; 1.
;; 2.
;; 3.
;;##########################################################################
;;
;;##########################################################################
;;### PROJETO 2
;;##########################################################################
;;
;; INSTRUÇÕES:
;;
;; Leia com atenção os enunciados, você deverá implementar EXATAMENTE o que está
;; sendo pedido. Em caso de dúvidas contate o professor.
;;
;; O projeto deve ser desenvolvido em grupos de 3 alunos.
;;
;; O projeto deve ser entregue via Moodle atá o prazo limite estabelecido. Ape-
;; nas um dos integrantes do grupo deve submeter o trabalho, colocando o nome 
;; completo e número de matrícula de todos os membros do grupo.
;;
;; Você deve usar EXATAMENTE os nomes dos tipos de dados e atributos e a ordem 
;; dos atributos definidos abaixo.
;; 
;; Você deve usar EXATAMENTE os nomes das funções e a ordem dos argumentos de
;; entrada definidos acima, mas pode escolher os nomes que quiser para os argu-
;; mentos. A escolha adequada dos nomes fará parte da avaliação.
;; 
;; Não esqueça da documentação completa (contrato, objetivo, exemplos) de TODAS
;; as estruturas e funções que você definir! A documentação correta e completa 
;; faz parte da avaliação, valendo nota.
;; 
;; Você pode implementar funções auxiliares extras para resolver os exercícios,
;; mesmo que o enunciado não diga explicitamente para criá-las. Contudo, defi-
;; nir e implementar corretamente as funções solicitadas nos enunciados, com
;; exatamente o mesmo nome e argumentos de entrada, é obrigatório.
;; 
;; Para cada função que você implementar (inclusive auxiliares), exceto as que 
;; retornam imagens, adicione pelo menos três casos de teste usando check-expect.
;; 
;; Você pode reaproveitar partes do código de seus projetos anteriores da dis-
;; ciplina se assim quiser.
;; 
;; Você pode e deve consultar a documentação de Scheme/Racket disponível no
;; Moodle da turma, no livro da disciplina (https://htdp.org/2023-8-14/Book/index.html) 
;; e no site oficial (https://docs.racket-lang.org/).
;; 
;; Você pode desenvolver seu código na plataforma que preferir, mas ele será
;; obrigatoriamente avaliado usando WeScheme (https://www.wescheme.org), então 
;; garanta que ele funciona corretamente neste ambiente.
;;

(define-struct pokemon (especie tipo1 tipo2))
;; Um elemento to conjunto Pokemon tem o formato (make-pokemon especie tipo1 tipo2)
;; onde:
;; especie: String, representa a especie do Pokemon
;;   tipo1: String, representa o primeiro tipo do Pokemon
;;   tipo2: String ou Symbol, representa o segundo tipo do Pokemon ou 'vazio, caso
;;        ele não o tenha.

(define POKEMON1 (make-pokemon "Bulbasaur" "Grass" "Poison"))
(define POKEMON2 (make-pokemon "Charmander" "Fire" 'vazio))
(define POKEMON3 (make-pokemon "Squirtle" "Water" 'vazio))
(define POKEMON4 (make-pokemon "Machop" "Fighting" 'vazio))

(define-struct pokemoncapturado (pokemon nome nivel hpmaximo hpatual))
;; Um elemento to conjunto PokemonCapturado tem o formato (make-pokemoncapturado 
;; pokemon nome nivel hpmaximo hpatual) onde:
;;  pokemon: Pokemon, representa o Pokemon capturado
;;  nome: String, representa o nome do Pokemon
;;  nivel: Numero, representa o nível do Pokemon  
;;  hpmaximo: Numero, representa a quantia de vida maxima do Pokemon  
;;  hpatual: Numero, representa a quantia de vida atual do Pokemon  

(define CAPTURADO1 (make-pokemoncapturado POKEMON1 "Pokemon 1" 1 100 90))
(define CAPTURADO2 (make-pokemoncapturado POKEMON2 "Pokemon 2" 2 100 90))
(define CAPTURADO3 (make-pokemoncapturado POKEMON3 "Pokemon 3" 3 100 90))
(define CAPTURADO4 (make-pokemoncapturado POKEMON4 "Pokemon 4" 4 100 90))

(define-struct treinador (nome idade vaga1 vaga2 vaga3 vaga4 vaga5 vaga6))
;; Um elemento do conjunto Treinador tem o formato (make-treinador nome idade 
;; vaga1 vaga2 vaga3 vaga4 vaga5 vaga6), onde:
;;   nome: String, representa o nome do treinador
;;   idade: Numero, representa a idade do treinador
;;   vaga1-6: PokemonCapturado ou Symbol, representa o PokemonCapturado que o 
;;            treinador possui, ou contem o Symbol 'vazio caso o treinador não 
;;            tenha um pokemon naquela vaga.

(define TREINADOR1 (make-treinador "Treinador 1" 18 POKEMON1 POKEMON2 'vazio 'vazio POKEMON4 'vazio))
(define TREINADOR2 (make-treinador "Treinador 2" 19 'vazio POKEMON2 'vazio 'vazio POKEMON4 'vazio))
(define TREINADOR3 (make-treinador "Treinador 3" 20 'vazio 'vazio 'vazio POKEMON3 POKEMON4 'vazio))
(define TREINADOR4 (make-treinador "Treinador 4" 21 'vazio 'vazio 'vazio 'vazio POKEMON4 'vazio))

;;##########################################################################
;;### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2    #####
;;##########################################################################
;;==========================================================================
;; Desenvolva um função chamada tamanho-time que, dado um Treinador, retorna o 
;; número de vagas do time que não são 'vazio (ou seja, são um PokémonCapturado).
;;==========================================================================
;;
;; --------------------------
;; FUNÇÃO  tamanho-time:
;; --------------------------
  
;;##########################################################################
;;### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3    #####
;;##########################################################################
;;==========================================================================
;; Construa uma função tem-vaga? que, dado um treinador, verifica se ele tem vaga 
;; no time para capturar um novo Pokémon, ou seja, caso algum de seus espaços de 
;; time seja 'vazio, devolve verdadeiro, caso contrário, gera um resultado falso.
;;==========================================================================
  
;; ---------------------------------
;; FUNÇÃO  tem-vaga?:
;; ---------------------------------
  
;;##########################################################################
;;### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4    #####
;;##########################################################################
;;==========================================================================
;; Um treinador que começa sua jornada sem nenhum Pokémon no time pode receber 
;; um Pokémon de presente. Construa uma função recebe-pokemon que, dado um 
;; elemento do tipo Treinador e um elemento do tipo Pokemon, cria um elemento 
;; do tipo PokemonCapturado e o adiciona na primeira vaga com 'vazio do treinador, 
;; desde que todas as vagas atuais do time do treinador contenham 'vazio. Se 
;; existir vaga com um PokemonCapturado, a função recebe-pokemon deverá retornar 
;; o treinador sem modificações.
;;==========================================================================
  
;; ---------------------------------
;; FUNÇÃO  recebe-pokemon:
;; ---------------------------------
  
;;##########################################################################
;;### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5    #####
;;##########################################################################
;;==========================================================================
;; Um treinador que já tem PokémonCapturado no time pode capturar novos Pokémon 
;; se tiver vagas livres no time. Construa uma função captura-pokemon que, dado 
;; um elemento do tipo Treinador e um elemento do tipo Pokemon, cria um elemento 
;; do tipo PokemonCapturado e o adiciona na primeira vaga com 'vazio do treinador, 
;; desde que exista pelo menos uma vaga com PokemonCapturado e exista uma vaga 
;; com 'vazio. Se não existir vaga com 'vazio, ou se todas as vagas tiverem 'vazio, 
;; a função captura-pokemon deverá retornar o treinador sem modificações.
;;==========================================================================
  
;; ---------------------------------
;; FUNÇÃO  captura-pokemon:
;; ---------------------------------
  
;;##########################################################################
;;### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6  m #####
;;##########################################################################
;;==========================================================================
;; Construa uma função libera-pokemon que, dado um elemento do tipo Treinador e 
;; uma String, remove do time do treinador o PokemonCapturado com nome igual ao 
;; da string de entrada, colocando no lugar da vaga a string 'vazio. Se não 
;; existir vaga com PokemonCapturado com nome igual ao da string de entrada, a 
;; função libera-pokemon deverá retornar o treinador sem modificações.
;;==========================================================================
  
;; ---------------------------------
;; FUNÇÃO  libera-pokemon:
;; ---------------------------------
  
;;##########################################################################
;;### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7    #####
;;##########################################################################
;;==========================================================================
;; Quando se visita um Centro Pokémon, é possível curar os danos sofridos pelos 
;; Pokémon Capturados no time de um Treinador. Defina abaixo duas funções, a 
;; função cura-pokemoncapturado, que recebe um elemento do tipo PokemonCapturado 
;; e restora seu HP atual para ser igual ao seu HP máximo, e a função cura-time, 
;; que recebe de entrada um elemento do tipo Treinador e restora o HP atual de 
;; todos os PokemonCapturado nas vagas de seu time para serem iguais aos seus 
;; HPs máximos.
;;==========================================================================
  
;; ---------------------------------
;; FUNÇÃO  cura-pokemon:
;; ---------------------------------
  
;; ---------------------------------
;; FUNÇÃO  cura-time:
;; ---------------------------------
  
;;##########################################################################
;;### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8    #####
;;##########################################################################
;;==========================================================================
;; Desenvolva uma função desenha-time, que recebe de entrada um elemento do tipo 
;; Treinador e desenha na tela um resumo do seu time, aparecendo todos os 
;; PokémonCapturados do time do treinador. Você pode definir a maneira que achar 
;; melhor para representar os pokémon na tela, mas todos devem ser desenhados e as 
;; suas informações devem aparecer (nome, espécie, tipo1, tipo2, espécie, nível, etc.).
;; DICA: você pode reaproveitar partes do seu código do PROJETO 1.
;;==========================================================================
  
;; ---------------------------------
;; FUNÇÃO  desenha-time:
;; ---------------------------------
  
