<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="ReenviarPush.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web143" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
        <link href="../Diseño/Banner.css" rel="stylesheet" />
        <script>
            function DesactivarBoton() {
             document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
        }
        window.onbeforeunload = DesactivarBoton;
    </script>
    <div id="procesando" class="ventana2" style="display: none">
                <h5 class="text-light text-center font-weight-bold">Enviando Mensajes...</h5>
        <img src="../Diseño/Imagenes/coheteLoading2.gif" />
    </div>
    <div class="container" id="conta">
    </div>
</asp:Content>
