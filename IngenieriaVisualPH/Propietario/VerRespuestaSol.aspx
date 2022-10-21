<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="VerRespuestaSol.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web122" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <div class="container">
        <div class="card-body">
            <div class="card-title">
                <h3 class="text-center textocolorinfo font-weight-bold">Respuesta de Solicitudes</h3>
            </div>
        </div>
        <form id="form1" runat="server">
            <div class="col-lg-4 col-md-6">
                <aside class="profile-nav alt">
                    <section class="card bordercolorinfo">
                        <div class="card-header user-header alt bg-dark">
                        </div>
                        <ul class="list-group list-group-flush">
                            <a href="RespuestaPQRPropietario.aspx"><li class="list-group-item">
                                <i class="fa fa-bell"></i>Solicitud-PQR <span class="badge badge-secondary pull-right">>Ver Estado</span>
                            </li></a>
                            <br />
                            <a href="ProTabResPar.aspx"><li class="list-group-item">
                                <i class="fa fa-car"></i>Solicitud de Parqueadros<span class="badge badge-primary pull-right">> Ver Estado</span>
                            </li></a>
                            <br />
                            <a href="ProTabResPag.aspx"><li class="list-group-item">
                                <i class="fa fa-bitcoin"></i>Solicitud-Novedad de pago <span class="badge badge-danger pull-right">> Ver Estado</span>
                            </li></a>
                            <br />
                            <a href="ProTabResSC.aspx"><li class="list-group-item">
                                <i class="fa fa-building"></i>Solicitud-Salon comunal<span class="badge badge-success pull-right">> Ver Estado</span>
                            </li></a>
                            <br />
                            <a href="ProTabResSal.aspx"><li class="list-group-item">
                                <i class="fa fa-truck"></i>Solicitud-Mudanza o Articulos<span class="badge badge-warning pull-right r-activity">> Ver Estado</span>
                            </li></a>
                            <br />
                            <a href="ProTabResChip.aspx"><li class="list-group-item">
                                <i class="fa fa-lock"></i>Solicitud-Chip puerta del conjunto <span class="badge badge-info pull-right">> Ver Estado</span>
                            </li></a>
                            <br />
                        </ul>
                    </section>
                </aside>
            </div>
        </form>
        <br />
    </div>
</asp:Content>
