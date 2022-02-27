:Class ReLU

    :Field Public output
    :Field Public input
    :Field Public dinput

    ∇ forward X
      :Access Public
      input←X
      output←0⌈X
    ∇


    ∇ backward ∆dinput
      :Access Public
      dinput←∆dinput×input>0
    ∇
    

    ∇ r←calculate X
      r←0⌈X
    ∇

:EndClass
