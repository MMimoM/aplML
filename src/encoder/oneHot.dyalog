 oneHot←{
     ⍝⍵←column of a datamatrix
     column←⊃⍵
     ⍉⊃{⍵⍷column}¨∪column
 }
