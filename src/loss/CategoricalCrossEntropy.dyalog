:Class CategoricalCrossEntropy    

    ∇ r←calculate(ytrue ypred)
      :Access Public
      r←ytrue{(+/-⍺×⍟⍵)÷↑⍴⍺}ypred
    ∇
    
:EndClass





