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
      ⍝ 2
      ∆mean←{
          +/⍵÷≢⍵
      }
      
      ⍝ Standardabweichung
      ⍝     ∆std 1 4 4
      ⍝ 0
      ∆std←{
          mean←∆mean ⍵
          square←(⍵-mean)*2
          (∆mean square)*0.5
      }

      ⍝    ∆median 6 3 7 2
      ⍝ 4.5
      ∆median←{
          v←⍵[⍋⍵]
          p1←(2÷⍨≢⍵)
          p2←⌊p1
          p1≠p2:v[p2]
          p1=p2:2÷⍨+/v[(p2-1),p2]
      }

:EndNamespace
