 trainTestSplit←{
     ⍝⍵[0]←X, ⍵[1]←y, ⍵[2]←split_size
     Xy←(⊃⍵[0]),(⊃⍵[1])
     Xy←randomSampler Xy
     split_point←#.Utils.round (⊃⍵[2])×↑⍴X
     X_train←Xy[⍳split_point;1↓⍴X]
     y_train←Xy[⍳split_point;1↓⍴Xy]
     X_train X_test y_train y_test
 }

