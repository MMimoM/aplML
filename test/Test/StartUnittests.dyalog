:Class StartUnittests
⍝ Start all available Unittests: Take all 'Test_*'-classes
    
    ∇ start;files;class_names;cname
      :Access Public Shared 
      files←⎕SE.SALT.List'C:\Users\Mehya\OneDrive\repos\aplML\test\Test'
      files←#.data.frame files
      class_names←'Name' files.get ⍳files.nrow
      

      :For cname :In class_names
          :If 'Test'≡4↑cname
              #.Test.ATest.run #.Test.⍎cname
          :EndIf
      :EndFor
    ∇

:EndClass
