*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0028
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0028.


DATA: gt_scarr TYPE TABLE OF scarr,
      gs_scarr TYPE scarr.

FIELD-SYMBOLS: <gfs_scarr> TYPE scarr.

SELECT * FROM scarr INTO TABLE gt_scarr.

*LOOP AT gt_scarr ASSIGNING <gfs_scarr>.
**  IF  gs_scarr-carrid = 'LH'.
**    gs_scarr-carrname = 'Serdal'.
**    MODIFY gt_scarr FROM gs_scarr.
**  ENDIF.
*
*  IF <gfs_scarr>-carrid = 'LH'.
*     <gfs_scarr>-carrname = 'Serdal'.
*  ENDIF.
*ENDLOOP.

READ TABLE gt_scarr ASSIGNING <gfs_scarr> WITH KEY carrid = 'AB'.
<gfs_scarr>-carrname = 'ffff'.
BREAK-POINT.
