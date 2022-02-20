:Namespace Mathtools

      ⍝ Negative Zahlen werden nach ihrem Betrag gerundet, bei einer 5 also weg von null (engl: Away from Zero)
      ⍝       ∆round 1.49 1.50 1.51 ¯1.49 ¯1.50 ¯1.51
      ⍝ 1 2 2 ¯1 ¯2 ¯2
      ∆round←{
          (×⍵)×⌊0.5+|⍵
      }

      ⍝ Runden mit Scale
      ⍝       10 ∆runden 1.649 1.650 1.651 ¯1.649 ¯1.650 ¯1.651
      ⍝ 1.6 1.7 1.7 ¯1.6 ¯1.7 ¯1.7
      ∆runden←{⍺←1
          ⍺÷⍨(×⍵)×⌊0.5+|⍺×⍵
      }

      ⍝       ∆diagonalize 1 7 3
      ⍝ 1 0 0
      ⍝ 0 7 0
      ⍝ 0 0 3
      ∆diagonalize←{
          s←≢⍵
          s s⍴⍵\⍨(s×s)⍴1,s⍴0
      }

      ⍝       ∆identityMatrix 3
      ⍝ 1 0 0
      ⍝ 0 1 0
      ⍝ 0 0 1
      ∆identityMatrix←{
          ⍵ ⍵⍴(⍵*2)⍴1,⍵⍴0
      }
      
      
      ⍝      ∆mean 1 2 3
      ⍝ (1+2+3)÷3=2
      ∆mean←{
          +/⍵÷⍴⍵
      }
      
      ⍝     ∆std 1 4 4
      ⍝ mean←2 ⋄ 1.5=0.5÷⍨(1-2)+(4-2)+(4-2)
      ∆std←{
         mean←∆mean ⍵
         square←(⍵-mean)*2
         (∆mean square)*0.5 
      }     

:EndNamespace

