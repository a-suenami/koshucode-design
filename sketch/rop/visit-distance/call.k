-*- koshu -*-

call-down : call @'1 -from /caller -to /callee
call-up   : call @'1 -from /callee -to /caller

call : add @from @'1
  | visit-distance ( source CALL /caller /callee )
         -step @from : @to -to /call -distance /n

|== CALL-DOWN  : call-down 'a  --order --table --forward /caller
|== CALL-UP    : call-up   'd  --order --table --forward /callee
