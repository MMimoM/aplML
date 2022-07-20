:Class TestTextFrame : ATest


    ∇ r←createTextFrame;x1;x2;x3;x4;x5;x6;data
      :Access Public Shared
      x1←⊂'Die where-Methoden geben Zeilenindices zurueck.'
      x2←⊂'Die Methoden sind so implemetiert, dass ⎕NULL ignoriert wird.'
      x3←⊂'Beispiel: where_neq("x1" 3). ⎕NULL wird nicht als Wert ungleich 3 beruecksichtigt.'
      x4←⊂'./'
      x5←⊂' '
      x6←⊂'Beispiel: x3≥4 oder x3<4 -> x3. Ausgegeben werden aber alle Zeilen ≠ ⎕NULL'
      data←⊆x1,x2,x3,x4,x5,x6
      r←⎕NEW #.Utils.TextFrame data
    ∇


    ∇ test_word_dictionary;frame;expected;actual
      :Access Public Shared
      frame←createTextFrame
     
     
    ∇


:EndClass

