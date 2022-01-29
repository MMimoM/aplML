:Class Softmax

    :Field Public output

    ∇ forward X;exp_val
      :Access Public
      exp_val←*(X-⍉(⍴⍉X)⍴(×/⍴X)⍴⌈/X)
      output←exp_val÷(⍉(⍴⍉exp_val)⍴(×/⍴exp_val)⍴+/exp_val)
    ∇

:EndClass

