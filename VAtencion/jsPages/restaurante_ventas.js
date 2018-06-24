var TimerPedidos;
var TimerDomicilios;
var TimerItems;
var TimerLlevar;
function AutocompleteDatos(){
    //se crea un objeto con los datos del formulario
    var form_data = new FormData();
        form_data.append('Telefono', $('#Telefono').val())
                
        $.ajax({
        url: 'Consultas/BuscarDatosPedidos.php',
        dataType: "json",
        cache: false,
        processData: false,
        contentType: false,
        data: form_data,
        type: 'POST',
        success: (data) =>{
            console.log(data)
            
            if(data.TelefonoConfirmacion){
                document.getElementById('Nombre').value=data.NombreCliente;
                document.getElementById('Direccion').value=data.DireccionEnvio;
                //document.getElementById('Observaciones').value=data.Observaciones;
                
            }
            
        },
        error: function(xhr, ajaxOptions, thrownError){
          alert(xhr.status);
          alert(thrownError);
        }
      })
}

//Funcion para cargar los productos al select de los productos 
function CargarProductos(){
    
    var form_data = new FormData();
        form_data.append('idDepartamento', $('#idDepartamento').val())
                
        $.ajax({
        url: 'Consultas/BuscarDatosPedidos.php',
        dataType: "json",
        cache: false,
        processData: false,
        contentType: false,
        data: form_data,
        type: 'POST',
        success: (data) =>{
             
            if(data[0].ID){
                  $("#idProducto").empty();
                for(i=0;i < data.length; i++){
                    
                    $("#idProducto").append('<option value='+data[i].ID+'>'+data[i].Nombre+'</option>');
                 
                }
                             
            }
            
        },
        error: function(xhr, ajaxOptions, thrownError){
          alert(xhr.status);
          alert(thrownError);
        }
      })
}

//funcion para Crear un Pedido
function AgregarItemPedido(idPedido=''){
    
    //e.preventDefault();
    //se crea un objeto con los datos del formulario
    var form_data = new FormData();
        form_data.append('idMesa', $('#idMesa').val())
        form_data.append('idPedido', idPedido)
        form_data.append('idDepartamento', $('#idDepartamento').val()) 
        form_data.append('Cantidad', $('#Cantidad').val())
        form_data.append('idProducto', $('#idProducto').val())
        form_data.append('Observaciones', $('#Observaciones').val())
        $.ajax({
        url: 'Consultas/Restaurante.process.php',
        dataType: "json",
        cache: false,
        processData: false,
        contentType: false,
        data: form_data,
        type: 'POST',
        success: (data) =>{
            //console.log(data);
            
            if(data.msg==='OK'){
                console.log("ItemAgregado");
                document.getElementById("Observaciones").value="";
                if(idPedido==""){
                    DibujeItemsPedido(data.idPedido,1);
                }
                
            }
            
            if(data.msg==='SD'){
                alert("Debes completar todos los campos");
                //DibujePedidos();
            }
            
        },
        error: function(xhr, ajaxOptions, thrownError){
          alert(xhr.status);
          alert(thrownError);
        }
      })
}

//Crear un domicilio

function CrearDomicilio(){
    
    //e.preventDefault();
    if($('#Telefono').val()=='' || $('#Nombre').val()=='' || $('#Direccion').val()==''){
        alert("Debes completar todos los campos");
        return;
    }
    //se crea un objeto con los datos del formulario
    var form_data = new FormData();
        form_data.append('Accion', "ADD_DOM")
        form_data.append('Telefono', $('#Telefono').val())
        form_data.append('Nombre', $('#Nombre').val())
        form_data.append('Direccion', $('#Direccion').val()) 
        form_data.append('Observaciones', $('#TxtObservaciones').val())
        
        $.ajax({
        url: 'Consultas/Restaurante.process.php',
        dataType: "json",
        cache: false,
        processData: false,
        contentType: false,
        data: form_data,
        type: 'POST',
        success: (data) =>{
            //console.log(data);
            
            if(data.msg==='OK'){
                console.log("Domicilio creado");
                DibujeItemsPedido(data.idPedido,1);
                
                
            }
            
            if(data.msg==='SD'){
                alert("Debes completar todos los campos");
                //DibujePedidos();
            }
            
        },
        error: function(xhr, ajaxOptions, thrownError){
          alert(xhr.status);
          alert(thrownError);
        }
      })
}

