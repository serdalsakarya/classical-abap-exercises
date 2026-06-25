class ZME_PROCESS_PO_CUST definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces IF_EX_ME_PROCESS_PO_CUST .
protected section.
private section.
ENDCLASS.



CLASS ZME_PROCESS_PO_CUST IMPLEMENTATION.


  METHOD if_ex_me_process_po_cust~check.
    DATA:
      lt_items TYPE purchase_order_items,
      ls_item  TYPE purchase_order_item,
      ls_mepo  TYPE mepoitem,
      lv_ttl   TYPE brgew.

    lt_items = im_header->get_items( ).

    LOOP AT lt_items INTO ls_item.
      lv_ttl = lv_ttl + ls_item-item->get_data( )-brgew.

    ENDLOOP.

    IF lv_ttl GT 50.
      MESSAGE 'Total gross weight of items cannot be more than 50' TYPE 'E'.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
