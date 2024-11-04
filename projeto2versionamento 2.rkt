;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |projeto2versionamento 2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prof. Bruno Iochins Grisci
;; INF05008 - Fundamentos De Algoritmos
;; PROJETO 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;##########################################################################
;; IDENTIFICAÇÃO DO GRUPO
;; Escreva abaixo, em ordem alfabética, o nome e número de matrícula de todos os membros do grupo:
;;     Nome     Sobrenome    Matrícula
;; 1.
;; 2.
;; 3.
;##########################################################################
;
;##########################################################################
;### PROJETO 2
;##########################################################################
;
;INSTRUÇÕES:
;
;Leia com atenção os enunciados, você deverá implementar EXATAMENTE o que está sendo pedido. Em caso de dúvidas contate o professor.
;
;O projeto deve ser desenvolvido em grupos de 3 alunos.
;
;O projeto deve ser entregue via Moodle atá o prazo limite estabelecido. Apenas um dos integrantes do grupo deve submeter o trabalho, colocando o nome completo e número de matrícula de todos os membros do grupo.
;
;Você deve usar EXATAMENTE os nomes dos tipos de dados e atributos e a ordem dos atributos definidos abaixo.
;
;Você deve usar EXATAMENTE os nomes das funções e a ordem dos argumentos de entrada definidos acima, mas pode escolher os nomes que quiser para os argumentos. A escolha adequada dos nomes fará parte da avaliação.
;
;Não esqueça da documentação completa (contrato, objetivo, exemplos) de TODAS as estruturas e funções que você definir! A documentação correta e completa faz parte da avaliação, valendo nota.
;
;Você pode implementar funções auxiliares extras para resolver os exercícios, mesmo que o enunciado não diga explicitamente para criá-las. Contudo, definir e implementar corretamente as funções solicitadas nos enunciados, com exatamente o mesmo nome e argumentos de entrada, é obrigatório.
;
;Para cada função que você implementar (inclusive auxiliares), exceto as que retornam imagens, adicione pelo menos três casos de teste usando check-expect.
;
;Você pode reaproveitar partes do código de seus projetos anteriores da disciplina se assim quiser.
;
;Você pode e deve consultar a documentação de Scheme/Racket disponível no Moodle da turma, no livro da disciplina (https://htdp.org/2023-8-14/Book/index.html) e no site oficial (https://docs.racket-lang.org/).
;
;Você pode desenvolver seu código na plataforma que preferir, mas ele será obrigatoriamente avaliado usando WeScheme (https://www.wescheme.org), então garanta que ele funciona corretamente neste ambiente.
;
;##########################################################################
;### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1    #####
;##########################################################################
;==========================================================================
;Defina um tipo de dados chamado Pokemon, que deve registrar o nome de uma espécie de Pokémon ("Bulbasaur", "Charmander", "Squirtle", etc.), o seu tipo 1 ("Grass", "Fire", etc.), tipo 2.
;Se o Pokemon só tem um tipo, tipo 2 deve ter o Symbol 'vazio.
 
;Defina 4 constantes cujos valores sejam do tipo Pokemon.   


;Defina um tipo de dados chamado PokemonCapturado que deve registrar o Pokémon que foi capturado (estrutura Pokemon), o nome de um Pokémon capturado (uma string), o nível do Pokémon (um inteiro positivo), o HP máximo do Pokémon (um inteiro positivo), o HP atual do Pokémon (um inteiro positivo).
 


;Defina 4 constantes cujos valores sejam do tipo PokemonCapturado.   
 
;Defina também um tipo de dados chamado Treinador, que deve registrar o nome de um treinador (uma string), sua idade (um número) e seis vagas do time deste Treinador. Cada vaga de time pode ser um Pokémon capturado (tipo PokemonCapturado) ou pode estar livre (neste caso, deve ser utilizada o Symbol 'vazio). 
;(define-struct treinador [nome idade vaga1 vaga2 vaga3 vaga4 vaga5 vaga6])
 

;Defina 4 constantes cujos valores sejam do tipo Treinador.    
 
;Escreva a documentação completa de cada estrutura como visto em aula.
;==========================================================================
(define VAZIO 'vazio)
(define CARTA_ALT 225)
(define CARTA_LAR 175)

(define-struct pokemon (especie tipo1 tipo2))
 
;; Um elemento do conjunto pokemom tem o formato 
;;        (make-pokemon (e tp1 tp2))
;; onde:
;;       e : String, representa o nome da especie do pokemom
;;       tp1 : String, representa o tipo de pokemom
;;       tp2 : StringOuSymbol, representa o tipo do pokemom ou um simbolo 'vazio'

(define POKEMON1 (make-pokemon "Bulbasaur" "Grass" "Poison"))
(define POKEMON2 (make-pokemon "Charmander" "Fire" VAZIO))
(define POKEMON3 (make-pokemon "Squirtle" "Water" VAZIO))
(define POKEMON4 (make-pokemon "Machop" "Fighting" VAZIO))
 
 
(define-struct pokemoncapturado (pokemon nome nivel hpmaximo hpatual))
;; Um elemento do conjunto pokemoncapturado tem o formato 
;;        (make-pokemoncapturado (pk N nvl hpmax hpactual))
;; onde:
;;       pk :Pokemom, representa a estrutura pokemom
;;       N : String, representa o nome do pokemom
;;       nvl : Número, representa o nivel do pokemom 
;;       hpmax: Número, representa o hp maximo do pokemom 
;;       hpacutal : Número, representa o hp atual do pokemom 

;Defina 4 constantes cujos valores sejam do tipo PokemonCapturado.   
(define CAPTURADO1 (make-pokemoncapturado POKEMON1 "Bulbasaur" 1 100 90))
(define CAPTURADO2 (make-pokemoncapturado POKEMON2 "Charmander" 2 100 90))
(define CAPTURADO3 (make-pokemoncapturado POKEMON3 "Squirtle" 3 100 90))
(define CAPTURADO4 (make-pokemoncapturado POKEMON4 "Machop" 4 100 90))
(define CAPTURADO5 (make-pokemoncapturado POKEMON1"Bulbasaur" 5 100 90))
(define CAPTURADO6 (make-pokemoncapturado POKEMON2 "Charmander" 6 100 90))
 

;--------------------------------
; TIPO StringOuSymbol:
;--------------------------------
;; Um elemento do conjunto StringOuSymbol é:
;; i) String, ou
;; ii) Symbol


;--------------------------------
; TIPO PokemonCapturadoOuSymbol:
;--------------------------------
;; Um elemento do conjuntoPokemonCapturadoOuSymbol é:
;; i) PokemonCapturado, ou
;; ii) Symbol



