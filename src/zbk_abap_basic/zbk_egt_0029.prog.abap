*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0029
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBK_EGT_0029.
tables: scarr.
data: gs_scarr TYPE scarr.

SELECT * from scarr where currcode = 'EUR'. "into gs_scarr.
  write: / scarr.
  ENDSELECT.
