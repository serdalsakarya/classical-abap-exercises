*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0006
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBK_EGT_0006.

data: gv_num1 type int4,
      gv_num2 type int4,
      gv_sonuc type int4,
      gv_mes type char20.

START-OF-SELECTION.

gv_num1 = 20.
gv_num2 = 0.
gv_mes = 'Mesaj3'.

CALL FUNCTION 'ZBK_EGITIM_FONKSIYONLARI'
 EXPORTING
   IV_NUM1               = gv_num1
   IV_NUM2               = gv_num2
 IMPORTING
   EV_SONUC              = gv_sonuc
 CHANGING
   CV_MES                = gv_mes
 EXCEPTIONS
   DIVIDED_BY_ZERO       = 1
   OTHERS                = 2.

IF sy-subrc = 0.
Write: / 'Sonuc: ', gv_sonuc.
write: / 'Mesaj: ', gv_mes.
ELSEIF sy-subrc = 1.
  write : / '0 a bolunmez'.
ENDIF.
