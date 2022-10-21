<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProProVis.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web110" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
 <div class="container">
    <form id="fo1" runat="server" method="post" novalidate="novalidate">        
            <asp:Label ID="lblcodigo" runat="server" Font="Red" Visible="False"></asp:Label>
        <div>
            <asp:Label ID="Label4" Font-Size="Small" runat="server"  Text="¡Hola Residente! Esta opción te permite programar el ingreso de tus visitas, lo único que debes hacer es subir tu visita y en la app de los vigilantes quedara registrada. Con esto el vigilante no tendrá necesidad de marcar por la Citófonia. " Font-Bold="True" CssClass="form-control bgcolor" ForeColor="White"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label8" Font-Size="Small" runat="server" Text="No se garantiza parqueadero de visitante, dependemos de disponibilidad. " Font-Bold="True" CssClass="form-control bgcolor" ForeColor="White"></asp:Label>
        </div>
        <br />
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" />
            </td>
        </tr>
        <br />
        <div class="form-group">
            <label for="" class="form-control-label textocolorinfo font-weight-bold">Nombre de las personas que te visitan</label>
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-users"></i></div>
                <asp:TextBox ID="txtuuario" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorusuario" runat="server" Display="Dynamic"
                    ErrorMessage="El nombre es requerido" ForeColor="Red" ControlToValidate="txtuuario" Text="*">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="" class="form-control-label textocolorinfo font-weight-bold">Tipo de Visita</label>
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-book"></i></div>
                <asp:DropDownList ID="ddobs" Font-Bold="true" CssClass="form-control" runat="server" ForeColor="Red">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>VISITA FAMILIAR</asp:ListItem>
                    <asp:ListItem>VISITA SERVICIO TECNICO</asp:ListItem>
                    <asp:ListItem>VISITA SERVICIO GENERAL</asp:ListItem>
                    <asp:ListItem>VISITA LABORAL</asp:ListItem>
                    <asp:ListItem>VISITA COBRANZA</asp:ListItem>
                    <asp:ListItem>VISITA ENTREGA DE PAQUETE</asp:ListItem>
                    <asp:ListItem>VISITA EVENTO SALON COMUNAL</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                    ErrorMessage="la observacion es requerida" ForeColor="Red" ControlToValidate="ddobs" Text="*">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="" class="form-control-label textocolorinfo font-weight-bold">Fecha de la visita</label>
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                <asp:TextBox ID="txtfecha" runat="server" CssClass="form-control" Text="" TextMode="Date"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                    ErrorMessage="la fecha es requerida" ForeColor="Red" ControlToValidate="txtfecha" Text="*">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="" class="form-control-label textocolorinfo font-weight-bold">PLaca Vehiculo </label>
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-barcode"></i></div>
                <asp:TextBox ID="txtplaca" runat="server" CssClass="form-control" Text="" TextMode="SingleLine"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label for="" class="form-control-label textocolorinfo font-weight-bold">Tipo de Vehiculo</label>
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-plus-square"></i></div>
                <asp:DropDownList ID="ddvehiculo" Font-Bold="true" CssClass="form-control" runat="server" ForeColor="Red">
                    <asp:ListItem>N/A</asp:ListItem>
                    <asp:ListItem>MOTO</asp:ListItem>
                    <asp:ListItem>CARRO</asp:ListItem>
                    <asp:ListItem>CICLA</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <br />
        <div>
            <asp:Button ID="btnguardar" Font-Bold="true" runat="server" class="btn-block btn-lg btncolorinfo border-light " Text="Enviar Visita" OnClick="btnguardar_Click" />
        </div>
        <br />
        <br />
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
