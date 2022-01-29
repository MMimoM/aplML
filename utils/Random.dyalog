:Class Random

    ∇ u_a_b←uniform(l_bound r_bound n_numbers);u_0_1;transformer
      :Access Public
      u_0_1←?n_numbers⍴0
      u_a_b←l_bound+(r_bound-l_bound)×u_0_1
    ∇

    ∇ g_mu_sigma←gaussian(mu sigma n_numbers);x;y
      (x y)←(?n_numbers⍴0)(?n_numbers⍴0)
      g_mu_sigma←(sigma*2)×((¯2×⍟x)*0.5)×1○○2×y+mu
    ∇

:EndClass

