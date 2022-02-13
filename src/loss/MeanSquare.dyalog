:Class MeanSquare    
    
    :Field Public dinput←⍬

    ∇ r←calculate(ytrue ypred)
      :Access Public
      r←{(+/⍵*2)÷≢⍵}(ytrue-ypred)
    ∇
    
    ∇ backward(dinput∆ ytrue);shape
      shape←⍴dinput∆
      dinput←(-2×(ytrue-dinput∆)÷shape[1])÷shape[0]
    ∇
    
:EndClass

