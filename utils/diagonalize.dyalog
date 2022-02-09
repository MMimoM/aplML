 diagonalize←{
     s←⍴⍵
     (s,s)⍴(,{(⍵,⍵)⍴1,(×/⍵)⍴0}s)\⍵
 }
