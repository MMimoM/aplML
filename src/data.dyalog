:Namespace data
⍝A Namespace for handling Data

    ∇ r←frame(data∆ colnames∆)
      r←⎕NEW #.Utils.DataFrame(data∆ colnames∆)
    ∇


    ∇ r←series(data∆ colname∆)
      r←⎕NEW #.Utils.DataSeries(data∆ colname∆)
    ∇


    :Namespace processing
    ⍝A Namespace for processing Datasets

        :Section Datasampling

        ∇ r←randomSampler matrix∆
          r←matrix∆[(↑⍴matrix∆)?(↑⍴matrix∆);]
        ∇

        :EndSection


        :Section Datasplitting

        ∇ r←trainTestSplit(X y split_size);Xy;split_point;X_train;X_test;y_train;y_test
          Xy←X,y
          Xy←randomSampler Xy
          split_point←#.Utils.Mathtools.∆round split_size×↑⍴X
         
          X_train←Xy[⍳split_point;⍳1↓⍴X]
          X_test←Xy[split_point↓⍳↑⍴X;⍳1↓⍴X]
         
          y_train←Xy[⍳split_point;1↓⍴X]
          y_test←Xy[split_point↓⍳↑⍴X;1↓⍴X]
         
          r←(X_train X_test y_train y_test)
        ∇

        :EndSection


        :Section Datatransformation

        ∇ r←batchTransform(X y batch_size sampler);number_of_splits;rv;batch_data;batch_labels
         
          :If 2≠≢⍴y
              y←#.Utils.Encoder.oneHot y
          :EndIf
         
          number_of_splits←#.Utils.Mathtools.∆round batch_size÷⍨↑⍴X
          batch_data←(number_of_splits,batch_size,1↓⍴X)⍴X
          batch_labels←(number_of_splits,batch_size,1↓⍴y)⍴y
         
          :If sampler≡'RandomSampler'
              rv←number_of_splits?number_of_splits
              batch_data←batch_data[rv;;]
              batch_labels←batch_labels[rv;;]
          :EndIf
         
          r←(batch_data batch_labels)
        ∇

        :EndSection

    :EndNamespace
    

    :Namespace encoding
    ⍝A Namespace for Encoding Categorical Datacolumns

    ⍝ One-Hot-Encoding
        ∇ r←oneHot column
          r←{⍵∘.=∪⍵}
        ∇

    :EndNamespace

:EndNamespace
