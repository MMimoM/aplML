:Class ALayer

    :Field Public random

    ∇ __init__ path
      :Implements constructor
      :Access Private
      random←⎕SE.SALT.Load path,'\aplML\utils\Random'
      random←⎕NEW random
      ⎕DF'ALayer'
    ∇

    :Section weights

    ∇ weights←getRandomWeights(n_columns n_neurons)
      :Access Public
      weights←n_columns{⍺ ⍵⍴?(⍺×⍵)⍴0}n_neurons
    ∇


    ∇ weights←getWeightsForSigmoidAndTanh(n_columns n_neurons method);l_bound;r_bound;n_numbers;random_vector
      :Access Public
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
      random_vector←random.uniform(l_bound r_bound n_numbers)
      weights←n_columns{⍺ ⍵⍴random_vector}n_neurons
    ∇


    ∇ weights←getWeightsForReLU(n_columns n_neurons);sigma;mu;n_numbers;random_vector
      :Access Public
      (sigma mu)←((2÷n_columns)*0.5)(0)
      n_numbers←n_columns×n_neurons
      random_vector←random.gaussian(mu sigma n_numbers)
      weights←n_columns{⍺ ⍵⍴random_vector}n_neurons
    ∇

    :EndSection

:EndClass
