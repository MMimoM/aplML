:Class Dataloader

    :Field Public batch_labels←⍬
    :Field Public batch_data←⍬

    ∇ __init__
      :Implements constructor
      :Access Public
      ⎕DF'Dataloader'
    ∇

    ∇ transform(X y batch_size sampler);number_of_splits;rv
      :Access Public
     
      :If 2≠≢⍴y
          y←utils.encoder.oneHot y
      :EndIf
     
      number_of_splits←#.Utis.round batch_size÷⍨↑⍴X
      batch_data←(number_of_splits,batch_size,1↓⍴X)⍴X
      batch_labels←(number_of_splits,batch_size,1↓⍴y)⍴y
     
      :If sampler≡'RandomSampler'
          rv←number_of_splits?number_of_splits
          batch_data←batch_data[rv;;]
          batch_labels←batch_labels[rv;;]
      :EndIf
    ∇

:EndClass
