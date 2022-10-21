<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="VerCartelera.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web140" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <div class="conatiner col-xl-12 col-lg-6">
        <div>
            <h3 class="text-center textocolorinfo font-weight-bold">Cartelera</h3>
        </div>
        <form id="fo1" runat="server">
            <br />
            <div>
                <asp:Label ID="Label1" Font-Size="Small" runat="server" Text="¡Hola Residente! Si ofreces algún tipo de servicio para tu conjunto como: peluquería, cuidar niños, vender comida, arreglar ropa, etc... Puedes enviar una solicitud de cartelera a la adm desde la app, para que las demás personas en tu comunidad lo vean. " Font-Bold="True" CssClass="form-control bgcolor" ForeColor="White"></asp:Label>
            </div>
            <br />
            <div class="text-center">
                <img class="mb-4 animate__animated animate__bounceInLeft" src="../Diseño/Imagenes/telefono-inteligente (1).png" alt="" width="110" height="110" border="0" />
            </div>
            <br />
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" EmptyDataText="No se han generado carteles" GridLines="None" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                            <Columns>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:Repeater ID="r1" runat="server">
                            <ItemTemplate>
                                <div class="col-xl-12 col-lg-6">
                                    <section class="card">
                                        <div class="bgcolor">
                                            <div class="corner-ribon black-ribon">
                                                <i class="fa fa-home"></i>
                                            </div>
                                            <div class="fa fa-user"></div>

                                            <div class="media">
                                                <a href="#"></a>
                                                &nbsp;<div class="media-body">
                                                    <h2 class="text-white display-6">
                                                        <asp:Label ID="Label5"
                                                            runat="server"
                                                            Text="">
                                                        </asp:Label></h2>
                                                    <p class="text-light">
                                                        <asp:Label ID="Label4" Font-Bold="true"
                                                            runat="server"
                                                            Text='<%#Eval("Observaciones") %>'>
                                                        </asp:Label>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="weather-category twt-category">
                                            <ul>
                                                <li class="active">
                                                    <h4>
                                                        <asp:Label ID="Label6"
                                                            runat="server"
                                                            Text='<%#Eval("Nombre") %>'>
                                                        </asp:Label></h4>
                                                    Nombre
                                                </li>
                                                <li>
                                                    <h4>
                                                        <asp:Label ID="Label7"
                                                            runat="server"
                                                            Text='<%#Eval("Estado") %>'>
                                                        </asp:Label></h4>
                                                    Estado
                                                </li>
                                                <li>
                                                    <h4>
                                                        <asp:Label ID="Label8"
                                                            runat="server"
                                                            Text='<%#Eval("Codigo") %>'>
                                                        </asp:Label></h4>
                                                    Apartamento
                                                </li>
                                            </ul>
                                        </div>
                                        <i class="menu-icon fa fa-phone"></i>
                                        <asp:Label ID="Label9"
                                            runat="server" Style="color: #26b638" Font-Bold="True"
                                            Text='<%#Eval("Celular") %>'>
                                        </asp:Label>
                                    </section>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView2" EmptyDataText="No has generado tu primer cartel" GridLines="None" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                            <Columns>
                            </Columns>
                        </asp:GridView>

                    </td>
                    <td>
                        <asp:Repeater ID="r2" runat="server">
                            <ItemTemplate>
                                <div class="col-xl-12 col-lg-12">
                                    <section class="card">
                                        <div class="bgcolor">
                                            <div class="corner-ribon black-ribon">
                                                <i class="fa fa-home"></i>
                                            </div>
                                            <div class="fa fa-user"></div>

                                            <div class="media">
                                                <a href="#"></a>
                                                &nbsp;<div class="media-body">
                                                    <h2 class="text-white display-6">
                                                        <asp:Label ID="Label5"
                                                            runat="server"
                                                            Text="">
                                                        </asp:Label></h2>
                                                    <p class="text-light">
                                                        <asp:Label ID="Label4" Font-Bold="true"
                                                            runat="server"
                                                            Text='<%#Eval("Descripcion") %>'>
                                                        </asp:Label>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="weather-category twt-category">
                                            <ul>
                                                <li class="active">
                                                    <h4>
                                                        <asp:Label ID="Label6"
                                                            runat="server"
                                                            Text='<%#Eval("Nombre") %>'>
                                                        </asp:Label></h4>
                                                    Nombre
                                                </li>
                                                <li>
                                                    <h4>
                                                        <asp:Label ID="Label7"
                                                            runat="server"
                                                            Text='<%#Eval("Estado") %>'>
                                                        </asp:Label></h4>
                                                    Estado
                                                </li>
                                                <li>
                                                    <h4>
                                                        <asp:Label ID="Label8"
                                                            runat="server"
                                                            Text='<%#Eval("Precio") %>'>
                                                        </asp:Label></h4>
                                                    Precio

                                                </li>

                                            </ul>
                                        </div>
                                        <i class="menu-icon fa fa-phone"></i>
                                        <asp:Label ID="Label9"
                                            runat="server" Style="color: #26b638" Font-Bold="True"
                                            Text='<%#Eval("Celular") %>'>
                                        </asp:Label>
                                    </section>
                                </div>

                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
        </form>
        <!-- .card -->
    </div>
</asp:Content>
