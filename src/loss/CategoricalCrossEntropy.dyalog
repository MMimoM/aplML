:Class CategoricalCrossEntropy

    :Field Public dinput←⍬

    ∇ r←calculate(ypred ytrue)
      :Access Public
      r←ytrue{(+/-⍺×⍟⍵)÷↑⍴⍺}ypred
    ∇

    ∇ backward(dinput∆ ytrue);number_of_datapoints
      :Access Public
      number_of_datapoints←↑⍴dinput∆
      dinput←(-ytrue÷dinput∆)÷number_of_datapoints
    ∇

:EndClass
