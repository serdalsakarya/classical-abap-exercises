*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0030
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0037.

INCLUDE ZBK_EGT_0037_TOP.
INCLUDE ZBK_EGT_0037_CLS.
INCLUDE ZBK_EGT_0037_PBO.
INCLUDE ZBK_EGT_0037_PAI.
INCLUDE ZBK_EGT_0037_FORM.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
