:Class Random

    ∇ u_a_b←uniform(l_bound r_bound n_numbers);u_0_1;transformer
      :Access Public
      u_0_1←?n_numbers⍴0
      transformer←{l_bound+(r_bound-l_bound)×⍵}
      u_a_b←transformer u_0_1
    ∇

:EndClass


