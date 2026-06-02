*&---------------------------------------------------------------------*
*& Include          ZBK_EGT_0030_TOP
*&---------------------------------------------------------------------*

DATA: go_grid TYPE REF TO cl_gui_alv_grid,
      go_cont TYPE REF TO cl_gui_custom_container.

TYPES: BEGIN OF gty_scarr,
         delete   TYPE char20,
         carrid   TYPE s_carr_id,
         carrname TYPE s_carrname,
         currcode TYPE s_currcode,
         url      TYPE s_carrurl,
       END OF gty_scarr.

DATA:gt_scarr  TYPE TABLE OF gty_scarr,
     gs_scarr  TYPE  gty_scarr,
     gt_fcat   TYPE lvc_t_fcat,
     gs_fcat   TYPE lvc_s_fcat,
     gs_layout TYPE lvc_s_layo.

FIELD-SYMBOLS: <gfs_scarr> TYPE  gty_scarr,
               <gfs_fcat>  TYPE lvc_s_fcat.

CLASS cl_event_receiver DEFINITION DEFERRED.
DATA: go_event_receiver TYPE REF TO cl_event_receiver.
