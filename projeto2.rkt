#lang racket

(define-struct pokemon (especie tipo1 tipo2))

(define POKEMON1 (make-pokemon "Bulbasaur" "Grass" "Poison"))
(define POKEMON2 (make-pokemon "Charmander" "Fire" 'vazio))
(define POKEMON3 (make-pokemon "Squirtle" "Water" 'vazio))
(define POKEMON4 (make-pokemon "Machop" "Fighting" 'vazio))

(define-struct pokemoncapturado (pokemon nome nivel hpmaximo hpatual))

(define CAPTURADO1 (make-pokemoncapturado POKEMON1 "Pokemon 1" 1 100 90))
(define CAPTURADO2 (make-pokemoncapturado POKEMON2 "Pokemon 2" 2 100 90))
(define CAPTURADO3 (make-pokemoncapturado POKEMON3 "Pokemon 3" 3 100 90))
(define CAPTURADO4 (make-pokemoncapturado POKEMON4 "Pokemon 4" 4 100 90))

(define-struct treinador (nome idade vaga1 vaga2 vaga3 vaga4 vaga5 vaga6))

(define TREINADOR1 (make-treinador "Treinador 1" 18 POKEMON1 POKEMON2 'vazio 'vazio POKEMON4 'vazio))
(define TREINADOR2 (make-treinador "Treinador 2" 19 'vazio POKEMON2 'vazio 'vazio POKEMON4 'vazio))
(define TREINADOR3 (make-treinador "Treinador 3" 20 'vazio 'vazio 'vazio POKEMON3 POKEMON4 'vazio))
(define TREINADOR4 (make-treinador "Treinador 4" 21 'vazio 'vazio 'vazio 'vazio POKEMON4 'vazio))

(define (tamanho-time @treinador))
