*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0025
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0025.

*data: gt_scarr TYPE TABLE OF scarr.

*TYPES: BEGIN OF gty_scarr,
**         mandt     TYPE s_mandt,
**         carrid   TYPE s_carr_id,
*         carrname TYPE  s_carrname,
*         currcode4 TYPE  s_currcode,
*         url      TYPE  s_carrurl,
*       END OF gty_scarr.
*
*data: gt_scarr TYPE TABLE OF gty_scarr.
*
*START-OF-SELECTION.
**
**select currcode from scarr into CORRESPONDING FIELDS OF TABLE  gt_scarr.
*
*
*SELECT * from scarr into CORRESPONDING FIELDS OF TABLE gt_scarr.
*
*BREAK-POINT.

TYPES: BEGIN OF gty_type1,
         col1 TYPE char10,
         col2 TYPE char10,
         col3 TYPE char10,
         col4 TYPE char10,
       END OF gty_type1.

TYPES: BEGIN OF gty_type2,
         col2 TYPE char10,
         col3 TYPE char10,
       END OF gty_type2.

DATA: gs_st1 TYPE gty_type1,
      gs_st2 TYPE gty_type2.

gs_st1-col1 ='aaa'.
gs_st1-col2 ='bbb'.
gs_st1-col3 ='ccc'.
gs_st1-col4 ='ddd'.

*gs_st2 = gs_st1.
MOVE-CORRESPONDING gs_st1 to gs_st2.
BREAK-POINT.
