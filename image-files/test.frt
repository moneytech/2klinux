\ a portion of the Forth core test suite
\ (C) 1995 JOHNS HOPKINS UNIVERSITY / APPLIED PHYSICS LABORATORY
\ MAY BE DISTRIBUTED FREELY AS LONG AS THIS COPYRIGHT NOTICE REMAINS.
CREATE ACTUAL-RESULTS $20 CELLS ALLOT
VARIABLE ACTUAL-DEPTH
VARIABLE START-DEPTH
VARIABLE ERROR-XT

: EMPTY-STACK S0 SP! ;
: ERROR ERROR-XT @ EXECUTE ;
: ERROR1 TYPE CR EMPTY-STACK ABORT ;
' ERROR1 ERROR-XT !

: T{ DEPTH START-DEPTH ! ;
: ->
  DEPTH DUP ACTUAL-DEPTH !
  START-DEPTH @ - 0 ?DO
    ACTUAL-RESULTS I CELLS + !
  LOOP
;

: }T
  DEPTH ACTUAL-DEPTH @ = IF
    DEPTH START-DEPTH @ - 0 ?DO
      ACTUAL-RESULTS I CELLS + @
      <> IF
        S" INCORRECT RESULT" ERROR LEAVE
      THEN
    LOOP
  ELSE
    S" WRONG NUMBER OF RESULTS" ERROR
  THEN
;

: TESTING
  ." TESTING"
  BEGIN
    KEY DUP NL <>
  WHILE
    EMIT
  REPEAT
  DROP
  CR
;

CONCLUDE" CORETEST.FRT"
