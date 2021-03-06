:Class TestMathtools : ATest


    ∇ test_∆diagonalize;expected
      :Access Public Shared
      expected←⊃(1 0 0)(0 7 0)(0 0 3)
      expected assertSame #.Utils.Mathtools.∆diagonalize 1 7 3
    ∇

    ∇ test_∆identityMatrix;expected
      :Access Public Shared
      expected←1 1⍴1
      expected assertSame #.Utils.Mathtools.∆identityMatrix 1
      expected←⊃(1 0)(0 1)
      expected assertSame #.Utils.Mathtools.∆identityMatrix 2
      expected←⊃(1 0 0)(0 1 0)(0 0 1)
      expected assertSame #.Utils.Mathtools.∆identityMatrix 3
    ∇

    ∇ test_∆round_negativ
      :Access Public Shared
      ¯1 assertSame #.Utils.Mathtools.∆round ¯1.49
      ¯2 assertSame #.Utils.Mathtools.∆round ¯1.5
    ∇

    ∇ test_∆round_positiv
      :Access Public Shared
      1 assertSame #.Utils.Mathtools.∆round 1.49
      2 assertSame #.Utils.Mathtools.∆round 1.5
    ∇

    ∇ test_∆runden_negativ
      :Access Public Shared
      ¯1.7 assertSame 10 #.Utils.Mathtools.∆runden ¯1.749
      ¯1.8 assertSame 10 #.Utils.Mathtools.∆runden ¯1.75
    ∇

    ∇ test_∆runden_positiv
      :Access Public Shared
      1.7 assertSame 10 #.Utils.Mathtools.∆runden 1.749
      1.8 assertSame 10 #.Utils.Mathtools.∆runden 1.75
    ∇

    ∇ test_∆runden_positiv1
      :Access Public Shared
      1.457 assertSame 1000 #.Utils.Mathtools.∆runden 1.45749
      1.458 assertSame 1000 #.Utils.Mathtools.∆runden 1.4575
    ∇

    ∇ test_∆runden_positiv2
      :Access Public Shared
      170 assertSame 0.1 #.Utils.Mathtools.∆runden 174.9
      180 assertSame 0.1 #.Utils.Mathtools.∆runden 175
    ∇

:EndClass
