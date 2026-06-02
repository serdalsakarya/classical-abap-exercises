*&---------------------------------------------------------------------*
*& Include          ZBK_EGT_0022_FORMS
*&---------------------------------------------------------------------*

FORM get_data .
  SELECT
     k~ebeln p~ebelp k~bstyp k~bsart
     p~matnr p~menge p~meins "UP TO 20 ROWS
     FROM ekko AS k
     INNER JOIN ekpo AS p ON k~ebeln = p~ebeln
     INTO CORRESPONDING FIELDS OF TABLE gt_list.

  LOOP AT gt_list INTO gs_list .
    IF  gs_list-ebelp = '10'.
*      gs_list-line_color = 'C500'.

      CLEAR gs_cell_color.
      gs_cell_color-fieldname = 'MATNR'.
      gs_cell_color-color-col = 5.
      gs_cell_color-color-int = 1.
      gs_cell_color-color-inv = 0.
      APPEND gs_cell_color TO gs_list-cell_color.

      CLEAR gs_cell_color.
      gs_cell_color-fieldname = 'EBELP'.
      gs_cell_color-color-col = 7.
      gs_cell_color-color-int = 1.
      gs_cell_color-color-inv = 0.
      APPEND gs_cell_color TO gs_list-cell_color.

      MODIFY gt_list FROM gs_list.
    ENDIF.

    IF  gs_list-ebelp = '20'.
      gs_list-line_color = 'C600'.

*      CLEAR gs_cell_color.
*      gs_cell_color-fieldname = 'BSTYP'.
*      gs_cell_color-color-col = 3.
*      gs_cell_color-color-int = 1.
*      gs_cell_color-color-inv = 0.
*      APPEND gs_cell_color TO gs_list-cell_color.

      MODIFY gt_list FROM gs_list.
    ENDIF.

*    IF  gs_list-ebelp = '10'.
*
*      MODIFY gt_list FROM gs_list.
*    ENDIF.
*    IF  gs_list-ebelp = '20'.
*
*      MODIFY gt_list FROM gs_list.
*    ENDIF.
  ENDLOOP.

ENDFORM.

FORM set_fieldcat .

*  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE' "Tek tek kolonlari eklemeden tek seferde butun kolonlari ekler.
*    EXPORTING
*      i_program_name   = sy-repid
**     i_internal_tabname = 'GT_LIST'
*      i_structure_name = 'ZBK_EGT_0022_S'
*      i_inclname       = sy-repid
*    CHANGING
*      ct_fieldcat      = gt_fc.
  PERFORM  set_fc_sub USING:
             'EBELN' 'SAS Numarasi' 'SAS No' abap_true 0 '',
             'EBELP' 'Kalem' 'K.' abap_true 1 '',
             'BSTYP' 'xxx xxx' 'yy' abap_false 2 '',
             'BSART' 'xxx xxx' 'yy' abap_false 3 '',
             'MATNR' 'xxx xxx' 'yy' abap_false 4 '',
             'MENGE' 'Miktar' 'M.' abap_false 5 '',
             'MEINS' 'Ölcu Birimi' 'Ö.B.' abap_false 6 ''.
ENDFORM.

FORM set_fc_sub  USING    p_fieldname
                          p_seltext_l
                          p_seltext_s
                          p_key
                          p_col_pos
                          p_do_sum.

  CLEAR: gs_fc.
  gs_fc-fieldname = p_fieldname.
  gs_fc-seltext_l = p_seltext_l.
  gs_fc-seltext_s = p_seltext_s.
  gs_fc-key = p_key.
  gs_fc-col_pos = p_col_pos.
  gs_fc-do_sum = p_do_sum.

  APPEND gs_fc TO gt_fc.

ENDFORM.

FORM set_layout .
  gs_layout-window_titlebar = 'REUSE ALV Egitimi'.
  gs_layout-zebra = abap_true.
  gs_layout-colwidth_optimize = abap_true.
  gs_layout-box_fieldname = 'SELKZ'.
  gs_layout-info_fieldname = 'LINE_COLOR'.
  gs_layout-coltab_fieldname = 'CELL_COLOR'.
ENDFORM.

FORM display_alv .

  CLEAR gs_event.
  gs_event-name = slis_ev_top_of_page.
  gs_event-form = 'TOP_OF_PAGE'.
  APPEND gs_event TO gt_events.

  CLEAR gs_event.
  gs_event-name = slis_ev_end_of_list.
  gs_event-form = 'END_OF_LIST'.
  APPEND gs_event TO gt_events.

*  CLEAR gs_event.
*  gs_event-name = slis_ev_pf_status_set.
*  gs_event-form = 'PF_STATUS_SET'.
*  APPEND gs_event TO gt_events.

