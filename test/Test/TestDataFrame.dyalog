:Class TestDataFrame : ATest


    ∇ r←createDataFrame;x1;x2;x3;data
      :Access Public Shared
      x1←'x1'⎕NULL 1 4 ⎕NULL 7 5 ⎕NULL 3 3 ⎕NULL
      x2←'x2' 'hurz1' 'hurz2' 'hurz3'⎕NULL'hurz2' 'hurz2'⎕NULL'hurz1' 'hurz3'⎕NULL
      x3←'x3' 4 5.3 2 2.4 ⎕NULL 3.9 ⎕NULL 8 4 3.2
      data←⍪x1,⍪x2,⍪x3
      r←⎕NEW #.Utils.DataFrame data
    ∇


    ∇ test_get;frame;expected;actual
      :Access Public Shared
      frame←createDataFrame
      
      ⍝ get liefert die reinen Daten. Gibt also keinen DataFrame zurueck.
      ⍝ Fuer die Ausgabe eines DataFrames ist die Methode copy vorgesehen. 

      expected←⍪4 7 5
      actual←'x1'frame.get frame.where_geq('x1' 4)
      expected assertSame actual
      
      expected←⍪(4 7 5),⍪('hurz3' 'hurz2' 'hurz2')
      actual←('x1' 'x2')frame.get frame.where_geq('x1' 4)
      expected assertSame actual
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
      expected←0 1 7 8
      expected assertSame frame.where_geq('x3' 4)
     
      ⍝ where_g
      expected←1 7
      expected assertSame frame.where_g('x3' 4)
     
      ⍝ where_leq
      expected←0 2 3 5 8 9
      expected assertSame frame.where_leq('x3' 4)
     
      ⍝ where_l
      expected←2 3 5 9
      expected assertSame frame.where_l('x3' 4)
    ∇


    ∇ test_and_or;frame;expected;actual
      :Access Public Shared
      frame←createDataFrame
     
      ⍝ Die Methoden sind so implemetiert, dass ⎕NULL ignoriert wird.
      ⍝ Beispiel: x3≥4 oder x3<4 -> x3. Ausgegeben werden aber alle Zeilen ≠ ⎕NULL
     
      ⍝ and
      expected←2,⍬
      actual←(frame.where_neq'x1' 3)frame.and(frame.where_min'x3')
      expected assertSame actual
     
      ⍝ or
      expected←0 1 2 3 5 7 8 9
      actual←(frame.where_g'x3' 4)frame.or(frame.where_leq'x3' 4)
      expected assertSame actual
    ∇


    ∇ test_sort;frame;expected
      :Access Public Shared
      frame←createDataFrame
     
      ⍝ sort liefert die Zeilenindices angeordnet nach der sortierten Spalte.
      ⍝ ⎕NULL'en werden zuerst angeordnet.
     
      ⍝ sort Spalte x1
      expected←0 3 6 9 1 7 8 2 5 4
      expected assertSame frame.sort'x1'
     
      ⍝ sort Spalte x3
      expected←4 6 2 3 9 5 0 8 1 7
      expected assertSame frame.sort'x3'
    ∇


    ∇ test_statistics;frame;expected;actual
      :Access Public Shared
      frame←createDataFrame
     
      ⍝ Berechnung statistischer Groessen
      ⍝ ⎕NULL'en werden ignoriert
     
      ⍝mean
      expected←23÷6
      actual←frame.mean'x1'
      expected assertSame actual
     
      expected←4.1
      actual←frame.mean'x3'
      expected assertSame actual
     
      ⍝median
      expected←3.5
      actual←frame.median'x1'
      expected assertSame actual
     
      expected←(3.9+4)÷2
      actual←frame.median'x3'
      expected assertSame actual
    ∇


    ∇ test_set;frame;expected;actual
      :Access Public Shared
     
      ⍝ Die Methode set dient dazu, den Datensatz zu ueberschreiben.
      ⍝ col set(rows value) -> Die Werte der Zeilen >rows< der Datenspalte >col< werden mit dem Wert >value< ueberschrieben.
      ⍝ value ist entweder ein einzelner Wert oder hat die selbe Dimension des ausgewaehlten Blocks
     
      ⍝ value ist ein einzelner Wert
      frame←createDataFrame
      expected←frame.where_eqv'x2' 'hurz2'
      'x2'frame.set(frame.where_eqv'x2' 'hurz2')(⊂'hurz4')
      expected assertSame frame.where_eqv('x2' 'hurz4')
     
      frame←createDataFrame
      expected←⍬
      'x1'frame.set(frame.where_g'x1' 0)0
      expected assertSame frame.where_g('x1' 0)
     
     
      ⍝ value hat die selbe Dimension des ausgewaehlten Blocks
      frame←createDataFrame
      expected←frame.where_geq'x1' 4
      'x1'frame.set(frame.where_geq'x1' 4)(10 11 12)
      actual←(frame.where_eq'x1' 10)frame.or(frame.where_eq'x1' 11)frame.or(frame.where_eq'x1' 12)
      expected assertSame actual
    ∇


:EndClass
