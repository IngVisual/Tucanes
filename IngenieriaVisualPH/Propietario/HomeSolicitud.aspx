<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="HomeSolicitud.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web121" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <link href="../Diseño/Color.css" rel="stylesheet" />
    <div class="container">
        <div class="card-body">
            <div class="card-title">
                <h3 class="text-center textocolorinfo font-weight-bold">Solicitudes</h3>
            </div>
        </div>
        <form id="form1" runat="server">
              <aside class="profile-nav alt">
                <a href="VerRespuestaSol.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/respu.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Ver Respuestas de tus solicitudes</h3>
                                    <p>
                                        <asp:Label ID="Label5" runat="server" Text="Solicitudes" ForeColor="White"></asp:Label></p>
                                    <p><span class="badge badge-dark pull-right">> Ver Respuestas</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
             <aside class="profile-nav alt">
                <a href="PQRPropietarios.aspx">
                    <section class="card">
                        <div class="card-header user-header alt btncolorinfo">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/homework (1).png">
                                <div class="media-body">
                                    <h4 class="text-light display-6">Realizar PQR por este medio,en caso de que no lo pueda hacer presencial.</h4>
                                    <p>
                                        <asp:Label ID="Label7" runat="server" Text="PQR" ForeColor="White"></asp:Label></p>
                                    <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
            <aside class="profile-nav alt">
                <a href="Documentos_propietario.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/estacionamiento.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Solicitud de Parqueadero</h3>
                                    <p>
                                        <asp:Label ID="lblapa" runat="server" Text="Solicitud" ForeColor="White"></asp:Label></p>
                                    <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
            <aside class="profile-nav alt">
                <a href="MudanzaValidar.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/camion-de-reparto.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Mudanzas</h3>
                                    <p>
                                        <asp:Label ID="Label1" runat="server" Text="Solicitud" ForeColor="White"></asp:Label></p>
                                     <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
            <aside class="profile-nav alt">
                <a href="ProCartelera.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/carte.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Anunciate en la Cartelera del Conjunto</h3>
                                    <p>
                                        <asp:Label ID="Label2" runat="server" Text="Anunciar" ForeColor="White"></asp:Label></p>
                                     <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
            <aside class="profile-nav alt">
                <a href="VerificarDisponibilidadSC.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/evento (1).png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Salon Social</h3>
                                    <p>
                                        <asp:Label ID="Label3" runat="server" Text="Solicitud" ForeColor="White"></asp:Label></p>
                                     <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
             <aside class="profile-nav alt">
                <a href="ProSolChip.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/puerta.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Chips de acceso nuevos</h3>
                                    <p>
                                        <asp:Label ID="Label4" runat="server" Text="Solicitud" ForeColor="White"></asp:Label></p>
                                     <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
            <aside class="profile-nav alt">
                <a href="ProArriVent.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/alquilar.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Anunciar apartamento en venta o arriendo</h3>
                                    <p>
                                        <asp:Label ID="Label6" runat="server" Text="Anunciar" ForeColor="White"></asp:Label></p>
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
