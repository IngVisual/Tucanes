<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="Perfil_Propietario.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
 <link href="../Diseño/Color.css" rel="stylesheet" />
    <div class="container">
        <form id="fo1" runat="server">
            <h3 class="text-center font-weight-bold textocolorinfo">Perfil Ápartamentos</h3>
            <div class="text-center">
                <img class="mb-4 animate__animated animate__heartBeat" src="../Diseño/imagenes/man (1).png" alt="" width="110" height="110" border="0" />
            </div>
            <div class="col-sm3">
                <asp:Button ID="btnEditar" runat="server" OnClick="btnEditar_Click" Text="Actualizar Datos" CssClass=" btn-lg btn-block btncolorinfo font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite animate__delay-2s" />
            </div>
            <br />
            <br />
            <br />
            <div>
                <asp:Label ID="Label1" runat="server" Text="¡Hola residente! Recomendamos tener los datos actualizados, los números telefónicos que ingresas son para la citofonía virtual y el correo electrónico es solamente para información de administración.  GRACIAS." Font-Bold="True" CssClass="form-control alert alert-warning"></asp:Label>
            </div>
            <br />
            <div class="form-group">
                <label class=" form-control-label textocolorinfo">PROPIETARIO</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                    <asp:Label ID="lblnombre" runat="server" Text="" CssClass="form-control"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo">APARTAMENTO</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-building"></i></div>
                    <asp:Label ID="lblapa" runat="server" Text="" CssClass="form-control"></asp:Label>
                </div>
            </div>
            <asp:Label ID="lblccpropietario" runat="server" Visible="false" Text="" CssClass="form-control"></asp:Label>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo">CORREO ELECTRONICO</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-envelope-o"></i></div>
                    <asp:Label ID="lblemail" runat="server" Text="" CssClass="form-control"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo">CELULAR 1 PROPIETARIOS(Se utilizara para citofonia)</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                    <asp:Label ID="lblcelular" runat="server" Text="" CssClass="form-control"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo">CELULAR 2 PROPIETARIOS(Se utilizara para citofonia)</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                    <asp:Label ID="lblotrocelular" runat="server" Text="" CssClass="form-control"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo">APARTAMENTO HABITADO POR:</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-users"></i></div>
                    <asp:Label ID="lblestado" runat="server" Text="" CssClass="form-control"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo">CELULAR ARRENDADO(Inquilino)(Se utilizara para citofonia)</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                    <asp:Label ID="lblcelarriendo" runat="server" Text="" CssClass="form-control"></asp:Label>
                </div>
            </div>
            <div>
                <asp:Label ID="lblcodigo" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </div>
            <div style="margin-left: 40px">
            </div>
            <br />
            <br />
        </form>
    </div><!--/.col-->
</asp:Content>

