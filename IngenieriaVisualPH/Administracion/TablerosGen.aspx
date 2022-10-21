<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="TablerosGen.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web134" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <style>
        body {
            background: rgb(249,244,242);
            background: linear-gradient(90deg, rgba(249,244,242,1) 0%, rgba(22,27,38,0.8267682072829132) 50%);
        }
     </style>
    <link href="../Diseño/Banner.css" rel="stylesheet" />
    <link href="../Diseño/Video.css" rel="stylesheet" />
    <script>
        function DesactivarBoton() {
             document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
        }
        window.onbeforeunload = DesactivarBoton;

        function ShowVideo() {
           document.getElementById("conta").style.display = "none"
           document.getElementById("procesando").style.display = "none"
        }
        function CloseVideo() {
            document.getElementById("conta").style.display = "block"
        }
    </script>
    <div id="procesando" class="ventana" style="border-radius: 7px; display: none">
        <h5 class="text-light text-center font-weight-bold">Administrador Trabajando...</h5>
        <img src="../Diseño/Imagenes/oficina.gif" />
    </div>
    <%-- ------------------------------------------------------------------- --%>
      <input type="checkbox" onclick="ShowVideo()" id="btn-modale" />
        <label for="btn-modale" class="lbl-modale">Video Ayuda</label>
        <div class="modale">
            <div class="contenedor" id="mostrarvideo">
                <header><strong>Video Instructivo (Puedes ajustar la velocidad de reproduccion en 1,5)</strong></header>
                <a href="TablerosGen.aspx">&#10006;</a>
                <div class="contenido">
                     <iframe width="1000" height="550" src="https://www.youtube.com/embed/bTwM_EuIzC4" frameborder="0" allow="accelerometer; 
                        autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
        </div>
<%-- -------------------------------------------------------------------- --%>
    <div class="container" id="conta">
        <form id="f2" runat="server">
            <div class="card-body">
                <div class="card-title">
                    <h3 class="text-center text-light font-weight-bold">Descargar en Excel Informacion General</h3>
                </div>
            </div>
            <div class="col-xs-6 col-lg-12">
                <div class="card" style="border-radius: 7px">
                    <div class="card-body">                      
                        <div class="col-xs-6 col-lg-4">
                            <p class="font-weight-bold">Seleccione Tipo de Consulta</p>
                            <asp:DropDownList ID="ddestado" runat="server" Font-Bold="true" CssClass="form-control border-primary">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Apartamentos</asp:ListItem>
                                <asp:ListItem>PQRS</asp:ListItem>
                                <asp:ListItem>Novedades de Saldo</asp:ListItem>
                                <asp:ListItem>Solicitudes de Mudanzas</asp:ListItem>
                                <asp:ListItem>Tablero de Notificaciones</asp:ListItem>
                                <asp:ListItem>Solicitudes de Parqueaderos</asp:ListItem>
                                <asp:ListItem>Solicitudes de Salon Comunal</asp:ListItem>
                                <asp:ListItem>Solicitudes de Chips</asp:ListItem>
                                <asp:ListItem>Registro de Visitantes</asp:ListItem>
                                <asp:ListItem>Registro General</asp:ListItem>
                                <asp:ListItem>Registro de Bicicletas</asp:ListItem>
                                <asp:ListItem>Tablero de Parqueaderos</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorusuario" runat="server" Display="Dynamic"
                                ErrorMessage="" ControlToValidate="ddestado" Text="*">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="col-xs-6 col-lg-3">
                            <p class="font-weight-bold">Fecha Inicial</p>
                            <div>
                                <asp:TextBox ID="txtfechaini" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-6 col-lg-3">
                            <div>
                                <p class="font-weight-bold">Fecha Final</p>
                                <asp:TextBox ID="txtfechafinal" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-6 col-lg-2">
                            <div>
                                <p></p>
                                <asp:Button ID="btnconsulta" runat="server" OnClick="btnconsulta_Click" Text="Descargar" CssClass=" btn-primary btn-lg font-weight-bold form-control border-light" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
