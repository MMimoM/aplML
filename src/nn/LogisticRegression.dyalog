:Class LogisticRegression

    :Field Public linear_layer
    :Field Public softmax_activation
    :Field Public sgd_optimizer
    :Field Public cat_cross_loss
    :Field Public learning_rate
    :Field Public input
    :Field Public ytrue


    ∇ __init__(X∆ y∆ lr∆)
      :Implements constructor
      :Access Public
      (input ytrue learning_rate)←(X∆ y∆ lr∆)
      initialization
      ⎕DF'Module'
    ∇


    ∇ initialization
      :Access Private
      linear_layer←⎕NEW #.layer.Linear((1↓⍴input),1)
      softmax_activation←⎕NEW #.activation.Softmax
      sgd_optimizer←⎕NEW #.optimizer.SGD(learning_rate 0)
      cat_cross_loss←⎕NEW #.loss.CategoricalCrossEntropy
    ∇


    ∇ forward input∆
      :Access Private
      linear_layer.forward input∆
      softmax_activation.forward linear_layer.output 
    ∇


    ∇ backward
      :Access Private
      ms_loss.backward(softmax_activation.output ytrue)
      softmax_activation.backward ms_loss.dinput
      linear_layer.backward softmax_activation.dinput
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
      loss←cat_cross_loss.calculate(ypred ytrue)
      acc←Utils.Metrics.accuracy(ypred ytrue)
      r←⊆('loss: 'loss 'accuracy' acc)
    ∇


    ∇ r←predict X_test;ypred
      :Access Public
      ypred←softmax_activation.calculate linear_layer.calculate X_test
    ∇

:EndClass
