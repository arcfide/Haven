:Namespace Make
(⎕IO ⎕ML ⎕WX)←0 1 3

∇ BUILD
 LOAD∆CONFIG
 #.Crawler.BUILD∆FLARE
 #.(TOPICS←FLARETOPICS)
 #.(IDX∆TERMS IDX∆DOCS)←#.(Search.build∆idx TOPICS)
 ⎕SE.SALT.Load JARVIS,'Source\Jarvis -target=#'
∇

∇ LAUNCH
 #.srv←⎕NEW #.Jarvis
 #.srv.CodeLocation←#.Server
 #.srv.Start
∇

∇ LOAD∆CONFIG
 CONFIG←(1↓⎕XML⊃⎕NGET'.\config.xml')[;1 2]
 DOCROOT JARVIS←CONFIG[;1][CONFIG[;0]⍳'docroot' 'jarvis']
 #.DOCROOT←DOCROOT
∇

:EndNamespace 
