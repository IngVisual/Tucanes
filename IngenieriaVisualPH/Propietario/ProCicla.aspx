<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProCicla.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <div class="container">
        <h3 class="text-center textocolorinfo font-weight-bold">Registro de Ciclas</h3>
        <form id="fo1" runat="server">

            <div class="card-body">
                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                    <asp:Repeater ID="r1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><a href="ProCiclaEditar.aspx?Id=<%#Eval("Id")%>">
                                    <button class="btn btn-info font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar">Eliminar</i></button>
                                </a></td>
                                <td class="textocolorinfo font-weight-bold"><%#Eval("Marca") %></td>
                                <td class="textocolorinfo font-weight-bold"><%#Eval("Estado") %></td>
                                <%--  <td><h2 class="text-success font-weight-bold"><i class="fa fa-dollar">&nbsp;<%#Eval("Total") %></i></h2></td>--%>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                                              </table>
                        </FooterTemplate>
                    </asp:Repeater>
            </div>
            <br />
            <div class="text-center">
                <img class="mb-4 animate__animated animate__bounceInLeft " src="../Diseño/imagenes/bici.png" alt="" width="110" height="110" border="0" />
            </div>
            <div>
                <asp:Label ID="Label1" runat="server" Text="¡Hola residente! Para mejorar la seguridad de tu cicla, en esta ventana puedes hacer el registro de la misma." Font-Bold="True" CssClass="form-control bgcolor" ForeColor="White"></asp:Label>
            </div>
            <div class="alert alert-success" id="error1" runat="server" style="margin-top: 10px; display: none">
                <span class="badge badge-pill badge-success">Listo</span>
                Bicicleta registrada
                                              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                  <span aria-hidden="true">&times;</span>
                                              </button>
            </div>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="true" ForeColor="Red" />
                </td>
            </tr>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">MARCA</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-bicycle"></i></div>
                    <asp:TextBox ID="txtmarca" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorusuario" runat="server" Display="Dynamic"
                        ErrorMessage="La marca es requerida" ControlToValidate="txtmarca" Text="*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">COLOR</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-bicycle"></i></div>
                    <asp:TextBox ID="txtcolor" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                        ErrorMessage="El color es requerido" ControlToValidate="txtcolor" Text="*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">TIPO</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-bicycle"></i></div>
                    <asp:DropDownList ID="ddtipo" CssClass="form-control" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Todo Terreno</asp:ListItem>
                        <asp:ListItem>Croos</asp:ListItem>
                        <asp:ListItem>Montañismo</asp:ListItem>
                        <asp:ListItem>Carrera de ruta</asp:ListItem>
                        <asp:ListItem>Carreras BMX</asp:ListItem>
                        <asp:ListItem>BMX</asp:ListItem>
                        <asp:ListItem>Scooter Electrica</asp:ListItem>
                        <asp:ListItem>Bicicleta Electrica</asp:ListItem>
                        <asp:ListItem>Bicicleta Clasica</asp:ListItem>
                        <asp:ListItem>Bicicleta Discapacidad</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                        ErrorMessage="El estado es requerido" ControlToValidate="ddtipo" Text="*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">ADULTO/NIÑO</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                    <asp:DropDownList ID="ddper" CssClass="form-control" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>NIÑO</asp:ListItem>
                        <asp:ListItem>ADULTO</asp:ListItem>
                        <asp:ListItem>DISCAPACIDAD</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorcon" runat="server" Display="Dynamic"
                        ErrorMessage="La persona es requerida" ControlToValidate="ddper" Text="*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <asp:Label ID="lblcodigo" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            <asp:Label ID="lblestado" runat="server" Text="Cicla Registrada" Visible="False"></asp:Label>
            <div class="align-content-md-center">
                <asp:Button ID="btnactualizar" runat="server" class="btn-lg btncolorinfo font-weight-bold border border-light form-control btn-block" Text="Guardar Registro" OnClick="btnactualizar_Click" />
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
    </div><!--/.col-->
</asp:Content>
