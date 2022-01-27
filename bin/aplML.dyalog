:Class aplML
    
    :Field Public path 

    ∇ __init__ path∆
      :Implements constructor
      :Access Public
      path←path∆
      ⎕DF'aplML'
    ∇

    ∇ aplML←loadPackage
      :Access Public
     
      aplML←⎕NS''
     
      ⍝optimizer
      aplML.optimizer←⎕NS''
     
      ⍝activation
      aplML.activation←⎕NS''
      aplML.activation.Linear←⎕SE.SALT.Load path,'\aplML\src\activation\Linear'
      aplML.activation.ReLU←⎕SE.SALT.Load path,'\aplML\src\activation\ReLU'
     
      ⍝layer
      aplML.layer←⎕NS''
      aplML.layer.ALayer←⎕SE.SALT.Load path,'\aplML\src\layer\ALayer'
      aplML.layer.ALayer←⎕NEW aplML.layer.ALayer path
      aplML.layer.Linear←⎕SE.SALT.Load path,'\aplML\src\layer\Linear'
     
      ⍝loss
      aplML.loss←⎕NS''
    ∇


    ∇ utils←loadUtils;random
      :Access Public
     
      utils←⎕NS''
     
      ⍝probability distributions
      utils.random←⎕SE.SALT.Load path,'\aplML\utils\Random'
      utils.random←⎕NEW utils.random
    ∇


:EndClass