(define-struct treinador(nome idade vaga1 vaga2 vaga3 vaga4 vaga5 vaga6))
      ;; Um elemento do conjunto treinador  tem o formato 
;;        (make-treinador (n id vg1 vg2 vg3 vg4 vg5 vg6))
;; onde:
;;       
;;       N : String, representa o nome do treinador
;;       id : Número, representa a idade do treinador  
;;      vg1: PokemonCapturadoOuSymbol, representa a estrutura PokemonCapturado ou um simbolo 'vazio' 
;;      vg2: PokemonCapturadoOuSymbol, representa a estrutura PokemonCapturado ou um simbolo 'vazio'
;;      vg3: PokemonCapturadoOuSymbol, representa a estrutura PokemonCapturado ou um simbolo 'vazio'
;;      vg4: PokemonCapturadoOuSymbol, representa a estrutura PokemonCapturado ou um simbolo 'vazio'
;;      vg5: PokemonCapturadoOuSymbol, representa a estrutura PokemonCapturado ou um simbolo 'vazio'
;;      vg6: PokemonCapturadoOuSymbol, representa a estrutura PokemonCapturado ou um simbolo 'vazio' 

 
;Defina as constantes abaixo:
(define TREINADOR1
  (make-treinador "Thiago" 12 CAPTURADO4 VAZIO VAZIO VAZIO VAZIO VAZIO))
