*&---------------------------------------------------------------------*
*& Report ZBK_OOP_0009_POLYMORPHISM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_oop_0010_polymorphism_if.


INTERFACE lcl_animal.
    METHODS:
      get_type,
      speak .
ENDINTERFACE.


CLASS lcl_cat DEFINITION.
  PUBLIC SECTION.
    INTERFACES: lcl_animal.
ENDCLASS.
CLASS lcl_cat IMPLEMENTATION.
  METHOD lcl_animal~get_type.
    WRITE: 'Cat'.
  ENDMETHOD.
  METHOD lcl_animal~speak.
    WRITE: 'Meow'.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_dog DEFINITION.
  PUBLIC SECTION.
    INTERFACES: lcl_animal.
ENDCLASS.
CLASS lcl_dog IMPLEMENTATION.
  METHOD lcl_animal~get_type.
    WRITE: 'Dog'.
  ENDMETHOD.
  METHOD lcl_animal~speak.
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
