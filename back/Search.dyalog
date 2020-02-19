:Namespace Search
(⎕IO ⎕ML ⎕WX)←0 1 3

 build∆idx←{kw←keywords¨⍵[;1] ⋄ ks←∪{⍵[⍋⍵]}⊃⍪⌿kw ⋄ ti←(≢ks)⍴⊂⍬ ⋄ ki←ks∘⍳ ⋄ _←kw{ti[ki ⍺],←⍵}¨⍳≢kw ⋄ ks ti}
 keywords←{(,¨⎕A)~⍨{⍵[⍋⍵]}t⊆⍨(t←ucase ⍵)∊⎕A,''''}
 ucase←{1(819⌶)⍵}

:EndNamespace 
