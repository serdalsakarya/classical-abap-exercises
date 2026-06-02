*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0024
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0024.

DATA: gt_scarr TYPE TABLE OF scarr,
      gs_scarr TYPE scarr.

START-OF-SELECTION.

  SELECT * FROM scarr INTO TABLE gt_scarr. " WHERE currcode = 'EUR'.

  READ TABLE gt_scarr INTO gs_scarr WITH KEY currcode = 'EUR' carrid = 'AB'.

  WRITE gs_scarr.

*  LOOP AT gt_scarr INTO gs_scarr WHERE currcode = 'EUR'.
*    WRITE gs_scarr.
*  ENDLOOP.
