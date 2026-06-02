*&---------------------------------------------------------------------*
*& Include          ZBK_EGT_0030_TOP
*&---------------------------------------------------------------------*

DATA: go_grid TYPE REF TO cl_gui_alv_grid,
      go_cont TYPE REF TO cl_gui_custom_container.

DATA: gt_tool   TYPE ui_functions,
      gv_tool   TYPE ui_func,
      gt_sort   TYPE lvc_t_sort,
      gt_filter TYPE lvc_t_filt.

DATA:gt_scarr  TYPE TABLE OF scarr,
     gs_scarr  TYPE  scarr,
     gt_fcat   TYPE lvc_t_fcat,
     gs_fcat   TYPE lvc_s_fcat,
     gs_layout TYPE lvc_s_layo.

FIELD-SYMBOLS: <gfs_scarr> TYPE  scarr,
               <gfs_fcat>  TYPE lvc_s_fcat.

CLASS cl_event_receiver DEFINITION DEFERRED.
DATA: go_event_receiver TYPE REF TO cl_event_receiver.
