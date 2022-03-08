:Class SGD

    :Field Private m_step_size
    :Field Private m_decay
    :Field Private m_iteration


    ∇ __init__(step_size∆ decay∆)
      :Implements constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      m_step_size←step_size∆
      m_decay←decay∆
      m_iteration←1
      ⎕DF'SGD'
    ∇


    ∇ step layer
      :Access Public
      layer.weights+←-m_step_size×layer.dweights
      layer.biases+←-m_step_size×layer.dbiases
    ∇


    ∇ update
      :Access Public
      :If m_decay>0
          m_step_size×←÷1+decay×iteration
          m_iteration+←1
      :EndIf
    ∇

:EndClass
