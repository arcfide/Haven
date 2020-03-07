:Require file://Search.dyalog
:Namespace Server
(⎕IO ⎕ML ⎕WX)←0 1 3

 search←{↓i,#.TOPICS[i←∪⊃⍪⌿{⍵[⍋≢¨⍵]}(#.IDX∆DOCS,⊂⍬)[#.IDX∆TERMS⍳#.Search.keywords ⊃⍵];1 2]}

 topic←{3::'Invalid Topic' '<p>Sorry, this is not a valid topic.</p>'
   {(≢'<body>')↓(-≢'</body>')↓⎕XML ⍵}¨@1⊢#.TOPICS[⊃⍵;1 3]}

:EndNamespace 

