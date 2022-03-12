:Class Logger

    :Field Public Shared SEP←' | '

    ∇ logInfo message
      :Access Public Shared
      'INFO 'show message
    ∇
    

    ∇ logWarn message
      :Access Public Shared
      'WARN 'show message
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
