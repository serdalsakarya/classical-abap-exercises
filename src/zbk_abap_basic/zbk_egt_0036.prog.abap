*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0030
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0036.

INCLUDE ZBK_EGT_0036_TOP.
INCLUDE ZBK_EGT_0036_CLS.
INCLUDE ZBK_EGT_0036_PBO.
INCLUDE ZBK_EGT_0036_PAI.
INCLUDE ZBK_EGT_0036_FORM.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
