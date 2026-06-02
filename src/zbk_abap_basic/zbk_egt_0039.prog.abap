*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0030
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0039.

INCLUDE ZBK_EGT_0039_TOP.
INCLUDE ZBK_EGT_0039_CLS.
INCLUDE ZBK_EGT_0039_PBO.
INCLUDE ZBK_EGT_0039_PAI.
INCLUDE ZBK_EGT_0039_FORM.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
