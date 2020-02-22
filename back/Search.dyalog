:Namespace Search
(⎕IO ⎕ML ⎕WX)←0 1 3

 keywords←{(,¨⎕A)~⍨{⍵[⍋⍵]}t⊆⍨(t←ucase ⍵)∊⎕A,''''}
 ucase←{1(819⌶)⍵}

∇ tie←INIT∆STORE store
  tie←store ⎕FCREATE 0
  ⍬⎕FAPPEND tie ⍝ 0: Topics
  ⍬⎕FAPPEND tie ⍝ 1: Index Terms
  ⍬⎕FAPPEND tie ⍝ 2: Index Docs
∇

∇ store BUILD∆IDX topics;kw;ks;ti
  ti←(⊂⍬)⍴⍨≢ks←∪{⍵[⍋⍵]}⊃⍪⌿kw←keywords¨topics[;1]
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