(define TREINADOR2
  (make-treinador "Ramom" 22 CAPTURADO4 CAPTURADO3 CAPTURADO2 VAZIO VAZIO VAZIO))
(define TREINADOR3
  (make-treinador "Renato" 20 CAPTURADO4 CAPTURADO1 CAPTURADO2 CAPTURADO3 CAPTURADO5 CAPTURADO6))
(define TREINADOR4
  (make-treinador "Nathan" 21 VAZIO VAZIO VAZIO VAZIO VAZIO VAZIO))

(define TREINADORVAZIO (make-treinador "Treinador Vazio" 18 VAZIO VAZIO VAZIO VAZIO VAZIO VAZIO))

(define TREINADORCHEIO
  (make-treinador "Treinador Cheio"
                  19
                  CAPTURADO1
                  CAPTURADO2
                  CAPTURADO3
                  CAPTURADO4
                  CAPTURADO5
                  CAPTURADO6))

;##########################################################################
;### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2    #####
;##########################################################################
;==========================================================================
;Desenvolva um função chamada tamanho-time que, dado um Treinador, retorna o número de vagas do time que não são 'vazio (ou seja, são um PokémonCapturado).
;==========================================================================
;; --------------------------
; FUNÇÃO-AUX  conta-vaga: Número->Número
; --------------------------
;; conta-vaga: PokemonCapturadoOuSymbol -> Número
;; Recebe uma vaga de treinador (que pode ser um PokemonCapturado ou o símbolo 'vazio)
;; e retorna 1 se houver um pokemon na vaga ou 0 se a vaga estiver vazia
;; Exemplos:
;; (conta-vaga VAZIO) = 0
;; (conta-vaga CAPTURADO1) = 1
(define (conta-vaga vaga)
  (cond
    [(symbol? vaga) 0]
    [else 1]))
;; Testes para conta-vaga
(check-expect (conta-vaga VAZIO) 0)
(check-expect (conta-vaga CAPTURADO1) 1)
(check-expect (conta-vaga CAPTURADO2) 1)
 
; --------------------------
; FUNÇÃO  tamanho-time: Treinador->Número
; --------------------------
;; Obj:  dado um Treinador, retorna o número de vagas do time que não são 'vazio (ou seja, são um PokémonCapturado).
;; Exemplos:
;       (tamanho-time Treinador1) = 1
;       (tamanho-time Treinador3) = 6


(define (tamanho-time t)
  (+ (conta-vaga (treinador-vaga1 t))
     (conta-vaga (treinador-vaga2 t))
     (conta-vaga (treinador-vaga3 t))
     (conta-vaga (treinador-vaga4 t))
     (conta-vaga (treinador-vaga5 t))
     (conta-vaga (treinador-vaga6 t))))

;; Testes
(check-expect (tamanho-time TREINADOR1) 1)
(check-expect (tamanho-time TREINADOR3) 6)
(check-expect (tamanho-time TREINADORVAZIO) 0)

;##########################################################################
;### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3    #####
;##########################################################################
;==========================================================================
;Construa uma função tem-vaga? que, dado um treinador, verifica se ele tem vaga no time para capturar um novo Pokémon, ou seja, caso algum de seus espaços de time seja 'vazio, devolve verdadeiro, caso contrário, gera um resultado falso.
;==========================================================================

; ---------------------------------
; FUNÇÃO  tem-vaga?:Treinador->Booleano
; ---------------------------------
;; Obj:  dado um treinador, verifica se ele tem vaga no time para capturar um novo Pokémon, ou seja,
;;caso algum de seus espaços de time seja 'vazio, devolve verdadeiro, caso contrário, gera um resultado falso.
;; Exemplos:
;       (tem-vaga Treinador1) = true
;       (tem-vaga Treinador3) = false

(define (tem-vaga? treinador)
  (cond
  [(< (tamanho-time treinador) 6)true]
  [else false]))

;; Testes
(check-expect (tem-vaga? TREINADOR1) true)   
(check-expect (tem-vaga? TREINADOR3) false)
 
;##########################################################################
;### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4    #####
;##########################################################################
;==========================================================================
;Um treinador que começa sua jornada sem nenhum Pokémon no time pode receber um Pokémon de presente. Construa uma função recebe-pokemon que, dado um elemento do tipo Treinador e um elemento do tipo Pokemon, cria um elemento do tipo PokemonCapturado e o adiciona na primeira vaga com 'vazio do treinador, desde que todas as vagas atuais do time do treinador contenham 'vazio. Se existir vaga com um PokemonCapturado, a função recebe-pokemon deverá retornar o treinador sem modificações.
;==========================================================================

; ---------------------------------
; FUNÇÃO  recebe-pokemon: Treinador Pokemon -> Treinador
; ---------------------------------
;; Obj:dado um treinador e um Pokémon. Se todas as vagas do time do treinador
;; estiverem vazias, cria um PokemonCapturado a partir do Pokémon dado e o adiciona na primeira vaga do treinador.
;; Se houver algum PokémonCapturado nas vagas, a função retorna o treinador sem modificações.
;;
;; Exemplos:
;; (recebe-pokemon TREINADOR4 POKEMON1)= (make-treinador "Nathan" 21  (make-pokemoncapturado POKEMON1 "Bulbasaur" 1 100 90 VAZIO VAZIO VAZIO VAZIO VAZIO))
;; (recebe-pokemon TREINADOR1 POKEMON2)= TREINADOR1
 
(define (recebe-pokemon treinador pokemon)
  (cond
    [(= 0 (tamanho-time treinador))
     (make-treinador 
      (treinador-nome treinador)
      (treinador-idade treinador)
      (make-pokemoncapturado pokemon 
                            (pokemon-especie pokemon) 
                            1 
                            100 
                            100)
      VAZIO
      VAZIO
      VAZIO
      VAZIO
      VAZIO)]
    [else treinador]))

;; Testes recebe-pokemon
(check-expect (recebe-pokemon TREINADOR4 POKEMON1)
              (make-treinador "Nathan" 21 
                             (make-pokemoncapturado POKEMON1 "Bulbasaur" 1 100 100)
                             VAZIO VAZIO VAZIO VAZIO VAZIO))
(check-expect (recebe-pokemon TREINADOR1 POKEMON2) TREINADOR1)
(check-expect (recebe-pokemon TREINADOR3 POKEMON1) TREINADOR3)

;##########################################################################
;### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5    #####
;##########################################################################
;==========================================================================
;Um treinador que já tem PokémonCapturado no time pode capturar novos Pokémon se tiver vagas livres no time. Construa uma função captura-pokemon que, dado um elemento do tipo Treinador e um elemento do tipo Pokemon, cria um elemento do tipo PokemonCapturado e o adiciona na primeira vaga com 'vazio do treinador, desde que exista pelo menos uma vaga com PokemonCapturado e exista uma vaga com 'vazio. Se não existir vaga com 'vazio, ou se todas as vagas tiverem 'vazio, a função captura-pokemon deverá retornar o treinador sem modificações.
;==========================================================================
; ---------------------------------
; FUNÇÃO captura-pokemon: Treinador Pokemon -> Treinador
; ---------------------------------
;; Objetivo: Dado um treinador e um pokemon, cria um PokemonCapturado e o adiciona na primeira
;; vaga vazia do treinador, desde que exista pelo menos uma vaga com Pokemon e uma vaga vazia.
;; Se não houver vaga vazia ou se todas estiverem vazias, retorna o treinador sem modificações.
;; Exemplos:
;; (captura-pokemon TREINADOR1 POKEMON2) -> Treinador com POKEMON2 na vaga2
;; (captura-pokemon TREINADOR3 POKEMON1) -> TREINADOR3 (sem modificações, time cheio)
;; (captura-pokemon TREINADORVAZIO POKEMON1) -> TREINADORVAZIO (sem modificações, todas vazias)

(define (captura-pokemon t p)
  (cond
    [(= (tamanho-time t) 0) t]  ; todas vazias
    [(= (tamanho-time t) 6) t]  ; time cheio
    [(symbol? (treinador-vaga1 t))
     (make-treinador (treinador-nome t)
                     (treinador-idade t)
                     (make-pokemoncapturado p "Pokemon Capturado" 1 100 100)
                     (treinador-vaga2 t)
                     (treinador-vaga3 t)
                     (treinador-vaga4 t)
                     (treinador-vaga5 t)
                     (treinador-vaga6 t))]
    [(symbol? (treinador-vaga2 t))
     (make-treinador (treinador-nome t)
                     (treinador-idade t)
                     (treinador-vaga1 t)
                     (make-pokemoncapturado p "Pokemon Capturado" 1 100 100)
                     (treinador-vaga3 t)
                     (treinador-vaga4 t)
                     (treinador-vaga5 t)
                     (treinador-vaga6 t))]
    [(symbol? (treinador-vaga3 t))
     (make-treinador (treinador-nome t)
                     (treinador-idade t)
                     (treinador-vaga1 t)
                     (treinador-vaga2 t)
                     (make-pokemoncapturado p "Pokemon Capturado" 1 100 100)
                     (treinador-vaga4 t)
                     (treinador-vaga5 t)
                     (treinador-vaga6 t))]
    [(symbol? (treinador-vaga4 t))
     (make-treinador (treinador-nome t)
                     (treinador-idade t)
                     (treinador-vaga1 t)
                     (treinador-vaga2 t)
                     (treinador-vaga3 t)
                     (make-pokemoncapturado p "Pokemon Capturado" 1 100 100)
                     (treinador-vaga5 t)
                     (treinador-vaga6 t))]
    [(symbol? (treinador-vaga5 t))
     (make-treinador (treinador-nome t)
                     (treinador-idade t)
                     (treinador-vaga1 t)
                     (treinador-vaga2 t)
                     (treinador-vaga3 t)
                     (treinador-vaga4 t)
                     (make-pokemoncapturado p "Pokemon Capturado" 1 100 100)
                     (treinador-vaga6 t))]
    [(symbol? (treinador-vaga6 t))
     (make-treinador (treinador-nome t)
                     (treinador-idade t)
                     (treinador-vaga1 t)
                     (treinador-vaga2 t)
                     (treinador-vaga3 t)
                     (treinador-vaga4 t)
                     (treinador-vaga5 t)
                     (make-pokemoncapturado p "Pokemon Capturado" 1 100 100))]
    [else t]))

;; Testes
(check-expect (captura-pokemon TREINADORVAZIO POKEMON1) TREINADORVAZIO)
(check-expect (captura-pokemon TREINADORCHEIO POKEMON1) TREINADORCHEIO)
(check-expect (tamanho-time (captura-pokemon TREINADOR1 POKEMON2)) 2)

;##########################################################################
;### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6  m #####
;##########################################################################

;; --------------------------
; FUNÇÃO-AUX verifica-nome: PokemonCapturadoOuSymbol String -> Boolean
; --------------------------
;; cura-vaga: PokemonCapturadoOuSymbol -> PokemonCapturadoOuSymbol
;;obj: Recebe uma vaga e um nome, retorna true se a vaga contém um Pokémon com esse nome
;;exemplos:
; (verifica-nome VAZIO "Pokemon 1") false)
; (verifica-nome CAPTURADO1 "Pokemon 1") true)
 
