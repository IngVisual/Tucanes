<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="HomeRegistro.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
     <div class="container">
        <div class="card-body">
            <div class="card-title">
                <h3 class="text-center textocolorinfo font-weight-bold">Registros</h3>
            </div>
        </div>
        <form id="form1" runat="server">
            <aside class="profile-nav alt">
                <a href="Perfil_Propietario.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor" style="height:120px">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/apa.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Actualizar Datos de Apartamento</h3>
                                    <p>
                                        <asp:Label ID="lblapa" runat="server" Text="Registro" ForeColor="White"></asp:Label></p>
                                    <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
             <aside class="profile-nav alt">
                <a href="ProProVis.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor" style="height:120px">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/progr.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Programar Visitas</h3>
                                    <p>
                                        <asp:Label ID="Label4" runat="server" Text="Programar" ForeColor="White"></asp:Label></p>
                                     <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
              <aside class="profile-nav alt">
                <a href="ProRegistroVisitantes.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor" style="height:120px">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/regi.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Historial de Visitas</h3>
                                    <p>
                                        <asp:Label ID="Label3" runat="server" Text="Historial" ForeColor="White"></asp:Label></p>
                                     <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
            <aside class="profile-nav alt">
                <a href="ProRegGen.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor" style="height:120px">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/registrarse.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Registro General</h3>
                                    <p>
                                        <asp:Label ID="Label5" runat="server" Text="Registrar" ForeColor="White"></asp:Label>
                                    </p>
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
