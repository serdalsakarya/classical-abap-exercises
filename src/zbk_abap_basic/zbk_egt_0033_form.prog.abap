*&---------------------------------------------------------------------*
*& Include          ZBK_EGT_0030_FORM
*&---------------------------------------------------------------------*

FORM display_alv .

  IF  go_grid IS INITIAL.

    CREATE OBJECT go_cont
      EXPORTING
        container_name = 'CC_ALV'.                " Name of the dynpro CustCtrl name to link this container to

    CREATE OBJECT go_spli
      EXPORTING
        parent  = go_cont                   " Parent Container
        rows    = 2                   " Anzahl zu zeigender Zeilen
        columns = 1.                  " Anzahl zu zeigender Spalten

    CALL METHOD go_spli->get_container
      EXPORTING
        row       = 1                 " Row
        column    = 1                " Column
      RECEIVING
        container = go_sub1.                " Container

    CALL METHOD go_spli->get_container
      EXPORTING
        row       = 2                 " Row
        column    = 1                " Column
      RECEIVING
        container = go_sub2.                " Container

    CALL METHOD go_spli->set_row_height
      EXPORTING
        id     = 1                 " Id der Zeile
        height = 15.                " Höhe

    CREATE OBJECT go_docu
      EXPORTING
        style = 'ALV_GRID'.

    CREATE OBJECT go_grid
      EXPORTING
        i_parent = go_sub2. " Parent-Container

    CREATE OBJECT go_event_receiver.
    SET HANDLER go_event_receiver->handle_top_of_page FOR go_grid.

    CALL METHOD go_grid->set_table_for_first_display
      EXPORTING
        is_layout       = gs_layout                 " Layout
      CHANGING
        it_outtab       = gt_scarr                 " Ausgabetabelle
        it_fieldcatalog = gt_fcat.                " Feldkatalog

    CALL METHOD go_grid->list_processing_events
      EXPORTING
        i_event_name = 'TOP_OF_PAGE'               " Eventname Lisprocessing
        i_dyndoc_id  = go_docu.             " Dynamisches Dokument
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
ENDFORM.

FORM get_data .

  SELECT * FROM scarr INTO CORRESPONDING FIELDS OF TABLE gt_scarr.

ENDFORM.

FORM set_layout .
  CLEAR: gs_layout.
  gs_layout-cwidth_opt = abap_true.
  gs_layout-zebra = abap_true.
ENDFORM.