(define (verifica-nome pcs nome)
  (cond
    [(symbol? pcs) false]
    [else (string=? (pokemoncapturado-nome pcs) nome)]))

;; Testes verifica-nome
(check-expect (verifica-nome VAZIO "Pokemon 1") false)
(check-expect (verifica-nome CAPTURADO1 "Pokemon 1") true)
(check-expect (verifica-nome CAPTURADO2 "Pokemon 1") false)


;==========================================================================
;Construa uma função libera-pokemon que, dado um elemento do tipo Treinador e uma String, remove do time do treinador o PokemonCapturado com nome igual ao da string de entrada, colocando no lugar da vaga a string 'vazio. Se não existir vaga com PokemonCapturado com nome igual ao da string de entrada, a função libera-pokemon deverá retornar o treinador sem modificações.
;==========================================================================

; ---------------------------------
; FUNÇÃO libera-pokemon: Treinador String -> Treinador
; ---------------------------------
;; Objetivo: Dado um treinador e uma string, remove do time o PokemonCapturado com nome igual à string,
;; colocando VAZIO em seu lugar. Se não existir pokemon com o nome dado, retorna o treinador sem modificações.
;; Exemplos:
;; (libera-pokemon TREINADOR1 "Pokemon 4") -> Treinador sem CAPTURADO4
;; (libera-pokemon TREINADOR1 "Não Existe") -> TREINADOR1 (sem modificações)

