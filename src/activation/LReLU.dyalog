:Class LReLU

    :Field Private m_input

    ∇ __init__
      :Implements constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      ⎕DF'LReLU'
    ∇
    

    ∇ {r}←forward input∆
      :Access Public
      m_input←input∆
      r←input∆×0.01*input∆≤0
    ∇


    ∇ {r}←backward ∆dinput
      :Access Public
      r←∆dinput×(0.01*m_input≤0)
    ∇


    ∇ {r}←calculate input∆
      :Access Public
      r←input∆×0.01*input∆≤0
    ∇

:EndClass
