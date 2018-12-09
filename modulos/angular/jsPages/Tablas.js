
var app = angular.module("ModuloTablas",[])

app.controller("ControladorTablas",function($scope,$http){
    
	$scope.DibujeTabla= function(tabla,idDiv){
            
            var condicion="";
            var idCondicion=tabla+"_condicion";
            
            
            if(document.getElementById(idCondicion)){   
                
                console.log(document.getElementById(idCondicion).value);
                condicion=document.getElementById(idCondicion).value;
                
            }
            var form_data = new FormData();
                form_data.append('Accion', 2);
                form_data.append('Tabla', tabla);
                form_data.append('Condicion', condicion);
                form_data.append('OrdenColumna', "");
                form_data.append('Orden', "");
                form_data.append('Limit', 10);
                form_data.append('Page', 1);
        
            $http.post("../../general/Consultas/administrador.draw.php", form_data, {
                headers: { 'Content-Type': undefined },
                transformRequest: angular.identity
            }).then(function (respuesta, status, headers, config) {
                document.getElementById(idDiv).innerHTML=respuesta.data;
            },function (data, status, headers, config) {
                console.log(data.statusText)
            });
         
	}
        
        $scope.DibujeOpcionesTabla= function(tabla,idDiv){
            
            var form_data = new FormData();
                form_data.append('Accion', 11);
                form_data.append('Tabla', tabla);
                
        
            $http.post("../../general/Consultas/administrador.draw.php", form_data, {
                headers: { 'Content-Type': undefined },
                transformRequest: angular.identity
            }).then(function (respuesta, status, headers, config) {
                document.getElementById(idDiv).innerHTML=respuesta.data;
            },function (data, status, headers, config) {
                console.log(data.statusText);
            });
         
	}
        
        $scope.OcultaMuestraCampoDB= function(tabla,Campo){
            
            alert(tabla);
         
	}
        
        
         
});