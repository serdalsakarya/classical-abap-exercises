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

    PERFORM set_exclude.
    PERFORM set_sort.
    PERFORM gt_filter.

    CALL METHOD go_grid->set_table_for_first_display
      EXPORTING
*       i_buffer_active      =                  " Pufferung aktiv
*       i_bypassing_buffer   =                  " Puffer ausschalten
*       i_consistency_check  =                  " Starte Konsistenzverprobung für Schnittstellefehlererkennung
*       i_structure_name     =                  " Strukturname der internen Ausgabetabelle
*       is_variant           =                  " Anzeigevariante
*       i_save               =                  " Anzeigevariante sichern
*       i_default            = 'X'              " Defaultanzeigevariante
        is_layout            = gs_layout               " Layout
*       is_print             =                  " Drucksteuerung
*       it_special_groups    =                  " Feldgruppen
        it_toolbar_excluding = gt_tool                " excludierte Toolbarstandardfunktionen
*       it_hyperlink         =                  " Hyperlinks
*       it_alv_graphics      =                  " Tabelle von der Struktur DTC_S_TC
*       it_except_qinfo      =                  " Tabelle für die Exception Quickinfo
*       ir_salv_adapter      =                  " Internal Usage only !!! - obsolete
      CHANGING
        it_outtab            = gt_scarr               " Ausgabetabelle
        it_fieldcatalog      = gt_fcat               " Feldkatalog
        it_sort              = gt_sort                  " Sortierkriterien
        it_filter            = gt_filter               " Filterkriterien
*      EXCEPTIONS
*       invalid_parameter_combination = 1                " Parameter falsch
*       program_error        = 2                " Programmfehler
*       too_many_lines       = 3                " Zu viele Zeilen in eingabebereitem Grid.
*       others               = 4
      .
    IF sy-subrc <> 0.
*     MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*       WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
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

FORM set_exclude .
*  CLEAR gv_tool.
*  gv_tool = cl_gui_alv_grid=>mc_fc_detail.
*  APPEND gv_tool TO gt_tool.
*
*  CLEAR gv_tool.
*  gv_tool = cl_gui_alv_grid=>mc_fc_find.
*  APPEND gv_tool TO gt_tool.

  gt_tool = VALUE #(
  ( cl_gui_alv_grid=>mc_fc_detail )
  ( cl_gui_alv_grid=>mc_fc_find )
  ).
ENDFORM.

FORM set_sort .
  gt_sort = VALUE #(
  ( spos = 1 fieldname = 'CURRCODE' down = abap_true )
  ( spos = 2 fieldname = 'CARRNAME' down = abap_false )
  ).
ENDFORM.

FORM gt_filter .
  gt_filter = VALUE #(
  ( tabname = 'GT_SCARR' fieldname = 'CURRCODE' sign = 'I' option = 'EQ' low = 'EUR' )
  ).
ENDFORM.
