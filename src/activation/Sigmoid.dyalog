:Class Sigmoid

    :Field Private m_output

    ∇ __init__
      :Implements constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      ⎕DF'Sigmoid'
    ∇


    ∇ {r}←forward input∆
      :Access Public
      m_output←÷1+*-input∆
      r←m_output
    ∇


    ∇ {r}←backward dinput∆
      :Access Public
      r←dinput∆×({⍵×1-⍵}(÷1+*-m_output))
    ∇


    ∇ {r}←calculate input∆
      :Access Public
      r←÷1+*-input∆
    ∇

:EndClass
