*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0007
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0007.

DATA: go_egitim_class TYPE REF TO z_cl_egitim_class.
DATA: gv_num1   TYPE int4,
      gv_num2   TYPE int4,
      gv_result TYPE int4.

START-OF-SELECTION.
gv_num1 = 12.
gv_num2 = 1.
  CREATE OBJECT go_egitim_class.
  go_egitim_class->sum_number(
    EXPORTING
      iv_num1   = gv_num1                 " 4 Byte Signed Integer
      iv_num2   = gv_num2          " 4 Byte Signed Integer
    IMPORTING
      ev_result = gv_result   " 4 Byte Signed Integer
  ).

  write: gv_result.
