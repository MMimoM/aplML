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

    ∇ backward dinput;diagonalized_rows
      :Access Public
      jacobian_matrices←{(utils.diagonalize output[⍵;])-(output[⍵;]∘.×output[⍵;])}/⍳↑⍴output

    ∇

:EndClass

