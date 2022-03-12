:Class Adam

    :Field Private m_step_size
    :Field Private m_decay
    :Field Private m_epsilon
    :Field Private m_beta_1
    :Field Private m_beta_2
    :Field Private m_iteration


    ∇ __init__(step_size∆ decay∆ epsilon∆ beta_1∆ beta_2∆)
      :Implements constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      m_step_size←step_size∆
      m_decay←decay∆
      m_iteration←1
      m_epsilon←epsilon∆
      m_beta_1←beta_1∆
      m_beta_2←beta_2∆
      ⎕DF'Adam(step_size∆ decay∆ epsilon∆ beta_1∆ beta_2∆)'
    ∇


    ∇ step layer
      :Access Public
      ⍝ TODO
    ∇


    ∇ update
      :Access Public
      :If m_decay>0
          m_step_size×←÷1+decay×iteration
          m_iteration+←1
      :EndIf
    ∇

:EndClass
