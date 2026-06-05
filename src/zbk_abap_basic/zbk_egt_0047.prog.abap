*&---------------------------------------------------------------------*
*& Report ZBK_EGT_0046
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbk_egt_0047.

PARAMETERS: p_id   TYPE int1,
            p_ad   TYPE char30,
            p_cins TYPE char1.

TYPES: BEGIN OF gty_list,
           pers_id     TYPE  zbk_persid_de,
           pers_ad     TYPE  zbk_persad_de,
           pers_cins   TYPE  zbk_perscins_de,
         END OF gty_list.

  DATA: gt_list       TYPE TABLE OF gty_list,
        gt_RETURN_TAB TYPE TABLE OF  ddshretval,
        gt_MAPPING    TYPE TABLE OF  dselc,
        gs_MAPPING    TYPE dselc.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_id.

select * from zbk_pers_t into CORRESPONDING FIELDS OF table gt_list.


  gs_mapping-fldname = 'F0001'.
  gs_mapping-dyfldname = 'P_ID'.
  append gs_mapping to gt_mapping.

  gs_mapping-fldname = 'F0002'.
  gs_mapping-dyfldname = 'P_AD'.
  append gs_mapping to gt_mapping.

  gs_mapping-fldname = 'F0003'.
  gs_mapping-dyfldname = 'P_CINS'.
  append gs_mapping to gt_mapping.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield        = 'PERS_ID'
      dynpprog        = sy-repid
      dynpnr          = sy-dynnr
      dynprofield     = 'P_ID'
      value_org       = 'S'
    TABLES
      value_tab       = gt_list
      return_tab      = gt_RETURN_TAB
      dynpfld_mapping = gt_MAPPING
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


START-OF-SELECTION.
