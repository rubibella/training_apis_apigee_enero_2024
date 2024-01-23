Feature:
    Yo como desarrollador de apis y microservicios, negocio me solicita poder consultar el saldo del credito actual solicitado por un cliente

    Scenario Outline: Obtener la información del saldo actual del crédito
        Given I set Content-Type header to application/json
        And I set bearer token
        When I GET `host`/creditos/`versionApi`/<idCredito>/saldos
        Then response code should be 200
        And response body should be valid json
        And response body path $.idCredito should be <idCredito>
        And response body path $.monto should be <monto>
        And response body path $.montoLiquidacion should be <montoLiquidacion>
        Examples:
        |idCredito|monto|montoLiquidacion|
        |1100305940|7000|6500|  

    Scenario Outline: Obtener la información del saldo actual del crédito con un error inesperado
        Given I set Content-Type header to application/json
        And I set bearer token
        When I GET `host`/creditos/`versionApi`/<idCredito>/saldos
        Then response code should be 500
        And response body should be valid json
        And response body path $.codigo should be <codigo>
        And response body path $.mensaje should be <mensaje>
        And response body path $.informacion should be <informacion>
        And response body path $.tracking should be <tracking>
        Examples:
        |idCredito|codigo|mensaje|informacion|tracking|
        |1100305941|500.api-creditos.1200|Error al realizar la operación.|Ocurrio un error inesperado, intentar nuevamente|22920181120162829642|
