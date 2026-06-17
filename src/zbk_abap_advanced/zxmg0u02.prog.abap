*&---------------------------------------------------------------------*
*& Include          ZXMG0U02
*&---------------------------------------------------------------------*

DATA: ls_log TYPE zmm_bk_max_value.

SELECT SINGLE * FROM zmm_bk_max_value INTO ls_log
  WHERE matkl = wmara-matkl.

IF sy-subrc = 0.
  IF wmara-ntgew GT ls_log-max_ntgew.
    cmara-ntgew = ls_log-max_ntgew.
  ENDIF.
  IF wmara-brgew GT ls_log-max_brgew.
    cmara-brgew = ls_log-max_brgew.
  ENDIF.
ELSE.
  RAISE application_error.
ENDIF.
