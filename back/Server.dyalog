:Namespace Server
(⎕IO ⎕ML ⎕WX)←0 1 3

 keywords←{(,¨⎕A)~⍨{⍵[⍋⍵]}t⊆⍨(t←ucase ⍵)∊⎕A,''''}
 ucase←{1(819⌶)⍵}

 search←{↓i,#.TOPICS[i←∪⊃⍪⌿{⍵[⍋≢¨⍵]}(#.IDX∆DOCS,⊂⍬)[#.IDX∆TERMS⍳keywords ⊃⍵];1 2]}

 topic←{3::'Invalid Topic' '<p>Sorry, this is not a valid topic.</p>'
   {(≢'<body>')↓(-≢'</body>')↓⎕XML ⍵}¨@1⊢#.TOPICS[⊃⍵;1 3]}

:EndNamespace 

