*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0030
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0030_oo_alv.
INCLUDE zbk_egt_0030_top.
INCLUDE zbk_egt_0030_pbo.
INCLUDE zbk_egt_0030_pai.
INCLUDE zbk_egt_0030_form.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fcat.
  PERFORM set_layout.

  CALL SCREEN 0100.