//Crear un domicilio

function CrearParaLlevar(){
    
    //e.preventDefault();
    if($('#Telefono').val()=='' || $('#Nombre').val()=='' || $('#Direccion').val()==''){
        alert("Debes completar todos los campos");
        return;
    }
    //se crea un objeto con los datos del formulario
    var form_data = new FormData();
        form_data.append('Accion', "ADD_LLE")
        form_data.append('Telefono', $('#Telefono').val())
        form_data.append('Nombre', $('#Nombre').val())
        form_data.append('Direccion', $('#Direccion').val()) 
        form_data.append('Observaciones', $('#TxtObservaciones').val())
        
        $.ajax({
        url: 'Consultas/Restaurante.process.php',
        dataType: "json",
        cache: false,
        processData: false,
        contentType: false,
        data: form_data,
        type: 'POST',
        success: (data) =>{
            //console.log(data);
            
            if(data.msg==='OK'){
                console.log("Servicio Para llevar creado");
                DibujeItemsPedido(data.idPedido,1);
                
                
            }
            
            if(data.msg==='SD'){
                alert("Debes completar todos los campos");
                //DibujePedidos();
            }
            
        },
        error: function(xhr, ajaxOptions, thrownError){
          alert(xhr.status);
          alert(thrownError);
        }
      })
}


//Funcion para dibujar los items de los pedidos en el div correspondiente
function DibujeItemsPedido(idPedido,Opciones=1,Div='DivPedidos'){
    clearInterval(TimerItems);
    
    function TimerItemsPedido(){
        Page="Consultas/Restaurante_pedidos_items.query.php?idPedido="+idPedido+"&Opciones="+Opciones+"&Carry=";
        EnvieObjetoConsulta(Page,`BtnPedidos`,Div,`99`);
        Div="DivItemsConsultas";
        Opciones=0;
        
    }
    
    TimerItems =  setInterval(TimerItemsPedido, 1000);
    
    clearInterval(TimerPedidos);
    clearInterval(TimerDomicilios);
    clearInterval(TimerLlevar);
}

//Funcion para dibujar los pedidos en el div correspondiente
function DibujePedidos(){
    var Div=VerifiqueObjeto('DivPedDom');
    
    if(Div === 1){
        var DivDestino =  'DivPedDom';
        Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=AB&Carry=";
    }
    if(Div === 0){
        var DivDestino =  'DivPedidos';
        Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=AB&CuadroAdd=1&Carry=";
    }
    //Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=AB&Carry=";
    EnvieObjetoConsulta(Page,`BtnPedidos`,DivDestino,`99`);return false;
    
}



//Funcion para dibujar los domicilios en el div correspondiente
function DibujeDomicilios(){
    var Div=VerifiqueObjeto('DivPedDom');
    
    if(Div === 1){
        var DivDestino =  'DivPedDom';
        Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=DO&Carry=";
    }
    if(Div === 0){
        var DivDestino =  'DivPedidos';
        Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=DO&CuadroAdd=1&Carry=";
    }
    
    EnvieObjetoConsulta(Page,`BtnPedidos`,DivDestino,`99`);return false;
}

//Funcion para dibujar los pedidos para llevar en el div correspondiente
function DibujeLlevar(){
    var Div=VerifiqueObjeto('DivPedDom');
    
    if(Div === 1){
        var DivDestino =  'DivPedDom';
        Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=LL&Carry=";
    }
    if(Div === 0){
        var DivDestino =  'DivPedidos';
        Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=LL&CuadroAdd=1&Carry=";
    }
    
    EnvieObjetoConsulta(Page,`BtnPedidos`,DivDestino,`99`);return false;
}

//Funcion para dibujar el area de facturacion en el div correspondiente
function DibujeAreaFacturar(idPedido){
    var Div=VerifiqueObjeto('DivFacturacion');
    document.getElementById('BtnAbreModalFact').click();
    if(Div === 1){
        
        var DivDestino =  'DivFacturacion';
        Page="Consultas/Restaurante_facturar.query.php?idPedido="+idPedido+"&Carry=";
        EnvieObjetoConsulta(Page,`BtnPedidos`,DivDestino,`99`);return false;
    }
    
    
}

