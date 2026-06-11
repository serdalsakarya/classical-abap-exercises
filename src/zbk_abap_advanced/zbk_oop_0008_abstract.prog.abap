*&---------------------------------------------------------------------*
*& Report ZBK_OOP_0005_INHERITANCE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_oop_0008_abstract.



CLASS lcl_animal DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      get_num_arms ABSTRACT RETURNING VALUE(rv_arms) TYPE i, "Wie ein Interface
      get_num_legs RETURNING VALUE(rv_legs) TYPE i.
    DATA:
      mv_arms TYPE i,
      mv_legs TYPE i.

ENDCLASS.

CLASS lcl_animal IMPLEMENTATION.
  METHOD get_num_legs.
    rv_legs = mv_legs.
  ENDMETHOD.
ENDCLASS.


CLASS lcl_cat DEFINITION INHERITING FROM lcl_animal.
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_arms TYPE i
                            iv_legs TYPE i,
      get_num_arms REDEFINITION.
ENDCLASS.

CLASS lcl_cat IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    mv_arms = iv_arms.
    mv_legs = iv_legs.
  ENDMETHOD.

  METHOD get_num_arms.
    rv_arms = mv_arms.
  ENDMETHOD.
ENDCLASS.


CLASS lcl_bird DEFINITION INHERITING FROM lcl_animal.
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_arms TYPE i
                            iv_legs TYPE i,
      get_num_arms REDEFINITION.

ENDCLASS.

CLASS lcl_bird IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    mv_arms = iv_arms.
    mv_legs = iv_legs.
  ENDMETHOD.

  METHOD get_num_arms.
    rv_arms = mv_arms.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  DATA go_cat TYPE REF TO lcl_cat.
  CREATE OBJECT go_cat
    EXPORTING
      iv_arms = 0
      iv_legs = 4.

  DATA(lo_bird) = NEW lcl_bird(
    iv_arms = 2
    iv_legs = 2
  ).

  WRITE: 'Cat Leg count: ', go_cat->get_num_legs( ), 'Arm count: ', go_cat->get_num_arms( ).
  WRITE: /'Bird Leg count:: ', lo_bird->get_num_legs( ), 'Arm count: ', lo_bird->get_num_arms( ).
