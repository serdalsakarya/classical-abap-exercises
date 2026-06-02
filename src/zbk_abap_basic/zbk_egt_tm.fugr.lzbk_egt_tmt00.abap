*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZBK_EGT_PERSL...................................*
DATA:  BEGIN OF STATUS_ZBK_EGT_PERSL                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZBK_EGT_PERSL                 .
CONTROLS: TCTRL_ZBK_EGT_PERSL
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: ZBK_PERS_T......................................*
DATA:  BEGIN OF STATUS_ZBK_PERS_T                    .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZBK_PERS_T                    .
CONTROLS: TCTRL_ZBK_PERS_T
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZBK_EGT_PERSL                 .
TABLES: *ZBK_PERS_T                    .
TABLES: ZBK_EGT_PERSL                  .
TABLES: ZBK_PERS_T                     .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
