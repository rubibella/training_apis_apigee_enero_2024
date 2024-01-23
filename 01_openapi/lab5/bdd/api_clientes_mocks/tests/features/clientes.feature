#Quien
#que se desea
#para que
Feature:
    Yo como desarrollador de apis y microservicios, negocio me solicita poder consultar,crear,modificar y eliminar los clientes del banco poder para su administracion en el banco

    Scenario Outline: Obtener la información del cliente via el recurso  /clientes/v1
                
        When I GET `host`/clientes/`versionApi`?idCliente=<idCliente>        
        Then response code should be 200
        And response body should be valid json
        And response body path $.id should be <id>
        And response body path $.nombre should be <nombre>
        And response body path $.apellidoPaterno should be <apellidoPaterno>
        And response body path $.apellidoMaterno should be <apellidoMaterno>
        And response body path $.edad should be <edad>
        And response body path $.rfc should be <rfc>
        And response body path $.email should be <email>
        And response body path $.direccion should be <direccion>
        And response body path $.codigoPostal should be <codigoPostal>
        And response body path $.referencias should be <referencias>
        And response body path $.genero should be <genero>
        Examples:
        |idCliente|id|nombre|apellidoPaterno|apellidoMaterno|edad|rfc|email|direccion|codigoPostal|referencias|genero|
        |1000|1000|Yaridel|Arzate|Landa|25|CUPU800825569|yaridelal435@gmail.com|calle esperanza, 10 de abril, Temixco Morelos|62588|Frente a la base de camiones LOS PEPES|F|
        |5000|5000|Jovani|Arzate|Cabrera|28|456787656453454sds|jovaniac@gmail.com|bugambilias 2, colonia 10 de abril, Temixco Morelos|0634560|enfrente de la tortilleria ALFONSOS|M|
        

    Scenario Outline: Obtener la información del cliente pero validando cuando ingresamos mal los datos de consulta /clientes/versionApi
                
        When I GET `host`/clientes/`versionApi`?idCliente=<idCliente>        
        Then response code should be 400
        And response body should be valid json
        And response body path $.codigo should be <codigo>
        And response body path $.mensaje should be <mensaje>
        And response body path $.informacion should be <informacion>
        And response body path $.tracking should be <tracking>
        Examples:
        |idCliente|codigo|mensaje|informacion|tracking|
        |1000s|400.api-clientes.1000|Los datos del cliente contienen caracteres invalidos|Debes introducir correctamente los datos|98755343|

    Scenario Outline: Caso donde validamos que un cliente no exista /clientes/versionApi                
        When I GET `host`/clientes/`versionApi`?idCliente=<idCliente>
        Then response code should be 404
        And response body should be valid json
        And response body path $.codigo should be <codigo>
        And response body path $.mensaje should be <mensaje>
        And response body path $.id should be <id>
        And response body path $.descripcion[0] should be <descripcion>
        Examples:
        |idCliente|codigo|mensaje|id|descripcion|
        |5001|404.api-clientes.1100|No existe la información solicitada.|5001||

    Scenario Outline: Obtener la información del cliente pero validando cuando ingresamos mal los datos de consulta /clientes/versionApi                

        When I GET `host`/clientes/`versionApi`?idCliente=<idCliente>        
        Then response code should be 500
        And response body should be valid json
        And response body path $.codigo should be <codigo>
        And response body path $.mensaje should be <mensaje>
        And response body path $.informacion should be <informacion>
        And response body path $.tracking should be <tracking>
        Examples:
        |idCliente|codigo|mensaje|informacion|tracking|
        |2000|500.api-clientes.1200|Error al realizar la operación.|Ocurrio un error inesperado, intentar nuevamente|22920181120162829642|

    Scenario Outline: Creacion de un cliente de banco poder /clientes/versionApi
        
        Given I set Content-Type header to application/json        
        And I set body to {"nombre": "Yaridel","apellidoPaterno": "Arzate","apellidoMaterno": "Landa","edad": "25","rfc":"CUPU800825569","email":"yaridel@gmail.com","direccion":"calle esperanza, num 10 de abril, Temixco Morelos","codigoPostal":"62588","referencias":"Frente a la base de camiones LOS PEPES","genero": "F"}
        When I POST to `host`/clientes/`versionApi`
        Then response code should be 201
        And response body should be valid json
        And response body path $.mensaje should be <mensaje>
        And response body path $.codigo should be <codigo>
        And response body path $.detalles.id should be <id>
        And response body path $.detalles.nombre should be <nombre>
        And response body path $.detalles.apellidoPaterno should be <apellidoPaterno>
        And response body path $.detalles.apellidoMaterno should be <apellidoMaterno>
        And response body path $.detalles.edad should be <edad>
        And response body path $.detalles.rfc should be <rfc>
        And response body path $.detalles.email should be <email>
        And response body path $.detalles.direccion should be <direccion>
        And response body path $.detalles.codigoPostal should be <codigoPostal>
        And response body path $.detalles.referencias should be <referencias>
        And response body path $.detalles.genero should be <genero>

        Examples:
        |mensaje|codigo|id|nombre|apellidoPaterno|apellidoMaterno|edad|rfc|email|direccion|codigoPostal|referencias|genero|
        |El Cliente se ha creado exitosamente|201|1000|Yaridel|Arzate|Landa|25|CUPU800825569|yaridelal435@gmail.com|calle esperanza, 10 de abril, Temixco Morelos|62588|Frente a la base de camiones LOS PEPES|F|
       
        
    Scenario Outline: Creacion de un cliente de banco poder, cliente nuevo /clientes/versionApi
        
        Given I set Content-Type header to application/json        
        And I set body to {"nombre": "Jovani","apellidoPaterno": "Arzate","apellidoMaterno": "Cabrera","edad": "28","rfc":"456787656453454","email":"jovaniac@gmail.com","direccion":"bugambilias 2, colonia 10 de abril, Temixco Morelos","codigoPostal":"0634560","referencias":"enfrente de la tortilleria ALFONSOS","genero": "M"}
        When I POST to `host`/clientes/`versionApi`
        Then response code should be 201
        And response body should be valid json
        And response body path $.mensaje should be <mensaje>
        And response body path $.codigo should be <codigo>
        And response body path $.detalles.id should be <id>
        And response body path $.detalles.nombre should be <nombre>
        And response body path $.detalles.apellidoPaterno should be <apellidoPaterno>
        And response body path $.detalles.apellidoMaterno should be <apellidoMaterno>
        And response body path $.detalles.edad should be <edad>
        And response body path $.detalles.rfc should be <rfc>
        And response body path $.detalles.email should be <email>
        And response body path $.detalles.direccion should be <direccion>
        And response body path $.detalles.codigoPostal should be <codigoPostal>
        And response body path $.detalles.referencias should be <referencias>
        And response body path $.detalles.genero should be <genero>

        Examples:
        |mensaje|codigo|id|nombre|apellidoPaterno|apellidoMaterno|edad|rfc|email|direccion|codigoPostal|referencias|genero|
        |El Cliente se ha creado exitosamente|201|2000|Jovani|Arzate|Cabrera|28|456787656453454sds|jovaniac@gmail.com|bugambilias 2, colonia 10 de abril, Temixco Morelos|0634560|enfrente de la tortilleria ALFONSOS|M|    
    
    Scenario Outline: Creacion de un cliente con datos incorrectos /clientes/versionApi
        
        Given I set Content-Type header to application/json        
        And I set body to {"nombre": "Jovani","apellidoPaterno": "Arzate","apellidoMaterno": "Cabrera","edad": "28s","rfc":"456787656453454","email":"jovaniac@gmail.com","direccion":"bugambilias 2, colonia 10 de abril, Temixco Morelos","codigoPostal":"0634560","referencias":"enfrente de la tortilleria ALFONSOS","genero": "M"}
        When I POST to `host`/clientes/`versionApi`
        Then response code should be 400
        And response body should be valid json
        And response body path $.codigo should be <codigo>
        And response body path $.mensaje should be <mensaje>
        And response body path $.informacion should be <informacion>
        And response body path $.tracking should be <tracking>
        Examples:
        |codigo|mensaje|informacion|tracking|
        |400.api-clientes.1000|Los datos del cliente contienen caracteres invalidos|Debes introducir correctamente los datos|98755343|

    Scenario Outline: Validamos cuando ocurre un escenario no controlado /clientes/versionApi
        
        Given I set Content-Type header to application/json        
        And I set body to {"nombre": "Jovani","apellidoPaterno": "Arzate", "apellidoMaterno": "Cabrera"}
        When I POST to `host`/clientes/`versionApi`
        Then response code should be 500
        And response body should be valid json
        And response body path $.codigo should be <codigo>
        And response body path $.mensaje should be <mensaje>
        And response body path $.informacion should be <informacion>
        And response body path $.tracking should be <tracking>
        Examples:
        |codigo|mensaje|informacion|tracking|
        |500.api-clientes.1200|Error al realizar la operación.|Ocurrio un error inesperado, intentar nuevamente|22920181120162829642|

    Scenario Outline: Actualizar los datos de los clientes /clientes/versionApi
        
        Given I set Content-Type header to application/json        
        And I set body to {"nombre": "Yaridel","apellidoPaterno": "Arzate","apellidoMaterno": "Reyna","edad": "25","rfc":"CUPU800825569","email":"yaridel@gmail.com","direccion":"calle esperanza, num de abril, Temixco Morelos","codigoPostal":"62588","referencias":"Frente a la base de camiones LOS PEPES","genero": "F"}
        When I PUT `host`/clientes/`versionApi`
        Then response code should be 200
        And response body should be valid json
        And response body path $.mensaje should be <mensaje>
        And response body path $.codigo should be <codigo>
        And response body path $.detalles.id should be <id>
        And response body path $.detalles.nombre should be <nombre>
        And response body path $.detalles.apellidoPaterno should be <apellidoPaterno>
        And response body path $.detalles.apellidoMaterno should be <apellidoMaterno>
        And response body path $.detalles.edad should be <edad>
        And response body path $.detalles.rfc should be <rfc>
        And response body path $.detalles.email should be <email>
        And response body path $.detalles.direccion should be <direccion>
        And response body path $.detalles.codigoPostal should be <codigoPostal>
        And response body path $.detalles.referencias should be <referencias>
        And response body path $.detalles.genero should be <genero>
        Examples:
        |mensaje|codigo|id|nombre|apellidoPaterno|apellidoMaterno|edad|rfc|email|direccion|codigoPostal|referencias|genero|
        |Operacion exitosa|200|1000|Yaridel|Arzate|Reyna|25|CUPU800825569|yaridelal435@gmail.com|calle esperanza, 10 de abril, Temixco Morelos|62588|Frente a la base de camiones LOS PEPES|F|    

    Scenario Outline: Actualizar los datos de los clientes con datos incorrectos /clientes/versionApi
        
        Given I set Content-Type header to application/json        
        And I set body to {"nombre": "Yaridel","apellidoPaterno": "Arzate","apellidoMaterno": "Reyna","edad": "25s","rfc":"CUPU800825569","email":"yaridel@gmail.com","direccion":"calle esperanza, num de abril, Temixco Morelos","codigoPostal":"62588","referencias":"Frente a la base de camiones LOS PEPES","genero": "F"}
        When I PUT `host`/clientes/`versionApi`
        Then response code should be 400
        And response body should be valid json
        And response body path $.codigo should be <codigo>
        And response body path $.mensaje should be <mensaje>
        And response body path $.informacion should be <informacion>
        And response body path $.tracking should be <tracking>
        Examples:
        |codigo|mensaje|informacion|tracking|
        |400.api-clientes.1000|Los datos del cliente contienen caracteres invalidos|Debes introducir correctamente los datos|98755343|

    Scenario Outline: Actualizar los datos de los clientes con escenario inesperado error interno /clientes/versionApi
        
        Given I set Content-Type header to application/json        
        And I set body to {"nombre": "Yaridel","apellidoPaterno": "Arzate"}
        When I PUT `host`/clientes/`versionApi`
        Then response code should be 500
        And response body should be valid json
        And response body path $.codigo should be <codigo>
        And response body path $.mensaje should be <mensaje>
        And response body path $.informacion should be <informacion>
        And response body path $.tracking should be <tracking>
        Examples:
        |codigo|mensaje|informacion|tracking|
        |500.api-clientes.1200|Error al realizar la operación.|Ocurrio un error inesperado, intentar nuevamente|22920181120162829642|

    Scenario Outline: eliminacion de empleados /clientes/versionApi                
        When I DELETE `host`/clientes/`versionApi`?idCliente=<idCliente>
        Then response code should be 200
        And response body should be valid json
        And response body path $.mensaje should be <mensaje>
        And response body path $.codigo should be <codigo>
        Examples:
        |idCliente|mensaje|codigo|
        |3000|El Cliente se ha dado de baja exitosamente|200|
    