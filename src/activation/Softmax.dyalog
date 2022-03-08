:Class Softmax

    :Field Private m_output

    ∇ __init__
      :Implements Constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      m_mathtools←#.Utils.Mathtools
      logger←#.Utils.Logger
      ⎕DF'Softmax'
    ∇


    ∇ {r}←forward input∆;exp_val
      :Access Public
      exp_val←{*(⍵-⍉(⍴⍉⍵)⍴(×/⍴⍵)⍴⌈/⍵)}input∆
      m_output←{⍵÷(⍉(⍴⍉⍵)⍴(×/⍴⍵)⍴+/⍵)}exp_val
      r←m_output
    ∇


    ∇ {r}←backward dinput∆
      :Access Public
      r←(⍴m_output)⍴dinput∆({((m_mathtools.diagonalize ⍵)-⍵∘.×⍵)+.×(⍪⍺)}⍤1)m_output
    ∇


    ∇ {r}←calculate input∆;exp_val
      :Access Public
      exp_val←{*(⍵-⍉(⍴⍉⍵)⍴(×/⍴⍵)⍴⌈/⍵)}input∆
      r←{⍵÷(⍉(⍴⍉⍵)⍴(×/⍴⍵)⍴+/⍵)}exp_val
    ∇

:EndClass
