:Class Sampler

    ∇ __init__
      :Implements constructor
      :Access Public
      ⎕DF'Sampler'
    ∇


    ∇ r←train_test_split(X y split_size);Xy;split_point
      :Access Public
      Xy←randomSampler(X,y)
      split_point←⌊0.5+split_size×↑⍴X
      
      X_train←Xy[⍳split_point;1↓⍴X]
      
      y_train←Xy[⍳split_point;1↓⍴Xy]
      
      r←X_train X_test y_train y_test
    ∇


    ∇ r←randomSampler X;batches
      :Access Public
      r←X[(↑⍴X)?(↑⍴X);]
    ∇

:EndClass
