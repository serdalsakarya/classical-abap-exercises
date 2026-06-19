*&---------------------------------------------------------------------*
*& Include          ZXCO1U06
*&---------------------------------------------------------------------*

*"       IMPORTING
*"             VALUE(HEADER_IMP) LIKE  CAUFVD STRUCTURE  CAUFVD
*"       EXPORTING
*"             VALUE(NO_UPDATE) LIKE  SY-DATAR
*"             VALUE(HEADER_EXP) LIKE  CAUFVD STRUCTURE  CAUFVD
*"----------------------------------------------------------------------

IF header_imp-gamng < 20.
  MESSAGE 'Total Quantity cannot be less than 20.' TYPE 'I'.
  no_update = abap_true.
ELSEIF header_imp-gamng GT 100.
  header_exp = header_imp.
  header_exp-gamng = 100.
  MESSAGE 'Total Quantity cannot be max 100. Thats why it is set to 100.' TYPE 'I'.
ENDIF.
