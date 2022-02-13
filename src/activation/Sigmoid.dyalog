:Class Sigmoid

    :Field Public output←⍬
    :Field Public input←⍬
    :Field Public dinput←⍬

    ∇ forward X
      :Access Public
      input←X
      output←÷1+*-X
    ∇

    ∇ backward ∆dinput
      :Access Public
      dinput←∆dinput×({⍵×1-⍵}(÷1+*-input))
    ∇

:EndClass

