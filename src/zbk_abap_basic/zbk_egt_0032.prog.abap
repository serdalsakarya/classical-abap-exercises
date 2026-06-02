*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0030
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0032.

INCLUDE ZBK_EGT_0032_TOP.
INCLUDE ZBK_EGT_0032_PBO.
INCLUDE ZBK_EGT_0032_PAI.
INCLUDE ZBK_EGT_0032_FORM.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
