:Namespace Haven
⍝ === VARIABLES ===

INVALID∆TOPIC←'Invalid Topic' '<p>Sorry, this is not a valid topic.</p>'


⍝ === End of variables definition ===

(⎕IO ⎕ML ⎕WX)←0 1 3

 build∆idx←{kw←keywords¨⍵[;1] ⋄ ks←∪{⍵[⍋⍵]}⊃⍪⌿kw ⋄ ti←(≢ks)⍴⊂⍬ ⋄ ki←ks∘⍳ ⋄ _←kw{ti[ki ⍺],←⍵}¨⍳≢kw ⋄ ks ti}

 doc∆path←{(≢#.Make.DOCROOT)↓⍵}

 flare∆body←{⍉(⊢-⊃)@0⍉⍵↓⍨⍵[;1]⍳⊂'body'}

 flare∆heading←{⊃{⍺,' ',⍵}⌿(⍵ subtree⍨1+⍵[;1]⍳⊂'body')[;2]~⊂''}

 fst∆node←{⍵[1+⍵[;1]⍳⊂'body';]}

 keywords←{(,¨⎕A)~⍨{⍵[⍋⍵]}t⊆⍨(t←ucase ⍵)∊⎕A,''''}

 parse∆flare←{(fst∆node ⍵)[1]∊'h2' 'h3' 'h4' 'div' 'tbl':⍉⍪(doc∆path ⍺)(flare∆heading ⍵)(summary b)(b←flare∆body ⍵) ⋄ 0 4⍴⊂''}

 render∆topic←{(≢'<body>')↓(-≢'</body>')↓⎕XML(1↑⍵)⍪{⍵⌿⍨~1,∧⍀1↓⍵[;0]>⊃⍵}1↓⍵}

 search←{i,#.TOPICS[i←∪⊃⍪⌿{⍵[⍋≢¨⍵]}(#.IDX∆DOCS,⊂⍬)[#.IDX∆TERMS⍳keywords ⍵];1 2]}

 subtree←{⍵⌿⍨⍺=(⍸⍵[⍺;0]≥⍵[;0])⍸⍳≢⍵}

 summary←{320↑⊃{⍺,' ',⍵}⌿⍵[;2]~⊂''}

 ucase←{1(819⌶)⍵}

 walk←{⍺←1 ⋄ ⊃(⎕NINFO⍠('Wildcard' 1)('Recurse'⍺))⍵}

∇ BUILD∆FLARE;topics;dirs
 dirs←'DotNet' 'GUI' 'InterfaceGuide' 'Language' 'MiscPages' 'UNIX_IUG' 'UserGuide'
 dirs←(#.Make.DOCROOT,'17.1\apl_core_release_specific\Core\Content\')∘,¨dirs,¨'\'
 topics←topics,⍪{⎕XML⊃⎕NGET ⍵}¨topics←⊃⍪/walk¨dirs,¨⊂'*.htm'
 #.FLARETOPICS←⊃⍪⌿parse∆flare/topics
∇

:Namespace server
(⎕IO ⎕ML ⎕WX)←0 1 3

 search←{↓##.search⊃⍵}

 topic←{3::##.INVALID∆TOPIC ⋄ {⊂##.render∆topic⊃⍵}@1⊢#.TOPICS[⊃⍵;1 3]}

:EndNamespace 
:EndNamespace 
