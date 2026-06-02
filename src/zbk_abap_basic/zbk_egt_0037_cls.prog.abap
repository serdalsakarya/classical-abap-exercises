*&---------------------------------------------------------------------*
*& Include          ZBK_EGT_0033_CLS
*&---------------------------------------------------------------------*
CLASS cl_event_receiver DEFINITION.
  PUBLIC SECTION.

    METHODS:
      handle_top_of_page
        FOR EVENT top_of_page OF cl_gui_alv_grid
        IMPORTING e_dyndoc_id
                  table_index,

      handle_hotspot_click
        FOR EVENT hotspot_click OF cl_gui_alv_grid
        IMPORTING e_row_id
                  e_column_id,

      handle_double_click
        FOR EVENT double_click OF cl_gui_alv_grid
        IMPORTING e_row
                  e_column
                  es_row_no,

      handle_data_changed
        FOR EVENT data_changed OF cl_gui_alv_grid
        IMPORTING er_data_changed
                  e_onf4
                  e_onf4_after
                  e_onf4_before
                  e_ucomm,

      handle_onf4
        FOR EVENT onf4 OF cl_gui_alv_grid
        IMPORTING e_fieldname
                  e_fieldvalue
                  es_row_no
                  er_event_data
                  et_bad_cells
                  e_display.
ENDCLASS.



CLASS cl_event_receiver IMPLEMENTATION.
  METHOD handle_top_of_page.
    MESSAGE 'TOP_OF_PAGE çalıştı' TYPE 'I'.
  ENDMETHOD.

  METHOD handle_hotspot_click.
    MESSAGE |Hotspot satır: { e_row_id-index } alan: { e_column_id-fieldname }| TYPE 'I'.
  ENDMETHOD.

  METHOD handle_double_click.
    MESSAGE |Double click satır: { e_row-index } alan: { e_column-fieldname }| TYPE 'I'.
  ENDMETHOD.

  METHOD handle_data_changed.
    MESSAGE 'Veri değiştirildi' TYPE 'I'.
  ENDMETHOD.

  METHOD handle_onf4.

    TYPES: BEGIN OF lty_value_tab,
             carrname TYPE s_carrname,
             carrdeff TYPE char20,
           END OF lty_value_tab.

    DATA: lt_value_tab  TYPE TABLE OF lty_value_tab,
          lt_return_tab TYPE TABLE OF ddshretval.

    lt_value_tab = VALUE #(
    ( carrname = 'Flug 1' carrdeff = 'Erster Flug' )
    ( carrname = 'Flug 2' carrdeff = 'Zweiter Flug' )
    ( carrname = 'Flug 3' carrdeff = 'Dritter Flug' )
    ).

    CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
      EXPORTING
        retfield     = 'CARRDEFF'           " Name des Rückgabefeldes in FIELD_TAB
        window_title = 'Carrname f4'               " Titel für die Trefferliste
        value_org    = 'S'              " Werteübergabe: C: zellenweise, S: strukturiert
      TABLES
        value_tab    = lt_value_tab               " Tabelle der Werte; Einträge zellenweise
        return_tab   = lt_return_tab.             " Rückgabe der ausgewählten Werte

    READ TABLE lt_return_tab INTO DATA(ls_return_tab) INDEX 1. "WITH KEY fieldname = 'F0002'.
    IF sy-subrc = 0.
      READ TABLE  gt_scarr ASSIGNING <gfs_scarr> INDEX es_row_no-row_id.
      IF  sy-subrc = 0.
        <gfs_scarr>-carrname = ls_return_tab-fieldval.
        go_grid->refresh_table_display( ).
      ENDIF.
    ENDIF.

    er_event_data->m_event_handled = abap_true. " To cancel default f4 pop-up

  ENDMETHOD.
ENDCLASS.
