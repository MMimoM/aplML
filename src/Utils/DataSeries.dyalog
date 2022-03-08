:Class DataSeries

    :Field Private m_colname
    :Field Private m_nrow
    :Field Private m_data


    ∇ make(data∆ colnames∆)
      :Implements Constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      m_data←data∆
      m_colname←⊆colnames∆
      m_nrow←≢data∆
    ∇


    :Property colname
    :Access Public
        ∇ r←get
          r←m_colname
        ∇
    :Endproperty


    :Property nrow
    :Access Public
        ∇ r←get
          r←m_ncol
        ∇
    :Endproperty


    ∇ {r}←get rows∆
      :Access Public
      r←m_data[rows∆]
    ∇


    ∇ show rows∆
      :Access Public
      ⍕m_data[rows∆]
    ∇


    ∇ set(rows∆ values)
      :Access Public
      m_data[rows∆]←values
    ∇


    ∇ head nrows∆
      :Access Public
      ⍕(colname,[0]m_data)[⍳(nrows∆+1)]
    ∇


    ∇ r←unique
      :Access Public
      r←∪m_data
    ∇


    ∇ r←frequency
      :Access Public
      r←{⍺,≢⍵}⌸m_data
    ∇


:EndClass
