<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProAgua.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web153" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <div class="container">

                <h3 class="text-center textocolorinfo font-weight-bold">Pago recibo del Agua</h3>

        <form id="form1" runat="server">
            <br />
            <div class="form-control bg-primary mb-6">
                 <a href="https://pagos.acueducto.com.co/" style="color: #FFFFFF">
                <div class="text-left">
                    <img class="mb-4" src="../Diseño/Imagenes/drop.png" alt="" width="80" height="80" border="0" />
                </div>
                <i class="menu-icon fa fa-paypal bg bg-green"></i>Click Aquí para realizar el pago.</a>
            </div>
            <br />
        </form>
    </div>
</asp:Content>
