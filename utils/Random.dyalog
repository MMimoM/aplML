:Namespace Random
⍝A Namespace for probability distributions

    ⍝ n-normal distributed numbers with mean mu and standard deviation sigma*2
    ∇ r←gaussian(mu sigma n_numbers);x;y
      (x y)←(?n_numbers⍴0)(?n_numbers⍴0)
      r←(sigma*2)×((¯2×⍟x)*0.5)×1○○2×y+mu
    ∇

    ⍝ n-uniformly distributed numbers
    ∇ r←uniform(l_bound r_bound n_numbers);u_0_1
      u_0_1←?n_numbers⍴0
      r←l_bound+(r_bound-l_bound)×u_0_1
    ∇

:EndNamespace
