:Class Encoder

    ∇ r←oneHot column
      :Access Public
      unique_values←∪column
      r←unique_values[0]⍷⍪column
      :For i :In 1↓⍳⍴unique_values
          r,←uníque_values[i]⍷⍪column
      :EndFor
    ∇

:EndClass


