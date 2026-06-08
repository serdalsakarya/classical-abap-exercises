*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0048_COLLECT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0048_collect_in_table.

TYPES: BEGIN OF gty_list,
         ebeln TYPE ebeln,
         menge TYPE menge_d,
         meins TYPE meins,
       END OF gty_list.

DATA: gt_collect TYPE TABLE OF gty_list,
      gs_collect TYPE gty_list,
      gt_ekpo    TYPE TABLE OF ekpo,
      gs_ekpo    TYPE ekpo.

SELECT * FROM ekpo INTO TABLE gt_ekpo
  WHERE ebeln IN
  ( '4600000004', '4151500802', '4151500803', '4500000029' ).

LOOP AT gt_ekpo INTO gs_ekpo.
  MOVE-CORRESPONDING gs_ekpo TO gs_collect.
  COLLECT gs_collect INTO gt_collect.
ENDLOOP.

cl_demo_output=>write_data( gt_ekpo ).
cl_demo_output=>write_data( gt_collect ).
cl_demo_output=>display( ).
