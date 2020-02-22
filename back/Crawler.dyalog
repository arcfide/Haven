:Require file://Search.dyalog
:Namespace Crawler
(⎕IO ⎕ML ⎕WX)←0 1 3

 keywords←#.Search.keywords
 ucase←#.Search.ucase
 doc∆path←{(≢#.DOCROOT)↓⍵}
 flare∆body←{⍉(⊢-⊃)@0⍉⍵↓⍨⍵[;1]⍳⊂'body'}
 flare∆heading←{⊃{⍺,' ',⍵}⌿(⍵ subtree⍨1+⍵[;1]⍳⊂'body')[;2]~⊂''}
 fst∆node←{⍵[1+⍵[;1]⍳⊂'body';]}
 parse∆flare←{(fst∆node ⍵)[1]∊'h2' 'h3' 'h4' 'div' 'tbl':⍉⍪(doc∆path ⍺)(flare∆heading ⍵)(summary b)(b←flare∆body ⍵) ⋄ 0 4⍴⊂''}
 subtree←{⍵⌿⍨⍺=(⍸⍵[⍺;0]≥⍵[;0])⍸⍳≢⍵}
 summary←{320↑⊃{⍺,' ',⍵}⌿⍵[;2]~⊂''}
 walk←{⍺←1 ⋄ ⊃(⎕NINFO⍠('Wildcard' 1)('Recurse'⍺))⍵}

∇ topics←BUILD∆FLARE store;topics;dirs
 dirs←'DotNet' 'GUI' 'InterfaceGuide' 'Language' 'MiscPages' 'UNIX_IUG' 'UserGuide'
 dirs←(#.DOCROOT,'17.1\apl_core_release_specific\Core\Content\')∘,¨dirs,¨'\'
 topics←topics,⍪{⎕XML⊃⎕NGET ⍵}¨topics←⊃⍪/walk¨dirs,¨⊂'*.htm'
 (topics←⊃⍪⌿parse∆flare/topics)⎕FREPLACE store 1
∇

:EndNamespace 
