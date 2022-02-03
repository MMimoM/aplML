:Class Metrics    

    ∇ r←accuracy(ytrue ypred)
      :Access Public
      ypred←⌊0.5+ypred
      r←ytrue{(+/+/⍺=⍵)÷×/⍴⍺}ypred
    ∇
    
:EndClass






