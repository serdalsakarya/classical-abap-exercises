class Z_CL_EGITIM_CLASS definition
  public
  final
  create public .

public section.

  interfaces Z_CL_EGITIM_INTERFACE .

  aliases MULT_NUMBERS
    for Z_CL_EGITIM_INTERFACE~MULT_NUMS .

  constants CV_NUM type INT4 value 100 ##NO_TEXT.

  class-events DIVIDE_NUMBERS
    exporting
      value(IV_NUM1S) type INT4 optional
      value(IV_NUM2S) type INT4 optional
      value(EV_NUMS) type INT4 optional .

  methods SUM_NUMBER
    importing
      value(IV_NUM1) type INT4 optional
      value(IV_NUM2) type INT4 optional
    exporting
      value(EV_RESULT) type INT4 .
  class-methods DIFF_NUM1
    importing
      value(IV_NUM1) type INT4 optional
      value(IV_NUM2) type INT4 optional
    exporting
      value(EV_RESULT) type INT4 .
  class-methods DIVIDE_NUMS
    for event DIVIDE_NUMBERS of Z_CL_EGITIM_CLASS
    importing
      !IV_NUM1S
      !IV_NUM2S
      !EV_NUMS .
protected section.
private section.

  methods SUM_NUMBERS_PRIVATE .
ENDCLASS.



CLASS Z_CL_EGITIM_CLASS IMPLEMENTATION.


  method DIFF_NUM1.
    z_cl_egitim_class2=>diff_nums(
      EXPORTING
        iv_num1   =  iv_num1                 " 4 Byte Signed Integer
        iv_num2   =  iv_num2                 " 4 Byte Signed Integer
      IMPORTING
        ev_result =  ev_result                " 4 Byte Signed Integer
    ).
  endmethod.


  method DIVIDE_NUMS.

  endmethod.


  METHOD sum_number.
    ev_result = iv_num1 + iv_num2 + cv_num.
  ENDMETHOD.


  method SUM_NUMBERS_PRIVATE.
  endmethod.


   method Z_CL_EGITIM_INTERFACE~MULT_NUMS.
  endmethod.
ENDCLASS.
