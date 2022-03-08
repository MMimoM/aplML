:Class ReLU

    :Field Private m_input

    ∇ __init__
      :Implements constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      ⎕DF'ReLU'
    ∇


    ∇ {r}←forward input∆
      :Access Public
      m_input←input∆
      r←0⌈input∆
    ∇


    ∇ {r}←backward dinput∆
      :Access Public
      r←dinput∆×m_input>0
    ∇


    ∇ {r}←calculate input∆
      :Access Public
      r←0⌈input∆
    ∇

:EndClass
