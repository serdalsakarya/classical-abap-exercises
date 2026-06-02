*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0030
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0038.

INCLUDE ZBK_EGT_0038_TOP.
INCLUDE ZBK_EGT_0038_CLS.
INCLUDE ZBK_EGT_0038_PBO.
INCLUDE ZBK_EGT_0038_PAI.
INCLUDE ZBK_EGT_0038_FORM.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
