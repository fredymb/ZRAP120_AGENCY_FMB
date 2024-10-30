CLASS lsc_zr_agencyfmb DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zr_agencyfmb IMPLEMENTATION.

  METHOD save_modified.
    "send notification for new agency instances
    IF create IS NOT INITIAL.
      "raise event
      RAISE ENTITY EVENT zr_agencyFMB~entity_created
       FROM VALUE #(
         FOR agency IN create-agency
           "transferred information
           ( %key        = agency-%key
             agency_id   = agency-agencyId
             agency_name = agency-agencyName
             created_by  = agency-LocalCreatedBy
             created_at  = agency-LocalCreatedAt
           )
         ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_zr_agencyfmb DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Agency
        RESULT result.
ENDCLASS.

CLASS lhc_zr_agencyfmb IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
ENDCLASS.
