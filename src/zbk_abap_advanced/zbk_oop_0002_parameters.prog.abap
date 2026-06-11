*&---------------------------------------------------------------------*
*& Report ZBK_OOP_0001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_oop_0002_parameters.

CLASS lcl_main DEFINITION DEFERRED.
DATA: go_main TYPE REF TO lcl_main.

*data gv_sum TYPE

PARAMETERS: p_num1 TYPE int4,
            p_num2 TYPE int4.

CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    METHODS:
      sum_numbers,
      sub_numbers,
      sum_numbers_v2 IMPORTING iv_num1 TYPE int4
                               iv_num2 TYPE int4
                     EXPORTING ev_sum  TYPE int4,
      sub_numbers_v2 IMPORTING iv_num1 TYPE int4
                     CHANGING  ev_sub  TYPE int4,
      sum_numbers_v3 IMPORTING iv_num1       TYPE int4
                               iv_num2       TYPE int4
                     RETURNING VALUE(rv_sum) TYPE int4.
    DATA: mv_sum  TYPE int4,
          mv_diff TYPE int4.

ENDCLASS.

CLASS lcl_main IMPLEMENTATION.
  METHOD sum_numbers.
    mv_sum = p_num1 + p_num2.
  ENDMETHOD.

  METHOD sub_numbers.
    mv_diff = p_num1 - p_num2.
  ENDMETHOD.

  METHOD sum_numbers_v2 .
    ev_sum = iv_num1 + iv_num2 + 1.
  ENDMETHOD.

  METHOD sub_numbers_v2 .
    ev_sub = iv_num1 - ev_sub - 1.
  ENDMETHOD.

  METHOD sum_numbers_v3 .
    rv_sum = iv_num1 + iv_num2 + 3.
  ENDMETHOD.
ENDCLASS.


START-OF-SELECTION.

  CREATE OBJECT go_main.

  go_main->sum_numbers( ).
  WRITE: /'Sum :', go_main->mv_sum.

  go_main->sub_numbers( ).
  WRITE: /'Sub :', go_main->mv_diff.

  go_main->sum_numbers_v2(
    EXPORTING
      iv_num1 = p_num1
      iv_num2 = p_num2
    IMPORTING
      ev_sum  = go_main->mv_sum
  ).
  WRITE: /'Sum+1 :', go_main->mv_sum.

data(gv_changing_num) = p_num2.
  go_main->sub_numbers_v2(
  EXPORTING
    iv_num1 = p_num1
        CHANGING
    ev_sub  = gv_changing_num
).
  WRITE: /'Sub-1 :', gv_changing_num.

  go_main->sum_numbers_v3(
    EXPORTING
      iv_num1 = p_num1
      iv_num2 = p_num2
    RECEIVING
      rv_sum  = go_main->mv_sum
  ).
  WRITE: /'Sum+3 :', go_main->mv_sum.

  WRITE: /'Sum+3 :', go_main->sum_numbers_v3(
                        iv_num1 = p_num1
                        iv_num2 = p_num2
                      ).
