<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="CajaParqueadero.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web116" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
      <link href="../Diseño/Banner.css" rel="stylesheet" />
    <script>
    function DesactivarBoton() {
        document.getElementById("conta").style.display = "none";
        document.getElementById("procesando").style.display = "block";
    }
    window.onbeforeunload = DesactivarBoton;
    </script>

    <div id="procesando" class="ventana">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando....</h5>
    </div>

    <div class="container" id="conta">
       <form id="form" runat="server">
        <asp:Label ID="lblcodigo" Visible="false" runat="server"></asp:Label>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-6">
                    <aside class="profile-nav alt">
                        <section class="card">
                            <br />
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                           <asp:Label ID="lblmsg" runat="server" CssClass=" text-danger font-weight-bold"></asp:Label>
                                            <br />
                                        <div class="clearfix">
                                            <i class="fa fa-car bg-flat-color-5 p-3 font-2xl mr-3 float-left text-light"></i>
                                            <div class="h2 text-danger mb-0 mt-1">$&nbsp;<asp:Label ID="lbltotal" runat="server"></asp:Label></div>
                                            <div class="text-muted text-uppercase font-weight-bold font-xs small">TOTAL A PAGAR</div>
                                        </div>
                                        <div class="weather-category ">
                                            <ul>
                                                <li class="active">
                                                    <h5>Inició</h5>
                                                    <asp:Label ID="lblfechini" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <h5>Finalizó</h5>
                                                    <asp:Label ID="lblfechfin" runat="server"></asp:Label>
                                                </li>
                                                <li>
                                                    <h5>Placa</h5>
                                                    <asp:Label ID="lblplaca" runat="server"></asp:Label>
                                                </li>
                                            </ul>
                                        </div>
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item">
                                                <a href="#"><i class="fa fa-check-circle"></i>Marca:&nbsp;
                                                    <asp:Label ID="lblmarca" runat="server"></asp:Label>
                                                </a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="#"><i class="fa fa-check-circle"></i>Nombre:&nbsp;
                                                    <asp:Label ID="lblnombre" runat="server"></asp:Label>
                                                </a>
                                            </li>
                                            <li class="list-group-item">            
<%--                                                <a href="#"><i class="fa fa-check-circle"></i>Dias: <span class="badge badge-success pull-right">
                                                    <asp:Label ID="lbldias" runat="server"></asp:Label>
                                                </span></a>--%>
                                                <a href="#"><i class="fa fa-check-circle"></i>Horas Alquiladas:<span class="badge badge-warning pull-right r-activity"><asp:Label ID="lblhoras" runat="server"></asp:Label>&nbsp;Hora(s)</span></a>
                                            </li>
                                        </ul>
                                        <p class="card-text">
                                            <asp:Label ID="lbltipoAlquiler" runat="server"></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </aside>
                </div>
                    <div class="col-md-6">
                        <aside class="profile-nav alt">
                            <section class="card">
                                <br />
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="col-md-12">
                                            <div class="card-body">
                                                <asp:DropDownList ID="ddestado" runat="server" CssClass="form-control">
                                                    <asp:ListItem>PAGO_FACTURADO</asp:ListItem>
                                                    <asp:ListItem>PAGO_NOVEDAD</asp:ListItem>
                                                    <asp:ListItem>ALQUILER_SIN_PAGO</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div>
                                            <label for="" class="control-label mb-1 font-weight-bold">Observaciones</label>
                                            <asp:TextBox ID="txtobser" runat="server" CssClass="form-control" TextMode="MultiLine" MaxLength="200"></asp:TextBox>
                                        </div>
                                        <br />
                                        <div>
                                            <asp:Button ID="btnguardar" runat="server" class="btn btn-danger" Style="border-radius: 6px" Text="Guardar Pago" OnClientClick="return confirm('¿Desea finalizar este alquiler ?');"  OnClick="btnguardar_Click"/>
                                        </div>
                                        <br />
                                    </div>
                                </div>
                            </section>
                        </aside>
                    </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
           </form>  
    </div>
</asp:Content>
