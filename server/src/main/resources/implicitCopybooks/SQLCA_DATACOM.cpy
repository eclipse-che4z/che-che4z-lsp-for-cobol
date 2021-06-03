          01  SQLCA.
                
                05  SQLCA-EYE-CATCH          PIC X(08).
                
                05  SQLCAID REDEFINES SQLCA-EYE-CATCH
                                        PIC X(08).
                
                05  SQLCA-LEN                PIC S9(9) COMP.
                
                05  SQLCABC REDEFINES SQLCA-LEN
                                        PIC S9(9) COMP.
                
                05  SQLCA-DB-VRS            PIC X(02).
                
                05  SQLCA-DB-RLS            PIC X(02).
                
                05  SQLCA-LUWID             PIC X(08).
                
                05  SQLCA-SQLCODE           PIC S9(9) COMP.
                
                05  SQLCA-ERROR-INFO.
                    10  SQLCA-ERR-LEN       PIC S9(4) COMP.
                    10  SQLCA-ERR-MSG       PIC X(80).
                
                05  SQLERRM REDEFINES SQLCA-ERROR-INFO.
                    10  SQLERRML             PIC S9(4) COMP.
                    10  SQLERRMC             PIC X(70).
                    10  SQLERRMF      PIC X(10).
                
                05  SQLCA-ERROR-PGM          PIC X(08).
                
                05  SQLERRP REDEFINES SQLCA-ERROR-PGM
                                        PIC X(08).
                
                05  SQLCA-FILLER-1           PIC X(02).
                
                05  SQLCA-ERROR-DATA.
                    10  SQLCA-DSFCODE        PIC X(04).
                    10  SQLCA-INFCODE        PIC S9(9) COMP.
                    10  SQLCA-DBCODE.
                   15  SQLCA-DBCODE-EXT PIC X(02).
                   15  SQLCA-DBCODE-INT PIC S9(4) COMP.
                    10  SQLCA-MISC-CODE1     PIC S9(9) COMP.
                    10  SQLCA-MISC-CODES-B.
                   15  SQLCA-MISC-CODE2 PIC S9(9) COMP.
                   15  SQLCA-MISC-CODE3 PIC S9(9) COMP.
                    10  SQLCA-ERR-INFO-2 REDEFINES
                            SQLCA-MISC-CODES-B.
                   15  SQLCA-SQLSTATE   PIC X(05).
                   15  SQLCA-FILLER-2   PIC X(03).
                
                05  SQLCA-WRN-AREA.
                    10  SQLCA-WARNING  PIC X OCCURS 8 TIMES.
                
                05  SQLWARN REDEFINES  SQLCA-WRN-AREA PIC X.
                    10  SQLWARN0             PIC X.
                    10  SQLWARN1             PIC X.
                    10  SQLWARN2             PIC X.
                    10  SQLWARN3             PIC X.
                    10  SQLWARN4             PIC X.
                    10  SQLWARN5             PIC X.
                    10  SQLWARN6             PIC X.
                    10  SQLWARN7             PIC X.
                
                05  SQLCA-PGM-NAME           PIC X(08).
                
                05  SQLCA-AUTHID             PIC X(18).
                
                05  SQLCA-PLAN-NAME          PIC X(18).
