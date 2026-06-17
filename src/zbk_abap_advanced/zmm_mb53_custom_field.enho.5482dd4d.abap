"Name: \PR:RM07MLBS\FO:LIST_OUTPUT\SE:BEGIN\EI
ENHANCEMENT 0 ZMM_MB53_CUSTOM_FIELD.

DATA: lt_ean11 TYPE TABLE OF mara,
      ls_ean11 TYPE mara.

SELECT matnr ean11 FROM mara INTO CORRESPONDING FIELDS OF TABLE lt_ean11
  FOR ALL ENTRIES IN bestand
  WHERE matnr = bestand-matnr.

LOOP AT bestand.
  READ TABLE lt_ean11 INTO ls_ean11 WITH  KEY matnr = bestand-matnr.
  bestand-zzean11 = ls_ean11-ean11.
  MODIFY bestand.
ENDLOOP.

ENDENHANCEMENT.
