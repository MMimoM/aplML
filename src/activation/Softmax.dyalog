:Class Softmax

    :Field Public output←⍬
    :Field Public input←⍬
    :Field Public dinput←⍬

    ∇ forward X;exp_val
      :Access Public
      input←X
      exp_val←{*(⍵-⍉(⍴⍉⍵)⍴(×/⍴⍵)⍴⌈/⍵)}X
      output←{⍵÷(⍉(⍴⍉⍵)⍴(×/⍴⍵)⍴+/⍵)}exp_val
    ∇

    
    ∇ backward dinput∆
      :Access Public
      ⍝ The following Code is a faster way to do:
      ⍝ (⍴output)⍴⊃{((#.Utils.diagonalize ⍵⌷output)-⍵⌷output∘.×⍵⌷output)+.×(⍪⍵⌷dinput∆)}¨⍳≢output
      dinput←(⍴output)⍴dinput∆({((#.Utils.Mathtools.diagonalize ⍵)-⍵∘.×⍵)+.×(⍪⍺)}⍤1)output
    ∇

:EndClass




