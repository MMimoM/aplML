:Class CategoricalCrossEntropy

    :Field Public dinput←⍬

    ∇ r←calculate(ytrue ypred)
      :Access Public
      r←ytrue{(+/-⍺×⍟⍵)÷↑⍴⍺}ypred
    ∇

    ∇ backward(dinput∆ ytrue);number_of_datapoints
      number_of_datapoints←↑⍴dinput∆
      dinput←(-ytrue÷dinput∆)÷number_of_datapoints
    ∇

:EndClass
