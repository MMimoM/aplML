:Namespace PackageLoader

    ∇ aplML←loadPackage path
     
      aplML←⎕NS''
     
      ⍝optimizer
      aplML.optimizer←⎕NS''
     
      ⍝activation
      aplML.activation←⎕NS''
      aplML.activation.Linear←⎕SE.SALT.Load path,'\aplML\src\activation\Linear'
      aplML.activation.ReLU←⎕SE.SALT.Load path,'\aplML\src\activation\ReLU'
     
      ⍝layer
      aplML.layer←⎕NS''
      aplML.layer.Linear←⎕SE.SALT.Load path,'\aplML\src\layer\Linear'
      aplML.layer.ALayer←⎕SE.SALT.Load path,'\aplML\src\layer\ALayer'
     
      ⍝loss
      aplML.loss←⎕NS''
    ∇

    ∇ utils←loadUtils path
      utils←⎕NS''
     
      ⍝probability distributions
      utils.random←path,'\aplML\utils\Random'
    ∇

:EndNamespace
