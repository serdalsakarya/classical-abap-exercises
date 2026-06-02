*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0019
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0019.

PARAMETERS: p_rad1 RADIOBUTTON GROUP rgr1 DEFAULT 'X' USER-COMMAND usr1,
            p_rad2 RADIOBUTTON GROUP rgr1.

PARAMETERS: p_lifnr TYPE lifnr MODIF ID gr1,
            p_vname TYPE name1_gp MODIF ID gr1 DEFAULT 'Satici ismi',
            p_kunnr TYPE kunnr MODIF ID gr2,
            p_kname TYPE name1_gp MODIF ID gr2 DEFAULT 'Musteri ismi'.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.

    IF screen-group1 = 'GR1' AND p_rad1 = abap_true.
      screen-active = 1.
    ELSEIF screen-group1 = 'GR1' AND p_rad1 = abap_false.
      screen-active = 0.
    ELSEIF  screen-group1 = 'GR2' AND p_rad2 = abap_true.
      screen-active = 1.
    ELSEIF  screen-group1 = 'GR2' AND p_rad2 = abap_false.
      screen-active = 0.
    ENDIF.
    MODIFY SCREEN.
  ENDLOOP.
