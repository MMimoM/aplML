:Class Dictionary

    :Field Private m_dict
    :Field Private mathtools
    :Field Private logger


    ∇ make keys∆;colnames;data
      :Implements Constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      data←⍪keys∆,⍪(⍳≢keys∆)
      colnames←'key' 'value'
      m_dict←⎕NEW #.Utils.DataFrame(data colnames)
     
      mathtools←#.Utils.Mathtools
      logger←#.Utils.Logger
    ∇


    ∇ make2(keys∆ values∆);data;colnames
      :Implements Constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      data←⍪keys∆,⍪values∆
      colnames←'key' 'value'
      m_dict←⎕NEW #.Utils.DataFrame(data colnames)
     
      mathtools←#.Utils.Mathtools
      logger←#.Utils.Logger
    ∇


    :Property keys
    :Access Public
        ∇ r←get
          r←'key'm_dict.get m_dict.rows
        ∇
    :EndProperty


    :Property values
    :Access Public
        ∇ r←get
          r←'value'm_dict.get m_dict.rows
        ∇
    :EndProperty


    :Property size
    :Access Public
        ∇ r←get
          r←m_dict.nrow
        ∇
    :EndProperty


    ∇ add key∆;value∆
      :Access Public
      value∆←size
      m_dict.rbind(key∆,value∆)
    ∇


    ∇ drop key∆
      :Access Public
      m_dict.drop m_dict.where_eqv('key'key∆)
    ∇


    ∇ r←getValue key∆
      :Access Public
      r←'value'm_dict.get m_dict.where_eqv('key'key∆)
    ∇


    ∇ r←getKey value∆
      :Access Public
      r←'key'm_dict.get m_dict.where_eq('value'value∆)
    ∇


:EndClass
