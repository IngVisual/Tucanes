<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="VigSCEditar.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web111" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
        <style>
        body {
            background: #134E5E; /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #71B280, #134E5E); /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #71B280, #134E5E); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }
    </style>
            <link href="../Diseño/Banner.css" rel="stylesheet" />
    <script>
        function DesactivarBoton() {
            document.getElementById("procesando").style.display = "block";
        }
        window.onbeforeunload = DesactivarBoton;
    </script>
    <form id="form" runat="server">
        <div id="programacion" runat="server">
            <h3 class="font-weight-bold text-capitalize text-light text-center">EDITAR PROGRAMACIÓN SALON COMUNAL</h3>
            <p></p>
            <div class="alert alert-danger" id="error1" runat="server" style="margin-top: 10px; display: none">
                <span class="badge badge-pill badge-danger">Sugerencia</span>
                Ingrese la descripcion de su novedad
                                              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                  <span aria-hidden="true">&times;</span>
                                              </button>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="card" style="border-radius: 5px">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-truck text-success border-success"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-digit">
                                    &nbsp;&nbsp<h5 class="text-primary font-weight-bold">Vivienda: &nbsp;&nbsp
                                    <asp:Label ID="lblcodigo" runat="server" CssClass="text-secondary font-weight-bold"></asp:Label></h5>
                                </div>
                                <p></p>
                                <div class="form-group">
                                    <h5 class="stat-text text-success">Editar Estado:&nbsp&nbsp
                                                    <asp:DropDownList ID="ddestado" runat="server" Font-Size="X-Large" AutoPostBack="true" OnSelectedIndexChanged="ddestado_SelectedIndexChanged" BackColor="Red" Font-Bold="true" Style="border-radius: 5px" ForeColor="white">
                                                        <asp:ListItem>Autorizado</asp:ListItem>
                                                        <asp:ListItem>Finalizado</asp:ListItem>
                                                        <asp:ListItem>Novedad</asp:ListItem>
                                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <p></p>
                        Describa aqui, si hubo alguna novedad en el Salon Comunal
                        <asp:TextBox ID="txtobservacion" runat="server" Font-Size="Small" Text="" MaxLength="300" Placeholder="Novedad de Salon Comunal" CssClass="form-control" Enabled="True" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div id="procesando" class="ventana" style="display: none">
                <img src="../Diseño/Imagenes/coheteLoading.gif" />
                <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando Edicion.....</h5>
            </div>
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</asp:Content>
