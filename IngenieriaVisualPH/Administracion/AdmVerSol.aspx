<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" EnableEventValidation = "false" AutoEventWireup="true" CodeBehind="AdmVerSol.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <style>
        body {
            background: rgb(249,244,242);
            background: linear-gradient(90deg, rgba(249,244,242,1) 0%, rgba(22,27,38,0.8267682072829132) 50%);
        }
    </style>
    <link href="../Diseño/Banner.css" rel="stylesheet" />

    <link href="../Diseño/Video.css" rel="stylesheet" />
    <script>
        function DesactivarBoton() {
             document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
        }
        window.onbeforeunload = DesactivarBoton;

        function ShowVideo() {
           document.getElementById("conta").style.display = "none"
           document.getElementById("procesando").style.display = "none"
        }
        function CloseVideo() {
            document.getElementById("conta").style.display = "block"
        }
    </script>

     <script>
        function reg1() {
            document.getElementById("tablero").style.display = "none";
            document.getElementById("registro").style.display = "block";
         }
        function docum() {
            document.getElementById("tablero").style.display = "none";
            document.getElementById("documento").style.display = "block";
         }
        function table() {
            document.getElementById("tablero").style.display = "none";
            document.getElementById("tableros").style.display = "block";
         }
     </script>

    <form id="fo2" runat="server">
        <div id="procesando" class="ventana" style="border-radius: 7px; display: none">
            <h5 class="text-light text-center font-weight-bold">Administrador Trabajando...</h5>
            <img src="../Diseño/Imagenes/oficina.gif" />
        </div>
<%-- ------------------------------------------------------------------- --%>
      <input type="checkbox" onclick="ShowVideo()" id="btn-modale" />
        <label for="btn-modale" class="lbl-modale">Video Ayuda</label>
        <div class="modale">
            <div class="contenedor" id="mostrarvideo">
                <header><strong>Video Instructivo (Puedes ajustar la velocidad de reproduccion en 1,5)</strong></header>
                <a href="AdmVerSol.aspx">&#10006;</a>
                <div class="contenido">
                    <iframe width="1000" height="550" src="https://www.youtube.com/embed/E8s9GJZdEyc" frameborder="0" allow="accelerometer; 
                        autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
        </div>
