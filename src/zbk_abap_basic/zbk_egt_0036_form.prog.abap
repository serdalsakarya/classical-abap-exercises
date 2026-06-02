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
    SET HANDLER go_event_receiver->handle_data_changed FOR go_grid.

    CALL METHOD go_grid->set_table_for_first_display
      EXPORTING
        is_layout       = gs_layout                 " Layout
      CHANGING
        it_outtab       = gt_scarr                 " Ausgabetabelle
        it_fieldcatalog = gt_fcat.                " Feldkatalog

    CALL METHOD go_grid->register_edit_event
      EXPORTING
        i_event_id = cl_gui_alv_grid=>mc_evt_modified.

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

  LOOP AT gt_fcat ASSIGNING <gfs_fcat>.
    IF  <gfs_fcat>-fieldname = 'CARRNAME'.
      <gfs_fcat>-edit = abap_true.
    ENDIF.
  ENDLOOP.
ENDFORM.

FORM get_data .

  SELECT * FROM scarr INTO CORRESPONDING FIELDS OF TABLE gt_scarr.

ENDFORM.

FORM set_layout .
  CLEAR: gs_layout.
  gs_layout-cwidth_opt = abap_true.
  gs_layout-zebra = abap_true.
ENDFORM.
