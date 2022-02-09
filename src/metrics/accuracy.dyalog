 accuracy←{
     ypred←#.Utils.round⊃⍵[0]
     y_true←⊃⍵[1]
     (+/y_true=ypred)÷×/⍴y_true
 }
