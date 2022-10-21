<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="Arriendo.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
     <style>
        body {
            background: #134E5E; /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #71B280, #134E5E); /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #71B280, #134E5E); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }
    </style>
    <div class="conatiner col-xl-12 col-lg-6">
        <div>
            <h3 class="text-center text-light font-weight-bold">Cartelera</h3>
        </div>
        <form id="fo1" runat="server">
            <div class="text-center">
                <img class="mb-4 animate__animated animate__bounceInLeft" src="../Diseño/Imagenes/telefono-inteligente (1).png" alt="" width="110" height="110" border="0" />
            </div>
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
                                        <div class="bg bg-primary">
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
