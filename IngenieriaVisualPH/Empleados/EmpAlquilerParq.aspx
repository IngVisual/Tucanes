<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="EmpAlquilerParq.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web119" %>
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
    document.getElementById("conta").style.display = "none";
    document.getElementById("procesando").style.display = "block";
    }
    window.onbeforeunload = DesactivarBoton;
    </script>
    <div id="procesando" class="ventana">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando.....</h5>
    </div>
    <div class="container" id="conta">
        <form id="form" runat="server">
            <div id="programacion" runat="server">
                <asp:Repeater ID="R1" runat="server">
                    <ItemTemplate>
                        <div class="card">
                            <div class="card-header font-weight-bold">
                                Tipo de Alquiler
                            </div>
                            <div class="card-body">
                                <p class="card-text">
                                    <asp:Label ID="label2" runat="server"><%#Eval("TipoAlquiler") %></asp:Label>
                                </p>
                                <a href="EmpGuardarAlquiler.aspx?IDtipoAlq=<%# Eval("IDtipoAlq")%>" <%--&&_TipoParqueadero=<%#Eval("_TipoParqueadero")%>&&_TipoVehiculo=<%#Eval("_TipoVehiculo")%>&&_Tarifa=<%#Eval("_Tarifa")%>&&_TipoTarifa=<%#Eval("_TipoTarifa")%>&&_TipoDia=<%# Eval("_TipoDia")%>&&_Free_hora=<%#Eval("_Free_hora")%>&&_TarifaHoraFija=<%#Eval("_TarifaHoraFija")%>--%> class="btn btn-primary">Continuar</a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </form>
    </div>
</asp:Content>
