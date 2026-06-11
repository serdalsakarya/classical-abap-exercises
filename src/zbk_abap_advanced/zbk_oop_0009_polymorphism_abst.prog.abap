*&---------------------------------------------------------------------*
*& Report ZBK_OOP_0009_POLYMORPHISM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_oop_0009_polymorphism_abst.


CLASS lcl_animal DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      get_type ABSTRACT,
      speak ABSTRACT.
ENDCLASS.


CLASS lcl_cat DEFINITION INHERITING FROM lcl_animal.
  PUBLIC SECTION.
    METHODS:
      get_type REDEFINITION,
      speak REDEFINITION.
ENDCLASS.
CLASS lcl_cat IMPLEMENTATION.
  METHOD get_type.
    WRITE: 'Cat'.
  ENDMETHOD.
  METHOD speak.
    WRITE: 'Meow'.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_dog DEFINITION INHERITING FROM lcl_animal.
  PUBLIC SECTION.
    METHODS:
      get_type REDEFINITION,
      speak REDEFINITION.
ENDCLASS.
CLASS lcl_dog IMPLEMENTATION.
  METHOD get_type.
    WRITE: 'Dog'.
  ENDMETHOD.
  METHOD speak.
    WRITE: 'Bark'.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  DATA: go_animal_1 TYPE REF TO lcl_animal,
        go_animal_2 TYPE REF TO lcl_animal.

  go_animal_1 = NEW lcl_cat( ).
  go_animal_2 = NEW lcl_dog( ).

  go_animal_1->get_type( ).
  WRITE: 'speaks'.
  go_animal_1->speak( ).
  WRITE: /.
  go_animal_2->get_type( ).
  WRITE: 'speaks'.
  go_animal_2->speak( ).
