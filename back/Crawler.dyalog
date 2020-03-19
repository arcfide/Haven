﻿:Namespace Crawler
(⎕IO ⎕ML ⎕WX)←0 1 3

 prep∆pre←'\<pre ' '\<pre\>'⎕R'&xml:space="preserve" ' '<pre xml:space="preserve">'
 doc∆path←{(≢#.DOCROOT)↓⍵}
 flare∆body←{cleanse∆madcap ⍉(⊢-⊃)@0⍉⍵↓⍨⍵[;1]⍳⊂'body'}
 flare∆heading←{⊃{⍺,' ',⍵}⌿(⍵ subtree 1+⍵[;1]⍳⊂'body')[;2]~⊂''}
 fst∆node←{⍵[1+⍵[;1]⍳⊂'body';]}
 get∆html←{⎕XML prep∆pre ⊃⎕NGET ⍵}
 keywords←{(,¨⎕A)~⍨{⍵[⍋⍵]}t⊆⍨(t←ucase ⍵)∊⎕A,''''}
 strip∆fst←{(1↑⍵)⍪{⍵⌿⍨~1,∧⍀1↓⍵[;0]>⊃⍵}1↓⍵}
 subtree←{⍺⌿⍨⍵=(⍸⍺[⍵;0]≥⍺[;0])⍸⍳≢⍺}
 summary←{'<p>',(320↑⊃{⍺,' ',⍵}⌿⍵[;2]~⊂''),'</p>'}
 tree∆txt←{⊃{⍺,' ',⍵}⌿(⊂''),⍵[;2]~⊂''}
 ucase←{1(819⌶)⍵}
 walk←{⍺←1 ⋄ ⊃(⎕NINFO⍠('Wildcard' 1)('Recurse'⍺))⍵}
 xml∆sanity←{(,¨'&<>')⎕R'\&amp;' '\&lt;' '\&gt;'⊢⍵}

 cleanse∆madcap←{mc∆footnote mc∆equation mc∆keyword ⍵}
 mc∆keyword←{⍵⌿⍨~⍵[;1]∊⊂'MadCap:keyword'}
 mc∆equation←{{⍉(⊂'div')@1⊢(⊂⍉⍪'class' 'equation')@3⍉⍵}@(⍸⍵[;1]∊⊂'MadCap:equation')⊢⍵}
 mc∆footnote←{i←⍸⍵[;1]∊⊂'MadCap:footnote'
  {⍉(⊂'span')@1⊢(⊂⍉⍪'class' 'footnote')@3{' [Note: ',⍵,'] '}¨@2⍉⍵}@i⊢⍵}
   
 parse∆flare←{good←'h2' 'h3' 'h4' 'div' 'tbl'
   body←flare∆body ⍵ ⋄ keys←keywords tree∆txt ⍵ ⋄ path←doc∆path ⍺
   (fst∆node ⍵)[1]∊good:⍉⍪path(flare∆heading ⍵)(summary body)(strip∆fst body)'doc' keys
   0 6⍴⊂''}

∇ topics←BUILD∆FLARE store;topics;dirs
  dirs←'DotNet' 'GUI' 'InterfaceGuide' 'Language' 'MiscPages' 'UNIX_IUG' 'UserGuide'
  dirs←(#.DOCROOT,'17.1\apl_core_release_specific\Core\Content\')∘,¨dirs,¨'\'
  topics←⊃⍪⌿parse∆flare/{⍵,⍪get∆html¨⍵}⊃⍪/walk¨dirs,¨⊂'*.htm'
  (topics⍪⍨⎕FREAD store 1)⎕FREPLACE store 1
∇

∇ topics←BUILD∆QUICKREF store;files;data;heads;bodies;summaries
  files←'17.1\apl_core_release_specific\Core\Content\Language\Language Bar\*.htm'
  files←walk #.DOCROOT,files
  data←get∆html¨files
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
