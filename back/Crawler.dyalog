:Namespace Crawler
(⎕IO ⎕ML ⎕WX)←0 1 3

 cleanse∆madcap←{mc∆equation mc∆keyword ⍵}
 doc∆path←{(≢#.DOCROOT)↓⍵}
 flare∆body←{cleanse∆madcap ⍉(⊢-⊃)@0⍉⍵↓⍨⍵[;1]⍳⊂'body'}
 flare∆heading←{⊃{⍺,' ',⍵}⌿(⍵ subtree 1+⍵[;1]⍳⊂'body')[;2]~⊂''}
 fst∆node←{⍵[1+⍵[;1]⍳⊂'body';]}
 keywords←{(,¨⎕A)~⍨{⍵[⍋⍵]}t⊆⍨(t←ucase ⍵)∊⎕A,''''}
 mc∆keyword←{⍵⌿⍨~⍵[;1]∊⊂'MadCap:keyword'}
 mc∆equation←{w⊣w[(⊂¨i,¨3),¨⊂⊂0 0]←⊂'xmlns'⊣w[i←⍸(w←⍵)[;1]∊⊂'MadCap:equation';1]←⊂'math'}
 strip∆fst←{(1↑⍵)⍪{⍵⌿⍨~1,∧⍀1↓⍵[;0]>⊃⍵}1↓⍵}
 subtree←{⍺⌿⍨⍵=(⍸⍺[⍵;0]≥⍺[;0])⍸⍳≢⍺}
 summary←{'<p>',(320↑⊃{⍺,' ',⍵}⌿⍵[;2]~⊂''),'</p>'}
 tree∆txt←{⊃{⍺,' ',⍵}⌿(⊂''),⍵[;2]~⊂''}
 ucase←{1(819⌶)⍵}
 walk←{⍺←1 ⋄ ⊃(⎕NINFO⍠('Wildcard' 1)('Recurse'⍺))⍵}
 xml∆sanity←{(,¨'&<>')⎕R'\&amp;' '\&lt;' '\&gt;'⊢⍵}

 parse∆flare←{good←'h2' 'h3' 'h4' 'div' 'tbl'
   body←flare∆body ⍵ ⋄ keys←keywords tree∆txt ⍵ ⋄ path←doc∆path ⍺
   (fst∆node ⍵)[1]∊good:⍉⍪path(flare∆heading ⍵)(summary body)(strip∆fst body)'doc' keys
   0 6⍴⊂''}

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
  topics←(doc∆path¨files),heads,summaries,bodies,(⊂'quickref'),⍪keywords∘tree∆txt¨data
  (topics⍪⍨⎕FREAD store 1)⎕FREPLACE store 1
∇

∇ topics←BUILD∆APLCART store;path;data;heads;summs;bods;keys
  path←#.DOCROOT,'aplcart\table.tsv'
  data←1↓⎕CSV⍠'Separator'(⎕UCS 9)⍠'QuoteChar' ''⊂path
  heads←'<pre>'∘,¨(xml∆sanity¨data[;0]),¨⊂'</pre>'
  summs←'<p>'∘,¨(xml∆sanity¨data[;1]),¨⊂'</p>'
  bods←⎕XML¨'<body>'∘,¨summs,¨⊂'</body>'
  keys←keywords¨{⍺,' ',⍵}/data[;0 1 6]
  topics←({path,':',⍕⍵}¨1+⍳≢data),heads,summs,bods,(⊂'aplcart'),⍪keys
  (topics⍪⍨⎕FREAD store 1)⎕FREPLACE store 1
∇

:EndNamespace 
