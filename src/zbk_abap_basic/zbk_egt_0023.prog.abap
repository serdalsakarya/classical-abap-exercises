*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0023
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBK_EGT_0023.


data: gt_scarr type TABLE OF scarr,
      gs_scarr TYPE scarr,
      gv_currcode TYPE S_CURRCODE.
*
*select * from scarr into table gt_scarr where carrid = 'AC'.
*
*  read table gt_scarr into gs_scarr INDEX 1.
*
*  write: |sonuc: { gs_scarr-currcode }|.


*select single * from scarr into gs_scarr where carrid = 'AC'.
*
*  write: |sonuc: { gs_scarr-currcode }|.

select single currcode from scarr into gv_currcode where carrid = 'AC'.

  write: |sonuc: { gv_currcode }|.
