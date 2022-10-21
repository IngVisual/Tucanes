<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="HomeSaldo.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web113" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
 <link href="../Diseño/Color.css" rel="stylesheet" />
    <div class="container">
        <div class="card-body">
            <div class="card-title">
                <h3 class="text-center textocolorinfo font-weight-bold">Saldos de Administracion</h3>
            </div>
        </div>
        <form id="form1" runat="server">
            <aside class="profile-nav alt">
                <a href="SaldoAdministracion.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/imagenes/saldo.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Ver Estados de Saldo</h3>
                                    <p>
                                        <asp:Label ID="lblapa" runat="server" Text="Estado de Cuenta" ForeColor="White"></asp:Label></p>
                                    <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
            <aside class="profile-nav alt">
                <a href="NovedadPagoSel.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/imagenes/recibo.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Realizar Novedades de Saldo</h3>
                                    <p>
                                        <asp:Label ID="Label1" runat="server" Text="Novedad" ForeColor="White"></asp:Label></p>
                                     <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
            <aside class="profile-nav alt">
                <a href="ProTabResPag.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/imagenes/recib.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Respuesta Novedades de Saldo</h3>
                                    <p>
                                        <asp:Label ID="Label2" runat="server" Text="Respuesta de solicitud" ForeColor="White"></asp:Label></p>
                                     <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
        </form>
    </div>
</asp:Content>
