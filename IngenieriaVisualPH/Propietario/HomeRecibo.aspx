<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="HomeRecibo.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web152" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <div class="container">
                <h3 class="text-center textocolorinfo font-weight-bold">Recibos</h3>
        <form id="form1" runat="server">
            <aside class="profile-nav alt">
                <a href="ProAgua.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/drop.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Pagar recibo del agua por PSE</h3>
                                    <p>
                                        <asp:Label ID="lblapa" runat="server" Text="PSE" ForeColor="White"></asp:Label></p>
                                    <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
            <aside class="profile-nav alt">
                <a href="ProEnergia.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/rechargeable.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Pagar recibo de energia por PSE</h3>
                                    <p>
                                        <asp:Label ID="Label1" runat="server" Text="PSE" ForeColor="White"></asp:Label></p>
                                     <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
             <aside class="profile-nav alt">
                <a href="ProGas.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/gas.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Pagar recibo del GAS por PSE</h3>
                                    <p>
                                        <asp:Label ID="Label2" runat="server" Text="PSE" ForeColor="White"></asp:Label></p>
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
