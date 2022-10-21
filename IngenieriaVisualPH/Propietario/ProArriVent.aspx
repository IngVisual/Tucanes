<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProArriVent.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web138" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <div class=" container">
        <div class="card-title">
            <h3 class="text-center textocolorinfo font-weight-bold">Registro de Arriendo o Venta</h3>
        </div>
        <div class="text-center">
            <img class="mb-4 animate__animated animate__bounceInLeft " src="../Diseño/imagenes/alquilar.png" alt="" width="110" height="110" border="0" />
        </div>
     <form id="fo1" runat="server">
        <td colspan="2">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="true" CssClass="text-danger" />
        </td>
        <div class="card bordercolorinfo" style="border-radius:7px">
            <div class="card-body">
                <table class="table">
                    <asp:Repeater ID="r1" runat="server">
                        <HeaderTemplate>
                            <thead class="bgcolor text-light">
                                <tr>
                                    <th>Eliminar</th>
                                    <th>Descripcion</th>
                                </tr>
                            </thead>
                            <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><a href="ProArriendoEditar.aspx?Id=<%#Eval("Id")%>">
                                    <button class="btn btn-info font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar">Eliminar</i></button>
                                </a></td>
                                <td class="font-weight-bold">
                                    <asp:Label ID="Label1" Font-Size="Small" Text='<%#Eval("Descripcion") %>' runat="server"></asp:Label></td>
                                <%--  <td><h2 class="text-success font-weight-bold"><i class="fa fa-dollar">&nbsp;<%#Eval("Total") %></i></h2></td>--%>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                       </table>
                        </FooterTemplate>
                    </asp:Repeater>
            </div>
        </div>
            <td colspan="2">
                <div class="sufee-alert alert with-close alert-success alert-dismissible fade show" id="error1" runat="server" style="margin-top: 20px; display: none">
                    <span class="badge badge-pill badge-success">Listo</span>
                    El registro se realizo correctamente.
                </div>
            </td>
            <div>
                <asp:Label ID="Label1" Font-Size="Small" runat="server" Text="¡Hola Propieatrio! Si lo deseas puedes postular tu apartamento en arriendo o venta para que los visitantes lo vean en portería. " Font-Bold="True" CssClass="form-control bgcolor" ForeColor="White"></asp:Label>
            </div>
            <br />
            <div class="form-group">
                <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Nombre</label>
                <asp:TextBox ID="txtnombre" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                    ErrorMessage="El Nombre es requerido" ForeColor="White" ControlToValidate="txtnombre" Text="*">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Celular de contacto</label>
                <asp:TextBox ID="txttelefono" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                    ErrorMessage="El Telefono es requerido" ForeColor="White" ControlToValidate="txttelefono" Text="*">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Tipo de Postulación</label>
                <asp:DropDownList ID="ddestado" runat="server" CssClass="form-control" ForeColor="Red">
                    <asp:ListItem>Arriendo</asp:ListItem>
                    <asp:ListItem>Venta</asp:ListItem>
                    <asp:ListItem>Venta o arriendo</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic"
                    ErrorMessage="El tipo es requerido" ForeColor="White" ControlToValidate="ddestado" Text="*">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Precios</label>
                <asp:TextBox ID="txtprecio" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                    ErrorMessage="El Precio es requerido" ForeColor="White" ControlToValidate="txtprecio" Text="*">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Descripción del apartamento</label>
                <asp:TextBox ID="txtobservacion" runat="server" CssClass="form-control" placeholder="Ej:3 habitaciones 48mt2, parqueadero, admin incluida etc..." TextMode="MultiLine" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                    ErrorMessage="La Observacion es requerida" ForeColor="White" ControlToValidate="txtobservacion" Text="*">
                </asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Button ID="btnenviardocuemnto" Font-Bold="true" runat="server" class="btn-block btn-lg font-weight-bold btncolorinfo border-light btn-block" Text="Enviar Registro" OnClick="btnenviardocuemnto_Click" />
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
        </form>
    </div>
</asp:Content>
