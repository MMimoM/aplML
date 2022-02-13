:Class ELU

    :Field Public output←⍬
    :Field Public input←⍬
    :Field Public dinput←⍬

    ∇ forward X
      :Access Public
      input←X
      output←(X×X>0)-(1-*X)×X≤0
    ∇

    ∇ backward ∆dinput
      :Access Public
      dinput←∆dinput×((*input)*input≤0)
    ∇

:EndClass
