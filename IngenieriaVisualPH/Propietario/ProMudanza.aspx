<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProMudanza.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web129" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <div class="container">
        <div class="card-body">
            <div class="card-title">
                <h3 class="text-center textocolorinfo font-weight-bold">Solicitudes de Mudanzas, Articulos o Articulos de Construcción</h3>
            </div>
        </div>
        <form id="form1" runat="server">
             <asp:label ID="date2" runat="server" visible="false"></asp:label>
            <div class="col-lg-4 col-md-6">
                <aside class="profile-nav alt">
                    <section class="card bordercolorinfo">
                        <div class="card-header user-header alt bgcolor">
                            <div class="media">
                                <a href="#">
                                    <img class="align-self-center rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/camion-de-reparto.png">
                                </a>
                                <div class="media-body">
                                    <h3 class="text-light display-6 animate__animated animate__pulse animate__infinite">Las solicitudes enviadas por este medio son realizadas por el PROPIETARIO(A)</h3>
                                    <p>
                                </div>
                            </div>
                        </div>
                       <ul class="list-group list-group-flush">
                             <asp:LinkButton ID="link1" runat="server" OnClick="link1_Click"><li class="list-group-item">
                               <i class="fa fa-mail-reply"></i>Solicitud-Salida de Mudanza Completa<span class="badge badge-primary pull-right">> Realizar Solicitud</span>
                            </li></asp:LinkButton>
                            <br />
                            <asp:LinkButton ID="link2" runat="server" OnClick="link2_Click"><li class="list-group-item">
                                <i class="fa fa-mail-reply"></i>Solicitud-Salida de ALGUNOS Articulos Individuales <span class="badge badge-danger pull-right">> Realizar Solicitud</span>
                            </li></asp:LinkButton>
                             <br />
                              <asp:LinkButton ID="link3" runat="server" OnClick="link3_Click"><li class="list-group-item">
                               <i class="fa fa-mail-forward"></i>Solicitud-Ingreso de Mudanza Completa<span class="badge badge-success pull-right">> Realizar Solicitud</span>
                            </li></asp:LinkButton>
                             <br />
                             <asp:LinkButton ID="link4" runat="server" OnClick="link4_Click"><li class="list-group-item">
                               <i class="fa fa-mail-forward"></i>Solicitud-Ingreso de ALGUNOS Articulos Individuales<span class="badge badge-warning pull-right r-activity">> Realizar Solicitud</span>
                            </li></asp:LinkButton>
                               <br />
                              <asp:LinkButton ID="link5" runat="server" OnClick="link5_Click"><li class="list-group-item">
                               <i class="fa fa-mail-forward"></i>Solicitud-Ingreso Materiales de Construcción<span class="badge badge-info pull-right r-activity">> Realizar Solicitud</span>
                            </li></asp:LinkButton>
                               <br />
                        </ul>
                    </section>
                </aside>
            </div>
        </form>
        <br />
    </div>
</asp:Content>
