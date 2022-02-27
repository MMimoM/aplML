:Class Softmax

    :Field Public output
    :Field Public input
    :Field Public dinput

    ∇ forward X;exp_val
      :Access Public
      input←X
      exp_val←{*(⍵-⍉(⍴⍉⍵)⍴(×/⍴⍵)⍴⌈/⍵)}X
      output←{⍵÷(⍉(⍴⍉⍵)⍴(×/⍴⍵)⍴+/⍵)}exp_val
    ∇


    ∇ backward dinput∆
      :Access Public
      dinput←(⍴output)⍴dinput∆({((#.Utils.Mathtools.diagonalize ⍵)-⍵∘.×⍵)+.×(⍪⍺)}⍤1)output
    ∇


    ∇ r←calculate X;exp_val
      exp_val←{*(⍵-⍉(⍴⍉⍵)⍴(×/⍴⍵)⍴⌈/⍵)}X
      r←{⍵÷(⍉(⍴⍉⍵)⍴(×/⍴⍵)⍴+/⍵)}exp_val
    ∇


:EndClass
