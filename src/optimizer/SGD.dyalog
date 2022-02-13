:Class SGD

    :Field Public step_size
    :Field Public decay
    :Field Public weights
    :Field Public biases
    :Field Private iteration


    ∇ __init__(step_size∆ decay∆)
      :Implements constructor
      :Access Public
      step_size←step_size∆
      decay←decay∆
      iteration←1
      ⎕DF'SGD'
    ∇


    ∇ step layer
      :Access Public
      layer.weights+←-step_size×layer.dweights
      layer.biases+←-step_size×layer.dbiases
    ∇


    ∇ updateStepSize
      :Access Public
      :If decay>0
          step_size×←÷1+decay×iteration
          iteration+←1
      :EndIf
    ∇

:EndClass
