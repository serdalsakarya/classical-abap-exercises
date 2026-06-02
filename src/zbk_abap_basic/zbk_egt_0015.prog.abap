*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0015
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0015.

DATA: gv_ad    TYPE char20,
      gv_soyad TYPE char30.
DATA: gv_rad1 TYPE char1,
      gv_rad2 TYPE xfeld.
DATA gv_chbox TYPE xfeld.
DATA gv_yas TYPE i.
DATA: gv_id     TYPE vrm_id,
      gt_values TYPE vrm_values,
      gs_value  TYPE vrm_value.
DATA ok_code TYPE sy-ucomm.
DATA gv_date TYPE datum.
DATA gs_log TYPE zbk_egt_0001.

CALL SCREEN 0100.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS '0100'.
* SET TITLEBAR 'Veri Girisim'.

  gv_id = 'GV_YAS'.

  DATA: gv_index TYPE i,
        gv_yas_c TYPE char20.
  gv_index = 18.
  DO 60 TIMES.
*
    gs_value-key = gv_index .
    gs_value-text = gv_index.
    APPEND gs_value TO gt_values.
    gv_index = gv_index + 1.
  ENDDO.



  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id     = gv_id
      values = gt_values.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  gv_yas_c = gv_yas.
  IF ok_code = '&BACK'.
*    MESSAGE gv_yas_c TYPE 'I'.
    LEAVE TO SCREEN 0.
  ENDIF.

  IF ok_code = '&CLEAR'.
    CLEAR: gv_ad,gv_soyad,gv_chbox, gv_rad1, gv_yas, gv_date.
  ENDIF.

  IF  ok_code = '&SAVE'.
    PERFORM save.
  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Form save
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM save .
  gs_log-ad = gv_ad.
  gs_log-soyad = gv_soyad.
  IF  gv_rad2 = abap_true .
    gs_log-cinsiyet = 'K'.
  ELSE.
    gs_log-cinsiyet = 'E'.
  ENDIF.
  gs_log-zdate = gv_date.
  gs_log-yas = gv_yas.
  gs_log-cbox = gv_chbox.

  INSERT zbk_egt_0001 FROM gs_log.
  COMMIT WORK AND WAIT.

  MESSAGE 'eklendi.' TYPE 'I'.
ENDFORM.
