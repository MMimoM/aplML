:Namespace Metrics

    ∇ r←accuracy(y_true ypred)
      ypred←#.Utils.round ypred
      r←(+/y_true=ypred)÷×/⍴y_true
    ∇

:EndNamespace
