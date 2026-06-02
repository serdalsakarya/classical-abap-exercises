*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0030
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0034.

INCLUDE ZBK_EGT_0034_TOP.
INCLUDE ZBK_EGT_0034_CLS.
INCLUDE ZBK_EGT_0034_PBO.
INCLUDE ZBK_EGT_0034_PAI.
INCLUDE ZBK_EGT_0034_FORM.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
