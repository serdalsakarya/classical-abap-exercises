*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0008
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0008.

CLASS math_op DEFINITION.
  PUBLIC SECTION.
    DATA: gv_num1   TYPE i,
          gv_num2   TYPE i,
          gv_result TYPE i.
    data lv_public TYPE i.

    METHODS: sum_numbers.

    PROTECTED SECTION.
    data lv_protected TYPE i.

    PRIVATE SECTION.
    data lv_private TYPE i.

ENDCLASS.

CLASS math_op IMPLEMENTATION.
  METHOD sum_numbers.
    gv_result = gv_num1 + gv_num2.
  ENDMETHOD.

ENDCLASS.

CLASS math_op_diff DEFINITION INHERITING FROM math_op.
  PUBLIC SECTION.
    METHODS num_diff.
ENDCLASS.

CLASS math_op_diff IMPLEMENTATION.
  METHOD num_diff.
    gv_result = gv_num1 - gv_num2.
  ENDMETHOD.

ENDCLASS.

DATA: go_math_op TYPE REF TO math_op.
DATA: go_math_op_diff TYPE REF TO math_op_diff.

START-OF-SELECTION.

  CREATE OBJECT: go_math_op.
  CREATE OBJECT: go_math_op_diff.

  go_math_op->gv_num1 = 11.
  go_math_op->gv_num2 = 2.
  go_math_op->sum_numbers( ).
  WRITE: go_math_op->gv_result.


  go_math_op_diff->gv_num1 = 11.
  go_math_op_diff->gv_num2 = 2.
  go_math_op_diff->num_diff( ).
  WRITE: go_math_op_diff->gv_result.
