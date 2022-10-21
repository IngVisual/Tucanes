<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
      <link href="../Diseño/Color.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div class="col-xs-6 col-lg-6">
        <div class="card bordercolorinfo" style="border-radius:7px">
            <a href="AdmNotificaciones.aspx">
                <div class="card-body">
                    <div class="media">
                        <div class="media-body">
                              <div class="col-sm3">
                                    <img class="animate__animated animate__fadeInLeft animate__infinite animate__delay-2s" style="width: 50px; height: 50px;" alt="" src="../Diseño/Imagenes/point.png">
                                  </div>
                            <div class="col-sm3">
                               
                                <asp:Label ID="lbleditar" runat= "server"  Text="Ver Notificaciones" Font-Size="Small" CssClass="font-weight-bold text-light bgcolor form-control border-light"></asp:Label>                             
                            </div>                           
                        </div>
                        <div class="stat-icon dib alert-secondary" style="border-radius: 10px">
                            <img class="align-content rounded-circle bordercolorinfo animate__animated animate__shakeY" src="../Diseño/Imagenes/logo.png" alt="" width="50" height="50" border="0" />
                        </div>
                    </div>
                </div>
            </a>
          </div>
        </div>
        <div class="row">
            <br />
            <div class="col-lg-6">
                <section class="card bordercolorinfo" style="border-radius: 15px">
                    <div class="card-body">
                        <div class="media">
                            <div class="media-body">
                                <a href="SaldoAdministracion.aspx">
                                    <div class="col-sm3">
                                        <img class="animate__animated animate__fadeInLeft animate__infinite animate__delay-2s" style="width: 50px; height: 50px;" alt="" src="../Diseño/Imagenes/point.png">
                                    </div>
                                    <div class="col-sm3">
                                        <asp:Label ID="Label12" runat="server" Text="$ Saldo Administración" Font-Size="Medium" CssClass="font-weight-bold text-light bgcolor form-control border-light 
                                            align-self-center"></asp:Label>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="twt-write col-sm-12">
                        <small class="font-weight-bold textocolorinfo "><i class="fa fa-user">Propietario:&nbsp;</i><asp:Label ID="lblnombre" Font-Size="Small" CssClass="font-weight-bold text-secondary" runat="server"></asp:Label></small>
                        <small class="font-weight-bold textocolorinfo"><i class="fa fa-envelope">Correo:&nbsp;</i><asp:Label ID="lblcorreo" Font-Size="Small" CssClass="font-weight-bold text-secondary" runat="server"></asp:Label></small>
                        <div class="row" style="margin-left: 1px">
                            <small class="font-weight-bold textocolorinfo"><i class="fa fa-building">Estado:&nbsp;</i><asp:Label ID="lblestado" Font-Size="Small" CssClass="font-weight-bold text-secondary" runat="server"></asp:Label></small>
                            &nbsp;&nbsp;&nbsp;
                      <small class="font-weight-bold textocolorinfo"><i class="fa fa-phone">Citofonia Arrendado:&nbsp;</i><asp:Label ID="lbltelarre" Font-Size="Small" CssClass="font-weight-bold text-secondary" runat="server"></asp:Label></small>
                        </div>
                        <div class="row" style="margin-left: 1px">
                            <small class="font-weight-bold textocolorinfo"><i class="fa fa-phone">Citofonia Propietario:&nbsp;</i><asp:Label ID="lbltelpro1" Font-Size="Small" CssClass="font-weight-bold text-secondary" runat="server"></asp:Label></small>
                            &nbsp;&nbsp;&nbsp;
                      <small class="font-weight-bold textocolorinfo"><i class="fa fa-phone">&nbsp;</i><asp:Label ID="lbltelpro2" Font-Size="Small" CssClass="font-weight-bold text-secondary" runat="server"></asp:Label></small>
                            <asp:Repeater ID="r8" runat="server">
                                <ItemTemplate>
                                    <small class="font-weight-bold textocolorinfo" style="margin-left: 20px"><i class="fa fa-car">Informacion Parqueaderos:&nbsp;</i>
                                        &nbsp;&nbsp;#:&nbsp;<asp:Label ID="label53" CssClass="text-secondary font-weight-bold" runat="server"><%#Eval("Parqueadero") %></asp:Label>
                                        &nbsp;&nbsp;Placas:&nbsp<asp:Label ID="label1" CssClass="text-secondary font-weight-bold" runat="server"><%#Eval("PlacaVehiculo1") %></asp:Label>
                                        <asp:Label ID="label2" CssClass="text-secondary font-weight-bold" runat="server">&nbsp;&nbsp;<%#Eval("PlacaVehiculo2") %></asp:Label>
                                        <asp:Label ID="label3" CssClass="text-secondary font-weight-bold" runat="server">&nbsp;&nbsp;<%#Eval("PlacaVehiculo3") %></asp:Label>
                                        <asp:Label ID="label4" CssClass="text-secondary font-weight-bold" runat="server">&nbsp;&nbsp;<%#Eval("PlacaVehiculo4") %></asp:Label>
                                        <asp:Label ID="label5" CssClass="text-secondary font-weight-bold" runat="server">&nbsp;&nbsp;<%#Eval("Obseravacion") %></asp:Label>
                                    </small>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <footer class="twt-footer font-weight-bold text-danger" style="margin-left: 1px">
                        <a href="Perfil_Propietario.aspx"><i class="fa fa-edit"></i>
                            Editar Informacion</a>
                    </footer>
                </section>
            </div>
            <br/>
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel" style="border-radius:15px">
                <div class="carousel-inner">
                    <asp:Repeater ID="r2" runat="server">
                        <ItemTemplate>
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="../<%#Eval("img1") %>" height="250">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../<%#Eval("img2") %>" height="250">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../<%#Eval("img3") %>" height="250">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../<%#Eval("img4") %>" height="250">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../<%#Eval("img5") %>" height="250">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../<%#Eval("img6") %>" height="250">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../<%#Eval("img7") %>" height="250">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../<%#Eval("img8") %>" height="250">
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
    </div>
            <script>
                $('.carousel').carousel({
                    interval: 5000
                })
            </script>

                      <div class="col-xs-2">
                        <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="HomeRegistro.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/regi.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label1" Font-Bold="true" Font-Size="Small" runat="server" Text="Registros"></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>
                    <div class="col-xs-2">
                        <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="Perfil_Propietario.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/cit.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label2" Font-Bold="true" Font-Size="Small" runat="server" Text="Citofonia"></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>
                    <div class="col-xs-2">
                       <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="HomeSaldo.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/saldo.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label3" Font-Bold="true" Font-Size="Small" runat="server" Text="Saldos."></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>
                    <div class="col-xs-2">
                        <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="HomeSolicitud.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/env.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label13" Font-Bold="true" Font-Size="Small" runat="server" Text="Solicitud"></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>
                    <div class="col-xs-2">
                        <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="AdmNotificaciones.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/respu.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label4" Font-Bold="true" Font-Size="Small" runat="server" Text="Mensajes"></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>
                    <div class="col-xs-2">
                         <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="VerCartelera.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/carte.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label5" Font-Bold="true" Font-Size="Small" runat="server" Text="Cartelera"></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>
                    <div class="col-xs-2">
                      <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="DescargarPDFAsamblea.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/desca.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label6" Font-Bold="true" Font-Size="Small" runat="server" Text="Descarga"></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>
                    <div class="col-xs-2">
                         <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="ProConvivencia.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/conv.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label7" Font-Bold="true" Font-Size="Small" runat="server" Text="Sancion."></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>
                    <div class="col-xs-2">
                        <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="Temporal2.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/voto.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label8" Font-Bold="true" Font-Size="Small" runat="server" Text="Votacion"></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>
                    <div class="col-xs-2">
                        <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="HomeRecibo.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/recib.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label9" Font-Bold="true" Font-Size="Small" runat="server" Text="Recibos."></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>
                    <div class="col-xs-2">
                        <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="Temporal2.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/dom.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label10" Font-Bold="true" Font-Size="Small" runat="server" Text="Domicilio"></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>
                    <div class="col-xs-2">
                      <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="ProST.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/serv.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label11" Font-Bold="true" Font-Size="Small" runat="server" Text="Servicios"></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>
                   <%-- Nuevo--%>
                            <div class="col-xs-2">
                        <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="SolRespuestas.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/correo-electronico.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label14" Font-Bold="true" Font-Size="Small" runat="server" Text="Correo.."></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>
                    <div class="col-xs-2">
                        <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="MudanzaValidar.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/camion-de-reparto.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label15" Font-Bold="true" Font-Size="Small" runat="server" Text="Mudanza"></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>
                    <div class="col-xs-2">
                      <section class="card bordercolorinfo" style="border-radius: 10px">
                            <div class="card-body text-secondary">
                                <a href="VerificarDisponibilidadSC.aspx">
                                    <button type="button" class="bgcolor text-light" style="margin-bottom: 4px; width: 75px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/evento (1).png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label16" Font-Bold="true" Font-Size="Small" runat="server" Text="SalonSoci"></asp:Label>
                                    </button>
                                </a>
                            </div>
                        </section>
                    </div>

    </form>
    <br />
    <div class="container">
            <div class="col-lg-4 col-md-6">
                <aside class="profile-nav alt">
                    <section class="card bordercolorinfo" style="border-radius:8px">
                        <div class="card-header user-header alt bgcolor ">
                            <div class="card-title">
                                <h4 class="text-center text-light font-weight-bold">Respuesta de Solicitudes</h4>
                            </div>
                        </div>
                        <ul class="list-group list-group-flush">
                            <a href="RespuestaPQRPropietario.aspx"><li class="list-group-item">
                                <i class="fa fa-bell"></i>Respuesta-PQR <span class="badge badge-secondary pull-right">> Ver Estado</span>
                            </li></a>
                            <a href="ProTabResPar.aspx"><li class="list-group-item">
                                <i class="fa fa-car"></i>Respuesta de Parqueadros<span class="badge badge-primary pull-right">> Ver Estado</span>
                            </li></a>
                            <a href="ProTabResPag.aspx"><li class="list-group-item">
                                <i class="fa fa-bitcoin"></i>Respuesta-Novedad de pago <span class="badge badge-danger pull-right">> Ver Estado</span>
                            </li></a>
                            <a href="ProTabResSC.aspx"><li class="list-group-item">
                                <i class="fa fa-building"></i>Respuesta-SALON SOCIAL<span class="badge badge-success pull-right">> Ver Estado</span>
                            </li></a>
                            <a href="ProTabResSal.aspx"><li class="list-group-item">
                                <i class="fa fa-truck"></i>Respuesta de Mudanza o Articulos<span class="badge badge-warning pull-right r-activity">> Ver Estado</span>
                            </li></a>
                            <a href="ProTabResChip.aspx"><li class="list-group-item">
                                <i class="fa fa-lock"></i>Respuesta-Chip puerta del conjunto <span class="badge badge-info pull-right">> Ver Estado</span>
                            </li></a>
                            <br />
                        </ul>
                    </section>
                </aside>
            </div>
        <br />
        </div>
</asp:Content>
