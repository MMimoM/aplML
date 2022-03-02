:Class DataFrame

    :Field Private m_colnames
    :Field Private m_ncol
    :Field Private m_nrow
    :Field Private m_shape
    :Field Private m_data


    ∇ make data∆
      :Implements Constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      m_data←1↓data∆
      m_colnames←⊆data∆[0;]
      m_ncol←⍴⊆m_colnames
      m_nrow←≢m_data
      m_shape←⍴m_data
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
    ∇


    :Property colnames
    :Access Public
        ∇ r←get
          r←m_colnames
        ∇
    :Endproperty


    :Property nrow
    :Access Public
        ∇ r←get
          r←m_ncol
        ∇
    :Endproperty


    :Property ncol
    :Access Public
        ∇ r←get
          r←m_ncol
        ∇
    :Endproperty


    :Property shape
    :Access Public
        ∇ r←get
          r←m_shape
        ∇
    :Endproperty


    ∇ {r}←{conditions∆}get cols∆;rows∆
      :Access Public
      cols∆←__set_cindex__ cols∆
     
      :If 900⌶⍬
          rows∆←⍳m_nrow
      :Else
          :If __is_boolean__ conditions∆
              rows∆←⍸conditions∆
          :ElseIf ⎕NULL∊conditions∆
              :If (⊂'not')∊conditions∆
                  rows∆←⍸~∨/(⎕NULL≡¨m_data[;cols∆])
              :Else
                  rows∆←⍸∨/(⎕NULL≡¨m_data[;cols∆])
              :EndIf
          :Else
              rows∆←__where__ conditions∆
              :If ⎕NULL∊rows∆
                  ⎕NULL
                  :Return
              :EndIf
          :EndIf
      :EndIf
     
      r←m_data[rows∆;cols∆]
    ∇


    ∇ {r}←{conditions∆}copy cols∆;rows∆;operator;temp_data
      :Access Public
      cols∆←__set_cindex__ cols∆
     
      :If 900⌶⍬
          rows∆←⍳m_nrow
      :Else
          :If __is_boolean__ conditions∆
              rows∆←⍸conditions∆
          :ElseIf ⎕NULL∊conditions∆
              :If (⊂'not')∊conditions∆
                  rows∆←⍸~∨/(⎕NULL≡¨m_data[;cols∆])
              :Else
                  rows∆←⍸∨/(⎕NULL≡¨m_data[;cols∆])
              :EndIf
          :Else
              rows∆←__where__ conditions∆
              :If ⎕NULL∊rows∆
                  ⎕NULL
                  :Return
              :EndIf
          :EndIf
      :EndIf
     
      r←data.frame(m_colnames[cols∆],[0]m_data[rows∆;cols∆])
    ∇


    ∇ {conditions∆}show cols∆;rows∆
      :Access Public
      cols∆←__set_cindex__ cols∆
     
      :If 900⌶⍬
          rows∆←⍳m_nrow
      :Else
          :If __is_boolean__ conditions∆
              rows∆←⍸conditions∆
          :ElseIf ⎕NULL∊conditions∆
              :If (⊂'not')∊conditions∆
                  rows∆←⍸~∨/(⎕NULL≡¨m_data[;cols∆])
              :Else
                  rows∆←⍸∨/(⎕NULL≡¨m_data[;cols∆])
              :EndIf
          :Else
              rows∆←__where__ conditions∆
              :If ⎕NULL∊rows∆
                  ⎕NULL
                  :Return
              :EndIf
          :EndIf
      :EndIf
     
      ⍕(m_colnames[cols∆],[0]m_data[rows∆;cols∆])
    ∇


    ∇ {conditions∆}set(cols∆ values);rows∆;col∆;operator
      :Access Public
      cols∆←__set_cindex__ cols∆
     
      :If 900⌶⍬
          rows∆←⍳m_nrow
      :Else
          :If __is_boolean__ conditions∆
              rows∆←⍸conditions∆
          :ElseIf ⎕NULL∊conditions∆
              operator←'≡'
              :If (⊂'not')∊conditions∆
                  operator←'≢'
              :EndIf
              :For col∆ :In cols∆
                  m_data[⎕NULL(⍎operator)¨m_data[;col∆];col∆]←values
              :EndFor
              :Return
          :Else
              rows∆←__where__ conditions∆
              :If ⎕NULL∊rows∆
                  ⎕NULL
                  :Return
              :EndIf
          :EndIf
      :EndIf
     
      m_data[rows∆;cols∆]←values
    ∇


    ∇ head nrows∆
      :Access Public
      ⍕(m_colnames,[0]m_data)[⍳(nrows∆+1);]
    ∇


    ∇ r←cindex colnames∆
      :Access Public
      r←(∊m_colnames⍳(⊆colnames∆))~m_ncol
    ∇


    ∇ cbind(columns∆ colnames∆)
      :Access Public Shared
      m_data,←columns∆
      m_colnames,←colnames∆
    ∇


    ∇ rbind row
      :Access Public Shared
      m_data,←[0]row
    ∇


    ∇ r←unique cols∆;column
      :Access Public
      cols∆←__set_cindex__ cols∆
      r←∪m_data[;cols∆]
    ∇


    ∇ r←frequency colname∆;col∆
      :Access Public
      col∆←__set_cindex__ colname∆
      r←{⍺,≢⍵}⌸m_data[;col∆]
    ∇


    ∇ r←{colnames∆}subset condition
      :Access Public
     
      :If 900⌶⍬
          colnames∆←m_colnames
      :EndIf
     
      r←condition copy colnames∆
    ∇


    ∇ r←isNull cols∆
      :Access Public
      cols∆←cindex cols∆
      r←⎕NULL∊m_data[;cols∆]
    ∇


    ∇ r←__where__ condition
      :Access Private
      r←condition
      :If __is_char__ r
          r←__betw_bracks__ r
          r←__transform_conditions__¨r
          :If ⎕NULL∊r
              r←⎕NULL
          :Else
              r←⍸⍎(⍕{∊⍵}¨r)
          :EndIf
      :EndIf
    ∇


    ∇ r←__transform_conditions__ x;ors∆;ands∆;conditions∆;col∆;attribute∆;operator∆;shortcut∆;iterator;condition
      :Access Private
     
      :If 1=⍴x
          r←x
          :Return
      :EndIf
     
      ors∆←__or_conditions__ x
      ands∆←__and_conditions__ x
      conditions∆←ands∆
     
      shortcut∆←'∧'
      :If 1≠≢ors∆
          shortcut∆←'∨'
          conditions∆←ors∆
      :EndIf
     
      iterator←0
      :For condition :In conditions∆
          iterator+←1
          condition←' '(≠⊆⊢)∊condition
          col∆←cindex condition
          attribute∆←__get_attribute__ col∆ condition
          operator∆←__get_logical_operator__ condition
          :If 1=iterator
              r←__get_boolean_from_condition__ col∆ attribute∆ operator∆
          :Else
              r←r(⍎shortcut∆)(__get_boolean_from_condition__ col∆ attribute∆ operator∆)
          :EndIf
      :EndFor
    ∇


    ∇ r←__get_boolean_from_condition__(col∆ attribute∆ operator∆)
      :Access Private
      :Select ∊(__is_char__ attribute∆)(operator∆)
      :Case (1 '=')
          r←(⊆attribute∆)⍷m_data[;col∆]
      :Case (1 '≠')
          r←~(⊆attribute∆)⍷m_data[;col∆]
      :CaseList (0 '=')(0 '≠')(0 '≤')(0 '<')(0 '>')(0 '≥')
          :If isNULL col∆
              r←⎕NULL
          :Else
              r←⍎('m_data[;',(⍕col∆),']',(⍕operator∆),(⍕attribute∆))
          :EndIf
      :CaseList (0 '⌈')(0 '⌊')
          :If isNULL col∆
              r←⎕NULL
          :Else
              r←(⍎operator∆)/m_data[;col∆]
              r←r⍷m_data[;col∆]
          :EndIf
      :Else
          r←⍬
      :EndSelect
    ∇


    ∇ r←__get_attribute__(col condition)
      :Access Private
      r←{u←,(unique col) ⋄ u[(∊u⍳(⊆⍵))~≢u]}condition
      :If ⍬≡r
          r←('[0-9]+'⎕S'\0')condition
          r←⍎(⍕r)
      :EndIf
    ∇


    ∇ r←__get_logical_operator__ condition;operator
      :Access Private
      operator←(' '⎕R'')'= ' '≠ ' '≤ ' '< ' '> ' '≥ ' '⌈ ' '⌊'
      r←{operator[(∊operator⍳(⊆⍵))~≢operator]}condition
    ∇


    ∇ r←__or_conditions__ x
      :Access Private
      r←'v'{⍺←↑,⍵ ⋄ (~⍵∊⍺)⊂,⍵}(('or'⎕R'v')x)
    ∇


    ∇ r←__and_conditions__ x
      :Access Private
      r←'∧'{⍺←↑,⍵ ⋄ (~⍵∊⍺)⊂,⍵}(('and'⎕R'∧')x)
    ∇


    ∇ r←__betw_bracks__ x;posl;posr;i
      :Access Private
      posl←⍸'('=x
      posr←⍸')'=x
      r←⍬
      :For i :In ⍳≢posl
          r,←⊆x[(posl[i]+1)↓⍳posr[i]]
          :If ~(i+1)=≢posl
              r,←⊆(' '⎕R'')x[(posr[i]+1)↓⍳posl[i+1]]
          :EndIf
      :EndFor
      r←('or'⎕R'v')('and'⎕R'∧')r
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
