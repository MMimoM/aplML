:Class ELU

    :Field Private m_input

    ∇ __init__
      :Implements constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      ⎕DF'ELU'
    ∇


    ∇ {r}←forward input∆
      :Access Public
      m_input←input∆
      r←(input∆×input∆>0)-(1-*input∆)×input∆≤0
    ∇


    ∇ {r}←backward dinput∆
      :Access Public
      r←dinput∆×((*m_input)*m_input≤0)
    ∇


    ∇ {r}←calculate input∆
      :Access Public
      r←(input∆×input∆>0)-(1-*input∆)×input∆≤0
    ∇

:EndClass
