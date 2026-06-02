FUNCTION ZBK_EGITIM_FONKSIYONLARI.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_NUM1) TYPE  INT4 DEFAULT 10
*"     REFERENCE(IV_NUM2) TYPE  INT4 DEFAULT 2
*"  EXPORTING
*"     REFERENCE(EV_SONUC) TYPE  INT4
*"  CHANGING
*"     REFERENCE(CV_MES) TYPE  CHAR20 OPTIONAL
*"  EXCEPTIONS
*"      DIVIDED_BY_ZERO
*"----------------------------------------------------------------------

if iv_num2 is initial.
  raise DIVIDED_BY_ZERO.
  endif.

ev_sonuc = iv_num1 / iv_num2.

cv_mes = 'Degistiirlmis Mesajim'.



ENDFUNCTION.
