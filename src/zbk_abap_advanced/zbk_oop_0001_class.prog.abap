*&---------------------------------------------------------------------*
*& Report ZBK_OOP_0001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_oop_0001_class.

CLASS lcl_main DEFINITION DEFERRED.
DATA: go_main TYPE REF TO lcl_main.

PARAMETERS: p_num1 TYPE int4,
            p_num2 TYPE int4.

CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    METHODS: sum_numbers,
      sub_numbers.
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
ENDCLASS.


START-OF-SELECTION.

  CREATE OBJECT go_main.

  go_main->sum_numbers( ).
  WRITE: /'Sum :', go_main->mv_sum.

  go_main->sub_numbers( ).
  WRITE: /'Sub :', go_main->mv_diff.
