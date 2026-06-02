*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0018
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0018.

DATA: gv_name    TYPE char20,
      gv_surname TYPE char30,
      gv_age     TYPE num4.

DATA gv_tmp TYPE xfeld.

START-OF-SELECTION.
  CALL SCREEN 0100.



*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS '0100'.
  LOOP AT SCREEN.
    IF  screen-group1 = 'X' AND gv_tmp = abap_true.
      screen-input = 1.
      MODIFY SCREEN.
    ELSEIF screen-group1 = 'X' AND gv_tmp = abap_false.
      screen-input = 0.
      MODIFY SCREEN.
    ENDIF.
*    IF screen-name = 'GV_NAME'.
*      screen-input = 0.
*      MODIFY SCREEN.
*    ENDIF.
*    IF  screen-name = 'GV_SURNAME'.
*      screen-invisible = 1.
*      MODIFY SCREEN.
*    ENDIF.
*    IF  screen-name = 'GV_AGE'.
*      screen-active = 0.
*      MODIFY SCREEN.
*    ENDIF.
*    IF screen-group1 = 'X'.
*      screen-input = 0.
*      MODIFY SCREEN.
*    ENDIF.
  ENDLOOP.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  IF sy-ucomm = '&BACK'.
    SET SCREEN 0.
  ENDIF.
  IF sy-ucomm = '&ENABLE'.
    gv_tmp = abap_true.
  ENDIF.
  IF  sy-ucomm = '&DISABLE'.
    gv_tmp = abap_false.
  ENDIF.
ENDMODULE.
