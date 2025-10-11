<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="AlquilerParqCMAddUser.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web150" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
        <style>
        body {
            background: rgb(249,244,242);
            background: linear-gradient(90deg, rgba(249,244,242,1) 0%, rgba(22,27,38,0.8267682072829132) 50%);
        }
     </style>
    <link href="../Diseño/Banner.css" rel="stylesheet" />
        <script>
            function DesactivarBoton() {
             document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
            }
            window.onbeforeunload = DesactivarBoton;
        </script>   
    <div id="procesando" class="ventana2" style="display: none">
                <h5 class="text-light text-center font-weight-bold">Administrador trabajando...</h5>
        <img src="../Diseño/Imagenes/oficina.gif" />
    </div>
    <div class="container" id="conta">
        <form id="f2" runat="server">
            <div class="col-lg-12">
                <div class="alert alert-info" runat="server" style="margin-top: 10px;">
                    <span class="badge badge-pill badge-success">Estado del Guarda</span>
                    True=Activo, False=Inactivo
                                              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                  <span aria-hidden="true">&times;</span>
                                              </button>
                </div>
                <div class="card" style="border-radius: 7px">
                    <div class="card-body">
                        <div class="col-lg-12">
                            Ingrese Nombre completo del Guarda
                                <asp:TextBox ID="txtuser" CssClass="form-control text-uppercase" runat="server" Enabled="True"></asp:TextBox>
                            <p></p>
                        </div>
                        <div class="col-lg-2">
                            <asp:Button ID="btnguardar" runat="server" OnClick="btnguardar_Click" Text="Guardar" Style="border-radius: 7px" CssClass="btn btn-primary font-weight-bold form-control border-light" />
                        </div>
                        <section id="tabsc">
                            <div class="content mt-3">
                                <table class="table">
                                    <asp:Repeater ID="r1" runat="server">
                                        <HeaderTemplate>
                                            <thead class="thead-dark" style="border-radius: 5px">
                                                <tr>
                                                    <th>Estado del Guarda</th>
                                                    <th>Nombre del Guarda</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <a href="AlquilerParquEditarUsuario.aspx?Id=<%#Eval("Id")%>&Activo=<%#Eval("Activo")%>" class="btn btn-primary" style="border-radius: 7px">
                                                        <asp:Label ID="lblactivo" runat="server"><%#Eval("Activo")%> </asp:Label>
                                                    </a></td>
                                                <td><i class="fa fa-user text-uppercase">&nbsp;<%#Eval("Nombre") %></i></td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody>
                                              </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                            </div>
                        </section>

                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
