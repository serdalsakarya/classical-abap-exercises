*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0030
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0033.

INCLUDE zbk_egt_0033_top.
INCLUDE ZBK_EGT_0033_cls.
INCLUDE zbk_egt_0033_pbo.
INCLUDE zbk_egt_0033_pai.
INCLUDE zbk_egt_0033_form.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
