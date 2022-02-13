:Class LReLU

    :Field Public output←⍬
    :Field Public input←⍬
    :Field Public dinput←⍬

    ∇ forward X
      :Access Public
      input←X
      output←X×0.01*X≤0
    ∇

    ∇ backward ∆dinput
      :Access Public
      dinput←∆dinput×(0.01*input≤0)
    ∇

:EndClass
