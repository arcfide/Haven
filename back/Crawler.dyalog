:Require file://Search.dyalog
:Namespace Crawler
(⎕IO ⎕ML ⎕WX)←0 1 3

 keywords←#.Search.keywords
 ucase←#.Search.ucase
 doc∆path←{(≢#.DOCROOT)↓⍵}
 flare∆body←{⍉(⊢-⊃)@0⍉⍵↓⍨⍵[;1]⍳⊂'body'}
 flare∆heading←{⊃{⍺,' ',⍵}⌿(⍵ subtree 1+⍵[;1]⍳⊂'body')[;2]~⊂''}
 fst∆node←{⍵[1+⍵[;1]⍳⊂'body';]}
 strip∆fst←{(1↑⍵)⍪{⍵⌿⍨~1,∧⍀1↓⍵[;0]>⊃⍵}1↓⍵}
 subtree←{⍺⌿⍨⍵=(⍸⍺[⍵;0]≥⍺[;0])⍸⍳≢⍺}
 summary←{'<p>',(320↑⊃{⍺,' ',⍵}⌿⍵[;2]~⊂''),'</p>'}
 walk←{⍺←1 ⋄ ⊃(⎕NINFO⍠('Wildcard' 1)('Recurse'⍺))⍵}

 parse∆flare←{good←'h2' 'h3' 'h4' 'div' 'tbl'
   (fst∆node ⍵)[1]∊good:⍉⍪(doc∆path ⍺)(flare∆heading ⍵)(summary b)(strip∆fst⊢b←flare∆body ⍵)
   0 4⍴⊂''}

∇ topics←BUILD∆FLARE store;topics;dirs
 dirs←'DotNet' 'GUI' 'InterfaceGuide' 'Language' 'MiscPages' 'UNIX_IUG' 'UserGuide'
 dirs←(#.DOCROOT,'17.1\apl_core_release_specific\Core\Content\')∘,¨dirs,¨'\'
 topics←⊃⍪⌿parse∆flare/{⍵,⍪{⎕XML⊃⎕NGET ⍵}¨⍵}⊃⍪/walk¨dirs,¨⊂'*.htm'
 (topics⍪⍨⎕FREAD store 1)⎕FREPLACE store 1
∇

∇ topics←BUILD∆QUICKREF store;files;data;heads;bodies;summaries
 files←walk #.DOCROOT,'17.1\apl_core_release_specific\Core\Content\Language\Language Bar\*.htm'
 data←{⎕XML⊃⎕NGET ⍵}¨files
 heads←{⊃{⍺,' ',⍵}⌿(⍵ subtree ⍵[;1]⍳⊂'head')[;2]}¨data
 bodies←flare∆body¨data
 summaries←{'<pre>',(2⊃fst∆node ⍵),'</pre>'}¨bodies
 topics←(doc∆path¨files),heads,summaries,⍪bodies
 (topics⍪⍨⎕FREAD store 1)⎕FREPLACE store 1
∇

:EndNamespace 