<%-- -------------------------------------------------------------------- --%>
        <div class="container" id="conta">
            <div class="row">
                <div class="content col-xs-6 col-lg-8">
                    <div class="card" style="border-radius: 7px">
                        <div class="card-header">
                            <strong>Solicitudes Abiertas</strong><small></small>
                        </div>
                        <div class="card-body card-block">
                            <div class="header-menu">
                                <div class="col-sm-8">
                                    <div class="header-left">
                                        <div class="dropdown for-message">
                                            <a href="TramitePQR.aspx">
                                                <button class="btn btn-secondary dropdown-toggle" type="button" id="pqr">
                                                    <i class="ti-bell"></i><span class="count bg-primary">
                                                        <asp:Label ID="lblpqr1" runat="server"></asp:Label></span>
                                                    <small><span class="badge badge-secondary float-right mt-1">PQRS</span></small>
                                                </button>
                                            </a>
                                        </div>
                                        <div class="dropdown for-message">
                                            <a href="NovedadesSaldo.aspx">
                                                <button class="btn btn-secondary dropdown-toggle" type="button" id="nove">
                                                    <i class="ti-money"></i><span class="count bg-primary">
                                                        <asp:Label ID="lblsaldo" runat="server"></asp:Label></span>
                                                    <small><span class="badge badge-secondary float-right mt-1">NovSaldo</span></small>
                                                </button>
                                            </a>
                                        </div>
                                        <div class="dropdown for-message">
                                            <a href="Documentos_Recibidos.aspx">
                                                <button class="btn btn-secondary dropdown-toggle" type="button" id="docu">
                                                    <i class="ti-car"></i><span class="count bg-primary">
                                                        <asp:Label ID="lbldoc" runat="server"></asp:Label></span>
                                                    <small><span class="badge badge-secondary float-right mt-1">SolParquea</span></small>
                                                </button>
                                            </a>
                                        </div>
                                        <div class="dropdown for-message">
                                            <a href="AutorizacionTrasteo.aspx">
                                                <button class="btn btn-secondary dropdown-toggle" type="button" id="muda">
                                                    <i class="ti-truck"></i><span class="count bg-primary">
                                                        <asp:Label ID="lbltrasteo" runat="server"></asp:Label></span>
                                                    <small><span class="badge badge-secondary float-right mt-1">SolMudanza</span></small>
                                                </button>
                                            </a>
                                        </div>
                                        <div class="dropdown for-message">
                                            <a href="SalonComunal.aspx">
                                                <button class="btn btn-secondary dropdown-toggle" type="button" id="sc">
                                                    <i class="fa fa-home"></i><span class="count bg-primary">
                                                        <asp:Label ID="lblsc" runat="server"></asp:Label></span>
                                                    <small><span class="badge badge-secondary float-right mt-1">SolSalComunal</span></small>
                                                </button>
                                            </a>
                                        </div>
                                        <div class="dropdown for-message">
                                            <a href="AdmCartelera.aspx">
                                                <button class="btn btn-secondary dropdown-toggle" type="button" id="cart">
                                                    <i class="ti-calendar"></i><span class="count bg-primary">
                                                        <asp:Label ID="lblcart" runat="server"></asp:Label></span>
                                                    <small><span class="badge badge-secondary float-right mt-1">SolCartelera</span></small>
                                                </button>
                                            </a>
                                        </div>
                                        <div class="dropdown for-message">
                                            <a href="AdmChip.aspx">
                                                <button class="btn btn-secondary dropdown-toggle" type="button" id="chip">
                                                    <i class="ti-lock"></i><span class="count bg-primary">
                                                        <asp:Label ID="lblchip" runat="server"></asp:Label></span>
                                                    <small><span class="badge badge-secondary float-right mt-1">SolChips</span></small>
                                                </button>
                                            </a>
                                        </div>
                                        <div class="dropdown for-message">
                                            <a href="AdmBici.aspx">
                                                <button class="btn btn-secondary dropdown-toggle" type="button" id="bici">
                                                    <i class="fa fa-bicycle"></i><span class="count bg-primary">
                                                        <asp:Label ID="lblbici" runat="server"></asp:Label></span>
                                                    <small><span class="badge badge-secondary float-right mt-1">SolBicicletero</span></small>
                                                </button>
                                            </a>
                                        </div>
                                         <div class="dropdown for-message">
                                            <a href="AdmMascotas.aspx">
                                                <button class="btn btn-secondary dropdown-toggle" type="button" id="macota">
                                                    <i class="fa fa-check-circle"></i><span class="count bg-primary">
                                                        <asp:Label ID="lblmascota" runat="server"></asp:Label></span>
                                                    <small><span class="badge badge-secondary float-right mt-1">RegMascotas</span></small>
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="user-area dropdown float-right">
                                        <a href="Estadisticas.aspx">
                                            <img class="" src="../Diseño/Imagenes/admin.png" alt="User Avatar">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <strong>Tablero de Administracion</strong><small></small>
                                    </div>
                                    <div class="card-body card-block">
                                        <div class="col-6 col-lg-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="clearfix">
                                                        <i class="fa fa-building bg-success p-3 font-2xl mr-3 float-left text-light"></i>
                                                        <div class="h4 text-secondary mb-0 mt-1">208</div>
                                                        <div class="text-muted text-uppercase font-weight-bold font-xs small">Aparta</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-lg-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="clearfix">
                                                        <i class="fa fa-building bg-success p-3 font-2xl mr-3 float-left text-light"></i>
                                                        <div class="h4 text-secondary mb-0 mt-1">
                                                            <asp:Label ID="lblreg" runat="server"></asp:Label>
                                                        </div>
                                                        <div class="text-muted text-uppercase font-weight-bold font-xs small">Registro</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-lg-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="clearfix">
                                                        <i class="fa fa-laptop bg-primary p-3 font-2xl mr-3 float-left text-light"></i>
                                                        <div class="h5 text-secondary mb-0 mt-1">
                                                            <asp:Label ID="lblsesi" Font-Size="Smaller" runat="server"></asp:Label>
                                                        </div>
                                                        <div class="text-muted text-uppercase font-weight-bold font-xs small">Sesiones</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-6 col-lg-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="clearfix">
                                                        <i class="fa fa-users bg-danger p-3 font-2xl mr-3 float-left text-light"></i>
                                                        <div class="h4 text-secondary mb-0 mt-1">
                                                            <asp:Label ID="lblmayo" runat="server"></asp:Label>
                                                        </div>
                                                        <div class="text-muted text-uppercase font-weight-bold font-xs small">Adultos</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-lg-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="clearfix">
                                                        <i class="fa fa-users bg-danger p-3 font-2xl mr-3 float-left text-light"></i>
                                                        <div class="h4 text-secondary mb-0 mt-1">
                                                            <asp:Label ID="lblbmen" runat="server"></asp:Label>
                                                        </div>
                                                        <div class="text-muted text-uppercase font-weight-bold font-xs small">menores</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-lg-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="clearfix">
                                                        <i class="fa fa-github bg-danger p-3 font-2xl mr-3 float-left text-light"></i>
                                                        <div class="h5 text-secondary mb-0 mt-1">
                                                            <asp:Label ID="lblmasc" runat="server"></asp:Label>
                                                        </div>
                                                        <div class="text-muted text-uppercase font-weight-bold font-xs small">mascota</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="content col-xs-6 col-lg-4">
                    <div class="card" style="border-radius: 7px">
                        <div class="card-body">
                            <div id="tablero">
                                <div class="col-xs-2">

                                    <a href="Registro_Apartamentos.aspx">
                                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 130px; border-radius: 7px">
                                            <img class="mx-auto d-block" src="../Diseño/Imagenes/apa.png" alt="Card image cap" width="45" height="45">
                                            <asp:Label ID="Label1" Font-Bold="true" Font-Size="Small" runat="server" Text="Buscar por Apartamento"></asp:Label>
                                        </button>
                                    </a>

                                </div>
                                <div class="col-xs-2">

                                    <a href="SaldoAdministracion.aspx">
                                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 130px; border-radius: 7px">
                                            <img class="mx-auto d-block" src="../Diseño/Imagenes/recib.png" alt="Card image cap" width="45" height="45">
                                            <asp:Label ID="Label3" Font-Bold="true" Font-Size="Small" runat="server" Text="Cargar Estados de Cuenta."></asp:Label>
                                        </button>
                                    </a>

                                </div>
                                <div class="col-xs-2">
                                    <a href="Notificicaciones.aspx">
                                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 130px; border-radius: 7px">
                                            <img class="mx-auto d-block" src="../Diseño/Imagenes/campana.png" alt="Card image cap" width="45" height="45">
                                            <asp:Label ID="Label13" Font-Bold="true" Font-Size="Small" runat="server" Text="Notificaciones Masivas"></asp:Label>
                                        </button>
                                    </a>
                                </div>
                                <div class="col-xs-2">
                                    <button type="button" onclick="docum()" class="bg-success text-light" style="margin-bottom: 4px; width: 130px; border-radius: 7px">
                                        <img class="mx-auto d-block" src="../Diseño/Imagenes/desca.png" alt="Card image cap" width="45" height="45">
                                        <asp:Label ID="Label4" Font-Bold="true" Font-Size="Small" runat="server" Text="Subir Documentos Administracion"></asp:Label>
                                    </button>
                                </div>
                                <div class="col-xs-2">
                                    <a href="TablerosGen.aspx">
                                        <button type="button" onclick="table()" class="bg-success text-light" style="margin-bottom: 4px; width: 130px; border-radius: 7px">
                                            <img class="mx-auto d-block" src="../Diseño/Imagenes/carte.png" alt="Card image cap" width="45" height="45">
                                            <asp:Label ID="Label5" Font-Bold="true" Font-Size="Small" runat="server" Text="Tableros Administracion"></asp:Label>
                                        </button>
                                    </a>
                                </div>
                                <div class="col-xs-2">
                                    <a href="Configuracion.aspx">
                                        <button type="button" class="bg-success text-light" style="margin-bottom: 4px; width: 130px; border-radius: 7px">
                                            <img class="mx-auto d-block" src="../Diseño/Imagenes/regi.png" alt="Card image cap" width="45" height="45">
                                            <asp:Label ID="Label2" Font-Bold="true" Font-Size="Small" runat="server" Text="Configurar Informacion"></asp:Label>
                                        </button>
                                    </a>
                                </div>
                            </div>

                            <div id="documento" style="display: none">
                                <div class="col-xs-2">
                                    <a href="Asamblea.aspx">
                                        <button type="button" class="bg-dark text-light" style="margin-bottom: 4px; width: 130px; border-radius: 7px">
                                            <img class="mx-auto d-block" src="../Diseño/Imagenes/registrarse.png" alt="Card image cap" width="45" height="45">
                                            <asp:Label ID="Label11" Font-Bold="true" Font-Size="Small" runat="server" Text="Subir Documentos en PDF"></asp:Label>
                                        </button>
                                    </a>
                                </div>
                                <div class="col-xs-2">
                                    <a href="AdmCarrusel.aspx">
                                        <button type="button" class="bg-dark text-light" style="margin-bottom: 4px; width: 130px; border-radius: 7px">
                                            <img class="mx-auto d-block" src="../Diseño/Imagenes/telefono-inteligente (1).png" alt="Card image cap" width="45" height="45">
                                            <asp:Label ID="Label12" Font-Bold="true" Font-Size="Small" runat="server" Text="Subir Imagenes al Carrusel"></asp:Label>
                                        </button>
                                    </a>
                                </div>
                                <div class="col-xs-2">
                                    <a href="AdmActas.aspx">
                                        <button type="button" class="bg-dark text-light" style="margin-bottom: 4px; width: 130px; border-radius: 7px">
                                            <img class="mx-auto d-block" src="../Diseño/Imagenes/regi.png" alt="Card image cap" width="45" height="45">
                                            <asp:Label ID="Label10" Font-Bold="true" Font-Size="Small" runat="server" Text="Subir Acta de Consejo"></asp:Label>
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="card-body">
                    <div class="col-xs-6 col-lg-12">
                        <div class="card" style="border-radius: 7px">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-xs-6 col-lg-2">
                                        <div>
                                            <asp:Button ID="btnnota" runat="server" OnClick="btnnota_Click" Text="Guardar" CssClass="btn-info btn-lg font-weight-bold form-control border-light" />
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-lg-8">
                                        <div>
                                            <asp:TextBox ID="txtnota" TextMode="MultiLine" CssClass="form-control border border-info" MaxLength="150" Placeholder="Ingrese nota rapida" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-lg-2">
                                        <div class="h1 text-muted mb-4">
                                            <i class="fa fa-pencil animate__animated animate__shakeX animate__infinite animate__delay-2s"></i>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <asp:Repeater ID="r1" runat="server">
                                    <ItemTemplate>
                                        <div class="col-xs-6 col-lg-6">
                                            <div class=" card alert alert-success border-success" style="border-radius: 7px">
                                                <div class="col-xs-6 col-lg-10">
                                                    <div class="fa fa-thumb-tack"></div>
                                                    &nbsp;&nbsp;
                                                        <asp:Label ID="lblnota" runat="server" CssClass="text-dark"><%#Eval("Nota") %></asp:Label>
                                                </div>
                                                <div class="col-xs-6 col-lg-2">
                                                    <td><a href="EditarNota.aspx?Id=<%#Eval("Id")%>">
                                                        <button class="btn btn-success btn-sm font-weight-bold" type="button" style="border-radius: 5px" title="Listo"><i class="fa fa-check-square">&nbsp;Listo</i></button>
                                                    </a></td>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
    </form>

</asp:Content>
