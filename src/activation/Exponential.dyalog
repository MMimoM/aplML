﻿:Class Exponential

    :Field Public output←⍬
    :Field Public input←⍬
    :Field Public dinput←⍬

    ∇ forward X
      :Access Public
      input←X
      output←*X
    ∇

    ∇ backward ∆dinput
      dinput←∆dinput×(*input)
    ∇

:EndClass