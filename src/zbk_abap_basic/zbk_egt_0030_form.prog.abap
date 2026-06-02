*&---------------------------------------------------------------------*
*& Include          ZBK_EGT_0030_FORM
*&---------------------------------------------------------------------*

FORM display_alv .

*  CREATE OBJECT go_cont
*    EXPORTING
*      container_name = 'CC_ALV'. " Name of the dynpro CustCtrl name to link this container to
  IF  go_alv IS INITIAL.
    CREATE OBJECT go_alv
      EXPORTING
        i_parent = cl_gui_container=>screen0. "go_cont.               " Parent-Container

    PERFORM set_dropdown.

    CALL METHOD go_alv->set_table_for_first_display
      EXPORTING
*       i_buffer_active =                  " Pufferung aktiv
*       i_bypassing_buffer            =                  " Puffer ausschalten
*       i_consistency_check           =                  " Starte Konsistenzverprobung für Schnittstellefehlererkennung
*       i_structure_name = 'SCARR'                " Strukturname der internen Ausgabetabelle
*       is_variant      =                  " Anzeigevariante
*       i_save          =                  " Anzeigevariante sichern
*       i_default       = 'X'              " Defaultanzeigevariante
        is_layout       = gs_layout                 " Layout
*       is_print        =                  " Drucksteuerung
*       it_special_groups             =                  " Feldgruppen
*       it_toolbar_excluding          =                  " excludierte Toolbarstandardfunktionen
*       it_hyperlink    =                  " Hyperlinks
*       it_alv_graphics =                  " Tabelle von der Struktur DTC_S_TC
*       it_except_qinfo =                  " Tabelle für die Exception Quickinfo
*       ir_salv_adapter =                  " Internal Usage only !!! - obsolete
      CHANGING
        it_outtab       = gt_scarr                 " Ausgabetabelle
        it_fieldcatalog = gt_fcat                " Feldkatalog
*       it_sort         =                  " Sortierkriterien
*       it_filter       =                  " Filterkriterien
*    EXCEPTIONS
*       invalid_parameter_combination = 1                " Parameter falsch
*       program_error   = 2                " Programmfehler
*       too_many_lines  = 3                " Zu viele Zeilen in eingabebereitem Grid.
*       others          = 4
      .

    CALL METHOD go_alv->register_edit_event
      EXPORTING
        i_event_id = cl_gui_alv_grid=>mc_evt_enter.

    CALL METHOD go_alv->register_edit_event
      EXPORTING
        i_event_id = cl_gui_alv_grid=>mc_evt_modified.
  ELSE.
    CALL METHOD go_alv->refresh_table_display.
  ENDIF.

ENDFORM.


FORM set_fcat .

  CLEAR:gs_fcat.
  gs_fcat-fieldname = 'DURUM'.
  gs_fcat-scrtext_s = 'Ikon'.
  gs_fcat-scrtext_m = 'Ikon'.
  gs_fcat-scrtext_l = 'Ikon'.
  APPEND gs_fcat TO gt_fcat.

  CLEAR:gs_fcat.
  gs_fcat-fieldname = 'CARRID'.
  gs_fcat-scrtext_s = 'Flugges.'.
  gs_fcat-scrtext_m = 'Fluggesellschaft'.
  gs_fcat-scrtext_l = 'Kurzbezeichnung der Fluggesellschaft'.
*  gs_fcat-key = abap_true.
  APPEND gs_fcat TO gt_fcat.

  CLEAR:gs_fcat.
  gs_fcat-fieldname = 'CARRNAME'.
  gs_fcat-scrtext_s = 'Name'.
  gs_fcat-scrtext_m = 'Name'.
  gs_fcat-scrtext_l = 'Name einer Fluggesellschaft'.

  APPEND gs_fcat TO gt_fcat.

  CLEAR:gs_fcat.
  gs_fcat-fieldname = 'CURRCODE'.
  gs_fcat-scrtext_s = 'Hauswährung'.
  gs_fcat-scrtext_m = 'Hauswährung'.
  gs_fcat-scrtext_l = 'Hauswährung der Fluggesellschaft'.

  APPEND gs_fcat TO gt_fcat.

  CLEAR:gs_fcat.
  gs_fcat-fieldname = 'URL'.
  gs_fcat-scrtext_s = 'URL'.
  gs_fcat-scrtext_m = 'URL'.
  gs_fcat-scrtext_l = 'URL einer Fluggesellschaft'.
