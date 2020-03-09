:Namespace Search
(⎕IO ⎕ML ⎕WX)←0 1 3

∇ tie←INIT∆STORE store
  tie←store ⎕FCREATE 0
  (0 6⍴⍬)⎕FAPPEND tie ⍝ 1: Topics
  ⍬⎕FAPPEND tie ⍝ 2: Index Terms
  ⍬⎕FAPPEND tie ⍝ 3: Index Docs
∇

∇ store BUILD∆IDX topics;kw;ks;ti
  ti←(⊂⍬)⍴⍨≢ks←∪{⍵[⍋⍵]}⊃⍪⌿kw←topics[;5]
  kw(ks∘⍳){ti[⍺⍺ ⍺],←⍵}¨⍳≢kw
  ks ⎕FREPLACE store 2
  ti ⎕FREPLACE store 3
∇

∇ LOAD∆STORE store;tie
  tie←store ⎕FTIE 0
  #.(TOPICS IDX∆TERMS IDX∆DOCS)←{⎕FREAD tie ⍵}¨1+⍳3
  ⎕FUNTIE tie
∇

:EndNamespace 
