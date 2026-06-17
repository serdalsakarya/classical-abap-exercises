"Name: \PR:RM07MLBS\FO:F0300_FIELDCAT_FLAT\SE:END\EI
ENHANCEMENT 0 ZMM_MB53_CUSTOM_FIELD.
FIELD-SYMBOLS: <lfs_fcat> TYPE slis_fieldcat_alv.
macro_fill_fieldcat 'ZZEAN11'  'BESTAND'   ''.

READ TABLE fieldcat ASSIGNING <lfs_fcat> WITH KEY fieldname = 'ZZEAN11'.
IF sy-subrc = 0.
  <lfs_fcat>-seltext_s = 'EAN11 Code'.
  <lfs_fcat>-seltext_m = 'EAN11 Code'.
  <lfs_fcat>-seltext_l = 'EAN11 Code'.

ENDIF.

ENDENHANCEMENT.
