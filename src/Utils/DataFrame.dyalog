:Class DataFrame

    :Field Private m_colnames
    :Field Private m_ncol
    :Field Private m_nrow
    :Field Private m_shape
    :Field Private m_data
    :Field Private m_encoder
    :Field Private logger


    ∇ make data∆
      :Implements Constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      m_data←1↓data∆
      m_colnames←⊆data∆[0;]
      m_ncol←⍴⊆m_colnames
      m_nrow←≢m_data
      m_shape←⍴m_data
      m_encoder←#.Utils.Encoder
      logger←#.Utils.Logger
    ∇


    ∇ make2(data∆ colnames∆)
      :Implements Constructor
      :Access Public
      ⎕IO←0
      m_data←data∆
      m_colnames←⊆colnames∆
      m_ncol←⍴⊆colnames∆
      m_nrow←≢data∆
      m_shape←⍴data∆
      m_encoder←#.Utils.Encoder
    ∇


    ⍝ Spaltennamen des Dataframes
    :Property colnames
    :Access Public
        ∇ r←get
          r←m_colnames
        ∇
    :Endproperty


    ⍝ Anzahl Zeilen des Dataframes
    :Property nrow
    :Access Public
        ∇ r←get
          r←m_nrow
        ∇
    :Endproperty


    ⍝ Anzahl Spalten des Dataframes
    :Property ncol
    :Access Public
        ∇ r←get
          r←m_ncol
        ∇
    :Endproperty


    ⍝ Dimension des Dataframes
    :Property shape
    :Access Public
        ∇ r←get
          r←m_shape
        ∇
    :Endproperty


    ⍝ Liefert die Daten aus dem Dataframe mit den vorgegebenen Zeilen >>rows∆<< und Spalten >>cols∆<<
    ∇ {r}←{cols∆}get rows∆
      :Access Public
     
      :If 900⌶⍬
          cols∆←colnames
      :EndIf
     
      cols∆←__set_cindex__ cols∆
      r←m_data[rows∆;cols∆]
    ∇


    ⍝ Liefert eine Kopie des Dataframes mit den vorgegebenen Zeilen >>rows∆<< und Spalten >>cols∆<<
    ∇ {r}←{cols∆}copy rows∆
      :Access Public
     
      :If 900⌶⍬
          cols∆←colnames
      :EndIf
     
      cols∆←__set_cindex__ cols∆
      r←data.frame(m_colnames[cols∆],[0]m_data[rows∆;cols∆])
    ∇


    ⍝ Printed die vorgegebenen Zeilen >>rows∆<< und Spalten >>cols∆<<
    ∇ {cols∆}show rows∆
      :Access Public
     
      :If 900⌶⍬
          cols∆←colnames
      :EndIf
     
      cols∆←__set_cindex__ cols∆
      ⍕(m_colnames[cols∆],[0]m_data[rows∆;cols∆])
    ∇


    ⍝ Ueberschreibt die vorgegebenen Zeilen >>rows∆<< und Spalten >>cols∆<< mit den Werten >>values<<
    ∇ {cols∆}set(rows∆ values)
      :Access Public
     
      :If 900⌶⍬
          cols∆←colnames
      :EndIf
     
      cols∆←__set_cindex__ cols∆
      m_data[rows∆;cols∆]←values
    ∇


    ⍝ Printed die ersten >>nrows∆<< des Dataframes
    ∇ head nrows∆
      :Access Public
      ⍕(m_colnames,[0]m_data)[⍳(nrows∆+1);]
    ∇


    ⍝ Liefert den Spaltenindex zu gegebenem Spaltennamen
    ∇ r←cindex colnames∆
      :Access Public
      r←(∊m_colnames⍳(⊆colnames∆))~m_ncol
    ∇


    ⍝ Anhaengen weiterer Spalten mit den zugehoerigen Spaltenbezeichnungen
    ∇ cbind(columns∆ colnames∆)
      :Access Public
      m_data,←columns∆
      m_colnames,←colnames∆
    ∇

    ⍝ Anhaengen weiterer Zeilen
    ∇ rbind row
      :Access Public
      m_data,←[0]row
    ∇


    ⍝ Liefert die Unique-Eintraege der vorgegebenen Spalten.
    ∇ r←unique cols∆;column
      :Access Public
      cols∆←__set_cindex__ cols∆
      r←∪m_data[;cols∆]
    ∇


    ⍝ Liefert die Haufigkeitsverteilung der vorgegebenen Spalte
    ∇ r←frequency colname∆;col∆
      :Access Public
      col∆←__set_cindex__ colname∆
      r←{⍺,≢⍵}⌸m_data[;col∆]
    ∇


    ⍝ Pruefung auf Null-Werte in den vorgegebenen Spalten
    ∇ r←isNull cols∆
      :Access Public
      cols∆←cindex cols∆
      r←⎕NULL∊m_data[;cols∆]
    ∇


    ⍝ Liefert den Schnitt zweier Vektoren bestehend aus Zeilenindices
    ∇ {r}←rows1∆ and rows2∆
      :Access Public
      r←rows1∆∩rows2∆
    ∇


    ⍝ Liefert die Vereinigung zweier Vektoren bestehend aus Zeilenindices
    ∇ {r}←rows1∆ or rows2∆
      :Access Public
      r←rows1∆∪rows2∆
    ∇


    ⍝ Liefert die Zeilen deren >>Zahlen-Eintraege<< dem vorgegebenen Wert gleichen.
    ∇ r←where_eq(col∆ value∆)
      :Access Public
      r←__where__(col∆'='value∆)
    ∇


    ⍝ Liefert die Zeilen deren >>Zahlen-Eintraege<< dem vorgegebenen Wert gleichen.
    ∇ r←where_neq(col∆ value∆)
      :Access Public
      r←__where__(col∆'≠'value∆)
    ∇


    ⍝ Liefert die Zeilen deren >>String-Eintraege<< dem vorgegebenen String gleichen.
    ∇ r←where_eqv(col∆ value∆)
      :Access Public
      col∆←__set_cindex__ col∆
      r←⍸∊(⊂value∆)≡¨m_data[;col∆]
    ∇


    ⍝ Liefert die Zeilen deren >>String-Eintraege<< nicht dem vorgegebenen String gleichen.
    ∇ r←where_neqv(col∆ value∆)
      :Access Public
      col∆←__set_cindex__ col∆
      r←⍸~∊(⊂value∆)≡¨m_data[;col∆]
    ∇


    ⍝ Liefert die Zeilen deren >>Zahlen-Eintraege<< kleiner gleich dem vorgegebenen Wert sind.
    ∇ r←where_leq(col∆ value∆)
      :Access Public
      r←__where__(col∆'≤'value∆)
    ∇


    ⍝ Liefert die Zeilen deren >>Zahlen-Eintraege<< groesser gleich dem vorgegebenen Wert sind.
    ∇ r←where_geq(col∆ value∆)
      :Access Public
      r←__where__(col∆'≥'value∆)
    ∇


    ⍝ Liefert die Zeilen deren >>Zahlen-Eintraege<< kleiner dem vorgegebenen Wert sind.
    ∇ r←where_l(col∆ value∆)
      :Access Public
      r←__where__(col∆'<'value∆)
    ∇


    ⍝ Liefert die Zeilen deren >>Zahlen-Eintraege<< groesser dem vorgegebenen Wert sind.
    ∇ r←where_g(col∆ value∆)
      :Access Public
      r←__where__(col∆'>'value∆)
    ∇


    ⍝ Liefert die Zeilen deren >>Zahlen-Eintraege<< dem maximalen Wert in der Spalte gleichen.
    ∇ r←where_max col∆
      :Access Public
      r←__where__(col∆'⌈'⍬)
    ∇


    ⍝ Liefert die Zeilen deren >>Zahlen-Eintraege<< dem minimalen Wert in der Spalte gleichen.
    ∇ r←where_min col∆
      :Access Public
      r←__where__(col∆'⌊'⍬)
    ∇


    ∇ r←__where__(col∆ operator value∆);rows
      :Access Private
     
      :If ⍬≡value∆
          value∆←(⍎operator)/∊m_data[;col∆]
      :EndIf
     
      :If 1<≢operator
          logger.logError'Only one operator is allowed'
      :EndIf
     
      col∆←__set_cindex__ col∆
      :If ~__is_char__ value∆
          :If ~⎕NULL∊m_data[;col∆]
          :OrIf value∆≡⎕NULL
              r←⍸∊value∆(⍎operator)m_data[;col∆]
          :Else
              rows←where(col∆'≠'⎕NULL)
              r←⍸value∆(⍎operator)m_data[rows;col∆]
          :EndIf
      :ElseIf (⊂value∆)∊m_data[;col∆]
          r←⍸∊(⊂value∆)≡¨m_data[;col∆]
      :Else
          logger.logError'Attribute is Unknown'
      :EndIf
    ∇


    ∇ r←__is_char__ x
      :Access Private
     
      r←0∊{10|⎕DR ⍵}¨x
    ∇


    ∇ r←__is_boolean__ x
      r←11∊⎕DR x
    ∇


    ∇ r←__set_cindex__ cols∆
      :Access Private
     
      r←cols∆
      :If __is_char__ r
          r←cindex cols∆
      :EndIf
    ∇


:EndClass
