:Class CategoricalCrossEntropy

    :Field Private m_dinput

    ∇ __init__
      :Implements constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      ⎕DF'CategoricalCrossEntropy'
    ∇


    ∇ {r}←calculate(ypred ytrue)
      :Access Public
      r←ytrue{(+/-⍺×⍟⍵)÷↑⍴⍺}ypred
    ∇


    ∇ {r}←backward(dinput∆ ytrue);number_of_datapoints
      :Access Public
      number_of_datapoints←≢dinput∆
      m_dinput←(-ytrue÷dinput∆)÷number_of_datapoints
      r←m_dinput
    ∇

:EndClass
