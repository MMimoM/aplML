:Class ATest
⍝ A simple Testclass: run all 'test_*'-Methoden

    :Field Public Shared LOG_INFO←0
    :Field Public Shared LOG_WARN←1
    :Field Public Shared SEP←' | '

    
    ⍝ @rparm candidat
    ⍝     a subclass of ATest
    ∇ run candidat;method
      :Access Public Shared
      :For method :In candidat.⎕NL ¯3
          :If 'test_'≡5↑method
              logInfo'run ',(⍕candidat),'.',method
              candidat.⍎method
          :EndIf
      :EndFor
    ∇

    ⍝ Compare wit Match ≡
    ⍝ @lparm expected
    ⍝     the expected result
    ⍝ @rparm actual
    ⍝     the acual result
    ∇ expected assertSame actual
      :Access Public Shared
      :If expected≢actual
          logError'expected: ',(⍕expected),'',(⍕actual)
      :EndIf
    ∇


    ∇ logInfo message
      :Access Public Shared
      :If 1≡LOG_INFO
          'INFO 'show message
      :EndIf
    ∇

    ∇ logWarn message
      :Access Public Shared
      :If 1≡LOG_WARN
          'WARN 'show message
      :EndIf
    ∇

    ∇ logError message
      :Access Public Shared
      'ERROR'show message
    ∇

    ∇ level show message
      :Access Private Shared
      ⎕←⍕level SEP(⍕1↑2↓⎕XSI)SEP message
    ∇


:EndClass
