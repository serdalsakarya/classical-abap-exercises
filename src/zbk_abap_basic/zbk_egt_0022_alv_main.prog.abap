*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0022
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0022_alv_main.

INCLUDE zbk_egt_0022_top.
INCLUDE zbk_egt_0022_forms.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fieldcat.
  PERFORM set_layout.
  PERFORM display_alv.
