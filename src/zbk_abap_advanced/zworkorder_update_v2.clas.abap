class ZWORKORDER_UPDATE_V2 definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces IF_EX_WORKORDER_UPDATE .
protected section.
private section.
ENDCLASS.



CLASS ZWORKORDER_UPDATE_V2 IMPLEMENTATION.


  method IF_EX_WORKORDER_UPDATE~BEFORE_UPDATE.
BREAK-POINT.
  endmethod.
ENDCLASS.
