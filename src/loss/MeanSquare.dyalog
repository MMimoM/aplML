:Class MeanSquare    

    ∇ r←calculate(ytrue ypred)
      :Access Public
      r←{(+/⍵*2)÷≢⍵}(ytrue-ypred)
    ∇
    
:EndClass

