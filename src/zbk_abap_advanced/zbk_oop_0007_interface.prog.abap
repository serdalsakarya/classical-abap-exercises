*&---------------------------------------------------------------------*
*& Report ZBK_OOP_0007_INTERFACE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_oop_0007_interface.

INTERFACE lif_animal.

  METHODS:
    get_num_arms RETURNING VALUE(rv_arms) TYPE i,
    get_num_legs RETURNING VALUE(rv_legs) TYPE i.

  DATA: mv_arms TYPE i,
        mv_legs TYPE i.

ENDINTERFACE.

CLASS lcl_cat DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_arms TYPE i
                                   iv_legs TYPE i.
    INTERFACES lif_animal.

ENDCLASS.

CLASS lcl_cat IMPLEMENTATION.

  METHOD constructor.
    lif_animal~mv_arms = iv_arms.
    lif_animal~mv_legs = iv_legs.
  ENDMETHOD.


  METHOD lif_animal~get_num_arms.
    rv_arms = lif_animal~mv_arms.
  ENDMETHOD.

  METHOD lif_animal~get_num_legs.
    rv_legs = lif_animal~mv_legs.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_bird DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_arms TYPE i
                                   iv_legs TYPE i.
    INTERFACES lif_animal.

ENDCLASS.

CLASS lcl_bird IMPLEMENTATION.

  METHOD constructor.
    lif_animal~mv_arms = iv_arms.
    lif_animal~mv_legs = iv_legs.
  ENDMETHOD.


  METHOD lif_animal~get_num_arms.
    rv_arms = lif_animal~mv_arms.
  ENDMETHOD.

  METHOD lif_animal~get_num_legs.
    rv_legs = lif_animal~mv_legs.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA(go_cat) = NEW lcl_cat(
    iv_arms = 4
    iv_legs = 0
  ).

  data(go_bird) = new lcl_bird(
    iv_arms = 2
    iv_legs = 2
  ).

  WRITE: 'Cat arms count', go_cat->lif_animal~get_num_arms( ), ', Cat legs Count:',go_cat->lif_animal~get_num_legs( ).
  WRITE: /'Bird arms count', go_bird->lif_animal~get_num_arms( ), ', Bird legs Count:',go_bird->lif_animal~get_num_legs( ).
