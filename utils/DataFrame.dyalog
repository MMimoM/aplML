:Class DataFrame

    :Field Private m_colnames
    :Field Private m_ncol
    :Field Private m_nrow
    :Field Private m_shape
    :Field Private m_data


    ∇ make data∆
      :Implements Constructor
      :Access Public
      ⎕IO←0
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
     
      :If 900⌶⍬
          rows∆←m_nrow
      :Else
          rows∆←__where__ conditions∆
      :EndIf
     
      cols∆←__set_cindex__ cols∆
      r←m_data[rows∆;cols∆]
    ∇


    ∇ {conditions∆}show cols∆;rows∆
      :Access Public
     
      :If 900⌶⍬
          rows∆←m_nrow
      :Else
          rows∆←__where__ conditions∆
      :EndIf
     
      cols∆←__set_cindex__ cols∆
      ⍕(m_colnames,[0]m_data)[rows∆+1;cols∆]
    ∇


    ∇ {conditions∆}set(cols∆ values);rows∆
      :Access Public
     
      :If 900⌶⍬
          rows∆←m_nrow
      :Else
          rows∆←__where__ conditions∆
      :EndIf
     
      cols∆←__set_cindex__ cols∆
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
     
      r←⍬
    ∇


    ∇ r←__where__ condition
      :Access Public
      r←condition
      :If __is_char__ r
          r←__betw_bracks__ r
          r←__transform_conditions__ r
      :EndIf
      r←⍬
    ∇


    ∇ r←__transform_conditions__ x;ors;ands;i;condition;col;conditions;attribute;logical_operator
      :Access Private
      ors←__or_conditions__ x
      ands←__and_conditions__ x
     
      conditions←⍬
      :For i :In ⍳≢ors
          condition←' '(≠⊆⊢)∊ors[i]
          col←cindex condition
          attribute←__get_attribute__ col condition
          logical_operator←__get_logical_operator__ condition
          :If __is_char__⊃attribute
              r←⍬
          :EndIf
      :EndFor
      r←⍬
    ∇


    ∇ r←__get_attribute__(col condition)
      :Access Private
      r←{u←,(unique col) ⋄ u[(∊u⍳(⊆⍵))~≢u]}condition
    ∇


    ∇ r←__get_logical_operator__ condition
      :Access Private
      r←{lo←⊆'=' '≠' '≤' '<' '>' '≥' ⋄ lo[(∊lo⍳(⊆⍵))~≢lo]}condition
    ∇


    ∇ r←__or_conditions__ x
      :Access Private
      r←'v'{⎕ML←3 ⋄ ⍺←↑,⍵ ⋄ (~⍵∊⍺)⊂,⍵}(('or'⎕R'v')x)
    ∇


    ∇ r←__and_conditions__ x
      :Access Private
      r←'∧'{⎕ML←3 ⋄ ⍺←↑,⍵ ⋄ (~⍵∊⍺)⊂,⍵}(('and'⎕R'∧')x)
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
    ∇


    ∇ r←__is_char__ x
      :Access Private
     
      r←0∊{10|⎕DR ⍵}¨x
    ∇


    ∇ r←__set_cindex__ cols∆
      :Access Private
     
      r←cols∆
      :If __is_char__ r
          r←cindex cols∆
      :EndIf
    ∇


:EndClass
