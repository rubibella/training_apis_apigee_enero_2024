Feature:
    Yo como desarrollador de apis y microservicios, negocio me solicita poder crear creditos para los clientes de banco poder para ampliar su cartera de credito

    Scenario Outline: Creacion de un creditos bancarios ofertados por banco poder /creditos/versionApi
        
        Given I set Content-Type header to application/json
        And I set body to {"pais":"Mexico","canal":"1","sucursal":{"id":"54","nombre":"Sucursal Leones","telefono":"5580965421","estado":"43","municipio":"10","numero":"50392"},"producto":"5","monto":"20000","plazo":"2","referencias":[{"nombre":"Israel","apellidos":"Ortiz Feria","tipoReferencia":"Companero de Trabajo","aniosConocimiento":"5"}]}
        When I POST to `host`/creditos/`versionApi`
        Then response code should be 201
        And response body should be valid json
        And response body path $.mensaje should be <mensaje>
        And response body path $.codigo should be <codigo>
        And response body path $.detalles.idCredito should be <idCredito>
        And response body path $.detalles.pais should be <pais>
        And response body path $.detalles.canal should be <canal>
        And response body path $.detalles.sucursal.id should be <id>
        And response body path $.detalles.sucursal.nombre should be <nombre>
        And response body path $.detalles.sucursal.telefono should be <telefono>
        And response body path $.detalles.sucursal.estado should be <estado>
        And response body path $.detalles.sucursal.municipio should be <municipio>
        And response body path $.detalles.sucursal.numero should be <numero>
        And response body path $.detalles.cliente should be <cliente>
        And response body path $.detalles.producto should be <producto>
        And response body path $.detalles.monto should be <monto>
        And response body path $.detalles.plazo should be <plazo>
        And response body path $.detalles.fecha should be <fecha>
        And response body path $.detalles.referencias[0].nombre should be <nombreReferencia>
        And response body path $.detalles.referencias[0].apellidos should be <apellidos>
        And response body path $.detalles.referencias[0].tipoReferencia should be <tipoReferencia>
        And response body path $.detalles.referencias[0].aniosConocimiento should be <aniosConocimiento>

        Examples:
        |mensaje|codigo|idCredito|pais|canal|id|nombre|telefono|estado|municipio|numero|cliente|producto|monto|plazo|fecha|nombreReferencia|apellidos|tipoReferencia|aniosConocimiento|
        |La solicitud del crédito se genero correctamente|201|1100305940|Mexico|1|54|Sucural Leones|5580965421|43|10|50392|391849|5|20000|2|2019-02-17|Israel|Ortiz Feria|Compañero de Trabajo|5|
    
    Scenario Outline: Creacion de un credito con datos incorrectos /creditos/versionApi
        
        Given I set Content-Type header to application/json
        And I set bearer token
        And I set body to {"pais":"Mexico","canal":"1x","sucursal":{"id":"54","nombre":"Sucursal Leones","telefono":"5580965421","estado":"43","municipio":"10","numero":"50392"},"producto":"5","monto":"20000","plazo":"2","referencias":[{"nombre":"Israel","apellidos":"Ortiz Feria","tipoReferencia":"Companero de Trabajo","aniosConocimiento":"5"}]}
        When I POST to `host`/creditos/`versionApi`
        Then response code should be 400
        And response body should be valid json
        And response body path $.codigo should be <codigo>
        And response body path $.mensaje should be <mensaje>
        And response body path $.informacion should be <informacion>
        And response body path $.tracking should be <tracking>
        Examples:
        |codigo|mensaje|informacion|tracking|
        |400.api-creditos.1000|Los datos del credito contienen caracteres invalidos|Debes introducir correctamente los datos|98755343|

    Scenario Outline: Creacion de un credito con un evento inesperado en el proceso /creditos/versionApi
        
        Given I set Content-Type header to application/json
        And I set bearer token
        And I set body to {"pais":"USA","canal":"2","sucursal":{"id":"89","nombre":"Sucursal Texas","telefono":"549495938294","estado":"1","municipio":"90","numero":"60392"},"producto":"5","monto":"10000","plazo":"24","referencias":[{"nombre":"Olivia","apellidos":"Castillo Zarate","tipoReferencia":"Vecina","aniosConocimiento":"1"}]}
        When I POST to `host`/creditos/`versionApi`
        Then response code should be 500
        And response body should be valid json
        And response body path $.codigo should be <codigo>
        And response body path $.mensaje should be <mensaje>
        And response body path $.informacion should be <informacion>
        And response body path $.tracking should be <tracking>
        Examples:
        |codigo|mensaje|informacion|tracking|
        |500.api-creditos.1200|Error al realizar la operación.|Ocurrio un error inesperado, intentar nuevamente|22920181120162829642|

    Scenario Outline: actualizacion de los datos de un credito /creditos/versionApi
        
        Given I set Content-Type header to application/json
        And I set bearer token
        And I set body to {"pais":"Mexico","canal":"1","sucursal":{"id":"34","nombre":"Sucursal Cuernavaca","telefono":"7776785434","estado":"12","municipio":"8","numero":"20567"},"producto":"5","monto":"10000","plazo":"36","referencias":[{"nombre":"Israel","apellidos":"Ortiz Feria","tipoReferencia":"Companero de Trabajo","aniosConocimiento":"5"}]}
        When I PUT `host`/creditos/`versionApi`
        Then response code should be 200
        And response body should be valid json
        And response body path $.mensaje should be <mensaje>
        And response body path $.codigo should be <codigo>
        And response body path $.detalles.idCredito should be <idCredito>
        And response body path $.detalles.pais should be <pais>
        And response body path $.detalles.canal should be <canal>
        And response body path $.detalles.sucursal.id should be <id>
        And response body path $.detalles.sucursal.nombre should be <nombre>
        And response body path $.detalles.sucursal.telefono should be <telefono>
        And response body path $.detalles.sucursal.estado should be <estado>
        And response body path $.detalles.sucursal.municipio should be <municipio>
        And response body path $.detalles.sucursal.numero should be <numero>
        And response body path $.detalles.producto should be <producto>
        And response body path $.detalles.monto should be <monto>
        And response body path $.detalles.plazo should be <plazo>
        And response body path $.detalles.referencias[0].nombre should be <nombreReferencia>
        And response body path $.detalles.referencias[0].apellidos should be <apellidos>
        And response body path $.detalles.referencias[0].tipoReferencia should be <tipoReferencia>
        And response body path $.detalles.referencias[0].aniosConocimiento should be <aniosConocimiento>

        Examples:
        |mensaje|codigo|idCredito|pais|canal|id|nombre|telefono|estado|municipio|numero|producto|monto|plazo|nombreReferencia|apellidos|tipoReferencia|aniosConocimiento|
        |La solicitud de credito se ha actualizado exitosamente|200|1100305940|Mexico|1|34|Sucursal Cuernavaca|7776785434|12|8|20567|5|1000|36|Israel|Ortiz Feria|Compañero de Trabajo|5|

    Scenario Outline: actualizacion de los datos de un credito con datos incorrectos /creditos/versionApi
        
        Given I set Content-Type header to application/json
        And I set bearer token
        And I set body to {"pais":"Mexico","canal":"x","sucursal":{"id":"34","nombre":"Sucursal Cuernavaca","telefono":"7776785434","estado":"12","municipio":"8","numero":"20567"},"producto":"5","monto":"10000","plazo":"36","referencias":[{"nombre":"Israel","apellidos":"Ortiz Feria","tipoReferencia":"Companero de Trabajo","aniosConocimiento":"5"}]}
        When I PUT `host`/creditos/`versionApi`
        Then response code should be 400
        And response body should be valid json
        And response body path $.codigo should be <codigo>
        And response body path $.mensaje should be <mensaje>
        And response body path $.informacion should be <informacion>
        And response body path $.tracking should be <tracking>
        Examples:
        |codigo|mensaje|informacion|tracking|
        |400.api-creditos.1000|Los datos del credito contienen caracteres invalidos|Debes introducir correctamente los datos|98755343|

    Scenario Outline: actualizacion de los datos de un credito, con un evento inesperado en el proceso /creditos/versionApi
        
        Given I set Content-Type header to application/json
        And I set bearer token
        And I set body to {"pais":"Mexico","canal":"2","sucursal":{"id":"34","nombre":"Sucursal Cuernavaca","telefono":"7776785434","estado":"12","municipio":"8","numero":"20567"},"producto":"5","monto":"10000","plazo":"36","referencias":[{"nombre":"Israel","apellidos":"Ortiz Feria","tipoReferencia":"Companero de Trabajo","aniosConocimiento":"5"}]}
        When I PUT `host`/creditos/`versionApi`
        Then response code should be 500
        And response body should be valid json
        And response body path $.codigo should be <codigo>
        And response body path $.mensaje should be <mensaje>
        And response body path $.informacion should be <informacion>
        And response body path $.tracking should be <tracking>
        Examples:
        |codigo|mensaje|informacion|tracking|
        |500.api-creditos.1200|Error al realizar la operación.|Ocurrio un error inesperado, intentar nuevamente|22920181120162829642|

    Scenario Outline: Obtener la información de un credito via su identificador /creditos/versionApi
        
        Given I set bearer token
        When I GET `host`/creditos/`versionApi`?idCredito=<idCredito>
        Then response code should be 200
        And response body should be valid json
        And response body path $.idCredito should be <idCreditoRespuesta>
        And response body path $.pais should be <pais>
        And response body path $.canal should be <canal>
        And response body path $.sucursal.id should be <id>
        And response body path $.sucursal.nombre should be <nombre>
        And response body path $.sucursal.telefono should be <telefono>
        And response body path $.sucursal.estado should be <estado>
        And response body path $.sucursal.municipio should be <municipio>
        And response body path $.sucursal.numero should be <numero>
        And response body path $.cliente should be <cliente>
        And response body path $.producto should be <producto>
        And response body path $.monto should be <monto>
        And response body path $.plazo should be <plazo>
        And response body path $.fecha should be <fecha>
        And response body path $.referencias[0].nombre should be <nombreReferencia>
        And response body path $.referencias[0].apellidos should be <apellidos>
        And response body path $.referencias[0].tipoReferencia should be <tipoReferencia>
        And response body path $.referencias[0].aniosConocimiento should be <aniosConocimiento>
        Examples:
        |idCredito|idCreditoRespuesta|pais|canal|id|nombre|telefono|estado|municipio|numero|cliente|producto|monto|plazo|fecha|nombreReferencia|apellidos|tipoReferencia|aniosConocimiento|
        |1100305940|1100305940|Mexico|1|54|Sucural Leones|5580965421|43|10|50392|391849|5|20000|2|2019-02-17|Israel|Ortiz Feria|Compañero de Trabajo|5|

    Scenario Outline: Validacion cuando consultamos un crédito y este no existe /creditos/versionApi
        
        Given I set bearer token
        When I GET `host`/creditos/`versionApi`?idCredito=<idCredito>
        Then response code should be 404
        And response body should be valid json
        And response body path $.codigo should be <codigo>
        And response body path $.mensaje should be <mensaje>
        And response body path $.id should be <id>
        And response body path $.descripcion should be <descripcion>
        Examples:
        |idCredito|codigo|mensaje|id|descripcion|
        |1100305941|404.api-creditos.1100|No existe la información solicitada.|143||

    Scenario Outline: baja de créditos otorgados a clientes /creditos/versionApi
        
        Given I set bearer token
        When I GET `host`/creditos/`versionApi`?idCredito=<idCredito>
        Then response code should be 200
        And response body should be valid json
        And response body path $.mensaje should be <mensaje>
        And response body path $.codigo should be <codigo>
        Examples:
        |idCredito|mensaje|codigo|
        |1100305939|La solicitud de credito se ha dado de baja exitosamente|200|