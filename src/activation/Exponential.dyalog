:Class Exponential

    :Field Private m_input

    ∇ __init__
      :Implements constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      ⎕DF'Exponential'
    ∇


    ∇ {r}←forward input∆
      :Access Public
      m_input←input∆
      r←*input∆
    ∇


    ∇ {r}←backward dinput∆
      :Access Public
      r←dinput∆×(*m_input)
    ∇


    ∇ {r}←calculate input∆
      :Access Public
      r←*input∆
    ∇

:EndClass
