Feature:
    Yo como desarrollador de apis y microservicios, negocio me solicita poder aprobar los créditos solicitados por los clientes

    Scenario Outline: aprobaciones de créditos del banco poder /creditos/versionApi/aprobaciones
        
        Given I set Content-Type header to application/json
        And I set bearer token
        And I set body to {"idCredito":"1100305940","idCliente":"391849"}
        When I POST to `host`/creditos/`versionApi`/aprobaciones
        Then response code should be 201
        And response body should be valid json
        And response body path $.mensaje should be <mensaje>
        And response body path $.codigo should be <codigo>
        Examples:
        |mensaje|codigo|
        |La solicitud del crédito se aprobo exitosamente|201|
    
    Scenario Outline: escenario de evento inesperado al al realizar una aprobacion de un crédito bancario /creditos/versionApi
        
        Given I set Content-Type header to application/json
        And I set bearer token
        And I set body to {"idCredito":"1200305940","idCliente":"391849"}
        When I POST to `host`/creditos/`versionApi`/aprobaciones
        Then response code should be 500
        And response body should be valid json
        And response body path $.mensaje should be <mensaje>
        And response body path $.codigo should be <codigo>
        And response body path $.informacion should be <informacion>
        And response body path $.tracking should be <tracking>
        Examples:
        |codigo|mensaje|informacion|tracking|
        |500.api-creditos.1200|Error al realizar la operación.|Ocurrio un error inesperado, intentar nuevamente|22920181120162829642|

    