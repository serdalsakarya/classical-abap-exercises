*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0030
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0033_muster_events.

INCLUDE ZBK_EGT_0033M_TOP.
INCLUDE ZBK_EGT_0033M_CLS.
INCLUDE ZBK_EGT_0033M_PBO.
INCLUDE ZBK_EGT_0033M_PAI.
INCLUDE ZBK_EGT_0033M_FORM.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
