<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="VerMascotas.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web172" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Abel');


.center {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
}

.card {
  width: 450px;
  height: 350px;
  background-color: #fff;
  background: linear-gradient(#f8f8f8, #fff);
  box-shadow: 0 8px 16px -8px rgba(0,0,0,0.4);
  border-radius: 6px;
  overflow: hidden;
  position: relative;
  margin: 1.5rem;
    font-family: Abel, Arial, Verdana, sans-serif;
    left:-20px;
}

.card h1 {
  text-align: center;
}

.card .additional {
  position: absolute;
  width: 150px;
  height: 100%;
  background: linear-gradient(#0f12cf9c, #0b1d8bdf);
  transition: width 0.4s;
  overflow: hidden;
  z-index: 2;
  left:-5px;
}


.card .additional .user-card {
  width: 150px;
  height: 100%;
  position: relative;
  float: left;
}

.card .additional .user-card::after {
  content: "";
  display: block;
  position: absolute;
  top: 10%;
  right: -2px;
  height: 80%;
  border-left: 2px solid rgba(0,0,0,0.025);*/
}

.card .additional .user-card .level,
.card .additional .user-card .points {
  top: 15%;
  color: #1a2c96df;
  text-transform: uppercase;
  font-size: 0.75em;
  font-weight: bold;
  background: rgb(206, 213, 234);
  padding: 0.125rem 0.75rem;
  border-radius: 100px;
  white-space: nowrap;
}



.card .additional .user-card img {
  top: 70%;
}

.card .additional .more-info {
  width: 300px;
  float: left;
  position: absolute;
  left: 50px;
  height: 100%;
}

.card .additional .more-info h1 {
  color: #fff;
  margin-bottom: 0;
}


.card .additional .coords {
  margin: 0 1rem;
  color: #fff;
  font-size: 1rem;
}


.card .additional .coords span + span {
  float: right;
}

.card .additional .stats {
  font-size: 2rem;
  display: flex;
  position: absolute;
  bottom: 1rem;
  left: 1rem;
  right: 1rem;
  top: auto;
  color: #fff;
}


.card .additional .stats > div {
  flex: 1;
  text-align: center;
}

.card .additional .stats i {
  display: block;
}

.card .additional .stats div.title {
  font-size: 0.75rem;
  font-weight: bold;
  text-transform: uppercase;
}

.card .additional .stats div.value {
  font-size: 1.5rem;
  font-weight: bold;
  line-height: 1.5rem;
}

.card .additional .stats div.value.infinity {
  font-size: 2.5rem;
}

.card .general {
  width: 300px;
  height: 100%;
  position: absolute;
  top: 0;
  right: 0;
  z-index: 1;
  box-sizing: border-box;
  padding: 1rem;
  padding-top: 0;
}

.card .general .more {
  position: absolute;
  bottom: 1rem;
  right: 1rem;
  font-size: 0.9em;
}

.round-image {
  width: 120px; /* Configura el tamaño deseado */
  height: 120px;
  border-radius: 50%; /* Hace que la imagen sea redonda */
  object-fit: cover; /* Ajusta la imagen para cubrir completamente el área redonda */
  position:center;
}
.round-image2 {
  width: 70px; /* Configura el tamaño deseado */
  height: 70px;
  position:center;
}

@media (max-width: 768px) {
  .card {
    width: 100%; /* Cambia el ancho de la tarjeta para adaptarse a pantallas más pequeñas */
    height: auto; /* Permite que la altura se ajuste automáticamente según el contenido */
    margin: 1rem; /* Ajusta los márgenes para evitar que la tarjeta se salga de la pantalla */
  }
  
  .card .additional,
  .card .additional .user-card,
  .card .additional .more-info,
  .card .general 
  {
    width: auto; /* Permite que los elementos internos se ajusten automáticamente */
    position: static; /* Elimina la posición absoluta para que los elementos fluyan normalmente */
    float: none; /* Elimina el flotado para que los elementos se muestren en línea */
    left: 0;
  }

}
        .linea-horizontal {
  border: none; /* Elimina el borde predeterminado */
  border-top: 2px solid gray; /* Establece el grosor y el color de la línea */
  margin: 20px 0; /* Agrega espacio superior e inferior a la línea */
}
    </style>
    <div class="card-title">
        <h3 class="text-center textocolorinfo font-weight-bold">Estado Registro de Mascotas</h3>
    </div>
    <form id="FORM1" runat="server">
        <asp:Repeater ID="r1" runat="server">
            <ItemTemplate>
                <div class="card col-12">
                    <div class="card-body additional">
                        <div class="user-card">
                            <div>
                                <img src="../SC/Mascota/FotoMascota/<%#Eval("FotoMascota") %>" alt="Card image cap" class="round-image">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <img src="../Diseño/Imagenes/dogcard.png" style="width:100px;">
                            </div>
                            <div >
                                
                            </div>
                        </div>
                    </div>
                    <div class="general">
                        <h3><i class="fa fa-credit-card text-success"></i>Estado del registro: <span id="estado"><%#Eval("Estado") %></span></h3>
                        <p></p>
                        <p>Nombre: <span id="nom"><%#Eval("Nombre") %></span></p>
                        <p>Raza: <span id="raz"><%#Eval("Raza") %></span></p>
                        <p>Especie: <span id="especieMascota"><%#Eval("Especie") %></span></p>
                        <p>Color: <span id="edadMascota"><%#Eval("Color") %></span></p>
                        <p>Sexo: <span id="sexoMascota"><%#Eval("Sexo") %></span></p>
                        <p>Edad: <span id="edad"><%#Eval("Edad") %></span></p>
                        <p>Raza Especial: <span id="especial"><%#Eval("RazaEspecial") %></span></p>
                        <p>Esterilizado: <span id="esterilizado"><%#Eval("Esterilizado") %></span></p>
                        <p>Discapacidad: <span id="discapacidad"><%#Eval("Discapacidad") %></span></p>
                        <p>Tipo de Encargado: <span id="tipoEncargado"><%#Eval("TipoEncargado") %></span></p>
                        <p>Nombre del Encargado: <span id="nombreEncargado"><%#Eval("NombreEncargado") %></span></p>
                        <p>Telefono del Encargado: <span id="telefonoEncargado"><%#Eval("Telefono") %></span></p>
                        <p>Correo del Encargado: <span id="CorreoEncargado"><%#Eval("Correo") %></span></p>
                        <a href="EliminarMascota.aspx?Id=<%#Eval("Id")%>"><button" class="btn btn-sm btn-danger border border-light form-control btn-block"type="button" style="border-radius: 5px" onclick="return confirm('¿Esta seguro(a) de eliminar el registro');">Eliminar Registro</button></a>
                        <p></p>
                        <div class="card col-12">
                            <div class="card-title">
                                CARNET DE VACUNAS N:<%#Eval("NumeroCarnet") %>
                                   <%#Eval("Nombre") %>
                                   <%#Eval("Raza") %>
                            </div>
                            <div class="card-body">
                                <img class="card-img-top" src="../SC/Mascota/Carnet/<%#Eval("Carnet") %>" alt="Card image cap">
                            </div>
                               <a href="EditarMascota.aspx?Id=<%#Eval("Id")%>"><button" class="btn btn-sm btn-primary border border-light form-control btn-block"type="button" style="border-radius: 5px">Actualizar Carnet</button></a>
                            <p></p>
                        </div>
                        <p>Fecha Respuesta: <span id="fecha"><%#Eval("FechaRespuesta") %></span></p>
                        <p>Respuesta Administracion: <span id="respuesta"><%#Eval("Respuesta") %></span></p>
                </div>
                       <hr class="linea-horizontal">
            </ItemTemplate>
        </asp:Repeater>
          <asp:Repeater ID="r2" runat="server">
            <ItemTemplate>
              
            </ItemTemplate>
        </asp:Repeater>
    </form>
</asp:Content>
