*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0030
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0035.

INCLUDE ZBK_EGT_0035_TOP.
INCLUDE ZBK_EGT_0035_CLS.
INCLUDE ZBK_EGT_0035_PBO.
INCLUDE ZBK_EGT_0035_PAI.
INCLUDE ZBK_EGT_0035_FORM.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
