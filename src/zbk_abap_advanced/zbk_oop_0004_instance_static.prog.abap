*&---------------------------------------------------------------------*
*& Report ZBK_OOP_0004_INSTANCE_STATIC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_oop_0004_instance_static.

CLASS lcl_main DEFINITION DEFERRED.
DATA: go_main1 TYPE REF TO lcl_main,
      go_main2 TYPE REF TO lcl_main,
      go_main3 TYPE REF TO lcl_main.

CLASS lcl_main DEFINITION.
  PUBLIC SECTION.

    DATA: mv_id TYPE char10,
          mv_ad TYPE char20.
    CLASS-DATA: mv_age   TYPE numc2,
                mv_ttnum TYPE i.

    METHODS: do_process IMPORTING iv_id  TYPE char10
                                  iv_ad  TYPE char20
                                  iv_age TYPE numc2.
    CLASS-METHODS: class_constructor, inc_num.



ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD class_constructor.
    mv_ttnum = mv_ttnum + 1.
    endmethod.

    METHOD inc_num.
      mv_ttnum = mv_ttnum + 1.
      ENDMETHOD.

  METHOD do_process.
    mv_id  = iv_id .
    mv_ad  = iv_ad .
    mv_age = iv_age.

  ENDMETHOD.





ENDCLASS.


START-OF-SELECTION.

  CREATE OBJECT: go_main1, go_main2, go_main3.

  go_main1->do_process(
    iv_id  = '10000001'
    iv_ad  = 'Ser'
    iv_age =  40
  ).

  go_main2->do_process(
    iv_id  = '10000002'
    iv_ad  = 'Mer'
    iv_age =  33
  ).

  go_main3->do_process(
    iv_id  = '10000003'
    iv_ad  = 'Ber'
    iv_age =  22
  ).

  WRITE: / go_main1->mv_id, go_main1->mv_ad, go_main1->mv_age,
  / go_main2->mv_id, go_main2->mv_ad, go_main2->mv_age,
  / go_main3->mv_id, go_main3->mv_ad, go_main3->mv_age.

  write: / go_main1->mv_ttnum.
  write: / go_main2->mv_ttnum.
  write: / go_main3->mv_ttnum.

  go_main1->inc_num( ).
  go_main1->inc_num( ).
  go_main2->inc_num( ).
  go_main1->inc_num( ).
  go_main3->inc_num( ).
  go_main2->inc_num( ).
  go_main1->inc_num( ).
    write: /'****',/ go_main1->mv_ttnum.
  write: / go_main2->mv_ttnum.
  write: / go_main3->mv_ttnum.