(define (libera-pokemon t nome)
  (cond
    [(verifica-nome (treinador-vaga1 t) nome)
     (make-treinador (treinador-nome t)
                     (treinador-idade t)
                     VAZIO
                     (treinador-vaga2 t)
                     (treinador-vaga3 t)
                     (treinador-vaga4 t)
                     (treinador-vaga5 t)
                     (treinador-vaga6 t))]
    [(verifica-nome (treinador-vaga2 t) nome)
     (make-treinador (treinador-nome t)
                     (treinador-idade t)
                     (treinador-vaga1 t)
                     VAZIO
                     (treinador-vaga3 t)
                     (treinador-vaga4 t)
                     (treinador-vaga5 t)
                     (treinador-vaga6 t))]
    [(verifica-nome (treinador-vaga3 t) nome)
     (make-treinador (treinador-nome t)
                     (treinador-idade t)
                     (treinador-vaga1 t)
                     (treinador-vaga2 t)
                     VAZIO
                     (treinador-vaga4 t)
                     (treinador-vaga5 t)
                     (treinador-vaga6 t))]
    [(verifica-nome (treinador-vaga4 t) nome)
     (make-treinador (treinador-nome t)
                     (treinador-idade t)
                     (treinador-vaga1 t)
                     (treinador-vaga2 t)
                     (treinador-vaga3 t)
                     VAZIO
                     (treinador-vaga5 t)
                     (treinador-vaga6 t))]
    [(verifica-nome (treinador-vaga5 t) nome)
     (make-treinador (treinador-nome t)
                     (treinador-idade t)
                     (treinador-vaga1 t)
                     (treinador-vaga2 t)
                     (treinador-vaga3 t)
                     (treinador-vaga4 t)
                     VAZIO
                     (treinador-vaga6 t))]
    [(verifica-nome (treinador-vaga6 t) nome)
     (make-treinador (treinador-nome t)
                     (treinador-idade t)
                     (treinador-vaga1 t)
                     (treinador-vaga2 t)
                     (treinador-vaga3 t)
                     (treinador-vaga4 t)
                     (treinador-vaga5 t)
                     VAZIO)]
    [else t]))