*  gs_exclude-fcode = '&UMC'.
*  APPEND gs_exclude TO gt_exclude.
*  gs_exclude-fcode = '&INFO'.
*  APPEND gs_exclude TO gt_exclude.
*
*  gs_sort-spos = 1.
*  gs_sort-tabname = 'GT_LIST'.
*  gs_sort-fieldname = 'BSART'.
*  gs_sort-down = abap_true.
*  APPEND gs_sort TO gt_sort.
*
*  gs_sort-spos = 2.
*  gs_sort-tabname = 'GT_LIST'.
*  gs_sort-fieldname = 'MENGE'.
*  gs_sort-down = abap_true.
*  APPEND gs_sort TO gt_sort.
*
*  gs_filter-tabname = 'GT_LIST'.
*  gs_filter-fieldname = 'EBELP'.
*  gs_filter-sign0 = 'I'.
*  gs_filter-optio = 'EQ'.
*  gs_filter-valuf_int = 20.
*  APPEND gs_filter TO gt_filter.

*   gs_filter-tabname = 'GT_LIST'.
*  gs_filter-fieldname = 'MENGE'.
*  gs_filter-sign0 = 'I'.
*  gs_filter-optio = 'EQ'.
*  gs_filter-valuf_int = 1.
*  APPEND gs_filter TO gt_filter.



  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK       = ' '
*     i_bypassing_buffer      = 'X'
*     I_BUFFER_ACTIVE         = ' '
      i_callback_program      = sy-repid
*     I_CALLBACK_PF_STATUS_SET          = 'PF_STATUS_SET'
      i_callback_user_command = 'USER_COMMAND'
*     i_callback_top_of_page  = 'TOP_OF_PAGE'
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME        =
*     I_BACKGROUND_ID         = ' '
*     I_GRID_TITLE            =
*     I_GRID_SETTINGS         =
      is_layout               = gs_layout
      it_fieldcat             = gt_fc
      it_excluding            = gt_exclude
*     IT_SPECIAL_GROUPS       =
      it_sort                 = gt_sort
      it_filter               = gt_filter
*     IS_SEL_HIDE             =
*     I_DEFAULT               = 'X'
     I_SAVE                  = 'X'
*     IS_VARIANT              =
      it_events               = gt_events
*     IT_EVENT_EXIT           =
*     IS_PRINT                =
*     IS_REPREP_ID            =
     I_SCREEN_START_COLUMN   = 30
     I_SCREEN_START_LINE     = 5
     I_SCREEN_END_COLUMN     = 90
     I_SCREEN_END_LINE       = 27
*     I_HTML_HEIGHT_TOP       = 0
*     I_HTML_HEIGHT_END       = 0
*     IT_ALV_GRAPHICS         =
*     IT_HYPERLINK            =
*     IT_ADD_FIELDCAT         =
*     IT_EXCEPT_QINFO         =
*     IR_SALV_FULLSCREEN_ADAPTER        =
*     O_PREVIOUS_SRAL_HANDLER =
*     O_COMMON_HUB            =
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER =
*     ES_EXIT_CAUSED_BY_USER  =
    TABLES
      t_outtab                = gt_list
* EXCEPTIONS
*     PROGRAM_ERROR           = 1
*     OTHERS                  = 2
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
ENDFORM.

FORM user_command USING p_ucomm TYPE sy-ucomm
      ps_selfield TYPE slis_selfield.
  DATA lv_index TYPE i.
  CASE p_ucomm.
    WHEN '&MSG'.
      LOOP AT gt_list INTO gs_list WHERE selkz = 'X'.
        lv_index = lv_index + 1.
      ENDLOOP.
      MESSAGE |{ lv_index } adet satir secili| TYPE 'I'.
    WHEN '&IC1'.
      CASE ps_selfield-fieldname.
        WHEN 'EBELN'.

          MESSAGE |Ebelndeki satir degeri: { ps_selfield-value }| TYPE 'I'.
        WHEN 'MENGE'.
          MESSAGE 'menge ye tiklandi.' TYPE 'I'.
        WHEN OTHERS.
      ENDCASE.
    WHEN OTHERS.
  ENDCASE.
ENDFORM.

FORM pf_status_set USING p_extab TYPE slis_t_extab.
  SET PF-STATUS '0200'.
ENDFORM.
FORM top_of_page.

  DATA: lv_date    TYPE char10.

  CLEAR ls_header.
  REFRESH lt_header.
  ls_header-typ = 'H'.
  ls_header-info = 'Satınalma Liste Raporu'.
  APPEND ls_header TO lt_header.

  CLEAR: ls_header.
  ls_header-typ = 'S'.
  ls_header-key = 'Tarih:'.
  CONCATENATE sy-datum+6(2) '.' sy-datum+4(2) '.' sy-datum+0(4) INTO lv_date.
  ls_header-info = lv_date.
  APPEND ls_header TO lt_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = lt_header.
ENDFORM.


FORM end_of_list.

  DATA: lv_lines   TYPE i.

  CLEAR ls_header.
  REFRESH lt_header.
  DESCRIBE TABLE gt_list LINES lv_lines.
  ls_header-typ = 'A'.
  ls_header-info = |Raporda { lv_lines } adet kayit var.| .
  APPEND ls_header TO lt_header.


  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = lt_header.
ENDFORM.
