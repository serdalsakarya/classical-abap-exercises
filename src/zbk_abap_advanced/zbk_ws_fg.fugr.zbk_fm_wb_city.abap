FUNCTION zbk_fm_wb_city.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_CITY_ID) TYPE  ZBK_DE_CITY_ID
*"     VALUE(IV_CITY_NAME) TYPE  ZBK_DE_CITY_NAME
*"  EXPORTING
*"     VALUE(EV_SUCCESS) TYPE  XFELD
*"     VALUE(EV_MESSAGE) TYPE  BAPI_MSG
*"----------------------------------------------------------------------

  DATA: ls_city TYPE zbk_city_list.

  ls_city-city_id = iv_city_id.
  ls_city-city_name = iv_city_name.
  ls_city-uname = sy-uname.
  ls_city-datum = sy-datum.
  ls_city-uzeit = sy-uzeit.

  SELECT COUNT(*) FROM zbk_city_list
    WHERE city_id = iv_city_id.
  IF sy-subrc = 0.
    ev_success = abap_false.
    ev_message = 'This city was already saved.'.

  ELSE.
    INSERT zbk_city_list FROM ls_city.
    IF sy-subrc = 0.
      COMMIT WORK.
      ev_success = abap_true.
      ev_message = 'This city is saved succesfully.'.
    ELSE.
      ev_success = abap_false.
      ev_message = 'There is an error, when the city is saving.'.
    ENDIF.
  ENDIF.

ENDFUNCTION.