*  gs_fcat-col_opt = abap_true.
  APPEND gs_fcat TO gt_fcat.

  CLEAR:gs_fcat.
  gs_fcat-fieldname = 'COST'.
  gs_fcat-scrtext_s = 'KOST'.
  gs_fcat-scrtext_m = 'KOST'.
  gs_fcat-scrtext_l = 'KOST'.
  gs_fcat-edit = abap_true.
  APPEND gs_fcat TO gt_fcat.


  CLEAR:gs_fcat.
  gs_fcat-fieldname = 'LOCATION'.
  gs_fcat-scrtext_s = 'Lokasyon'.
  gs_fcat-scrtext_m = 'Lokasyon'.
  gs_fcat-scrtext_l = 'Lokasyon'.
  gs_fcat-edit = abap_true.
  gs_fcat-drdn_hndl = 1.
  APPEND gs_fcat TO gt_fcat.

  CLEAR:gs_fcat.
  gs_fcat-fieldname = 'SEATL'.
  gs_fcat-scrtext_s = 'Koltuk Harfi'.
  gs_fcat-scrtext_m = 'Koltuk Harfi'.
  gs_fcat-scrtext_l = 'Koltuk Harfi'.
  gs_fcat-edit = abap_true.
  gs_fcat-drdn_hndl = 2.
  APPEND gs_fcat TO gt_fcat.

  CLEAR:gs_fcat.
  gs_fcat-fieldname = 'SEATP'.
  gs_fcat-scrtext_s = 'Koltuk Pozisyonu'.
  gs_fcat-scrtext_m = 'Koltuk Pozisyonu'.
  gs_fcat-scrtext_l = 'Koltuk Pozisyonu'.
  gs_fcat-edit = abap_true.
  gs_fcat-drdn_field = 'DD_HANDLE'.
  APPEND gs_fcat TO gt_fcat.

*  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE' " field cataloga alternatif olarak herseyi ceker.
*    EXPORTING
*      i_structure_name       = 'SCARR'                " Strukturname(Struktur, Tabelle, View)
**     i_structure_name       = 'ZBK_EGT_0030_S'                " Strukturname(Struktur, Tabelle, View)
**     i_internal_tabname     =                  " Tabellenname
*    CHANGING
*      ct_fieldcat            = gt_fcat                " Feldkatalog mit Feldbeschreibungen
*    EXCEPTIONS
*      inconsistent_interface = 1                " Aufrufparameterkombination falsch
*      program_error          = 2                " Programmfehler
*      OTHERS                 = 3.
*  IF sy-subrc <> 0.
**   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
**     WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
*  ENDIF.
*
*  READ TABLE gt_fcat ASSIGNING <gfs_fc> WITH KEY fieldname = 'MES'.
*  IF  sy-subrc = 0.
*    <gfs_fc>-edit = abap_true.
*  ENDIF.

ENDFORM.

FORM get_data .

  SELECT * FROM scarr INTO CORRESPONDING FIELDS OF TABLE gt_scarr.

  LOOP AT gt_scarr ASSIGNING <gfs_scarr>.

    CASE <gfs_scarr>-currcode.
      WHEN 'EUR'.
        <gfs_scarr>-dd_handle = 3.
      WHEN 'USD'.
        <gfs_scarr>-dd_handle = 4.
      WHEN OTHERS.
        <gfs_scarr>-dd_handle = 5.
    ENDCASE.

  ENDLOOP.

