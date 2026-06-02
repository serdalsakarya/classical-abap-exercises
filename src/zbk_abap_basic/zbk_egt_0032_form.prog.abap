*&---------------------------------------------------------------------*
*& Include          ZBK_EGT_0030_FORM
*&---------------------------------------------------------------------*

FORM display_alv .

*  CREATE OBJECT go_cont
*    EXPORTING
*      container_name = 'CC_ALV'. " Name of the dynpro CustCtrl name to link this container to
  IF  go_alv IS INITIAL.

    CREATE OBJECT go_cont
      EXPORTING
        container_name = 'CC_ALV'.                " Name of the dynpro CustCtrl name to link this container to

    CREATE OBJECT go_splitter
      EXPORTING
        parent  = go_cont                  " Parent Container
        rows    = 2           " Anzahl zu zeigender Zeilen
        columns = 2.       " Anzahl zu zeigender Spalten

    CALL METHOD go_splitter->get_container
      EXPORTING
        row       = 1                " Row
        column    = 1                " Column
      RECEIVING
        container = go_gui1.             " Container

    CALL METHOD go_splitter->get_container
      EXPORTING
        row       = 2                " Row
        column    = 2                " Column
      RECEIVING
        container = go_gui2.             " Container

    CREATE OBJECT go_alv
      EXPORTING
        i_parent = go_gui1. "cl_gui_container=>screen0.                " Parent-Container

    CREATE OBJECT go_alv2
      EXPORTING
        i_parent = go_gui2. "cl_gui_container=>screen0.                " Parent-Container

    CALL METHOD go_alv->set_table_for_first_display
      EXPORTING
        is_layout       = gs_layout                 " Layout
      CHANGING
        it_outtab       = gt_scarr                 " Ausgabetabelle
        it_fieldcatalog = gt_fcat.                " Feldkatalog

 CALL METHOD go_alv2->set_table_for_first_display
      EXPORTING
        is_layout       = gs_layout                 " Layout
      CHANGING
        it_outtab       = gt_SFLIGHT                 " Ausgabetabelle
        it_fieldcatalog = gt_fcat2.                " Feldkatalog

  ELSE.
    CALL METHOD go_alv->refresh_table_display.
  ENDIF.

ENDFORM.


FORM set_fcat .

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name = 'SCARR'                " Strukturname(Struktur, Tabelle, View)
    CHANGING
      ct_fieldcat      = gt_fcat.                " Feldkatalog mit Feldbeschreibungen


  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name = 'SFLIGHT'                " Strukturname(Struktur, Tabelle, View)
    CHANGING
      ct_fieldcat      = gt_fcat2.                " Feldkatalog mit Feldbeschreibungen

ENDFORM.

FORM get_data .

  SELECT * FROM scarr INTO CORRESPONDING FIELDS OF TABLE gt_scarr.
  SELECT * FROM sflights INTO CORRESPONDING FIELDS OF TABLE gt_sflight.

ENDFORM.

FORM set_layout .
  CLEAR: gs_layout.
  gs_layout-cwidth_opt = abap_true.
  gs_layout-zebra = abap_true.
ENDFORM.
