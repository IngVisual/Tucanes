<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="MudanzaValidar.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web164" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
        <link href="../Diseño/Color.css" rel="stylesheet" />
     <link href="../Diseño/Banner.css" rel="stylesheet" />
        <script>
        function DesactivarBoton() {
            document.getElementById("conta").style.display = "none"
         <%--   document.getElementById('<%=btnsi.ClientID%>').disabled = true;--%>
            document.getElementById("procesando").style.display = "block"
            document.getElementById("error").style.display = "none"
        }
        window.onbeforeunload = DesactivarBoton;
    </script>
        <div id="procesando" class="ventana3" style="display: none">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando.....</h5>
    </div>
    <div class="container" id="conta">
      <form id="form1" runat="server">
        <div class="card-body">
            <div class="card-title">
                <h3 class="text-center textocolorinfo font-weight-bold">Solicitud Mudanza, Articulos o Articulos de Contrucción</h3>
            </div>
            <div class="card bordercolorinfo" style="border-radius: 5px">
                <div>
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Size="Small" CssClass="form-control alert alert-danger" Visible="False"></asp:Label>
                </div>
                <div class="card-body">
                    <p class="font-weight-bold textocolorinfo">Selecciona Fecha de Mudanza o Articulos</p>
                    <div class="input-group">
                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                        <asp:TextBox ID="txtfecha" runat="server" CssClass="form-control" Text="" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                            ErrorMessage="." ForeColor="Red" ControlToValidate="txtfecha" Text="* Ingrese Fecha">
                        </asp:RequiredFieldValidator>
                    </div>
                    <p></p>
                    <div>
                        <asp:Button ID="btnbuscar" runat="server" OnClick="btnbuscar_Click" Text="Validar Fecha" CssClass=" btn-lg btn-block btncolorinfo  font-weight-bold form-control border-light" />
                    </div>
                    &nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </div>
        </form>
    </div>
</asp:Content>