function TimersPedidos(idTimer,idPedido=0){
    //Timer para dibujar Pedidos
    if(idTimer===1){
        clearInterval(TimerPedidos);
        clearInterval(TimerDomicilios);
        clearInterval(TimerItems);
        clearInterval(TimerLlevar);
        TimerPedidos = setInterval(DibujePedidos, 1000);
    }
    //Timer para dibujar Domicilios
    if(idTimer===2){
        clearInterval(TimerPedidos);
        clearInterval(TimerDomicilios);
        clearInterval(TimerItems);
        clearInterval(TimerLlevar);
        TimerDomicilios = setInterval(DibujeDomicilios, 1000);
    }
    
    //Timer para dibujar para llevar
    if(idTimer===3){
        clearInterval(TimerPedidos);
        clearInterval(TimerDomicilios);
        clearInterval(TimerItems);
        clearInterval(TimerLlevar);
        TimerLlevar = setInterval(DibujeLlevar, 1000);
    }
    
    //Apago todos los timers
    if(idTimer===99){
        clearInterval(TimerPedidos);
        clearInterval(TimerDomicilios);
        clearInterval(TimerItems);
        clearInterval(TimerLlevar);
    }
}

//Verifica la existencia de un objeto
function VerifiqueObjeto(id){
    var Existe=1;
    if(document.getElementById(id)== undefined){
        Existe=0;
    }
    return (Existe);
}

//Eliminar un item de un pedido
function EliminarItemPedido(idItem,idPedido){
    var Observaciones = prompt("por favor indicar el por qué se eliminará el item", "");
    if (Observaciones != null) {
    var form_data = new FormData();
        form_data.append('Accion', "DEL")
        form_data.append('idItem', idItem)
        form_data.append('Observaciones', Observaciones)
        form_data.append('idPedido', idPedido)
        $.ajax({
        url: 'Consultas/Restaurante.process.php',
        dataType: "json",
        cache: false,
        processData: false,
        contentType: false,
        data: form_data,
        type: 'POST',
        success: (data) =>{
            //console.log(data);
            
            if(data.msg==='OK'){
                alert("Se ha eliminado el item "+data.idItem+", del pedido "+data.idPedido+", por: "+data.Observaciones)
            }
                       
        },
        error: function(xhr, ajaxOptions, thrownError){
          alert(xhr.status);
          alert(thrownError);
        }
      })
  }else{
      alert("Debes Escribir una observacion");
  }
}

///Realice acciones como descartar un pedido, imprimir la precuenta, el domicilio y el pedido

