FUNCTION ZBK_FM_WB_COUNTRY.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_COUNTRY_ID) TYPE  ZBK_DE_COUNTRY_ID
*"     VALUE(IV_COUNTRY_NAME) TYPE  ZBK_DE_COUNTRY_NAME
*"  EXPORTING
*"     VALUE(EV_SUCCESS) TYPE  XFELD
*"     VALUE(EV_MESSAGE) TYPE  BAPI_MSG
*"----------------------------------------------------------------------

  DATA: ls_country TYPE zbk_country_list.

  ls_country-country_id = iv_country_id.
  ls_country-country_name = iv_country_name.
  ls_country-uname = sy-uname.
  ls_country-datum = sy-datum.
  ls_country-uzeit = sy-uzeit.

  SELECT COUNT(*) FROM zbk_country_list
    WHERE country_id = iv_country_id.
  IF sy-subrc = 0.
    ev_success = abap_false.
    ev_message = 'This country was already saved.'.

  ELSE.
    INSERT zbk_country_list FROM ls_country.
    IF sy-subrc = 0.
      COMMIT WORK.
      ev_success = abap_true.
      ev_message = 'This country is saved succesfully.'.
    ELSE.
      ev_success = abap_false.
      ev_message = 'There is an error, when the country is saving.'.
    ENDIF.
  ENDIF.

ENDFUNCTION.
