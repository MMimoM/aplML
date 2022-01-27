:Class Linear: ALayer 

    :Field Public weights
    :Field Public biases
    :Field Public output

    ∇ __init__(n_columns n_neurons)
      :Implements constructor
      :Access Public
      weights←getRandomWeights(n_columns n_neurons)
      biases←?n_neurons⍴0
      ⎕DF'Linear'
    ∇

    ∇ forward X
      :Access Public
      output←X+.×weights
      output+←(⍴output)⍴(×/⍴output)⍴biases
    ∇

:EndClass





