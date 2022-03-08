:Class Sequential

    :Field Private m_input
    :Field Private m_ytrue
    :Field Private m_arguments

    :Field Private Logger
    :Field Private m_metrics

    :Field Private m_layers←⍬
    :Field Private m_optimizer←⍬
    :Field Private m_loss←⍬
    :Field Private m_verbose←0
    :Field Private m_len←0


    :Property arguments
    :Access Public
        ∇ r←get
          r←m_arguments
        ∇
    :EndProperty


    ∇ __init__
      :Implements Constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      Logger←#.Utils.Logger
      m_metrics←#.Utils.Metrics
      __arguments__
      ⎕DF'Sequential'
    ∇


    ∇ add layer∆
      :Access Public
      :If ⍬≡m_layers
          m_layers←layer∆
      :Else
          m_layers,←layer∆
      :EndIf
      m_len+←1
    ∇


    ∇ {verbose∆}compile(loss∆ optimizer∆ optimizer_args∆);layer;iteration
      :Access Public
      :If ~900⌶⍬
          m_verbose←verbose∆
      :EndIf
     
      :If 1<m_len
          iteration←0
          :While iteration<m_len
              layer←m_layers[iteration]
              optimizer_args∆ layer.setOptimizer optimizer∆
              iteration←iteration+1
          :EndWhile
      :Else
          optimizer_args∆ m_layers.setOptimizer optimizer∆
      :EndIf
      __set_loss__ loss∆
    ∇


    ∇ fit(input∆ ytrue∆ batch_size∆ epochs∆ val_split∆)
      :Access Public
      :If 2≠⍴⍴ytrue∆
          ytrue∆←((≢ytrue∆),1)⍴ytrue∆
      :EndIf
      m_input←input∆
      m_ytrue←ytrue∆
      (__train__⍣epochs∆)input∆
    ∇


    ∇ r←evaluate;ypred∆;loss∆;acc∆
      :Access Public
      :If 0<m_verbose
          ypred∆←predict m_input
          loss∆←m_loss.calculate(ypred∆ m_ytrue)
          acc∆←m_metrics.accuracy(ypred∆ m_ytrue)
          r←⊆('loss: 'loss∆'accuracy: 'acc∆)
      :EndIf
    ∇


    ∇ r←predict input∆
      :Access Public
      r←__calculate__ input∆
    ∇


    ∇ __arguments__;colnames;row1;row2;row3;row4;row5;data
      colnames←'method' 'arg_1' 'arg_2' 'arg_3' 'arg_4' 'arg_5' 'optional'
      row1←'add' 'layer' ' ' ' ' ' ' ' ' ' '
      row2←'compile' 'loss' 'optimizer' 'arguments for optimizer' ' ' ' ' 'verbose'
      row3←'fit' 'trainset' 'target' 'batch size' 'epochs' 'validation split' ' '
      row4←'evaluate' ' ' ' ' ' ' ' ' ' ' ' '
      row5←'predict' 'set' ' ' ' ' ' ' ' ' ' '
      m_arguments←6 7⍴(colnames,row1,row2,row3,row4,row5)
    ∇


    ∇ {r}←__forward__ input∆;iteration
      :Access Private
      :If 1<m_len
          r←m_layers[0].forward input∆
          iteration←1
          :While iteration<m_len
              r←m_layers[iteration].forward r
              iteration←iteration+1
          :EndWhile
      :Else
          r←m_layers.forward input∆
      :EndIf
    ∇


    ∇ {r}←__calculate__ input∆;iteration
      :Access Private
      :If 1<m_len
          r←m_layers[0].calculate input∆
          iteration←0
          :While iteration<m_len
              r←m_layers[iteration].calculate r
              iteration←iteration+1
          :EndWhile
      :Else
          r←m_layers.calculate input∆
      :EndIf
    ∇


    ∇ {r}←__backward__ output∆;dinput∆;iteration
      :Access Private
      dinput∆←m_loss.backward output∆ m_ytrue
      :If 1<m_len
          r←m_layers[m_len-1].backward dinput∆
          iteration←2
          r←m_layers[m_len-iteration].backward dinput∆
          :While 0≤m_len-iteration
              r←m_layers[m_len-iteration].backward r
              iteration←iteration+1
          :EndWhile
      :Else
          r←m_layers.backward dinput∆
      :EndIf
    ∇


    ∇ {r}←__train__ input∆
      :Access Private
      __backward__ __forward__ input∆
      m_layers.step
      m_layers.update
      evaluate
      r←input∆
    ∇


    ∇ __set_loss__ loss∆
      :Access Private
      :Select loss∆
      :CaseList 'CCE' 'CategoricalCrossEntropy'
          m_loss←⎕NEW ##.loss.CategoricalCrossEntropy
      :CaseList 'MSE' 'mse' 'Mse' 'MeanSquareError' 'MeanSquare'
          m_loss←⎕NEW ##.loss.MeanSquare
      :Else
          Logger.logError'Loss-function is Unknown'
      :EndSelect
    ∇

:EndClass
