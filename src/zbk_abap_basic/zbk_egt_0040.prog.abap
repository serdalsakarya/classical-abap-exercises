*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0030
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0040.

INCLUDE ZBK_EGT_0040_TOP.
INCLUDE ZBK_EGT_0040_CLS.
INCLUDE ZBK_EGT_0040_PBO.
INCLUDE ZBK_EGT_0040_PAI.
INCLUDE ZBK_EGT_0040_FORM.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
