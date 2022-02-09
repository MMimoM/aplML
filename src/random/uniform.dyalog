 uniform←{
     ⍝⍵[0]←l_bound, ⍵[1]←r_bound, ⍵[2]←n_numbers
     u_0_1←?⍵[2]⍴0
     ⍵[0]+(⍵[1]-⍵[0])×u_0_1
 }
