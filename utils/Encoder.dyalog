:Namespace Encoder
⍝A Namespace for Encoding Categorical Datacolumns

    ⍝ One-Hot-Encoding
    ∇ r←oneHot column
      r←{⍵∘.=∪⍵}
    ∇

:EndNamespace

