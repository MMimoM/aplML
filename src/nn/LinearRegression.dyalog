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
      initialization
      input←X∆
      ytrue←y∆
      ⎕DF'Module'
    ∇


    ∇ initialization
      :Access Private
      linear_layer←⎕NEW ##.layer.Linear((1↓⍴input),1)
      linear_activation←⎕NEW ##.activation.Linear
      sgd_optimizer←⎕NEW ##.optimizer.SGD(0.0001 0)
      ms_loss←⎕NEW ##.loss.MeanSquare
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


    ∇ train input∆
      :Access Private
      forward input∆
      backward
      sgd_optimizer.step linear_layer
    ∇

    ∇ fit iterations
      :Access Public
      (train⍣iterations)input
    ∇


    ∇ predict X_test
      :Access Public
      ⍬
    ∇

:EndClass