function AccionesPedidos(idAccion,idPedido,idFactura=''){ 
    var Observaciones = "";
    if(idAccion === 1 || idAccion === 2 || idAccion === 3){
        Observaciones = prompt("por favor indicar el por qué se eliminará el item", "");
        if(Observaciones === '' || Observaciones === null || Observaciones === undefined){
            alert("Debe escribir el por que se descarta el pedido");
            return;
        }
            
    }
    var form_data = new FormData();
        form_data.append('Accion', idAccion);
        form_data.append('Observaciones', Observaciones);
        form_data.append('idPedido', idPedido);
        if(idFactura != ""){
            form_data.append('idFactura', idFactura);
        }
        $.ajax({
        url: 'Consultas/Restaurante.process.php',
        dataType: "json",
        cache: false,
        processData: false,
        contentType: false,
        data: form_data,
        type: 'POST',
        success: (data) =>{
            //console.log(data);
            
            if(data.msg==='OK'){
                if(idAccion===1){
                    alert("Se ha descartado el pedido "+idPedido+", por: "+Observaciones);                    
                    TimersPedidos(1);
                }
                if(idAccion===2){
                    alert("Se ha descartado el Domicilio "+idPedido+", por: "+Observaciones);                    
                    TimersPedidos(2);
                }
                if(idAccion===3){
                    alert("Se ha descartado el servicio para llevar "+idPedido+", por: "+Observaciones);                    
                    TimersPedidos(3);
                }
                if(idAccion===4){
                    alert("Se ha impreso el pedido "+idPedido);                    
                    
                }
                if(idAccion===5){
                    alert("Se ha impreso el domicilio "+idPedido);                   
                    
                }
                if(idAccion===6){
                    alert("Se ha impreso el servicio para llevar "+idPedido);                   
                    
                }
                if(idAccion===7){
                    alert("Precuenta del pedido "+idPedido+" impresa");                    
                    
                }
                if(idAccion===8){
                    alert("Factura Impresa");                   
                    
                }
                if(idAccion===9){
                    alert("Turno Cerrado");            
                    TimersPedidos(99);
                    document.getElementById('DivPedDom').innerHTML ='Turno Cerrado';
                }
            }
            
            if(data.msg==="SD"){
                alert("No se recibiron todos los datos");
            }
            
                       
        },
        error: function(xhr, ajaxOptions, thrownError){
          alert(xhr.status);
          alert(thrownError);
        }
      })
  
}
//Facturar pedido
function FacturarPedido(idPedido){
    //event.preventDefault();
    //console.log($('#CmbTipoPago').val());   
    //se crea un objeto con los datos del formulario
    var form_data = new FormData();
        form_data.append('Accion', 8)
        form_data.append('idPedido', idPedido)
        form_data.append('idCliente', 1)
        form_data.append('TxtTarjetas', $('#TxtTarjetas').val())
        form_data.append('TxtCheques', $('#TxtCheques').val()) 
        form_data.append('TxtBonos', $('#TxtBonos').val())
        form_data.append('CmbTipoPago', $('#CmbTipoPago').val())
        form_data.append('CmbColaboradores', $('#CmbColaboradores').val()) 
        form_data.append('TxtObservaciones', $('#TxtObservacionesFactura').val())
        form_data.append('TxtEfectivo', $('#TxtEfectivo').val()) 
        form_data.append('TxtDevuelta', $('#TxtDevuelta').val())
        document.getElementById('DivFacturacion').innerHTML ='Procesando...<br><img src="../images/process.gif" alt="Cargando" height="100" width="100">';
   
        $.ajax({
        url: 'Consultas/Restaurante.process.php',
        dataType: "json",
        cache: false,
        processData: false,
        contentType: false,
        data: form_data,
        type: 'POST',
        success: (data) =>{
            //console.log(data);
            
            if(data.msg==='OK'){
                //console.log("Factura Creada");
                document.getElementById('DivFacturacion').innerHTML ='Factura Creada';
                document.getElementById('BtnCierreModal').click();
                var DivDestino =  'DivPedDom';
                Page="Consultas/Restaurante_pedidos.query.php?TipoPedido="+data.TipoPedido+"&CuadroAdd=1&Carry=";
                EnvieObjetoConsulta(Page,`BtnPedidos`,DivDestino,`99`);
                if(data.TipoPedido=="AB"){
                    TimersPedidos(1);
                }
                if(data.TipoPedido=="DO"){
                    TimersPedidos(2);
                }
                if(data.TipoPedido=="LL"){
                    TimersPedidos(3);
                }
            }
            
            if(data.msg==='SD'){
                alert("Debes completar todos los campos");
                //DibujePedidos();
            }
            
            if(data.msg==='E'){
                alert(data.Error);
                //DibujePedidos();
            }
            
        },
        error: function(xhr, ajaxOptions, thrownError){
          alert(xhr.status);
          alert(thrownError);
        }
      })
}

//calcular la devuelta
function CalculeDevueltaRestaurante(Total){
    var Efectivo=$('#TxtEfectivo').val();
    var Tarjetas=$('#TxtTarjetas').val();
    var Cheques=$('#TxtCheques').val();
    var Bonos=$('#TxtBonos').val();
    var TotalPagos=parseInt(Efectivo)+parseInt(Tarjetas)+parseInt(Cheques)+parseInt(Bonos);
    document.getElementById("TxtDevuelta").value = TotalPagos-Total;
}

//Cerrar Turno

function CerrarTurnoRestaurante(){
    AccionesPedidos(9,"",'');
}