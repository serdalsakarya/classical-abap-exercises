*&---------------------------------------------------------------------*
*& Include          ZBK_EGT_0030_FORM
*&---------------------------------------------------------------------*

FORM display_alv .

  IF  go_grid IS INITIAL.

    CREATE OBJECT go_cont
      EXPORTING
        container_name = 'CC_ALV'.                " Name of the dynpro CustCtrl name to link this container to

    CREATE OBJECT go_grid
      EXPORTING
        i_parent = go_cont. "cl_gui_container=>screen0.                " Parent-Container

    CREATE OBJECT go_event_receiver.
    SET HANDLER go_event_receiver->handle_top_of_page FOR go_grid.
    SET HANDLER go_event_receiver->handle_button_click FOR go_grid.

    CALL METHOD go_grid->set_table_for_first_display
      EXPORTING
        is_layout       = gs_layout                 " Layout
      CHANGING
        it_outtab       = gt_scarr                 " Ausgabetabelle
        it_fieldcatalog = gt_fcat.                " Feldkatalog

  ELSE.
    CALL METHOD go_grid->refresh_table_display.
  ENDIF.

ENDFORM.


FORM set_fcat .

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name = 'SCARR'                " Strukturname(Struktur, Tabelle, View)
    CHANGING
      ct_fieldcat      = gt_fcat.                " Feldkatalog mit Feldbeschreibungen

  CLEAR gs_fcat.
  gs_fcat-fieldname = 'DELETE'.
  gs_fcat-scrtext_l = 'Silinecek'.
  gs_fcat-scrtext_m = 'Silinme.'.
  gs_fcat-scrtext_s = 'Silme'.
  gs_fcat-style = cl_gui_alv_grid=>mc_style_button.
  gs_fcat-icon = abap_true.
  APPEND gs_fcat TO gt_fcat.

ENDFORM.

FORM get_data .

  SELECT * FROM scarr INTO CORRESPONDING FIELDS OF TABLE gt_scarr.

  LOOP AT gt_scarr ASSIGNING <gfs_scarr>.
    <gfs_scarr>-delete = '@11@'.
  ENDLOOP.

ENDFORM.

FORM set_layout .
  CLEAR: gs_layout.
  gs_layout-cwidth_opt = abap_true.
  gs_layout-zebra = abap_true.
ENDFORM.
