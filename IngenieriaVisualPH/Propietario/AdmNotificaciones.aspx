<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="AdmNotificaciones.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web149" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
   <link href="../Diseño/Color.css" rel="stylesheet" />
    <div class="container">
        <form id="form1" runat="server">
                <asp:Label ID="lblcodigo" runat="server" Text="" visible="false"></asp:Label>
            <br />
            <div class="col-md-6">
                <div class="card bordercolorinfo" style="border-radius:7px">
                    <div class="card-header">
                    <strong class="card-title font-weight-bold">Bandeja de Notificaciones</strong>
                    </div>
                    <br />
                    <div class="container">
                    <div class="table col-6">
                        <asp:Repeater ID="r1" runat="server">
                            <ItemTemplate>
                               <a href="ProVerNotifi.aspx?Id=<%#Eval("IdNotCod")%>">
                                <div class="col-lg-6 col-md-6">
                                    <div class="card alert alert-primary border border-primary" style="border-radius:13px">
                                        <div>
                                            <div class="stat-widget-four">
                                                <div class="stat-icon dib">
                                                    <i class="ti-email text-muted text-light"></i>
                                                </div>
                                                <div class="stat-content">
                                                    <div class="text-left">
                                                        <div class="stat-heading">
                                                            <asp:Label ID="label2" Font-Size="Large" CssClass="font-weight-bold" runat="server"><%#Eval("Asunto") %></asp:Label></div>
                                                        <div class="stat-text">
                                                            <asp:Label ID="label1" runat="server" Font-Size="Smaller"><%#Eval("Fecha") %></asp:Label><span class="badge badge-primary pull-right">>> Ver Mensaje Completo</span></div>
                                                        <div class="pull-left text-danger">¿Este mensaje lo leíste? &nbsp;&nbsp;<asp:Label ID="label3" Font-Size="X-Large" CssClass="font-weight-bold" runat="server"><%#Eval("Leido") %></asp:Label></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div></a>                            
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                          <asp:Button ID="btnactualizar" runat="server" Font-Bold="true" class="btn-lg btncolorinfo border border-dark" Text="Ver Mas" OnClick="btnactualizar_Click" />
                   </div>
                                <br />
            <br />
            <br />
            <br />
            <br />
                </div>
            </div>
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
            <br />
            <br />
            <br />
            <br />
</asp:Content>
                                