:Class Linear: ALayer

    :Field Private m_input
    :Field Private m_output
    :Field Private m_activation_input
    :Field Private m_activation
    :Field Private m_optimizer
    :Field Private m_dinput

    :Field Private m_weights
    :Field Private m_biases
    :Field Private m_dweights
    :Field Private m_dbiases


    :Property weights
    :Access Public
        ∇ r←get
          r←m_weights
        ∇
        ∇ set val
          m_weights←val
        ∇
    :Endproperty


    :Property biases
    :Access Public
        ∇ r←get
          r←m_biases
        ∇
        ∇ set val
          m_biases←val
        ∇
    :Endproperty


    :Property dweights
    :Access Public
        ∇ r←get
          r←m_dweights
        ∇
        ∇ set val
          m_dweights←val
        ∇
    :Endproperty


    :Property dbiases
    :Access Public
        ∇ r←get
          r←m_dbiases
        ∇
        ∇ set val
          m_dbiases←val
        ∇
    :Endproperty


    ∇ __init__(n_columns n_neurons activation)
      :Implements constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      m_biases←?n_neurons⍴0
      m_activation←activation
      m_weights←setWeights n_columns n_neurons activation
      ⎕DF'Linear'
    ∇


    ∇ {r}←forward ∆input
      :Access Public
      m_input←∆input
      m_activation_input←∆input+.×m_weights
      m_activation_input+←m_biases{⍺⍴⍨⍴⍵}m_activation_input
      m_output←activate m_activation_input ⍬ ⍬'forward'm_activation
      r←m_output
    ∇


    ∇ {r}←backward ∆dinput
      :Access Public
      :If 'softmax'≡m_activation
          m_dinput←activate ∆dinput ⍬ m_output'backward'm_activation
      :Else
          m_dinput←activate ∆dinput m_activation_input ⍬'backward'm_activation
      :EndIf
      m_dweights←(⍉m_input)+.×m_dinput
      m_dbiases←+/⍉m_dinput
      m_dinput←m_dinput+.×⍉m_weights
      r←m_dinput
    ∇


    ∇ r←calculate ∆input
      :Access Public
      r←∆input+.×m_weights
      r+←m_biases{⍺⍴⍨⍴⍵}r
      r←activate r ⍬ ⍬'forward'm_activation
    ∇


    ∇ step
      :Access Public
      (m_weights m_biases)←astep m_weights m_biases m_dweights m_dbiases
    ∇

:EndClass
