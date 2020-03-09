:Namespace Make
(⎕IO ⎕ML ⎕WX)←0 1 3

∇ CRAWL
 LOAD∆CONFIG
 ⎕←'Initializing store...'
 ⎕←'tie←#.Search.INIT∆STORE STORE'
 tie←#.Search.INIT∆STORE STORE
 ⎕←'Crawling quick reference...'
 ⎕←'topics⍪←#.Crawler.BUILD∆QUICKREF tie'
 topics←#.Crawler.BUILD∆QUICKREF tie
 ⎕←'Building APLCart...'
 ⎕←'topics⍪←#.Crawler.BUILD∆APLCART tie'
 topics⍪←#.Crawler.BUILD∆APLCART tie
 ⎕←'Crawling documentation...'
 ⎕←'topics←#.Crawler.BUILD∆FLARE tie'
 topics⍪←#.Crawler.BUILD∆FLARE tie
 ⎕←'There are',(≢topics),'topics.'
 ⎕←'Building search index...'
 ⎕←'tie #.Search.BUILD∆IDX topics'
 tie #.Search.BUILD∆IDX topics
 ⎕←'Done. Cleaning up and exiting...'
 ⎕FUNTIE tie
 ⎕OFF
∇

∇ LAUNCH
 LOAD∆CONFIG
 #.Search.LOAD∆STORE STORE
 ⎕SE.SALT.Load JARVIS,'Source\Jarvis -target=#'
 #.srv←⎕NEW #.Jarvis
 #.srv.CodeLocation←#.Server
 #.srv.Start
∇

∇ LOAD∆CONFIG
 CONFIG←(1↓⎕XML⊃⎕NGET'.\config.xml')[;1 2]
 DOCROOT JARVIS STORE←CONFIG[;1][CONFIG[;0]⍳'docroot' 'jarvis' 'datastore']
 #.DOCROOT←DOCROOT
∇

:EndNamespace 
