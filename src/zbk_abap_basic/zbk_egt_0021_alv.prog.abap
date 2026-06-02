*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0021_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBK_EGT_0021_ALV.
data: gt_sbook type table of sbook,
      go_salv type ref to cl_salv_table.

START-OF-SELECTION.

SELECT * up to 20 rows from sbook INTO TABLE gt_sbook.

cl_salv_table=>factory(
  IMPORTING
    r_salv_table   =  go_salv
  CHANGING
    t_table        = gt_sbook
).

go_salv->get_display_settings( )->set_list_header( value = 'denemem' ).
go_salv->get_display_settings( )->set_striped_pattern( value = 'X' ). " zebra cizgiler
go_salv->get_columns( )->set_optimize( value = 'X' ). " Kolonlarin uzunlugunu optimize eder
data lo_col TYPE REF TO cl_salv_column.
lo_col = go_salv->get_columns( )->get_column( columnname =  'INVOICE' ).
lo_col->set_long_text('Yeni bir is' ).
lo_col->set_medium_text('Yeni bir..' ).
lo_col->set_short_text('Yeni..' ).

lo_col = go_salv->get_columns( )->get_column( columnname =  'MANDT' ).
lo_col->set_visible(  abap_false ). " Kolunu hokus-pokus yap

data(lo_header) = new cl_salv_form_layout_grid( ). " baslik bilgileri icin

lo_header->create_label( row = 1 column = 1 )->set_text( value = 'Baslik - Ilk Satir' ).
lo_header->create_flow( row = 2 column = 1 )->create_text( text = 'Alt Baslik - ikinci satir' ).
go_salv->set_top_of_list( value = lo_header ).

go_salv->set_screen_popup( "popup gosterimi
  start_column = 10
  end_column   = 80
  start_line   = 5
  end_line     = 20
).

go_salv->display( ).
