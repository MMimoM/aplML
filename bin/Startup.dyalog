:Class Startup

    ∇ link;Utils;Test
      :Access Public Shared
      ⎕SE.Link.Create #'C:\Users\Mehya\OneDrive\repos\aplML\src'
     
      ⎕SE.Link.Import #'C:\Users\Mehya\OneDrive\repos\aplML\utils'
     
      ⎕SE.Link.Import #'C:\Users\Mehya\OneDrive\repos\aplML\test'
    ∇


    ∇ linkUtils
      :Access Public Shared
      ⎕SE.Link.Create #'C:\Users\Mehya\OneDrive\repos\aplML\utils'
     
      ⎕SE.Link.Import #'C:\Users\Mehya\OneDrive\repos\aplML\src'
     
      ⎕SE.Link.Import #'C:\Users\Mehya\OneDrive\repos\aplML\test'
    ∇

    ∇ linkTest
      :Access Public Shared
      ⎕SE.Link.Create #'C:\Users\Mehya\OneDrive\repos\aplML\test'
     
      ⎕SE.Link.Import #'C:\Users\Mehya\OneDrive\repos\aplML\src'
     
      ⎕SE.Link.Import #'C:\Users\Mehya\OneDrive\repos\aplML\utils'
    ∇

:EndClass
