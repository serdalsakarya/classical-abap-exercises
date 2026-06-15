"Name: \PR:SAPMV45A\FO:USEREXIT_SAVE_DOCUMENT\SE:END\EI
ENHANCEMENT 0 ZSD_ENH_MV45AFZZ_AUDAT_LOG.
DATA: ls_log TYPE zbk_oop_t0002.
ls_log-uname         = sy-uname.
ls_log-datum         = sy-datum.
ls_log-uzeit         = sy-uzeit.
ls_log-old_audat     = yvbak-audat.
ls_log-new_audat     = vbak-audat.

INSERT zbk_oop_t0002 FROM ls_log.

ENDENHANCEMENT.