;; Testes libera-pokemon
(check-expect (libera-pokemon TREINADOR4 "Pokemon 1") TREINADOR4)
(check-expect (libera-pokemon TREINADOR1 "Pokemon 4")
              (make-treinador "Thiago" 12 VAZIO VAZIO VAZIO VAZIO VAZIO VAZIO))
(check-expect (tamanho-time (libera-pokemon TREINADOR1 "Pokemon 4")) 0)

;##########################################################################
;### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7    #####
;##########################################################################
;==========================================================================
;Quando se visita um Centro Pokémon, é possível curar os danos sofridos pelos Pokémon Capturados no time de um Treinador. Defina abaixo duas funções, a função cura-pokemoncapturado, que recebe um elemento do tipo PokemonCapturado e restora seu HP atual para ser igual ao seu HP máximo, e a função cura-time, que recebe de entrada um elemento do tipo Treinador e restora o HP atual de todos os PokemonCapturado nas vagas de seu time para serem iguais aos seus HPs máximos.
;==========================================================================
; ---------------------------------
; FUNÇÃO cura-pokemoncapturado: PokemonCapturado -> PokemonCapturado
; ---------------------------------
;; Objetivo: Dado um PokemonCapturado, restaura seu HP atual para igual ao HP máximo
;; Exemplos:
;; (cura-pokemoncapturado CAPTURADO1)= 100
;;(cura-pokemoncapturado CAPTURADO2)= (make-pokemoncapturado POKEMON2 "Pokemon 2" 2 100 100))
 
