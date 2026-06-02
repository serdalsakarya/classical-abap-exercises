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
                  e_display,
      handle_button_click
        FOR EVENT button_click OF cl_gui_alv_grid
        IMPORTING es_col_id es_row_no,

      handle_toolbar
        FOR EVENT toolbar OF cl_gui_alv_grid
        IMPORTING e_object e_interactive,

      handle_user_command
        FOR EVENT user_command OF cl_gui_alv_grid
        IMPORTING e_ucomm.
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
    MESSAGE |F4 basıldı: { e_fieldname }| TYPE 'I'.
  ENDMETHOD.

  METHOD handle_button_click.
    MESSAGE |Button click satır: { gs_scarr-carrname } alan: { es_col_id-fieldname }| TYPE 'I'.
  ENDMETHOD.

  METHOD handle_toolbar.
    DATA: ls_toolbar TYPE stb_button.

    CLEAR: ls_toolbar.
    ls_toolbar-function = '&DEL'.
    ls_toolbar-text = 'Delete'.
    ls_toolbar-icon = '@11@'.
    ls_toolbar-quickinfo = 'Deleting'.
    ls_toolbar-disabled = abap_false.
    APPEND ls_toolbar TO e_object->mt_toolbar.

    CLEAR: ls_toolbar.
    ls_toolbar-function = '&DIS'.
    ls_toolbar-text = 'Display'.
    ls_toolbar-icon = '@10@'.
    ls_toolbar-quickinfo = 'Displaying'.
    ls_toolbar-disabled = abap_false.
    APPEND ls_toolbar TO e_object->mt_toolbar.

  ENDMETHOD.

  METHOD handle_user_command.
    IF e_ucomm = '&DEL'.
      MESSAGE |Clicked to delete button. | TYPE 'I'.

      ELSEIF e_ucomm = '&DIS'.
        MESSAGE |Clicked to display button. | TYPE 'I'.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
