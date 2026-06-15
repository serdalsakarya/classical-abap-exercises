"Name: \PR:SAPMV45A\FO:USEREXIT_MOVE_FIELD_TO_VBKD\SE:END\EI
ENHANCEMENT 0 ZSD_ENH_MV45AFZZ_VBKD_CHANGE.
CASE vbkd-zterm.
  WHEN '0001'.
    vbkd-inco1 = 'CFR'.
    vbkd-inco2_l = 'ZTERM 0001 is selected'.
  WHEN '0002'.
    vbkd-inco1 = 'DEQ'.
    vbkd-inco2_l = 'ZTERM 0002 is selected'.
  WHEN '0003'.
    vbkd-inco1 = 'FAS'.
    vbkd-inco2_l = 'ZTERM 0003 is selected'.
  WHEN '0004'.
    vbkd-inco1 = 'FOB'.
    vbkd-inco2_l = 'ZTERM 0004 is selected'.
  WHEN OTHERS.
    vbkd-inco1 = ''.
    vbkd-inco2_l = 'ZTERM is not selected'.
ENDCASE.
ENDENHANCEMENT.