*  LOOP AT gt_scarr ASSIGNING <gfs_scarr>. "renk degistirmek icin..
*    CASE <gfs_scarr>-currcode.
*      WHEN 'USD'.
*        <gfs_scarr>-line_color = 'C710'.
*      WHEN 'EUR'.
*        CLEAR: gs_cell_color.
*        gs_cell_color-fname = 'URL'.
*        gs_cell_color-color-col = '3'.
*        gs_cell_color-color-int = '1'.
*        gs_cell_color-color-inv = '0'.
*        APPEND gs_cell_color TO <gfs_scarr>-cell_color.
*    ENDCASE.
*  ENDLOOP.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form set_layout
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM set_layout .
  CLEAR: gs_layout.
  gs_layout-cwidth_opt = abap_true.
  gs_layout-zebra = abap_true.
*  gs_layout-info_fname = 'LINE_COLOR'.
*  gs_layout-ctab_fname = 'CELL_COLOR'.

ENDFORM.

FORM get_total .
  DATA: lv_total TYPE int4,
        lv_lines TYPE int4,
        lv_ave   TYPE int4.

  DESCRIBE TABLE gt_scarr LINES lv_lines.

  LOOP AT gt_scarr ASSIGNING <gfs_scarr>.
    lv_total = lv_total + <gfs_scarr>-cost.
  ENDLOOP.

  lv_ave = lv_total / lv_lines.

  LOOP AT gt_scarr ASSIGNING <gfs_scarr>.
    IF <gfs_scarr>-cost < lv_ave.
      <gfs_scarr>-durum = '@0A@'.
    ELSEIF <gfs_scarr>-cost > lv_ave.
      <gfs_scarr>-durum = '@08@'.
    ELSE.
      <gfs_scarr>-durum = '@09@'.
    ENDIF.
  ENDLOOP.

*  MESSAGE |Toplam = { lv_total }| TYPE 'I'.
ENDFORM.


FORM set_dropdown .
  DATA: lt_dropdown TYPE lvc_t_drop,
        ls_dropdown TYPE lvc_s_drop.

  CLEAR: ls_dropdown.
  ls_dropdown-handle = 1.
  ls_dropdown-value = 'Yurt Ici'.
  APPEND ls_dropdown TO lt_dropdown.

  CLEAR: ls_dropdown.
  ls_dropdown-handle = 1.
  ls_dropdown-value = 'Yurt Disi'.
  APPEND ls_dropdown TO lt_dropdown.

  CLEAR: ls_dropdown.
  ls_dropdown-handle = 2.
  ls_dropdown-value = 'A'.
  APPEND ls_dropdown TO lt_dropdown.

  CLEAR: ls_dropdown.
  ls_dropdown-handle = 2.
  ls_dropdown-value = 'B'.
  APPEND ls_dropdown TO lt_dropdown.

  CLEAR: ls_dropdown.
  ls_dropdown-handle = 2.
  ls_dropdown-value = 'C'.
  APPEND ls_dropdown TO lt_dropdown.

  CLEAR: ls_dropdown.
  ls_dropdown-handle = 2.
  ls_dropdown-value = 'D'.
  APPEND ls_dropdown TO lt_dropdown.
  CLEAR: ls_dropdown.

  ls_dropdown-handle = 2.
  ls_dropdown-value = 'E'.
  APPEND ls_dropdown TO lt_dropdown.

  ls_dropdown-handle = 3.
  ls_dropdown-value = 'On'.
  APPEND ls_dropdown TO lt_dropdown.

  ls_dropdown-handle = 3.
  ls_dropdown-value = 'Kanat'.
  APPEND ls_dropdown TO lt_dropdown.

  ls_dropdown-handle = 3.
  ls_dropdown-value = 'Arka'.
  APPEND ls_dropdown TO lt_dropdown.

  ls_dropdown-handle = 4.
  ls_dropdown-value = 'On'.
  APPEND ls_dropdown TO lt_dropdown.

  ls_dropdown-handle = 4.
  ls_dropdown-value = 'Arka'.
  APPEND ls_dropdown TO lt_dropdown.

  ls_dropdown-handle = 5.
  ls_dropdown-value = 'Kanat'.
  APPEND ls_dropdown TO lt_dropdown.

  go_alv->set_drop_down_table(
    it_drop_down       =    lt_dropdown              " DropDownTable
  ).

ENDFORM.