(define (cura-pokemoncapturado pc)
  (make-pokemoncapturado 
   (pokemoncapturado-pokemon pc)
   (pokemoncapturado-nome pc)
   (pokemoncapturado-nivel pc)
   (pokemoncapturado-hpmaximo pc)
   (pokemoncapturado-hpmaximo pc)))

;; Testes cura-pokemoncapturado
(check-expect (pokemoncapturado-hpatual 
               (cura-pokemoncapturado CAPTURADO1)) 100)
(check-expect (cura-pokemoncapturado CAPTURADO1)
              (make-pokemoncapturado POKEMON1 "Pokemon 1" 1 100 100))
(check-expect (cura-pokemoncapturado CAPTURADO2)
              (make-pokemoncapturado POKEMON2 "Pokemon 2" 2 100 100))

;; --------------------------
; FUNÇÃO-AUX cura-vaga: PokemonCapturadoOuSymbol -> PokemonCapturadoOuSymbol
; --------------------------
;; cura-vaga: PokemonCapturadoOuSymbol -> PokemonCapturadoOuSymbol
;;obj: Recebe uma vaga e cura o Pokémon se houver um
;;exemplos:
; (cura-vaga VAZIO)=VAZIO)
 
;;(cura-vaga CAPTURADO1)=(make-pokemoncapturado POKEMON1 "Pokemon 1" 1 100 10
(define (cura-vaga vaga)
  (cond
    [(symbol? vaga) vaga]
    [else (cura-pokemoncapturado vaga)]))

;; Testes cura-vaga
(check-expect (cura-vaga VAZIO) VAZIO)
(check-expect (cura-vaga CAPTURADO1) 
              (make-pokemoncapturado POKEMON1 "Pokemon 1" 1 100 100))
(check-expect (cura-vaga CAPTURADO2)
              (make-pokemoncapturado POKEMON2 "Pokemon 2" 2 100 100))
; ---------------------------------
; FUNÇÃO cura-time: Treinador -> Treinador
; ---------------------------------
;; Objetivo: Dado um Treinador, restaura o HP atual de todos os Pokemon do time para seus HPs máximos
;; Exemplos:
;; (cura-time TREINADOR4) TREINADOR4)
;;(cura-time TREINADOR1)
  ;;            (make-treinador "Thiago" 12 
      ;;                       (cura-pokemoncapturado CAPTURADO4)
        ;;                     VAZIO VAZIO VAZIO VAZIO VAZIO))


(define (cura-time t)
  (make-treinador
   (treinador-nome t)
   (treinador-idade t)
   (cura-vaga (treinador-vaga1 t))
   (cura-vaga (treinador-vaga2 t))
   (cura-vaga (treinador-vaga3 t))
   (cura-vaga (treinador-vaga4 t))
   (cura-vaga (treinador-vaga5 t))
   (cura-vaga (treinador-vaga6 t))))

;; Testes cura-time
(check-expect (cura-time TREINADOR4) TREINADOR4)
  
(check-expect (cura-time TREINADOR1)
              (make-treinador "Thiago" 12 
                             (cura-pokemoncapturado CAPTURADO4)
                             VAZIO VAZIO VAZIO VAZIO VAZIO))

;##########################################################################
;### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8    #####
;##########################################################################
;==========================================================================
;Desenvolva uma função desenha-time, que recebe de entrada um elemento do tipo Treinador e desenha na tela um resumo do seu time, aparecendo todos os PokémonCapturados do time do treinador. Você pode definir a maneira que achar melhor para representar os pokémon na tela, mas todos devem ser desenhados e as suas informações devem aparecer (nome, espécie, tipo1, tipo2, espécie, nível, etc.).
;DICA: você pode reaproveitar partes do seu código do PROJETO 1.
;==========================================================================

; ---------------------------------
; FUNÇÃO  desenha-time:
; ---------------------------------



 
