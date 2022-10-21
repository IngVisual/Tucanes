<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProGas.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web155" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
        <div class="container">
                <h3 class="text-center textocolorinfo font-weight-bold">Pago Recibo del Gas</h3>
        <form id="form1" runat="server">
            <br />
            <div class="form-control bg-primary mb-6">
               <a href="https://www.grupovanti.com/pagos-en-linea/" style="color: #000000">
                <div class="text-left">
                    <img class="mb-4" src="../Diseño/Imagenes/gas.png" alt="" width="80" height="80" border="0" />
                </div>
                <i class="menu-icon fa fa-paypal text-light bg bg-green"></i>Click Aquí para realizar el pago.</a>
            </div>
            <br />
        </form>
    </div>
</asp:Content>
