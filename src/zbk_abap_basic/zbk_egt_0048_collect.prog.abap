*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0048_COLLECT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0048_collect.

TYPES: BEGIN OF gty_list,
         column_1 TYPE char10,
         column_2 TYPE int4,
       END OF gty_list.

DATA: gt_collect TYPE TABLE OF gty_list,
      gt_append  TYPE TABLE OF gty_list,
      gs_list TYPE gty_list.

gs_list-column_1 = 'Hans'.
gs_list-column_2 = 10.
COLLECT gs_list INTO gt_collect.

gs_list-column_1 = 'Hans'.
gs_list-column_2 = 4.
COLLECT gs_list INTO gt_collect.

gs_list-column_1 = 'Peter'.
gs_list-column_2 = 20.
COLLECT gs_list INTO gt_collect.


gs_list-column_1 = 'Hans'.
gs_list-column_2 = 5.
COLLECT gs_list INTO gt_collect.


gs_list-column_1 = 'Peter'.
gs_list-column_2 = 4.
COLLECT gs_list INTO gt_collect.



gs_list-column_1 = 'Hans'.
gs_list-column_2 = 10.
APPEND gs_list TO gt_append.

gs_list-column_1 = 'Hans'.
gs_list-column_2 = 4.
APPEND gs_list TO gt_append.

gs_list-column_1 = 'Peter'.
gs_list-column_2 = 20.
APPEND gs_list TO gt_append.


gs_list-column_1 = 'Hans'.
gs_list-column_2 = 5.
APPEND gs_list TO gt_append.


gs_list-column_1 = 'Peter'.
gs_list-column_2 = 4.
APPEND gs_list TO gt_append.


cl_demo_output=>write_data( gt_append ).
cl_demo_output=>write_data( gt_collect ).
cl_demo_output=>display( ).
