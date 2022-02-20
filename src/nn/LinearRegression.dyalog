:Class LinearRegression

    :Field Public linear_layer
    :Field Public linear_activation
    :Field Public sgd_optimizer
    :Field Public ms_loss
    :Field Public input
    :Field Public ytrue


    ∇ __init__(X∆ y∆)
      :Implements constructor
      :Access Public
      input←X∆
      ytrue←y∆
      initialization
      ⎕DF'Module'
    ∇


    ∇ initialization
      :Access Private
      linear_layer←⎕NEW #.aplML.layer.Linear((1↓⍴input),1)
      sgd_optimizer←⎕NEW #.aplML.optimizer.SGD(0.0001 0)
      ms_loss←⎕NEW #.aplML.loss.MeanSquare
    ∇


    ∇ forward input∆
      :Access Private
      linear_layer.forward input∆
    ∇


    ∇ backward
      :Access Private
      ms_loss.backward(linear_layer.output ytrue)
      linear_layer.backward ms_loss.dinput
    ∇


    ∇ r←train(input∆ verbose)
      :Access Private
      forward input∆
      backward
      sgd_optimizer.step linear_layer
      :If 1=verbose
          evaluate
      :EndIf
      r←(input∆ verbose)
    ∇


    ∇ {r}←fit(iterations verbose)
      :Access Public
      r←(train⍣iterations)(input verbose)
    ∇


    ∇ r←evaluate;ypred;loss;acc
      ypred←predict input
      loss←ms_loss.calculate(ypred ytrue)
      r←⊆('MSE: 'loss)
    ∇


    ∇ r←predict X_test;ypred
      :Access Public
      ypred←linear_layer.calculate X_test
      :If 1∊⍴ypred
          r←∊ypred
      :Else
          r←ypred
      :EndIf
    ∇

:EndClass
