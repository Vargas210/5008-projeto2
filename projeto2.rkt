#lang racket

(define VAZIO 'vazio)

(define-struct pokemon [especie tipo1 tipo2])

(define POKEMON1 (make-pokemon "Bulbasaur" "Grass" "Poison"))
(define POKEMON2 (make-pokemon "Charmander" "Fire" VAZIO))
(define POKEMON3 (make-pokemon "Squirtle" "Water" VAZIO))
(define POKEMON4 (make-pokemon "Machop" "Fighting" VAZIO))

(define-struct pokemoncapturado [pokemon nome nivel hpmaximo hpatual])

(define CAPTURADO1 (make-pokemoncapturado POKEMON1 "Pokemon 1" 1 100 90))
(define CAPTURADO2 (make-pokemoncapturado POKEMON2 "Pokemon 2" 2 100 90))
(define CAPTURADO3 (make-pokemoncapturado POKEMON3 "Pokemon 3" 3 100 90))
(define CAPTURADO4 (make-pokemoncapturado POKEMON4 "Pokemon 4" 4 100 90))

(define-struct treinador [nome idade pokebag])

(define TREINADOR1
  (make-treinador "Treinador 1"
                  18
                  (list VAZIO VAZIO VAZIO CAPTURADO4 CAPTURADO2 CAPTURADO1)))

(define TREINADOR2
  (make-treinador "Treinador 2" 
                  19 
                  (list VAZIO VAZIO VAZIO VAZIO CAPTURADO3 CAPTURADO1)))

(define TREINADOR3 
  (make-treinador "Treinador 3" 
                  20 
                  (list VAZIO VAZIO VAZIO VAZIO VAZIO CAPTURADO4)))

(define TREINADOR4
  (make-treinador "Treinador 4"
                  21
                  (list CAPTURADO4 CAPTURADO2 VAZIO VAZIO CAPTURADO3 CAPTURADO1)))


(define [conta-capturado pokebag]
  (if (empty? pokebag)
    0
    (let ([f (first pokebag)]
          [r (rest pokebag)])
      (cond
        [(pokemoncapturado? f) (add1 (conta-capturado r))]
        [else (conta-capturado r)]))))


(define (tamanho-time treinador)
  (conta-capturado (treinador-pokebag treinador)))

(define (tem-vaga treinador)
  (< (tamanho-time treinador) 6))

(define (recebe-pokemon treinador pokemon)
  (cond
    [(> (tamanho-time treinador) 0) treinador]
    [else
      (make-treinador (treinador-nome treinador)
                      (treinador-idade treinador)
                      (cons (make-pokemoncapturado pokemon "Brindemon" 1 100 100)
                            (make-list 5 VAZIO)))]))

(define TREINADOR6 (recebe-pokemon TREINADOR5 (make-pokemon "Brindemon" "Grass" VAZIO)))

(define (adiciona-pokemon pokebag pokemon)
  (if (empty? pokebag)
    (list)
    (let ([f (first pokebag)]
          [r (rest pokebag)])
      (cond
        [(empty? pokebag) (list)]
        [(eq? VAZIO f) (append (list (make-pokemoncapturado pokemon "Capturamon" 1 100 100)) r)]
        [else (append (list f) (adiciona-pokemon r pokemon))]))))

(define (captura-pokemon treinador pokemon)
  (cond
    [(and (> (tamanho-time treinador) 0) (< (tamanho-time treinador) 6))
     (make-treinador (treinador-nome treinador)
                     (treinador-idade treinador)
                     (adiciona-pokemon (treinador-pokebag treinador) pokemon))]
    [else treinador]))

(define (acha-e-deleta pokebag nome)
  (if (empty? pokebag)
    '()
    (let ([f (first pokebag)]
          [r (rest pokebag)])
      (cond
        [(empty? pokebag) '()]
        [(or (eq? VAZIO f) (not (eq? nome (pokemoncapturado-nome f))))
         (append '(f) (acha-e-deleta r nome))]
        [else (append '(VAZIO) (acha-e-deleta r nome))]))))

(define (libera-pokemon treinador nome)
  (make-treinador (treinador-nome treinador)
                  (treinador-idade treinador)
                  (acha-e-deleta (treinador-pokebag treinador) nome)))

(define [cura-pokemon pokemoncapturado]
  (if (eq? VAZIO pokemoncapturado)
    VAZIO
    (make-pokemoncapturado (pokemoncapturado-pokemon pokemoncapturado)
                           (pokemoncapturado-nome pokemoncapturado)
                           (pokemoncapturado-nivel pokemoncapturado)
                           (pokemoncapturado-hpmaximo pokemoncapturado)
                           (pokemoncapturado-hpmaximo pokemoncapturado))))

(define [cura-time treinador]
  (make-treinador (treinador-nome treinador)
                  (treinador-idade treinador)
                  (map cura-pokemon (treinador-pokebag treinador))))
