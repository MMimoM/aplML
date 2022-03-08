:Class Sigmoid

    :Field Private m_input

    ∇ __init__
      :Implements constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      ⎕DF'Sigmoid'
    ∇


    ∇ {r}←forward input∆
      :Access Public
      m_input←input∆
      r←÷1+*-input∆
    ∇


    ∇ {r}←backward dinput∆
      :Access Public
      r←dinput∆×({⍵×1-⍵}(÷1+*-m_input))
    ∇


    ∇ {r}←calculate input∆
      :Access Public
      r←÷1+*-input∆
    ∇

:EndClass
