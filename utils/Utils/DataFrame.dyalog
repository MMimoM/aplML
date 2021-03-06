:Class DataFrame

    :Field Private m_colnames
    :Field Private m_ncol
    :Field Private m_nrow
    :Field Private m_rows
    :Field Private m_shape
    :Field Private m_data
    :Field Private encoder
    :Field Private mathtools
    :Field Private logger


    ∇ make data∆
      :Implements Constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      m_data←1↓data∆
      m_colnames←⊆data∆[0;]
      m_ncol←⍴⊆m_colnames
      m_nrow←≢m_data
      m_rows←⍳m_nrow
      m_shape←⍴m_data
      encoder←#.Utils.Encoder
      mathtools←#.Utils.Mathtools
      logger←#.Utils.Logger
    ∇


    ∇ make2(data∆ colnames∆)
      :Implements Constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      :If ⍬≡colnames∆
          colnames∆←{'X',(⍕⍵)}¨⍳(1↓data∆)
      :EndIf
      m_data←data∆
      m_colnames←⊆colnames∆
      m_ncol←⍴⊆colnames∆
      m_nrow←≢data∆
      m_rows←⍳m_nrow
      m_shape←⍴data∆
      encoder←#.Utils.Encoder
      mathtools←#.Utils.Mathtools
      logger←#.Utils.Logger
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

    ⍝ Zeilen des Dataframes
    :Property rows
    :Access Public
        ∇ r←get
          r←m_rows
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
          cols∆←m_colnames
      :EndIf
     
      cols∆←__set_cindex__ cols∆
      r←m_data[rows∆;cols∆]
    ∇


    ⍝ Liefert eine Kopie des Dataframes mit den vorgegebenen Zeilen >>rows∆<< und Spalten >>cols∆<<
    ∇ {r}←{cols∆}copy rows∆
      :Access Public
     
      :If 900⌶⍬
          cols∆←m_colnames
      :EndIf
     
      cols∆←__set_cindex__ cols∆
      r←data.frame(m_colnames[cols∆],[0]m_data[rows∆;cols∆])
    ∇


    ⍝ Printed die vorgegebenen Zeilen >>rows∆<< und Spalten >>cols∆<<
    ∇ {cols∆}show rows∆
      :Access Public
     
      :If 900⌶⍬
          cols∆←m_colnames
      :EndIf
     
      cols∆←__set_cindex__ cols∆
      m_colnames[cols∆],[0]m_data[rows∆;cols∆]
    ∇


    ⍝ Ueberschreibt die vorgegebenen Zeilen >>rows∆<< und Spalten >>cols∆<< mit den Werten >>values<<
    ∇ {cols∆}set(rows∆ values)
      :Access Public
     
      :If 900⌶⍬
          cols∆←m_colnames
      :EndIf
     
      cols∆←__set_cindex__ cols∆
      m_data[rows∆;cols∆]←values
    ∇


    ⍝ Entfernt die vorgegebenen Zeilen >>rows∆<< aus den Daten
    ∇ rdrop rows∆;cols∆
      :Access Public
      cols∆←cindex m_colnames
     
      ⍝ Ueberschreibe die Daten
      m_data←m_data[m_rows~rows∆;cols∆]
     
      ⍝ Reduziere die Anzahl der Zeilen
      m_nrow←m_nrow-≢rows∆
     
      ⍝ Reset der Zeilenindizes
      m_rows←⍳m_nrow
     
      ⍝ Ueberschreibe die Dimension der Daten
      m_shape←⍴m_data
    ∇


    ⍝ Entfernt die vorgegebenen Spalten >>cols∆<< aus den Daten
    ∇ cdrop cols∆
      :Access Public
      cols∆←__set_cindex__ cols∆
     
      ⍝ Entferne die Spaltennamen
      m_colnames←m_colnames~m_colnames[cols∆]
     
      ⍝ Entferne die Spaltenindizes
      cols∆←(⍳≢m_colnames)~cols∆
     
      ⍝ Ueberschreibe Daten
      m_data←m_data[m_rows;cols∆]
     
      ⍝ Ueberschreibe die Anzahl Spalten
      m_ncol←≢m_colnames
     
      ⍝ Ueberschreibe die Dimension der Daten
      m_shape←⍴m_data
    ∇


    ⍝ Printed die ersten >>nrows∆<< des Dataframes
    ∇ head nrows∆
      :Access Public
      (m_colnames,[0]m_data)[⍳(nrows∆+1);]
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
      __update__ m_data m_colnames
    ∇

    ⍝ Anhaengen weiterer Zeilen
    ∇ rbind row
      :Access Public
      m_data,←[0]row
      __update__ m_data m_colnames
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
      r←{⍵[⍋⍵]}rows1∆∩rows2∆
    ∇


    ⍝ Liefert die Vereinigung zweier Vektoren bestehend aus Zeilenindices
    ∇ {r}←rows1∆ or rows2∆
      :Access Public
      r←{⍵[⍋⍵]}rows1∆∪rows2∆
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


    ⍝ Liefert die Zeilen deren >>Eintraege<< nicht Null sind.
    ∇ r←where_not_null col∆
      :Access Public
      r←__where__(col∆'≠'⎕NULL)
    ∇


    ⍝ Liefert die Zeilen deren >>Eintraege<< Null sind.
    ∇ r←where_null col∆
      :Access Public
      r←__where__(col∆'='⎕NULL)
    ∇

    ⍝ Liefert die Zeilen der sortierten Spalte
    ∇ r←sort col∆
      :Access Public
      col∆←__set_cindex__ col∆
      r←⍋m_data[;col∆]
    ∇


    ⍝ Liefert den Mittelwert der Spalte >>col∆<<. >>Null-Eintraege<< werden ignoriert.
    ∇ r←mean col∆;rows
      :Access Public
      col∆←__set_cindex__ col∆
      rows←where_not_null col∆
      r←mathtools.∆mean∊m_data[rows;col∆]
    ∇


    ⍝ Liefert den Median der Spalte >>col∆<<. >>Null-Eintraege<< werden ignoriert.
    ∇ r←median col∆;rows
      :Access Public
      col∆←__set_cindex__ col∆
      rows←where_not_null col∆
      r←mathtools.∆median∊m_data[rows;col∆]
    ∇


    ∇ r←__where__(col∆ operator value∆);rows
      :Access Private
      col∆←__set_cindex__ col∆
     
      ⍝ Suche nach Minimum oder Maximum
      :If ⍬≡value∆
          :If ~⎕NULL∊m_data[;col∆]
              value∆←(⍎operator)/∊m_data[;col∆]
          :Else
              rows←__where__(col∆'≠'⎕NULL)
              value∆←(⍎operator)/∊m_data[rows;col∆]
              r←(∊value∆⍷m_data[rows;col∆])/rows
              :Return
          :EndIf
      :EndIf
     
      ⍝ In diesem Block werden die Zeilenindices ermittelt durch Anwendung des Operators welcher im Argument uebergeben wurde.
      :If ~⎕NULL∊m_data[;col∆]
      :OrIf value∆≡⎕NULL
          r←⍸∊m_data[;col∆](⍎operator)value∆
      :Else
          ⍝ Der Operator wird nur auf die Zeilen angewendet welche nicht ⎕NULL sind. ⎕NULL'en werden somit prinzipiell ignoriert.
          rows←__where__(col∆'≠'⎕NULL)
          r←(∊m_data[rows;col∆](⍎operator)value∆)/rows
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


    ∇ __update__(data∆ colnames∆)
      :Access Private
      m_ncol←⍴⊆colnames∆
      m_nrow←≢data∆
      m_rows←⍳m_nrow
      m_shape←⍴data∆
    ∇

:EndClass

