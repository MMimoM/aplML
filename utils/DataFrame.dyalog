:Class DataFrame

    :Field Private m_colnames
    :Field Private m_ncol
    :Field Private m_nrow
    :Field Private m_shape
    :Field Private m_data


    ∇ make(data∆ colnames∆)
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


    ∇ {r}←{rows∆}get cols∆
      :Access Public
     
      :If 900⌶⍬
          rows∆←m_nrow
      :EndIf
     
      cols∆←__set_cindex__ cols∆
      r←m_data[rows∆;cols∆]
    ∇


    ∇ {rows∆}show cols∆
      :Access Public
     
      :If 900⌶⍬
          rows∆←m_nrow
      :EndIf
     
      cols∆←__set_cindex__ cols∆
      ⍕(m_colnames,[0]m_data)[rows∆+1;cols∆]
    ∇


    ∇ {rows∆}set(cols∆ values)
      :Access Public
     
      :If 900⌶⍬
          rows∆←m_nrow
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


    ∇ r←frequency cols∆
      :Access Public
      cols∆←__set_cindex__ cols∆
      r←{⍺,≢⍵}⌸m_data[;cols∆]
    ∇


    ∇ r←where condition
      :Access Public
      r←⍬
    ∇


    ∇ r←{colnames∆}subset condition
      :Access Public
     
      :If 900⌶⍬
          colnames∆←m_colnames
      :EndIf
     
      r←⍬
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
