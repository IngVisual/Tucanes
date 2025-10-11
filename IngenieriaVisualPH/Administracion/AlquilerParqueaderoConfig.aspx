<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="AlquilerParqueaderoConfig.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web148" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
      <style>
        body {
            background: rgb(249,244,242);
            background: linear-gradient(90deg, rgba(249,244,242,1) 0%, rgba(22,27,38,0.8267682072829132) 50%);
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
    <div id="procesando" class="ventana2" style="display: none">
                <h5 class="text-light text-center font-weight-bold">Administrador trabajando...</h5>
        <img src="../Diseño/Imagenes/oficina.gif" />
    </div>
    <div class="container" id="conta">
        <div class="alert alert-warning" role="alert">
            Los tipos de alquiler no se pueden editar, en esta opcion solo puedes crear un nuevo tipo de alquiler. Si este tipo de alquiler es para remplazar 
                        uno que ya existe, no olvides desactivar el tipo de alquiler que se esta remplazando. Si su alquiler de parqueadero
                        requiere mas opciones de las que dispone el sistema se debe comunicar con Ingenieria Visual para soporte.
        </div>
        <form id="form" runat="server">
            <div class="alert alert-success" id="error" runat="server" style="margin-top: 10px; display: none">
                <span class="badge badge-pill badge-success">Listo</span>
               Alquiler nuevo registrado. No olvides que si estas remplazando un tipo de alquiler, este debe ser desactivado en la parte inferior de esta 
                ventana y despues verifica en la aplicacion de los guardas.
                                              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                  <span aria-hidden="true">&times;</span>
                                              </button>
            </div>
            <div class="col-lg-12">

                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Crear Tipo de Alquiler</strong>
                        <br />
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <label>Elija Tipo Vehiculo</label>
                                        <asp:DropDownList ID="ddtipveh" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="TipoVehiculo" DataValueField="IDtipoVeh">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>" SelectCommand="SELECT * FROM [ParqTbl_TipoVehiculo]"></asp:SqlDataSource>
                                    </div>
                                    <div class="col-lg-4">
                                        <label>Elija Valor</label>
                                        <asp:DropDownList ID="ddvalor" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="Tarifa" DataValueField="IDtar">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>" SelectCommand="SELECT * FROM [ParqTbl_Tarifa]"></asp:SqlDataSource>
                                    </div>
                                    <div class="col-lg-4">
                                        <label>Elija Cantidad de horas gratis</label>
                                        <asp:DropDownList ID="ddcantfree" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="Free_hora" DataValueField="IDfree">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>" SelectCommand="SELECT * FROM [ParqTbl_FreeHora]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                </br>
                                <div class="row">
                                    <div class="col-lg-10">
                                        <label></label>
                                    </div>
                                    <div class="col-lg-2">
                                        <asp:Button ID="btnguardar" runat="server" Text="Guardar"  class="btn btn-success " OnClick="btnguardar_Click"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="alert alert-warning" role="alert">
                    Para cambiar los valores del tipo de alquiler debes crear uno nuevo, desactivar el tipo de alquiler con el boton ACTIVO para que pase de TRUE a FALSE y
                        con eso el vigilante ya no podra ver el tipo de alquiler a remplazar.
                </div>
                <div class="card" style="border-radius: 7px">
                    <div class="card-header">
                        <strong class="card-title">Activa o Desactiva tus Tipos de Alquiler</strong>

                        <div id="programacion" runat="server">
                            <asp:Repeater ID="R1" runat="server">
                                <ItemTemplate>
                                    <br />
                                    <div class="card">
                                        <div class="card-body">
                                            <p class="card-text">
                                                <asp:Label ID="label2" runat="server"><%#Eval("TipoAlquiler") %></asp:Label>
                                            </p>

                                            <a href="AlquilerParqConfigActivar.aspx?Id=<%#Eval("IDtipoAlq")%>&Activo=<%#Eval("Activo")%>" class="btn btn-primary">ACTIVO:
                                                <asp:Label ID="lblactivo" runat="server"><%#Eval("Activo")%> </asp:Label>
                                            </a>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                    </div>
                </div>
              </div>
        </form>
    </div>            
</asp:Content>
