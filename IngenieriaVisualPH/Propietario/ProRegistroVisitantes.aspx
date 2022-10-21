<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProRegistroVisitantes.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web111" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
        <h3 class="text-center font-weight-bold textocolorinfo">Visitantes</h3>
        <form id="form1" runat="server">
            <asp:Label ID="lblcodigo" runat="server" Text="" ForeColor="Red" Visible="False"></asp:Label>
            <br />
            <div class="text-center">
                <img class="mb-4 animate__animated animate__heartBeat" src="../Diseño/Imagenes/officer.png" alt="" width="110" height="110" border="0" />
            </div>
            <br />
                <div>
                <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                    <asp:Repeater ID="r1" runat="server">
                        <HeaderTemplate>
                            <thead class="thead-dark">
                                <tr>
                                    <th>
                                    <asp:Label ID="label1" runat="server" Text="Fecha" Font-Size="Smaller"></asp:Label></th>
                                    <th><asp:Label ID="label2" runat="server" Text="Usuario" Font-Size="Smaller"></asp:Label></th>
                                    <th><asp:Label ID="label3" runat="server" Text="Observacion" Font-Size="Smaller"></asp:Label></th>
                                    <th><asp:Label ID="label4" runat="server" Text="Vehiculo" Font-Size="Smaller"></asp:Label></th>
                                    <th><asp:Label ID="label5" runat="server" Text="Placa" Font-Size="Smaller"></asp:Label></th>
                                </tr>
                            </thead>
                            <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><asp:Label ID="label5" runat="server" CssClass=" textocolorinfo" Text='<%#Eval("FechaPro","{0:d}") %>' Font-Size="Smaller"></asp:Label></td>
                                <td><asp:Label ID="label6" runat="server" CssClass=" textocolorinfo" Text='<%#Eval("Usuario") %>' Font-Size="Smaller"></asp:Label></td>
                                <td><asp:Label ID="label7" runat="server" CssClass=" textocolorinfo" Text='<%#Eval("Observacion") %>' Font-Size="Smaller"></asp:Label></td>
                                <td><asp:Label ID="label8" runat="server" CssClass=" textocolorinfo" Text='<%#Eval("Vehiculo") %>' Font-Size="Smaller"></asp:Label></td>
                                <td><asp:Label ID="label9" runat="server" CssClass=" textocolorinfo" Text='<%#Eval("PlacaVehiculo") %>' Font-Size="Smaller"></asp:Label></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                                              </table>
                        </FooterTemplate>
                    </asp:Repeater>
            </div>

            <!-- .animated -->
            <br />
         
        </form>

</asp:Content>
