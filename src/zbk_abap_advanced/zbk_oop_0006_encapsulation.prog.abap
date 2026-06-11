*&---------------------------------------------------------------------*
*& Report ZBK_OOP_0005_INHERITANCE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_oop_0006_encapsulation.



CLASS lcl_animal DEFINITION.
  PUBLIC SECTION.
    METHODS:
      get_num_arms RETURNING VALUE(rv_arms) TYPE i.
    DATA:
      mv_arms TYPE i.

  PROTECTED SECTION.
    METHODS:
      get_num_legs_protected RETURNING VALUE(rv_legs) TYPE i.
    DATA:
      mv_legs_protected TYPE i.

    PRIVATE SECTION.
    METHODS:
      get_num_legs_private RETURNING VALUE(rv_legs) TYPE i.
    DATA:
      mv_legs_private TYPE i.
ENDCLASS.

CLASS lcl_animal IMPLEMENTATION.
  METHOD get_num_arms.
    rv_arms = mv_arms.
  ENDMETHOD.
  METHOD get_num_legs_protected.
    rv_legs = mv_legs_protected.
  ENDMETHOD.
   METHOD get_num_legs_private.
    rv_legs = mv_legs_private.
  ENDMETHOD.
ENDCLASS.


CLASS lcl_cat DEFINITION INHERITING FROM lcl_animal.
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_arms TYPE i
                            iv_legs TYPE i
                            iv_legs_private TYPE i.
ENDCLASS.

CLASS lcl_cat IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    mv_arms = iv_arms.
    mv_legs_protected = iv_legs.
*    mv_legs_private = iv_legs_private.
  ENDMETHOD.
ENDCLASS.


START-OF-SELECTION.

  DATA go_cat TYPE REF TO lcl_cat.
  CREATE OBJECT go_cat
    EXPORTING
      iv_arms         = 0
      iv_legs         = 4
      iv_legs_private = 4
    .
  WRITE: "'Cat Leg count: ', go_cat->get_num_legs_protected( ),
*  'Cat Leg private count: ', go_cat->get_num_legs_private( ),
  'Arm count: ', go_cat->get_num_arms( ).
