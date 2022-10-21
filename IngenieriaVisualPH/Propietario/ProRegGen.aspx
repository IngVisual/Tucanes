<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProRegGen.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web112" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <div class="container">
        <h3 class="text-center textocolorinfo font-weight-bold">REGISTRO GENERAL</h3>
            <br />
        <form id="fo1" runat="server" >
            <div>
                <asp:Label ID="Label4" Font-Size="Small" runat="server" Text="¡Hola Residente! Este registro solo se envía cuando la administración lo solicita para un evento en especial." Font-Bold="True" CssClass="form-control bgcolor" ForeColor="White"></asp:Label>
            </div>
            <br />
            <div class="sufee-alert alert with-close alert-success alert-dismissible fade show" id="error" runat="server" style="margin-top: 20px; display: none">
                <span class="badge badge-pill badge-success">Listo</span>
                Gracias por tu registro
            </div>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" />
                </td>
            </tr>
            <div>
                <asp:Label ID="lblcodigo" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <div class="form-group">
                <label class="form-control-label textocolorinfo font-weight-bold">REGISTRO</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-edit"></i></div>
                    <asp:TextBox ID="txtobservacion" runat="server" Text="" CssClass="form-control" Enabled="True" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                        ErrorMessage="El Registro es requerido" ForeColor="Red" ControlToValidate="txtobservacion" Text="*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
            <div>
                <asp:Button ID="btnenviardocuemnto" Font-Bold="true" runat="server" class="btn-block btn-lg btncolorinfo border-light" Text="Enviar Registro" OnClick="btnenviardocuemnto_Click" />
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </form>
    </div>
</asp:Content>
