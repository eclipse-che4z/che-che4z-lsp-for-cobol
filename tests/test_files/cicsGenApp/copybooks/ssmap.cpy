       01  SSMAPC1I.                                                            
           02  FILLER PIC X(12).                                                
           02  ENT1CNOL    COMP  PIC  S9(4).                                    
           02  ENT1CNOF    PICTURE X.                                           
           02  FILLER REDEFINES ENT1CNOF.                                       
             03 ENT1CNOA    PICTURE X.                                          
           02  ENT1CNOI  PIC X(10).                                             
           02  ENT1FNAL    COMP  PIC  S9(4).                                    
           02  ENT1FNAF    PICTURE X.                                           
           02  FILLER REDEFINES ENT1FNAF.                                       
             03 ENT1FNAA    PICTURE X.                                          
           02  ENT1FNAI  PIC X(10).                                             
           02  ENT1LNAL    COMP  PIC  S9(4).                                    
           02  ENT1LNAF    PICTURE X.                                           
           02  FILLER REDEFINES ENT1LNAF.                                       
             03 ENT1LNAA    PICTURE X.                                          
           02  ENT1LNAI  PIC X(20).                                             
           02  ENT1DOBL    COMP  PIC  S9(4).                                    
           02  ENT1DOBF    PICTURE X.                                           
           02  FILLER REDEFINES ENT1DOBF.                                       
             03 ENT1DOBA    PICTURE X.                                          
           02  ENT1DOBI  PIC X(10).                                             
           02  ENT1HNML    COMP  PIC  S9(4).                                    
           02  ENT1HNMF    PICTURE X.                                           
           02  FILLER REDEFINES ENT1HNMF.                                       
             03 ENT1HNMA    PICTURE X.                                          
           02  ENT1HNMI  PIC X(20).                                             
           02  ENT1HNOL    COMP  PIC  S9(4).                                    
           02  ENT1HNOF    PICTURE X.                                           
           02  FILLER REDEFINES ENT1HNOF.                                       
             03 ENT1HNOA    PICTURE X.                                          
           02  ENT1HNOI  PIC X(4).                                              
           02  ENT1HPCL    COMP  PIC  S9(4).                                    
           02  ENT1HPCF    PICTURE X.                                           
           02  FILLER REDEFINES ENT1HPCF.                                       
             03 ENT1HPCA    PICTURE X.                                          
           02  ENT1HPCI  PIC X(8).                                              
           02  ENT1HP1L    COMP  PIC  S9(4).                                    
           02  ENT1HP1F    PICTURE X.                                           
           02  FILLER REDEFINES ENT1HP1F.                                       
             03 ENT1HP1A    PICTURE X.                                          
           02  ENT1HP1I  PIC X(20).                                             
           02  ENT1HP2L    COMP  PIC  S9(4).                                    
           02  ENT1HP2F    PICTURE X.                                           
           02  FILLER REDEFINES ENT1HP2F.                                       
             03 ENT1HP2A    PICTURE X.                                          
           02  ENT1HP2I  PIC X(20).                                             
           02  ENT1HMOL    COMP  PIC  S9(4).                                    
           02  ENT1HMOF    PICTURE X.                                           
           02  FILLER REDEFINES ENT1HMOF.                                       
             03 ENT1HMOA    PICTURE X.                                          
           02  ENT1HMOI  PIC X(27).                                             
           02  ENT1OPTL    COMP  PIC  S9(4).                                    
           02  ENT1OPTF    PICTURE X.                                           
           02  FILLER REDEFINES ENT1OPTF.                                       
             03 ENT1OPTA    PICTURE X.                                          
           02  ENT1OPTI  PIC X(1).                                              
           02  ERRFLDL    COMP  PIC  S9(4).                                     
           02  ERRFLDF    PICTURE X.                                            
           02  FILLER REDEFINES ERRFLDF.                                        
             03 ERRFLDA    PICTURE X.                                           
           02  ERRFLDI  PIC X(40).                                              
       01  SSMAPC1O REDEFINES SSMAPC1I.                                         
           02  FILLER PIC X(12).                                                
           02  FILLER PICTURE X(3).                                             
           02  ENT1CNOO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENT1FNAO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENT1LNAO  PIC X(20).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENT1DOBO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENT1HNMO  PIC X(20).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENT1HNOO  PIC X(4).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENT1HPCO  PIC X(8).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENT1HP1O  PIC X(20).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENT1HP2O  PIC X(20).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENT1HMOO  PIC X(27).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENT1OPTO  PIC X(1).                                              
           02  FILLER PICTURE X(3).                                             
           02  ERRFLDO  PIC X(40).                                              
       01  SSMAPP1I.                                                            
           02  FILLER PIC X(12).                                                
           02  ENP1PNOL    COMP  PIC  S9(4).                                    
           02  ENP1PNOF    PICTURE X.                                           
           02  FILLER REDEFINES ENP1PNOF.                                       
             03 ENP1PNOA    PICTURE X.                                          
           02  ENP1PNOI  PIC X(10).                                             
           02  ENP1CNOL    COMP  PIC  S9(4).                                    
           02  ENP1CNOF    PICTURE X.                                           
           02  FILLER REDEFINES ENP1CNOF.                                       
             03 ENP1CNOA    PICTURE X.                                          
           02  ENP1CNOI  PIC X(10).                                             
           02  ENP1IDAL    COMP  PIC  S9(4).                                    
           02  ENP1IDAF    PICTURE X.                                           
           02  FILLER REDEFINES ENP1IDAF.                                       
             03 ENP1IDAA    PICTURE X.                                          
           02  ENP1IDAI  PIC X(10).                                             
           02  ENP1EDAL    COMP  PIC  S9(4).                                    
           02  ENP1EDAF    PICTURE X.                                           
           02  FILLER REDEFINES ENP1EDAF.                                       
             03 ENP1EDAA    PICTURE X.                                          
           02  ENP1EDAI  PIC X(10).                                             
           02  ENP1CMKL    COMP  PIC  S9(4).                                    
           02  ENP1CMKF    PICTURE X.                                           
           02  FILLER REDEFINES ENP1CMKF.                                       
             03 ENP1CMKA    PICTURE X.                                          
           02  ENP1CMKI  PIC X(20).                                             
           02  ENP1CMOL    COMP  PIC  S9(4).                                    
           02  ENP1CMOF    PICTURE X.                                           
           02  FILLER REDEFINES ENP1CMOF.                                       
             03 ENP1CMOA    PICTURE X.                                          
           02  ENP1CMOI  PIC X(20).                                             
           02  ENP1VALL    COMP  PIC  S9(4).                                    
           02  ENP1VALF    PICTURE X.                                           
           02  FILLER REDEFINES ENP1VALF.                                       
             03 ENP1VALA    PICTURE X.                                          
           02  ENP1VALI  PIC X(6).                                              
           02  ENP1REGL    COMP  PIC  S9(4).                                    
           02  ENP1REGF    PICTURE X.                                           
           02  FILLER REDEFINES ENP1REGF.                                       
             03 ENP1REGA    PICTURE X.                                          
           02  ENP1REGI  PIC X(7).                                              
           02  ENP1COLL    COMP  PIC  S9(4).                                    
           02  ENP1COLF    PICTURE X.                                           
           02  FILLER REDEFINES ENP1COLF.                                       
             03 ENP1COLA    PICTURE X.                                          
           02  ENP1COLI  PIC X(8).                                              
           02  ENP1CCL    COMP  PIC  S9(4).                                     
           02  ENP1CCF    PICTURE X.                                            
           02  FILLER REDEFINES ENP1CCF.                                        
             03 ENP1CCA    PICTURE X.                                           
           02  ENP1CCI  PIC X(8).                                               
           02  ENP1MANL    COMP  PIC  S9(4).                                    
           02  ENP1MANF    PICTURE X.                                           
           02  FILLER REDEFINES ENP1MANF.                                       
             03 ENP1MANA    PICTURE X.                                          
           02  ENP1MANI  PIC X(10).                                             
           02  ENP1ACCL    COMP  PIC  S9(4).                                    
           02  ENP1ACCF    PICTURE X.                                           
           02  FILLER REDEFINES ENP1ACCF.                                       
             03 ENP1ACCA    PICTURE X.                                          
           02  ENP1ACCI  PIC X(6).                                              
           02  ENP1PREL    COMP  PIC  S9(4).                                    
           02  ENP1PREF    PICTURE X.                                           
           02  FILLER REDEFINES ENP1PREF.                                       
             03 ENP1PREA    PICTURE X.                                          
           02  ENP1PREI  PIC X(6).                                              
           02  ENP1OPTL    COMP  PIC  S9(4).                                    
           02  ENP1OPTF    PICTURE X.                                           
           02  FILLER REDEFINES ENP1OPTF.                                       
             03 ENP1OPTA    PICTURE X.                                          
           02  ENP1OPTI  PIC X(1).                                              
           02  ERP1FLDL    COMP  PIC  S9(4).                                    
           02  ERP1FLDF    PICTURE X.                                           
           02  FILLER REDEFINES ERP1FLDF.                                       
             03 ERP1FLDA    PICTURE X.                                          
           02  ERP1FLDI  PIC X(40).                                             
       01  SSMAPP1O REDEFINES SSMAPP1I.                                         
           02  FILLER PIC X(12).                                                
           02  FILLER PICTURE X(3).                                             
           02  ENP1PNOO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP1CNOO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP1IDAO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP1EDAO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP1CMKO  PIC X(20).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP1CMOO  PIC X(20).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP1VALO  PIC X(6).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP1REGO  PIC X(7).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP1COLO  PIC X(8).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP1CCO  PIC X(8).                                               
           02  FILLER PICTURE X(3).                                             
           02  ENP1MANO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP1ACCO  PIC X(6).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP1PREO  PIC X(6).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP1OPTO  PIC X(1).                                              
           02  FILLER PICTURE X(3).                                             
           02  ERP1FLDO  PIC X(40).                                             
       01  SSMAPP2I.                                                            
           02  FILLER PIC X(12).                                                
           02  ENP2PNOL    COMP  PIC  S9(4).                                    
           02  ENP2PNOF    PICTURE X.                                           
           02  FILLER REDEFINES ENP2PNOF.                                       
             03 ENP2PNOA    PICTURE X.                                          
           02  ENP2PNOI  PIC X(10).                                             
           02  ENP2CNOL    COMP  PIC  S9(4).                                    
           02  ENP2CNOF    PICTURE X.                                           
           02  FILLER REDEFINES ENP2CNOF.                                       
             03 ENP2CNOA    PICTURE X.                                          
           02  ENP2CNOI  PIC X(10).                                             
           02  ENP2IDAL    COMP  PIC  S9(4).                                    
           02  ENP2IDAF    PICTURE X.                                           
           02  FILLER REDEFINES ENP2IDAF.                                       
             03 ENP2IDAA    PICTURE X.                                          
           02  ENP2IDAI  PIC X(10).                                             
           02  ENP2EDAL    COMP  PIC  S9(4).                                    
           02  ENP2EDAF    PICTURE X.                                           
           02  FILLER REDEFINES ENP2EDAF.                                       
             03 ENP2EDAA    PICTURE X.                                          
           02  ENP2EDAI  PIC X(10).                                             
           02  ENP2FNML    COMP  PIC  S9(4).                                    
           02  ENP2FNMF    PICTURE X.                                           
           02  FILLER REDEFINES ENP2FNMF.                                       
             03 ENP2FNMA    PICTURE X.                                          
           02  ENP2FNMI  PIC X(10).                                             
           02  ENP2TERL    COMP  PIC  S9(4).                                    
           02  ENP2TERF    PICTURE X.                                           
           02  FILLER REDEFINES ENP2TERF.                                       
             03 ENP2TERA    PICTURE X.                                          
           02  ENP2TERI  PIC X(2).                                              
           02  ENP2SUML    COMP  PIC  S9(4).                                    
           02  ENP2SUMF    PICTURE X.                                           
           02  FILLER REDEFINES ENP2SUMF.                                       
             03 ENP2SUMA    PICTURE X.                                          
           02  ENP2SUMI  PIC X(6).                                              
           02  ENP2LIFL    COMP  PIC  S9(4).                                    
           02  ENP2LIFF    PICTURE X.                                           
           02  FILLER REDEFINES ENP2LIFF.                                       
             03 ENP2LIFA    PICTURE X.                                          
           02  ENP2LIFI  PIC X(25).                                             
           02  ENP2WPRL    COMP  PIC  S9(4).                                    
           02  ENP2WPRF    PICTURE X.                                           
           02  FILLER REDEFINES ENP2WPRF.                                       
             03 ENP2WPRA    PICTURE X.                                          
           02  ENP2WPRI  PIC X(1).                                              
           02  ENP2EQUL    COMP  PIC  S9(4).                                    
           02  ENP2EQUF    PICTURE X.                                           
           02  FILLER REDEFINES ENP2EQUF.                                       
             03 ENP2EQUA    PICTURE X.                                          
           02  ENP2EQUI  PIC X(1).                                              
           02  ENP2MANL    COMP  PIC  S9(4).                                    
           02  ENP2MANF    PICTURE X.                                           
           02  FILLER REDEFINES ENP2MANF.                                       
             03 ENP2MANA    PICTURE X.                                          
           02  ENP2MANI  PIC X(1).                                              
           02  ENP2OPTL    COMP  PIC  S9(4).                                    
           02  ENP2OPTF    PICTURE X.                                           
           02  FILLER REDEFINES ENP2OPTF.                                       
             03 ENP2OPTA    PICTURE X.                                          
           02  ENP2OPTI  PIC X(1).                                              
           02  ERP2FLDL    COMP  PIC  S9(4).                                    
           02  ERP2FLDF    PICTURE X.                                           
           02  FILLER REDEFINES ERP2FLDF.                                       
             03 ERP2FLDA    PICTURE X.                                          
           02  ERP2FLDI  PIC X(40).                                             
       01  SSMAPP2O REDEFINES SSMAPP2I.                                         
           02  FILLER PIC X(12).                                                
           02  FILLER PICTURE X(3).                                             
           02  ENP2PNOO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP2CNOO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP2IDAO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP2EDAO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP2FNMO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP2TERO  PIC X(2).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP2SUMO  PIC X(6).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP2LIFO  PIC X(25).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP2WPRO  PIC X(1).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP2EQUO  PIC X(1).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP2MANO  PIC X(1).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP2OPTO  PIC X(1).                                              
           02  FILLER PICTURE X(3).                                             
           02  ERP2FLDO  PIC X(40).                                             
       01  SSMAPP3I.                                                            
           02  FILLER PIC X(12).                                                
           02  ENP3PNOL    COMP  PIC  S9(4).                                    
           02  ENP3PNOF    PICTURE X.                                           
           02  FILLER REDEFINES ENP3PNOF.                                       
             03 ENP3PNOA    PICTURE X.                                          
           02  ENP3PNOI  PIC X(10).                                             
           02  ENP3CNOL    COMP  PIC  S9(4).                                    
           02  ENP3CNOF    PICTURE X.                                           
           02  FILLER REDEFINES ENP3CNOF.                                       
             03 ENP3CNOA    PICTURE X.                                          
           02  ENP3CNOI  PIC X(10).                                             
           02  ENP3IDAL    COMP  PIC  S9(4).                                    
           02  ENP3IDAF    PICTURE X.                                           
           02  FILLER REDEFINES ENP3IDAF.                                       
             03 ENP3IDAA    PICTURE X.                                          
           02  ENP3IDAI  PIC X(10).                                             
           02  ENP3EDAL    COMP  PIC  S9(4).                                    
           02  ENP3EDAF    PICTURE X.                                           
           02  FILLER REDEFINES ENP3EDAF.                                       
             03 ENP3EDAA    PICTURE X.                                          
           02  ENP3EDAI  PIC X(10).                                             
           02  ENP3TYPL    COMP  PIC  S9(4).                                    
           02  ENP3TYPF    PICTURE X.                                           
           02  FILLER REDEFINES ENP3TYPF.                                       
             03 ENP3TYPA    PICTURE X.                                          
           02  ENP3TYPI  PIC X(15).                                             
           02  ENP3BEDL    COMP  PIC  S9(4).                                    
           02  ENP3BEDF    PICTURE X.                                           
           02  FILLER REDEFINES ENP3BEDF.                                       
             03 ENP3BEDA    PICTURE X.                                          
           02  ENP3BEDI  PIC X(3).                                              
           02  ENP3VALL    COMP  PIC  S9(4).                                    
           02  ENP3VALF    PICTURE X.                                           
           02  FILLER REDEFINES ENP3VALF.                                       
             03 ENP3VALA    PICTURE X.                                          
           02  ENP3VALI  PIC X(8).                                              
           02  ENP3HNML    COMP  PIC  S9(4).                                    
           02  ENP3HNMF    PICTURE X.                                           
           02  FILLER REDEFINES ENP3HNMF.                                       
             03 ENP3HNMA    PICTURE X.                                          
           02  ENP3HNMI  PIC X(20).                                             
           02  ENP3HNOL    COMP  PIC  S9(4).                                    
           02  ENP3HNOF    PICTURE X.                                           
           02  FILLER REDEFINES ENP3HNOF.                                       
             03 ENP3HNOA    PICTURE X.                                          
           02  ENP3HNOI  PIC X(4).                                              
           02  ENP3HPCL    COMP  PIC  S9(4).                                    
           02  ENP3HPCF    PICTURE X.                                           
           02  FILLER REDEFINES ENP3HPCF.                                       
             03 ENP3HPCA    PICTURE X.                                          
           02  ENP3HPCI  PIC X(8).                                              
           02  ENP3OPTL    COMP  PIC  S9(4).                                    
           02  ENP3OPTF    PICTURE X.                                           
           02  FILLER REDEFINES ENP3OPTF.                                       
             03 ENP3OPTA    PICTURE X.                                          
           02  ENP3OPTI  PIC X(1).                                              
           02  ERP3FLDL    COMP  PIC  S9(4).                                    
           02  ERP3FLDF    PICTURE X.                                           
           02  FILLER REDEFINES ERP3FLDF.                                       
             03 ERP3FLDA    PICTURE X.                                          
           02  ERP3FLDI  PIC X(40).                                             
       01  SSMAPP3O REDEFINES SSMAPP3I.                                         
           02  FILLER PIC X(12).                                                
           02  FILLER PICTURE X(3).                                             
           02  ENP3PNOO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP3CNOO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP3IDAO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP3EDAO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP3TYPO  PIC X(15).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP3BEDO  PIC X(3).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP3VALO  PIC X(8).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP3HNMO  PIC X(20).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP3HNOO  PIC X(4).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP3HPCO  PIC X(8).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP3OPTO  PIC X(1).                                              
           02  FILLER PICTURE X(3).                                             
           02  ERP3FLDO  PIC X(40).                                             
       01  SSMAPP4I.                                                            
           02  FILLER PIC X(12).                                                
           02  ENP4PNOL    COMP  PIC  S9(4).                                    
           02  ENP4PNOF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4PNOF.                                       
             03 ENP4PNOA    PICTURE X.                                          
           02  ENP4PNOI  PIC X(10).                                             
           02  ENP4CNOL    COMP  PIC  S9(4).                                    
           02  ENP4CNOF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4CNOF.                                       
             03 ENP4CNOA    PICTURE X.                                          
           02  ENP4CNOI  PIC X(10).                                             
           02  ENP4IDAL    COMP  PIC  S9(4).                                    
           02  ENP4IDAF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4IDAF.                                       
             03 ENP4IDAA    PICTURE X.                                          
           02  ENP4IDAI  PIC X(10).                                             
           02  ENP4EDAL    COMP  PIC  S9(4).                                    
           02  ENP4EDAF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4EDAF.                                       
             03 ENP4EDAA    PICTURE X.                                          
           02  ENP4EDAI  PIC X(10).                                             
           02  ENP4ADDL    COMP  PIC  S9(4).                                    
           02  ENP4ADDF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4ADDF.                                       
             03 ENP4ADDA    PICTURE X.                                          
           02  ENP4ADDI  PIC X(25).                                             
           02  ENP4HPCL    COMP  PIC  S9(4).                                    
           02  ENP4HPCF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4HPCF.                                       
             03 ENP4HPCA    PICTURE X.                                          
           02  ENP4HPCI  PIC X(8).                                              
           02  ENP4LATL    COMP  PIC  S9(4).                                    
           02  ENP4LATF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4LATF.                                       
             03 ENP4LATA    PICTURE X.                                          
           02  ENP4LATI  PIC X(11).                                             
           02  ENP4LONL    COMP  PIC  S9(4).                                    
           02  ENP4LONF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4LONF.                                       
             03 ENP4LONA    PICTURE X.                                          
           02  ENP4LONI  PIC X(11).                                             
           02  ENP4CUSL    COMP  PIC  S9(4).                                    
           02  ENP4CUSF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4CUSF.                                       
             03 ENP4CUSA    PICTURE X.                                          
           02  ENP4CUSI  PIC X(25).                                             
           02  ENP4PTYL    COMP  PIC  S9(4).                                    
           02  ENP4PTYF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4PTYF.                                       
             03 ENP4PTYA    PICTURE X.                                          
           02  ENP4PTYI  PIC X(25).                                             
           02  ENP4FPEL    COMP  PIC  S9(4).                                    
           02  ENP4FPEF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4FPEF.                                       
             03 ENP4FPEA    PICTURE X.                                          
           02  ENP4FPEI  PIC X(4).                                              
           02  ENP4FPRL    COMP  PIC  S9(4).                                    
           02  ENP4FPRF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4FPRF.                                       
             03 ENP4FPRA    PICTURE X.                                          
           02  ENP4FPRI  PIC X(8).                                              
           02  ENP4CPEL    COMP  PIC  S9(4).                                    
           02  ENP4CPEF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4CPEF.                                       
             03 ENP4CPEA    PICTURE X.                                          
           02  ENP4CPEI  PIC X(4).                                              
           02  ENP4CPRL    COMP  PIC  S9(4).                                    
           02  ENP4CPRF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4CPRF.                                       
             03 ENP4CPRA    PICTURE X.                                          
           02  ENP4CPRI  PIC X(8).                                              
           02  ENP4XPEL    COMP  PIC  S9(4).                                    
           02  ENP4XPEF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4XPEF.                                       
             03 ENP4XPEA    PICTURE X.                                          
           02  ENP4XPEI  PIC X(4).                                              
           02  ENP4XPRL    COMP  PIC  S9(4).                                    
           02  ENP4XPRF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4XPRF.                                       
             03 ENP4XPRA    PICTURE X.                                          
           02  ENP4XPRI  PIC X(8).                                              
           02  ENP4WPEL    COMP  PIC  S9(4).                                    
           02  ENP4WPEF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4WPEF.                                       
             03 ENP4WPEA    PICTURE X.                                          
           02  ENP4WPEI  PIC X(4).                                              
           02  ENP4WPRL    COMP  PIC  S9(4).                                    
           02  ENP4WPRF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4WPRF.                                       
             03 ENP4WPRA    PICTURE X.                                          
           02  ENP4WPRI  PIC X(8).                                              
           02  ENP4STAL    COMP  PIC  S9(4).                                    
           02  ENP4STAF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4STAF.                                       
             03 ENP4STAA    PICTURE X.                                          
           02  ENP4STAI  PIC X(4).                                              
           02  ENP4REJL    COMP  PIC  S9(4).                                    
           02  ENP4REJF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4REJF.                                       
             03 ENP4REJA    PICTURE X.                                          
           02  ENP4REJI  PIC X(25).                                             
           02  ENP4OPTL    COMP  PIC  S9(4).                                    
           02  ENP4OPTF    PICTURE X.                                           
           02  FILLER REDEFINES ENP4OPTF.                                       
             03 ENP4OPTA    PICTURE X.                                          
           02  ENP4OPTI  PIC X(1).                                              
           02  ERP4FLDL    COMP  PIC  S9(4).                                    
           02  ERP4FLDF    PICTURE X.                                           
           02  FILLER REDEFINES ERP4FLDF.                                       
             03 ERP4FLDA    PICTURE X.                                          
           02  ERP4FLDI  PIC X(40).                                             
       01  SSMAPP4O REDEFINES SSMAPP4I.                                         
           02  FILLER PIC X(12).                                                
           02  FILLER PICTURE X(3).                                             
           02  ENP4PNOO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP4CNOO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP4IDAO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP4EDAO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP4ADDO  PIC X(25).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP4HPCO  PIC X(8).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP4LATO  PIC X(11).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP4LONO  PIC X(11).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP4CUSO  PIC X(25).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP4PTYO  PIC X(25).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP4FPEO  PIC X(4).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP4FPRO  PIC X(8).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP4CPEO  PIC X(4).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP4CPRO  PIC X(8).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP4XPEO  PIC X(4).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP4XPRO  PIC X(8).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP4WPEO  PIC X(4).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP4WPRO  PIC X(8).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP4STAO  PIC X(4).                                              
           02  FILLER PICTURE X(3).                                             
           02  ENP4REJO  PIC X(25).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP4OPTO  PIC X(1).                                              
           02  FILLER PICTURE X(3).                                             
           02  ERP4FLDO  PIC X(40).                                             
       01  SSMAPP5I.                                                            
           02  FILLER PIC X(12).                                                
           02  ENP5LNOL    COMP  PIC  S9(4).                                    
           02  ENP5LNOF    PICTURE X.                                           
           02  FILLER REDEFINES ENP5LNOF.                                       
             03 ENP5LNOA    PICTURE X.                                          
           02  ENP5LNOI  PIC X(10).                                             
           02  ENP5PNOL    COMP  PIC  S9(4).                                    
           02  ENP5PNOF    PICTURE X.                                           
           02  FILLER REDEFINES ENP5PNOF.                                       
             03 ENP5PNOA    PICTURE X.                                          
           02  ENP5PNOI  PIC X(10).                                             
           02  ENP5CNOL    COMP  PIC  S9(4).                                    
           02  ENP5CNOF    PICTURE X.                                           
           02  FILLER REDEFINES ENP5CNOF.                                       
             03 ENP5CNOA    PICTURE X.                                          
           02  ENP5CNOI  PIC X(10).                                             
           02  ENP5CDAL    COMP  PIC  S9(4).                                    
           02  ENP5CDAF    PICTURE X.                                           
           02  FILLER REDEFINES ENP5CDAF.                                       
             03 ENP5CDAA    PICTURE X.                                          
           02  ENP5CDAI  PIC X(10).                                             
           02  ENP5PADL    COMP  PIC  S9(4).                                    
           02  ENP5PADF    PICTURE X.                                           
           02  FILLER REDEFINES ENP5PADF.                                       
             03 ENP5PADA    PICTURE X.                                          
           02  ENP5PADI  PIC X(10).                                             
           02  ENP5VALL    COMP  PIC  S9(4).                                    
           02  ENP5VALF    PICTURE X.                                           
           02  FILLER REDEFINES ENP5VALF.                                       
             03 ENP5VALA    PICTURE X.                                          
           02  ENP5VALI  PIC X(10).                                             
           02  ENP5CAUL    COMP  PIC  S9(4).                                    
           02  ENP5CAUF    PICTURE X.                                           
           02  FILLER REDEFINES ENP5CAUF.                                       
             03 ENP5CAUA    PICTURE X.                                          
           02  ENP5CAUI  PIC X(25).                                             
           02  ENP5OBSL    COMP  PIC  S9(4).                                    
           02  ENP5OBSF    PICTURE X.                                           
           02  FILLER REDEFINES ENP5OBSF.                                       
             03 ENP5OBSA    PICTURE X.                                          
           02  ENP5OBSI  PIC X(25).                                             
           02  ENP5OPTL    COMP  PIC  S9(4).                                    
           02  ENP5OPTF    PICTURE X.                                           
           02  FILLER REDEFINES ENP5OPTF.                                       
             03 ENP5OPTA    PICTURE X.                                          
           02  ENP5OPTI  PIC X(1).                                              
           02  ERP5FLDL    COMP  PIC  S9(4).                                    
           02  ERP5FLDF    PICTURE X.                                           
           02  FILLER REDEFINES ERP5FLDF.                                       
             03 ERP5FLDA    PICTURE X.                                          
           02  ERP5FLDI  PIC X(40).                                             
       01  SSMAPP5O REDEFINES SSMAPP5I.                                         
           02  FILLER PIC X(12).                                                
           02  FILLER PICTURE X(3).                                             
           02  ENP5LNOO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP5PNOO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP5CNOO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP5CDAO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP5PADO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP5VALO  PIC X(10).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP5CAUO  PIC X(25).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP5OBSO  PIC X(25).                                             
           02  FILLER PICTURE X(3).                                             
           02  ENP5OPTO  PIC X(1).                                              
           02  FILLER PICTURE X(3).                                             
           02  ERP5FLDO  PIC X(40).                                             
