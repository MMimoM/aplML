:Class Linear

    :Field Public weights

    ∇ __init__(n_columns n_neurons)
      :Implements constructor
      :Access Public
      weights←(n_columns+1){(1÷(1000×⍺×⍵))×⍺ ⍵⍴(⍺×⍵)?(1000×⍺×⍵)}n_neurons
      ⎕DF'Linear'
    ∇

    ∇ output←forward X
      :Access Public
      X←1,X
      output←(X+.×weights)
    ∇

:EndClass

