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
    READ TABLE gt_scarr into gs_scarr INDEX e_row-index.
    MESSAGE |Double click satır: { gs_scarr-carrid } /Alan: { e_column-fieldname }| TYPE 'I'.
  ENDMETHOD.

  METHOD handle_data_changed.
    MESSAGE 'Veri değiştirildi' TYPE 'I'.
  ENDMETHOD.

  METHOD handle_onf4.
    MESSAGE |F4 basıldı: { e_fieldname }| TYPE 'I'.
  ENDMETHOD.
ENDCLASS.
