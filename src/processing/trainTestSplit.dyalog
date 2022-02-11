 trainTestSplit←{
     ⍝⍵[0]←X, ⍵[1]←y, ⍵[2]←split_size => args→(X y 0.7) 
     Xy←(⊃⍵[0]),(⊃⍵[1])
     Xy←randomSampler Xy
     split_point←#.Utils.round(⊃⍵[2])×↑⍴(⊃⍵[0])

     X_train←Xy[⍳split_point;⍳1↓⍴(⊃⍵[0])]
     X_test←Xy[split_point↓⍳↑⍴(⊃⍵[0]);⍳1↓⍴(⊃⍵[0])]

     y_train←Xy[⍳split_point;1↓⍴(⊃⍵[0])]
     y_test←Xy[split_point↓⍳↑⍴(⊃⍵[0]);1↓⍴(⊃⍵[0])]

     X_train X_test y_train y_test
 }

