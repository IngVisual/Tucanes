<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="VerMascota.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web158" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
       <style>
        body {
            background: rgb(249,244,242);
            background: linear-gradient(90deg, rgba(249,244,242,1) 0%, rgba(22,27,38,0.8267682072829132) 50%);
        }
     </style>
      <style>
        @import url('https://fonts.googleapis.com/css?family=Abel');


.center {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
}

.card2 {
  width: 500px;
  height: 450px;
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

.card2 h1 {
  text-align: center;
}

.card2 .additional {
  position: absolute;
  width: 200px;
  height: 100%;
  background: linear-gradient(#0f12cf9c, #0b1d8bdf);
  transition: width 0.4s;
  overflow: hidden;
  z-index: 2;
  left:-5px;
}


.card2 .additional .user-card {
  width: 150px;
  height: 100%;
  position: relative;
  float: left;
}

.card2 .additional .user-card::after {
  content: "";
  display: block;
  position: absolute;
  top: 10%;
  right: -2px;
  height: 80%;
  border-left: 2px solid rgba(0,0,0,0.025);*/
}

.card2 .additional .user-card .level,
.card2 .additional .user-card .points {
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

.card2 .additional .user-card .points {
  top: 60%;
  left:60px;
}

.card2 .additional .user-card .level {
  top: 50%;
  left:60px;
}
.card2 .additional .user-card .tarjeta {
  top: 80%;
  left:60px;
}

.card2 .additional .user-card img {
  top: 70%;
}

.card2 .additional .more-info {
  width: 300px;
  float: left;
  position: absolute;
  left: 50px;
  height: 100%;
}

.card2 .additional .more-info h1 {
  color: #fff;
  margin-bottom: 0;
}


.card2 .additional .coords {
  margin: 0 1rem;
  color: #fff;
  font-size: 1rem;
}


.card2 .additional .coords span + span {
  float: right;
}

.card2 .additional .stats {
  font-size: 2rem;
  display: flex;
  position: absolute;
  bottom: 1rem;
  left: 1rem;
  right: 1rem;
  top: auto;
  color: #fff;
}


.card2 .additional .stats > div {
  flex: 1;
  text-align: center;
}

.card2 .additional .stats i {
  display: block;
}

.card2 .additional .stats div.title {
  font-size: 0.75rem;
  font-weight: bold;
  text-transform: uppercase;
}

.card2 .additional .stats div.value {
  font-size: 1.5rem;
  font-weight: bold;
  line-height: 1.5rem;
}

.card2 .additional .stats div.value.infinity {
  font-size: 2.5rem;
}

.card2 .general {
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

.card2 .general .more {
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
    </style>
    <link href="../Diseño/Banner.css" rel="stylesheet" />
    <script>
        function DesactivarBoton() {
            document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
        }
        window.onbeforeunload = DesactivarBoton;
    </script>
    <form id="fo2" runat="server">
        <div id="procesando" class="ventana" style="border-radius: 7px; display: none">
            <h5 class="text-light text-center font-weight-bold">Administrador Trabajando...</h5>
            <img src="../Diseño/Imagenes/oficina.gif" />
        </div>
        <asp:Label ID="lblemail1" runat="server" Visible="false"></asp:Label>
        <div class="container" id="conta">
            <div class="alert alert-danger" id="error" runat="server" style="margin-top: 10px; display: none">
                <strong>Debes llenar todas las cajas de texto</strong>
            </div>
            <div class="col-xs-12 col-lg-12">
                <div class="card border-danger" style="border-radius: 7px">
                    <div class="card-header">
                        <strong>EDITAR REGISTRO DE MASCOTA</strong>&nbsp;&nbsp;<strong>CODIGO:&nbsp;&nbsp;<asp:Label ID="lblcodigo" runat="server" ForeColor="Red"></asp:Label> </strong> 
                    </div>
                    <div class="card-body col-lg-12">
                        <div class="row">
                            <div class="col-lg-3">
                                <label class=" form-control-label">ESTADO</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-bullseye"></i></div>
                                    <asp:DropDownList ID="ddestado" Font-Bold="true" CssClass="form-control text-danger font-weight-bold" runat="server">
                                        <asp:ListItem>Solicitud</asp:ListItem>
                                        <asp:ListItem>Registrado</asp:ListItem>
                                        <asp:ListItem>Eliminado</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <label class=" form-control-label">RAZA DE TENENCIA ESPECIAL</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-bullseye"></i></div>
                                    <asp:DropDownList ID="ddesec" Font-Bold="true" CssClass="form-control text-danger font-weight-bold" runat="server">
                                        <asp:ListItem>SI</asp:ListItem>
                                        <asp:ListItem>NO</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <label class=" form-control-label">RESPUESTA</label>-Fecha Respuesta:_<asp:Label ID="lblfecha" runat="server"></asp:Label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-mail-reply"></i></div>
                                    <asp:TextBox ID="txtres" ForeColor="Red" CssClass="form-control" runat="server" TextMode="MultiLine" Enabled="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                 <label class=" form-control-label"></label>
                                <asp:Button ID="btnactualizar" Style="border-radius: 5px" runat="server" Font-Bold="true" class="btn btn-lg btn-success btn-block" Text="Guardar Registro" OnClick="btnactualizar_Click1" OnClientClick="return confirm('¿Esta seguro(a) de enviar esta respuesta?');" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          <asp:Repeater ID="r1" runat="server">
            <ItemTemplate>
                <div class="card2 col-12">
                    <div class="card-body additional">
                        <div class="user-card">
                            <div class="level center">
                                <%#Eval("Nombre") %>
                            </div>
                            <div>
                                <img src="../SC/Mascota/FotoMascota/<%#Eval("FotoMascota") %>" alt="Card image cap" class="round-image" style="width:180px; height:180px">
                            </div>
                            <div class="points center">
                                <%#Eval("Raza") %>
                            </div>
                            <div class="tarjeta center">
                                <img src="../Diseño/Imagenes/dogcard.png"  class="round-image2" style="width:100px; height:100px">
                            </div>
                        </div>
                    </div>
                    <div class="general">
                        <h3><i class="fa fa-credit-card text-success"></i>Estado del registro: <span id="estado"><%#Eval("Estado") %></span></h3>
                        <p>Especie: <span class="text-success" id="especieMascota"><%#Eval("Especie") %></span>&nbsp;Color: <span class="text-success" id="edadMascota"><%#Eval("Color") %></span></p>
                        <p>Sexo: <span class="text-success" id="sexoMascota"><%#Eval("Sexo") %></span>&nbsp;Edad: <span class="text-success" id="edad"><%#Eval("Edad") %></span></p>
                        <p>Raza Especial: <span class="text-success" id="especial"><%#Eval("RazaEspecial") %></span>&nbsp;Esterilizado: <span class="text-success" id="esterilizado"><%#Eval("Esterilizado") %></span></p>
                        <p>Discapacidad: <span class="text-success" id="discapacidad"><%#Eval("Discapacidad") %></span></p>
                        <p>Tipo de Encargado: <span class="text-success" id="tipoEncargado"><%#Eval("TipoEncargado") %></span></p>
                        <p>Nombre del Encargado: <span class="text-success" id="nombreEncargado"><%#Eval("NombreEncargado") %></span></p>
                        <p>Telefono del Encargado: <span class="text-success" id="telefonoEncargado"><%#Eval("Telefono") %></span></p>
                        <p>Correo del Encargado: <span class="text-success" id="CorreoEncargado"><%#Eval("Correo") %></span></p>                  
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
          <asp:Repeater ID="r2" runat="server">
            <ItemTemplate>
                <div class="card col-9">
                    <div class="card-title">
                        CARNET DE VACUNAS N:<%#Eval("NumeroCarnet") %><%#Eval("Nombre") %><%#Eval("Raza") %></div>
                    <div class="card-body">
                        <img class="card-img-top" src="../SC/Mascota/Carnet/<%#Eval("Carnet") %>" alt="Card image cap">
                    </div>
                      
                    <p></p>
                </div> 
            </ItemTemplate>
        </asp:Repeater>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
    </form>
</asp:Content>
