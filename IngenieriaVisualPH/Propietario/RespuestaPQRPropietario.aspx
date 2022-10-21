<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="RespuestaPQRPropietario.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web124" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
       <div class="container">
        <div class="card-body">
            <div class="card-title">
                <h3 class="text-center text-center textocolorinfo font-weight-bold">Respuesta de PQRS</h3>
            </div>
        </div>
        <form id="form1" runat="server">
                <asp:Label ID="lblcodigo" runat="server" Text="" visible="false"></asp:Label>
            <div>
                <asp:Label ID="Label1" runat="server" Text="PQRS Enviados a la Administración" Font-Bold="True" CssClass="form-control bgcolor" ForeColor="White"></asp:Label>
            </div>
            <br />
            <div class="col-md-6">
                    <div class="card bordercolorinfo" style="border-radius:7px">
                    <div class="card-header">
                        <strong class="card-title">Historial de PQRS<small><span class="badge badge-info float-right mt-1">PQR Activos</span></small></strong>
                    </div>
                    <div class="table col-6">
                        <asp:Repeater ID="r1" runat="server">
                            <HeaderTemplate>
                                <table class="table col-6">
                                    <thead>
                                        <tr>
                                            <th scope="col">Respuesta</th>
                                            <th scope="col">Enviado:</th>
                                            <th scope="col">Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><a href="ProRespuestas.aspx?Id=<%#Eval("Id")%>">
                                        <button class="btncolorinfo font-weight-bold" style="border-radius:5px" type="button" title="Actualizar">Ver Respuesta</i></button>
                                    </a></td>
                                    <td><asp:Label ID="label1" runat="server" Font-Size="Smaller"><%#Eval("FechaInicio") %></asp:Label></td>
                                    <td><span class="badge badge-primary float-right mt-1"><asp:Label ID="label2" runat="server" Font-Size="Large"><%#Eval("Estado") %></asp:Label></span></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>                                
                                </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
        </form>
    </div>
</asp:Content>
