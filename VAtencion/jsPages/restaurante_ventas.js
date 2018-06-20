var TimerPedidos;
var TimerDomicilios;

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
        error: function(){
          alert("error en la comunicación con el servidor");
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
        error: function(){
          alert("error en la comunicación con el servidor");
        }
      })
}

//funcion para Crear un Pedido
function AgregarItemPedido(idPedido=''){
    TimersPedidos(99);
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
                DibujeItemsPedido(data.idPedido);
                DibujePedidos();
            }
            
            if(data.msg==='SD'){
                alert("Debes completar todos los campos");
                DibujePedidos();
            }
            
        },
        error: function(){
          alert("error en la comunicación con el servidor para agregar el item");
        }
      })
}


//Funcion para dibujar los items de los pedidos en el div correspondiente
function DibujeItemsPedido(idPedido){
    
    Page="Consultas/Restaurante_pedidos_items.query.php?idPedido="+idPedido+"&Carry=";
    EnvieObjetoConsulta(Page,`BtnPedidos`,'DivPedidos',`99`);return false;
    clearInterval(TimerPedidos);
    clearInterval(TimerDomicilios);
}

//Funcion para dibujar los pedidos en el div correspondiente
function DibujePedidos(){
    Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=AB&Carry=";
    EnvieObjetoConsulta(Page,`BtnPedidos`,`DivPedDom`,`99`);return false;
}

//Funcion para dibujar los domicilios en el div correspondiente
function DibujeDomicilios(){
    Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=DO&Carry=";
    EnvieObjetoConsulta(Page,`BtnPedidos`,`DivPedDom`,`99`);return false;
}

function TimersPedidos(idTimer){
    //Timer para dibujar Pedidos
    if(idTimer===1){
        clearInterval(TimerPedidos);
        clearInterval(TimerDomicilios);
        TimerPedidos = setInterval(DibujePedidos, 1000);
    }
    //Timer para dibujar Domicilios
    if(idTimer===2){
        clearInterval(TimerPedidos);
        clearInterval(TimerDomicilios);
        TimerDomicilios = setInterval(DibujeDomicilios, 1000);
    }
    //Apago todos los timers
    if(idTimer===99){
        clearInterval(TimerPedidos);
        clearInterval(TimerDomicilios);
    }
}