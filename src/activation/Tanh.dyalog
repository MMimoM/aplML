:Class Tanh

    :Field Public output←⍬
    :Field Public input←⍬
    :Field Public dinput←⍬

    ∇ forward X
      :Access Public
      input←X
      output←7○X
    ∇

    ∇ backward ∆dinput
      dinput←∆dinput×({(1+⍵)×1-⍵}(7○input))
    ∇

:EndClass
