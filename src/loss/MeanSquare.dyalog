:Class MeanSquare

    :Field Private m_dinput

    ∇ __init__
      :Implements constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      ⎕DF'MeanSquare'
    ∇


    ∇ {r}←calculate(ytrue ypred)
      :Access Public
      r←{(+/⍵*2)÷≢⍵}∊(ytrue-ypred)
    ∇


    ∇ {r}←backward(dinput∆ ytrue);shape
      :Access Public
      shape←⍴dinput∆
      m_dinput←(-2×((⍪ytrue)-dinput∆)÷shape[1])÷shape[0]
      r←m_dinput
    ∇

:EndClass
