Feature:
    Yo como desarrollador de apis y microservicios, negocio me solicita poder consultar toddos los pagos realizados por los clientes a un credito

    Scenario Outline: Obtener la información del saldo actual del crédito
        Given I set Content-Type header to application/json
        And I set bearer token
        When I GET `host`/creditos/`versionApi`/<idCredito>/pagos
        Then response code should be 200
        And response body should be valid json
        And response body path $.idCredito should be <idCredito>
        And response body path $.capital should be <capital>
        And response body path $.intereses should be <intereses>
        And response body path $.detalle[0].idPago should be <idPago>
        And response body path $.detalle[0].fechaAplicacion should be <fechaAplicacion>
        And response body path $.detalle[0].concepto should be <concepto>
        And response body path $.detalle[0].importe should be <importe>

        Examples:
        |idCredito|capital|intereses|idPago|fechaAplicacion|concepto|importe|
        |1100305940|10000|0|12|2019-02-20|Abono de credito autorizado|500|

    Scenario Outline: Obtener la información de los pagos realizados a un credito con un evento inesperado
        Given I set Content-Type header to application/json
        And I set bearer token
        When I GET `host`/creditos/`versionApi`/<idCredito>/pagos
        Then response code should be 500
        And response body should be valid json
        And response body path $.codigo should be <codigo>
        And response body path $.mensaje should be <mensaje>
        And response body path $.informacion should be <informacion>
        And response body path $.tracking should be <tracking>
        Examples:
        |idCredito|codigo|mensaje|informacion|tracking|
        |1100305943|500.api-creditos.1200|Error al realizar la operación.|Ocurrio un error inesperado, intentar nuevamente|22920181120162829642|
