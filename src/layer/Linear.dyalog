:Class Linear: ALayer 

    :Field Public weights
    :Field Public biases
    :Field Public output
    :Field Public input
    
    :Field Public dweights
    :Field Public dbiases
    :Field Public dinput 
    

    ∇ __init__(n_columns n_neurons)
      :Implements constructor
      :Access Private
      weights←getRandomWeights(n_columns n_neurons)
      biases←?n_neurons⍴0
      ⎕DF'Linear'
    ∇ 
    

    ∇ forward X
      :Access Public
      input←X

      output←X+.×⍉weights
      output+←biases{⍺⍴⍨⍴⍵}output
    ∇
    

    ∇ backward ∆dinput
      dweights←(⍉input)+.×∆dinput
      dbiases = +/⍉∆dinput
      dinput = ∆dinput+.×⍉weights
    ∇
    
:EndClass


