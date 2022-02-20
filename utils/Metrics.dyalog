:Namespace Metrics

    ∇ r←accuracy(ytrue ypred);deviation
      :If 1=⍴⍴ypred
      :Orif 1∊⍴ypred
          deviation←#.Utils.Mathtools.∆std ytrue
          r←deviation÷⍨#.Utils.Mathtools.∆mean (ypred-ytrue) 
      :Else
          ypred←#.Utils.Mathtools.∆round ypred
          r←(+/ytrue=ypred)÷×/⍴ytrue
      :EndIf
    ∇

:EndNamespace


