:Namespace Make
(⎕IO ⎕ML ⎕WX)←0 1 3

∇ BUILD
 LOAD∆CONFIG
 #.Haven.BUILD∆FLARE
 #.(TOPICS←FLARETOPICS)
 #.(IDX∆TERMS IDX∆DOCS)←#.(Haven.build∆idx TOPICS)
 ⎕SE.SALT.Load JARVIS,'Source\Jarvis -target=#'
∇

∇ CLEAN
 ⎕EX'TOPICS' 'FLARETOPICS' 'IDX∆TERMS' 'IDX∆DOCS' 'Jarvis' 'Conga' 'DRC' 'HttpCommand' 'srv'
∇

∇ LAUNCH
 #.srv←⎕NEW #.Jarvis
 #.srv.CodeLocation←#.Haven.server
 #.srv.Start
∇

∇ LOAD∆CONFIG
 ⎕SE.SALT.Load '.\Haven.dyalog -target=#'
 CONFIG←(1↓⎕XML⊃⎕NGET'.\config.xml')[;1 2]
 DOCROOT JARVIS←CONFIG[;1][CONFIG[;0]⍳'docroot' 'jarvis']
∇

:EndNamespace 
