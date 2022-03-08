:Class ALayer

    :Field Private m_random
    :Field Private m_mathtools
    :Field Private m_optimizer
    :Field Private logger

    :Field Private m_step_size←0.001
    :Field Private m_decay←0
    :Field Private m_iteration←0


    ∇ __init__
      :Implements Constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      m_random←#.Utils.Random
      m_mathtools←#.Utils.Mathtools
      logger←#.Utils.Logger
      ⎕DF'ALayer'
    ∇

    :Section weights

    ∇ r←__random_weights__(n_columns n_neurons)
      :Access Private
      r←n_columns{⍺ ⍵⍴?(⍺×⍵)⍴0}n_neurons
    ∇


    ∇ r←__weights_sigmoid_tanh__(n_columns n_neurons method);l_bound;r_bound;n_numbers;random_vector
      :Access Private
      :If 'xavier'≡method
          r_bound←n_columns*0.5
          l_bound←-r_bound
      :ElseIf 'normalized_xavier'≡method
          r_bound←(6*0.5)÷(n_columns+n_neurons)*0.5
          l_bound←-r_bound
      :Else
          r_bound←1
          l_bound←-1
      :EndIf
     
      n_numbers←n_columns×n_neurons
      random_vector←m_random.uniform(l_bound r_bound n_numbers)
      r←n_columns{⍺ ⍵⍴random_vector}n_neurons
    ∇


    ∇ r←__weights_relu__(n_columns n_neurons);sigma;mu;n_numbers;random_vector
      :Access Private
      (sigma mu)←((2÷n_columns)*0.5)(0)
      n_numbers←n_columns×n_neurons
      random_vector←m_random.gaussian(mu sigma n_numbers)
      r←n_columns{⍺ ⍵⍴random_vector}n_neurons
    ∇


    ∇ r←setWeights(n_columns n_neurons activation)
      :Access Public
      :Select activation
      :Case 'relu'
          r←__weights_relu__ n_columns n_neurons
      :CaseList 'sigmoid' 'tanh'
          r←__weights_sigmoid_tanh__ n_columns n_neurons'xavier'
      :Else
          r←__random_weights__ n_columns n_neurons
      :EndSelect
    ∇

    :EndSection


    :Section activations

    ∇ r←__elu__(∆input ∆activation_input method)
      :Access Private
     
      :If method≡'forward'
          r←(∆input×∆input>0)-(1-*∆input)×∆input≤0
      :ElseIf method≡'backward'
          r←∆input×((*∆activation_input)*∆activation_input≤0)
      :EndIf
    ∇


    ∇ r←__exp__(∆input ∆activation_input method)
      :Access Private
     
      :If method≡'forward'
          r←*∆input
      :ElseIf method≡'backward'
          r←∆input×(*∆activation_input)
      :EndIf
    ∇


    ∇ r←__lrelu__(∆input ∆activation_input method)
      :Access Private
     
      :If method≡'forward'
          r←∆input×0.01*∆input≤0
      :ElseIf method≡'backward'
          r←∆input×(0.01*∆activation_input≤0)
      :EndIf
    ∇


    ∇ r←__relu__(∆input ∆activation_input method)
      :Access Private
     
      :If method≡'forward'
          r←0⌈∆input
      :ElseIf method≡'backward'
          r←∆input×∆activation_input>0
      :EndIf
    ∇


    ∇ r←__sigmoid__(∆input ∆activation_input method)
      :Access Private
     
      :If method≡'forward'
          r←÷1+*-∆input
      :ElseIf method≡'backward'
          r←∆input×({⍵×1-⍵}(÷1+*-∆activation_input))
      :EndIf
    ∇


    ∇ r←__softmax__(∆input ∆activation_output method);exp_val
      :Access Private
     
      :If method≡'forward'
          exp_val←{*(⍵-⍉(⍴⍉⍵)⍴(×/⍴⍵)⍴⌈/⍵)}∆input
          r←{⍵÷(⍉(⍴⍉⍵)⍴(×/⍴⍵)⍴+/⍵)}exp_val
      :ElseIf method≡'backward'
          r←(⍴∆activation_output)⍴∆input({((m_mathtools.diagonalize ⍵)-⍵∘.×⍵)+.×(⍪⍺)}⍤1)∆activation_output
      :EndIf
    ∇


    ∇ r←__tanh__(∆input ∆activation_input method);exp_val
      :Access Private
     
      :If method≡'forward'
          r←7○∆input
      :ElseIf method≡'backward'
          r←∆input×({(1+⍵)×1-⍵}(7○∆activation_input))
      :EndIf
    ∇


    ∇ r←__linear__ ∆input
      :Access Private
      r←∆input
    ∇


    ∇ r←activate(∆input ∆activation_input ∆activation_output method activation)
      :Access Public
      :Select activation
      :Case 'elu'
          r←__elu__ ∆input ∆activation_input method
      :Case 'relu'
          r←__relu__ ∆input ∆activation_input method
      :Case 'linear'
          r←__linear__ ∆input
      :Case 'lrelu'
          r←__lrelu__ ∆input ∆activation_input method
      :Case 'exp'
          r←__exp__ ∆input ∆activation_input method
      :Case 'sigmoid'
          r←__sigmoid__ ∆input ∆activation_input method
      :Case 'softmax'
          r←__softmax__ ∆input ∆activation_output method
      :Case 'tanh'
          r←__tanh__ ∆input ∆activation_input method
      :Else
          logger.logError'Activation is Unknown'
      :EndSelect
    ∇

    :EndSection


    :Section optimizer

    ∇ {r}←astep(weights biases dweights dbiases)
      :Access Public
      :Select m_optimizer
      :CaseList 'sgd' 'SGD' 'Sgd'
          r←__sgd_step__ weights biases dweights dbiases
      :Else
          logger.logError'Optimizer is Unknown'
      :EndSelect
    ∇


    ∇ update
      :Access Public
      :If m_decay>0
          m_step_size×←÷1+decay×iteration
          m_iteration+←1
      :EndIf
    ∇


    ∇ optimizer_args setOptimizer optimizer
      :Access Public
      m_optimizer←optimizer
      m_step_size←optimizer_args.step_size
      m_decay←optimizer_args.decay
    ∇


    ∇ {r}←__sgd_step__(weights biases dweights dbiases)
      :Access Private
      weights+←-m_step_size×dweights
      biases+←-m_step_size×dbiases
      r←(weights biases)
    ∇

    :EndSection

:EndClass
