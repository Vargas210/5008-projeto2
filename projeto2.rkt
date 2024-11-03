#lang racket

(define VAZIO 'vazio)
(define CARTA_ALT 225)
(define CARTA_LAR 175)

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
(define CAPTURADO5 (make-pokemoncapturado POKEMON1 "Pokemon 5" 5 100 90))
(define CAPTURADO6 (make-pokemoncapturado POKEMON2 "Pokemon 6" 6 100 90))

(define-struct treinador [nome idade vaga1 vaga2 vaga3 vaga4 vaga5 vaga6])

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

(define TREINADORCOM1
  (make-treinador "Treinador Com 1 Pokemon" 20 CAPTURADO4 VAZIO VAZIO VAZIO VAZIO VAZIO))

(define TREINADORCOM3
  (make-treinador "Treinador Com 3 Pokemons" 21 CAPTURADO4 CAPTURADO2 VAZIO VAZIO VAZIO CAPTURADO1))

(define (tamanho-time treinador)
  (length (filter pokemoncapturado?
                  (list (treinador-vaga1 treinador)
                        (treinador-vaga2 treinador)
                        (treinador-vaga3 treinador)
                        (treinador-vaga4 treinador)
                        (treinador-vaga5 treinador)
                        (treinador-vaga6 treinador)))))

(define (tem-vaga? treinador)
  (< (tamanho-time treinador) 6))

(define (vazio? x)
  (eq? x VAZIO))

(define (recebe-pokemon treinador pokemon)
  (cond
    [(= 0 (tamanho-time treinador))
     (make-treinador (treinador-nome treinador)
                     (treinador-idade treinador)
                     (make-pokemoncapturado pokemon "Pokemon Recebido" 1 100 100)
                     (treinador-vaga2 treinador)
                     (treinador-vaga3 treinador)
                     (treinador-vaga4 treinador)
                     (treinador-vaga5 treinador)
                     (treinador-vaga6 treinador))]
    [else treinador]))

(define (captura-pokemon treinador pokemon)
  (cond
    [(and (tem-vaga? treinador) (> (tamanho-time treinador) 0))
     (let ([tn (treinador-nome treinador)]
           [ti (treinador-idade treinador)]
           [v1 (treinador-vaga1 treinador)]
           [v2 (treinador-vaga2 treinador)]
           [v3 (treinador-vaga3 treinador)]
           [v4 (treinador-vaga4 treinador)]
           [v5 (treinador-vaga5 treinador)]
           [v6 (treinador-vaga6 treinador)]
           [pk (make-pokemoncapturado pokemon "Pokemon Capturado" 1 100 100)])
       (cond
         [(vazio? v1) (make-treinador tn ti pk v2 v3 v4 v5 v6)]
         [(vazio? v2) (make-treinador tn ti v1 pk v3 v4 v5 v6)]
         [(vazio? v3) (make-treinador tn ti v1 v2 pk v4 v5 v6)]
         [(vazio? v4) (make-treinador tn ti v1 v2 v3 pk v5 v6)]
         [(vazio? v5) (make-treinador tn ti v1 v2 v3 v4 pk v6)]
         [(vazio? v6) (make-treinador tn ti v1 v2 v3 v4 v5 pk)]))]
    [else treinador]))

(define (cura-pokemoncapturado pokemoncapturado)
  (make-pokemoncapturado (pokemoncapturado-pokemon pokemoncapturado)
                         (pokemoncapturado-nome pokemoncapturado)
                         (pokemoncapturado-nivel pokemoncapturado)
                         (pokemoncapturado-hpmaximo pokemoncapturado)
                         (pokemoncapturado-hpmaximo pokemoncapturado)))

(define (cura-time treinador)
  (let ([tn (treinador-nome treinador)]
        [ti (treinador-nome treinador)]
        [v1 (treinador-vaga1 treinador)]
        [v2 (treinador-vaga2 treinador)]
        [v3 (treinador-vaga3 treinador)]
        [v4 (treinador-vaga4 treinador)]
        [v5 (treinador-vaga5 treinador)]
        [v6 (treinador-vaga6 treinador)]
        [cura (lambda (pk)
                (if (eq? pk VAZIO)
                    VAZIO
                    (cura-pokemoncapturado pk)))])
    (make-treinador tn ti (cura v1) (cura v2) (cura v3) (cura v4) (cura v5) (cura v6))))


(define (cor-do-tipo pokemoncapturado)
  (if (vazio? pokemoncapturado)
    "lightgray"
    (let ([tipo (pokemon-tipo1 (pokemoncapturado-pokemon pokemoncapturado))])
      (cond 
        [(eq? tipo "Normal") (make-color 170 170 153 255)]
        [(eq? tipo "Fire") (make-color 255 68 34 255)]
        [(eq? tipo "Fire") (make-color 51 153 255 255)]
        [(eq? tipo "Eletric") (make-color 255 204 51 255)]
        [(eq? tipo "Grass") (make-color 109 204 85 255)]
        [(eq? tipo "Ice") (make-color 102 204 255 255)]
        [(eq? tipo "Fighting") (make-color 187 85 68 255)]
        [(eq? tipo "Poison") (make-color 170 85 153 255)]
        [(eq? tipo "Ground") (make-color 221 187 85 255)]
        [(eq? tipo "Flying") (make-color 136 153 255 255)]
        [(eq? tipo "Psychic") (make-color 255 85 153 255)]
        [(eq? tipo "Bug") (make-color 170 187 34 255)]
        [(eq? tipo "Rock") (make-color 187 170 102 255)]
        [(eq? tipo "Ghost") (make-color 102 102 187 255)]
        [(eq? tipo "Dragon") (make-color 119 102 238 255)]
        [(eq? tipo "Dark") (make-color 119 85 68 255)]
        [(eq? tipo "Steel") (make-color 170 170 187 255)]
        [(eq? tipo "Fairy") (make-color 238 153 238 255)]
        [else "darkgray"]))))

(define (desenha-pokemon pokemoncapturado)
  (overlay 
   (rectangle (+ CARTA_LAR 1) (+ CARTA_ALT 1) "outline" "black")
   (rectangle CARTA_LAR CARTA_ALT "solid" (cor-do-tipo pokemoncapturado))))

(cor-do-tipo CAPTURADO1)
