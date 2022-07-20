:Class TextFrame

    :Field Private m_len
    :Field Private m_documents
    :Field Private encoder
    :Field Private mathtools
    :Field Private logger

    :Field Private m_sequences←⍬
    :Field Private m_tokenized←⍬
    :Field Private m_dictionary←⍬


    ∇ make documents∆
      :Implements Constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
      m_documents←documents∆
     
      ⍝ Entferne alle Leerstrings
      m_documents←{⍵~(⍵[⍸' '≡¨⍵])}m_documents
      m_len←≢m_documents
     
      encoder←#.Utils.Encoder
      mathtools←#.Utils.Mathtools
      logger←#.Utils.Logger
     
      ⍝ Zerlege die Dokumente
      m_tokenized←tokenize'simple'
     
      ⍝ Erzeuge ein Dictionary ueber alle Token
      m_dictionary←createDict m_documents
     
      ⍝ Erzeuge Sequenzen (Inidizematrix)
      __create_sequences__
    ∇



    ∇ make2(documents∆ tokenization_method)
      :Implements Constructor
      :Access Public
      (⎕IO ⎕ML)←(0 3)
       (⎕IO ⎕ML)←(0 3)
      m_documents←documents∆
     
      ⍝ Entferne alle Leerstrings
      m_documents←{⍵~(⍵[⍸' '≡¨⍵])}m_documents
      m_len←≢m_documents
     
      encoder←#.Utils.Encoder
      mathtools←#.Utils.Mathtools
      logger←#.Utils.Logger
     
      ⍝ Zerlege die Dokumente
      m_tokenized←tokenize tokenization_method
     
      ⍝ Erzeuge ein Dictionary ueber alle Token
      m_dictionary←createDict m_documents
     
      ⍝ Erzeuge Sequenzen (Inidizematrix)
      __create_sequences__
    ∇


    ⍝ Dimension des Dataframes
    :Property len
    :Access Public
        ∇ r←get
          r←m_len
        ∇
    :Endproperty


    ⍝ Indize- bzw. Sequenzmatrix
    :Property sequences
    :Access Public
        ∇ r←get
          r←m_sequences
        ∇
    :Endproperty


    :Property dict
    :Access Public
        ∇ r←get
          r←m_dictionary
        ∇
    :Endproperty


    ⍝ Ein einfacher reader fuer .txt Dateien. Liefert einen TextFrame mit der eingelesenen Textdatei.
    ∇ r←readText path∆
      :Access Public Shared
      r←⎕NEW #.Utils.TextFrame(↑⎕NGET path∆ 1)
    ∇


    ∇ writeDict path
      :Access Public
      ⍬
    ∇


    ∇ readDict path
      :Access Public
      ⍬
    ∇


    ∇ r←createDict documents∆;pos;len
      :Access Public
      ⍝ Hole alle unique Token
      r←∪,m_tokenized
     
      ⍝ Anzahl Token
      len←≢r
     
      ⍝ Hole Position des Blanks
      pos←⍸{' '=(↑↑r[⍵])}¨⍳len
     
      ⍝ Setze Blank auf die erste Positon im Vektor
      r←r[pos,((⍳len)~pos)]
     
      r←⎕NEW #.Utils.Dictionary r
    ∇


    ∇ r←lowerCase x
      :Access Public
      r←¯1∘⎕C x
    ∇

    ⍝ Erzeugt eine Matrix mit Index-Eintraegen. Jeder Index hat eine eindeutige Beziehung zu einem Wort.
    ∇ __create_sequences__;unique_words;tokenized
      :Access Private
      m_sequences←(,m_dictionary.keys)⍳m_tokenized
    ∇


    ⍝ Schneidet die Sequencen an >>maxlen<< ab.
    ∇ r←padSequences maxlen
      :Access Public
      r←maxlen↑[1]m_sequences
    ∇


    ⍝ Zerlegt einen String oder einen Nested-Array bestehend aus Strings an dem definierten Trennzeichen >>separator<<
    ∇ {r}←split separator
      :Access Public
      ⍝ Durch das Entpacken ⊃ wird im Falle eines Nested-Arrays eine Wortmatrix generiert.
      r←⊃{separator(≠⊆⊢)(⊃⍵⌷m_documents)}¨⍳m_len

      ⍝ Multiple Blanks werden auf einen Blank reduziert.
      r←mathtools.∆dmb r
    ∇


    ∇ r←tokenize method
      :Access Public
      :Select method
      :Case 'simple'
          r←split' '
      :EndSelect
    ∇


    ∇ r←window(token size)
      :Access Public
      r←⍬
    ∇


    ∇ r←termDocumentMatrix
      :Access Public
      r←⊃{⌈/⍵=m_sequences}¨m_dictionary.values
    ∇


    ∇ r←documentTermMatrix
      :Access Public
      r←⍉⊃{⌈/⍵=m_sequences}¨m_dictionary.values
    ∇


    ∇ r←tfIdf
      :Access Public
      r←⍬
    ∇


    ∇ r←wordCoocuranceMatrix
      :Access Public
      r←⍬
    ∇


    ∇ {r}←get rows∆
      :Access Public
      r←⍬
    ∇


    ∇ {r}←copy rows∆
      :Access Public
      r←⍬
    ∇


    ∇ show rows∆
      :Access Public
      ⍬
    ∇


    ∇ set(rows∆ values∆)
      :Access Public
      ⍬
    ∇


    ∇ head nrows∆
      :Access Public
      ⍪m_documents[⍳nrows∆]
    ∇


    ∇ replace(regex∆ replacement∆)
      :Access Public
      ⍬
    ∇


    ∇ r←index x
      :Access Public
      r←⍬
    ∇


    ∇ bind doc
      :Access Public
      ⍬
    ∇


    ∇ r←unique x
      :Access Public
      r←∪,x
    ∇

    ⍝ Liefert die Haeufigkeit eines Wortes ueber alle Dokumente
    ∇ r←frequency x
      :Access Public
      r←{+/+/⍵=m_sequences}(m_dictionary.getValue x)
    ∇

    ⍝ Liefert die Positionen eines Wortes in der Wortmatrix 
    ∇ r←getPostions x
      :Access Public
      r←{⍸⍵=m_sequences}(m_dictionary.getValue x)
    ∇


:EndClass
