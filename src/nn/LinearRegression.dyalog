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
      linear_activation←⎕NEW #.aplML.activation.Linear
      sgd_optimizer←⎕NEW #.aplML.optimizer.SGD(0.0001 0)
      ms_loss←⎕NEW #.aplML.loss.MeanSquare
    ∇


    ∇ forward input∆
      :Access Private
      linear_layer.forward input∆
      linear_activation.forward linear_layer.output
    ∇


    ∇ backward
      :Access Private
      ms_loss.backward(linear_activation.output ytrue)
      linear_layer.backward ms_loss.dinput
    ∇


    ∇ r←train input∆
      :Access Private
      forward input∆
      backward
      sgd_optimizer.step linear_layer
      r←input∆
    ∇


    ∇ {r}←fit iterations
      :Access Public
      r←(train⍣iterations)input
    ∇


    ∇ predict X_test
      :Access Public
      ⍬
    ∇

:EndClass
