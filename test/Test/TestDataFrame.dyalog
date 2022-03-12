:Class TestDataFrame : ATest


    ∇ r←createDataFrame;x1;x2;x3;data
      :Access Public Shared
      x1←'x1'⎕NULL 1 4 ⎕NULL 7 5 ⎕NULL 3 3 ⎕NULL
      x2←'x2' 'hurz1' 'hurz2' 'hurz3'⎕NULL'hurz2' 'hurz2'⎕NULL'hurz1' 'hurz3'⎕NULL
      x3←'x3' 4 5.3 2 2.4 ⎕NULL 3.9 ⎕NULL 8 4 3.2
      data←⍪x1,⍪x2,⍪x3
      r←⎕NEW #.Utils.DataFrame data
    ∇


    ∇ test_where;expected;frame
      :Access Public Shared
      frame←createDataFrame
     
      ⍝ Die where-Methoden geben Zeilenindices zurueck.
     
      ⍝ Die Methoden sind so implemetiert, dass ⎕NULL ignoriert wird.
      ⍝ Beispiel: where_neq('x1' 3). ⎕NULL wird nicht als Wert ungleich 3 beruecksichtigt.
      ⍝ where_neq
      expected←1 2 4 5
      expected assertSame frame.where_neq('x1' 3)

     
      ⍝ where_eq
      expected←7 8
      expected assertSame frame.where_eq('x1' 3)
     
      ⍝ where_null
      expected←0 3 6 9
      expected assertSame frame.where_null'x1'
     
      ⍝ where_not_null
      expected←1 2 4 5 7 8
      expected assertSame frame.where_not_null'x1'
     
      ⍝ where_min
      expected←2,⍬
      expected assertSame frame.where_min'x3'
     
      ⍝ where_max
      expected←7,⍬
      expected assertSame frame.where_max'x3'
     
      ⍝ where_eqv
      expected←1 4 5
      expected assertSame frame.where_eqv('x2' 'hurz2')
     
      ⍝ where_neqv
      expected←0 2 3 6 7 8 9
      expected assertSame frame.where_neqv('x2' 'hurz2')
     
      ⍝ where_geq
      expected←0 2 3 5 8 9
      expected assertSame frame.where_geq('x3' 4)
     
      ⍝ where_g
      expected←2 3 5 9
      expected assertSame frame.where_g('x3' 4)
      
      ⍝ where_leq
      expected←0 1 7 8
      expected assertSame frame.where_leq('x3' 4)
     
      ⍝ where_l
      expected←1 7
      expected assertSame frame.where_l('x3' 4)
    ∇


:EndClass
