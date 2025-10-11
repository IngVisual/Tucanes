<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProCartelera.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web136" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <div class=" container">
        <div class="card-title">
            <h3 class="text-center textocolorinfo font-weight-bold">Registro Cartelera Residentes</h3>
        </div>
        <div class="text-center">
            <img class="mb-4 animate__animated animate__bounceInLeft " src="../Diseño/imagenes/carte.png" alt="" width="110" height="110" border="0" />
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
                                <td><a href="ProCarteleraEditar.aspx?Id=<%#Eval("IdCartelera")%>">
                                    <button class="btn btn-info font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar">Eliminar</i></button>
                                </a></td>
                                <td class="font-weight-bold">
                                    <asp:Label ID="Label1" Font-Size="Small" Text='<%#Eval("Observaciones") %>' runat="server"></asp:Label></td>
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
                    La solicitud se envió correctamente a la administración para ser autorizada.
                </div>
            </td>
            <div>
                <asp:Label ID="Label1" Font-Size="Small" runat="server" Text="¡Hola Residente! Si ofreces algún tipo de servicio para tu conjunto como: peluquería, cuidar niños, vender comida, arreglar ropa, etc... Puedes enviar una solicitud de cartelera a la adm desde la app, para que las demás personas en tu comunidad lo vean. " Font-Bold="True" CssClass="form-control bgcolor" ForeColor="White"></asp:Label>
            </div>
            <br />
            <div class="form-group">
                <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Nombre</label>
                <asp:TextBox ID="txtnombre" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                    ErrorMessage="El Nombre es requerido" ControlToValidate="txtnombre" Text="*">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Celular de contacto</label>
                <asp:TextBox ID="txttelefono" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                    ErrorMessage="El Telefono es requerido" ControlToValidate="txttelefono" Text="*">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="" class="control-label mb-1 textocolorinfo  font-weight-bold">Descripción del servicio</label>
                <asp:TextBox ID="txtobservacion" placeholder="Ej:Peluqueria para adultos y niños" runat="server" CssClass="form-control" TextMode="MultiLine" MaxLength="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                    ErrorMessage="La Observacion es requerida" ControlToValidate="txtobservacion" Text="*">
                </asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Button ID="btnenviardocuemnto" Font-Bold="true" runat="server" class="btn-block btn-lg font-weight-bold btncolorinfo border-light btn-block" Text="Enviar Solicitud" OnClick="btnenviardocuemnto_Click" />
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
