:Class Tanh

    :Field Private m_input

    ∇ __init__
      :Implements constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      ⎕DF'Tanh'
    ∇


    ∇ {r}←forward input∆
      :Access Public
      m_input←input∆
      r←7○input∆
    ∇


    ∇ {r}←backward ∆dinput
      :Access Public
      r←∆dinput×({(1+⍵)×1-⍵}(7○m_input))
    ∇


    ∇ {r}←calculate X
      :Access Public
      r←7○X
    ∇

:EndClass
