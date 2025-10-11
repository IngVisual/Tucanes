<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="Registro_Apartamentos.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
 <style>
        body {
            background: rgb(249,244,242);
            background: linear-gradient(90deg, rgba(249,244,242,1) 0%, rgba(22,27,38,0.8267682072829132) 50%);
        }
     </style>
        <style>
        .linea-horizontal {
  border: none; /* Elimina el borde predeterminado */
  border-top: 2px solid gray; /* Establece el grosor y el color de la línea */
  margin: 20px 0; /* Agrega espacio superior e inferior a la línea */
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
                <a href="Registro_Apartamentos.aspx">&#10006;</a>
                <div class="contenido">
                    <iframe width="1000" height="550" src="https://www.youtube.com/embed/mjD4PLQag7o" frameborder="0" allow="accelerometer; 
                        autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
        </div>
<%-- -------------------------------------------------------------------- --%>
    <div class="card-body">
        <div class="card-title">
            <h3 class="text-center font-weight-bold text-light">Informacion de Apartamentos</h3>
        </div>
    </div>
    <form id="form1" runat="server">
      <div id="conta">
        <div class="alert alert-danger" id="div1" runat="server" style="margin-top: 10px; display: none">
            <span class="badge badge-pill badge-danger">Error</span>
            Ingrese un Codigo
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <section class="content">
            <div class="row">
                <div class="col-xs-4 col-lg-4">
                    <div class="card" style="border-radius: 7px">
                        <div class="card-header">
                            <strong>Buscar por Apartamento</strong><small></small>
                        </div>
                        <div class="card-body card-block">
                            <div class="col-xs-12 col-lg-12">
                                <div class="form-group">
                                    <label class=" form-control-label">Buscar Codigo</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-search"></i></div>
                                        <asp:TextBox ID="txtbuscar" TextMode="Number" CssClass="form-control" OnTextChanged="txtbuscar_TextChanged" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-lg-8">
                    <div class="card" style="border-radius: 7px">
                        <div class="card-group">
                            <div class="card col-md-6 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-tablet"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblingresos" runat="server"></asp:Label></span>
                                    </div>

                                    <small class="text-muted text-uppercase font-weight-bold">INGRESOS A LA APP</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-1" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-6 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-users"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lbladultos" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">ADULTOS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-2" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-6 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-users"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblmenores" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">MENORES</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-3" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-6 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-github"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Label ID="lblmascotas" runat="server"></asp:Label></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">MASCOTAS</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-3" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-6 col-lg-8">
                    <div class="card" style="border-radius: 7px">
                        <div class="card-body">
                            <div class="col-md-12">
                                <section class="card" style="border-radius: 15px">
                                    <div class="weather-category twt-category">
                                        <ul>
                                            <li class="active">
                                                <h6 class="text-secondary">Saldo a Pagar:</h6>
                                                <a href="SaldoAdministracion.aspx">
                                                    <h3 class="alert-danger" style="border-radius: 10px">$&nbsp;<asp:Label ID="lbltotal" runat="server"></asp:Label></h3>
                                                    <h6><span class="badge badge-success r-activity"><i class="fa fa-hand-o-right">&nbsp;&nbsp;Ver Mas</i></span></h6>
                                                </a>
                                            </li>
                                            <li>
                                                <h6 class="text-secondary">Saldo a Favor:</h6>
                                                <a href="SaldoAdministracion.aspx">
                                                    <h3 class="alert-success" style="border-radius: 10px">$&nbsp;<asp:Label ID="lblfavor" runat="server"></asp:Label></h3>
                                                    <h6><span class="badge badge-success r-activity"><i class="fa fa-hand-o-right">&nbsp;&nbsp;Ver Mas</i></span></h6>
                                                </a>
                                            </li>
                                            <li>
                                                <div class="stat-icon dib alert-success" style="border-radius: 10px">
                                                    <img class="align-content rounded-circle border-success animate__animated animate__shakeY" src="../Diseño/Imagenes/apa.png" alt="" width="120" height="120" border="0" />
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-12">
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
                                        </div>
                                        <hr class="linea-horizontal">
                                        <div class="row" style="left: 1px">
                                            <asp:Repeater ID="r8" runat="server">
                                                <ItemTemplate>
                                                    <small class="font-weight-bold textocolorinfo" style="margin-left: 20px"><i class="fa fa-car">Informacion Parqueaderos:&nbsp;</i>
                                                        &nbsp;&nbsp;#Parqueadero:&nbsp;<asp:Label ID="label53" CssClass="text-secondary font-weight-bold" runat="server"><%#Eval("Parqueadero") %></asp:Label>
                                                        &nbsp;&nbsp;Placas:&nbsp<asp:Label ID="label1" CssClass="text-secondary font-weight-bold" runat="server"><%#Eval("PlacaVehiculo1") %></asp:Label>
                                                        <asp:Label ID="label2" CssClass="text-secondary font-weight-bold" runat="server">&nbsp;&nbsp;<%#Eval("PlacaVehiculo2") %></asp:Label>
                                                        <asp:Label ID="label3" CssClass="text-secondary font-weight-bold" runat="server">&nbsp;&nbsp;<%#Eval("PlacaVehiculo3") %></asp:Label>
                                                        <asp:Label ID="label4" CssClass="text-secondary font-weight-bold" runat="server">&nbsp;&nbsp;<%#Eval("PlacaVehiculo4") %></asp:Label>
                                                        &nbsp;&nbsp;Observaciones:&nbsp<asp:Label ID="label5" CssClass="text-secondary font-weight-bold" runat="server">&nbsp;&nbsp;<%#Eval("Obseravacion") %></asp:Label>
                                                    </small>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <hr class="linea-horizontal">
                                        <div class="row" style="left: 1px">
                                            <asp:Repeater ID="r9" runat="server">
                                                <ItemTemplate>
                                                    <small class="font-weight-bold textocolorinfo" style="margin-left: 20px"><i class="fa fa-bicycle">Informacion Bicicletero:&nbsp;</i>
                                                        &nbsp;&nbsp;Numero: &nbsp<asp:Label ID="label53" CssClass="text-secondary" runat="server"><%#Eval("ObservacionAdm") %></asp:Label>
                                                        &nbsp;&nbsp;Solicitante: &nbsp<asp:Label ID="label17" CssClass="text-secondary" runat="server"><%#Eval("TipoSolicitante") %></asp:Label>
                                                        &nbsp;&nbsp;Asignado a: &nbsp<asp:Label ID="label18" CssClass="text-secondary " runat="server"><%#Eval("Nombre") %></asp:Label>
                                                        &nbsp;&nbsp;Marca: &nbsp<asp:Label ID="label1" CssClass="text-secondary " runat="server"><%#Eval("Marca") %></asp:Label>
                                                        &nbsp;&nbsp;Tipo: &nbsp<asp:Label ID="label2" CssClass="text-secondary " runat="server"><%#Eval("Tipo") %></asp:Label>
                                                        &nbsp;&nbsp;Color: &nbsp<asp:Label ID="label3" CssClass="text-secondary " runat="server"><%#Eval("Color") %></asp:Label>
                                                    </small>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>

                               <asp:Repeater ID="r10" Visible="false" runat="server">
                                        <ItemTemplate>
                                      &nbsp;&nbsp;<footer class="font-weight-bold text-danger">
                                        <a href="RegEditarApa.aspx?Id=<%#Eval("Codigo") %>"><i class="fa fa-edit">
                                            <h5 class="font-weight-bold text-danger animate__animated animate__pulse animate__infinite animate__delay-2s">Editar Informacion</h5>
                                        </i></a>
                                    </footer>
                                       </ItemTemplate>
                                    </asp:Repeater>
                                </section>  
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-lg-4">
                     <div class="col-lg-6 col-lg-12">
                        <div class="card" style="border-radius: 7px">
                            <div class="card-body">
                                <h6 class="font-weight-bold">Ultimos 3 Ingresos a la App</h6>
                                <div>
                                          <asp:Repeater ID="R1registro" runat="server">
                                               <ItemTemplate>
                                              <h6 class="text-success"><%#Eval("FechaIngreso","{0:dd/MM/yyyy hh:mm tt}") %></h6>   
                                               </ItemTemplate>
                                          </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-lg-12">
                        <div class="card" style="border-radius: 7px">
                            <div class="card-body">
                                <div class="stat-widget-one">
                                    <div class="stat-icon dib"><i class="ti-pin-alt text-success border-success"></i></div>
                                    <div class="stat-content dib">
                                        <div class="stat-text">Razas de Mascotas</div>
                                        <h4>
                                            <asp:Label ID="lblrazas" runat="server"></asp:Label></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-lg-12">
                        <div class="card" style="border-radius: 7px">
                            <div class="card-body">
                                <div class="stat-widget-one">
                                    <div class="stat-icon dib"><i class="ti-pin-alt text-primary border-primary"></i></div>
                                    <div class="stat-content dib">
                                        <div class="stat-text">Llamados de Atencion</div>
                                        <div class="stat-digit">
                                            <asp:Label ID="lblllamad" runat="server"></asp:Label></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-lg-12">
                        <div class="card" style="border-radius: 7px">
                            <div class="card-body">
                                <div class="stat-widget-one">
                                    <div class="stat-icon dib"><i class="ti-pin-alt text-warning border-warning"></i></div>
                                    <div class="stat-content dib">
                                        <div class="stat-text">PQRS</div>
                                        <div class="stat-digit">
                                            <asp:Label ID="lblpqrs" runat="server"></asp:Label></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="tabpqr">
              <div class="content mt-3">
                  <div class="animated fadeIn">
                      <div class="row">
                          <div class="col-md-12">
                              <div class="card" style="border-radius: 7px">
                                  <div class="card-header">
                                      <strong class="card-title">PQRS</strong>
                                  </div>
                                  <div class="card-body">
                                      <table class="table">
                                          <asp:Repeater ID="r1" runat="server">
                                              <HeaderTemplate>
                                                  <thead class="thead-dark" style="border-radius: 5px">
                                                      <tr>
                                                          <th>Editar</th>
                                                          <th>Fecha de Solicitud</th>
                                                          <th>Tipo de PQR</th>
                                                          <th>Estado</th>
                                                          <th>Observacion</th>
                                                          <th>Respuesta</th>
                                                          <th>Imagen</th>
                                                      </tr>
                                                  </thead>
                                              </HeaderTemplate>
                                              <ItemTemplate>
                                                  <tr>
                                                      <td><a href="VerPQR.aspx?Id=<%#Eval("Id")%>">
                                                          <button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                      </a></td>
                                                      <td><%#Eval("FechaInicio","{0:dd/MM/yyyy}") %></td>
                                                      <td>
                                                          <small class="text-secondary"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Tipo") %></i></small>
                                                      </td>
                                                      <td>
                                                          <small class="text-success"><%#Eval("Estado") %></i></small></td>
                                                      <td>
                                                          <small><%#Eval("DescripcionPQR") %></small></td>
                                                      <td>
                                                          <small><%#Eval("Respuesta") %></small></td>
                                                      <td>
                                                          <img class="card-img-top" src="../NovedadPQR/<%#Eval("ImagenQueja") %>" style="border-radius: 5px" width="40" height="60" alt="Card image cap"></td>
                                                  </tr>
                                              </ItemTemplate>
                                          </asp:Repeater>
                                      </table>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </section>
        <section id="tableroLLamdo">
            <div class="content mt-3">
                <div class="animated fadeIn">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card" style="border-radius: 7px">
                                <div class="card-header">
                                    <strong class="card-title">LLAMADOS DE ATENCION</strong>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <asp:Repeater ID="r2" runat="server">
                                            <HeaderTemplate>
                                                <thead class="thead-dark" style="border-radius: 5px">
                                                    <tr>
                                                        <th>Editar</th>
                                                        <th>Fecha</th>
                                                        <th>Tipo de Queja</th>
                                                        <th>Estado</th>
                                                        <th>Impuesta por:</th>
                                                        <th>Descripcion</th>
                                                        <th>Msg Administracion</th>
                                                        <th>Imagen</th>
                                                    </tr>
                                                </thead>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a href="VerPQR.aspx?Id=<%#Eval("Id")%>">
                                                        <button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                    </a></td>
                                                    <td><%#Eval("FechaInicio","{0:dd/MM/yyyy}") %></td>
                                                    <td>
                                                        <small class="text-secondary"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Tipo") %></i></small>
                                                    </td>
                                                    <td>
                                                        <small class="text-success"><%#Eval("Estado") %></i></small></td>
                                                    <td>
                                                        <small class="text-danger"><i class="fa fa-legal">&nbsp;<%#Eval("Codigo") %></i></small></td>
                                                    <td>
                                                        <small><%#Eval("DescripcionPQR") %></small></td>
                                                    <td>
                                                        <small><%#Eval("Respuesta") %></small></td>
                                                    <td>
                                                        <img class="card-img-top" src="../NovedadPQR/<%#Eval("ImagenQueja") %>" style="border-radius: 5px" width="40" height="60" alt="Card image cap"></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                  </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .animated -->
        </section>
        <section id="tabMudanza">
            <div class="content mt-3">
                <div class="animated fadeIn">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card" style="border-radius: 7px">
                                <div class="card-header">
                                    <strong class="card-title">MUDANZAS O ARTICULOS</strong>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <asp:Repeater ID="r3" runat="server">
                                            <HeaderTemplate>
                                                <thead class="thead-dark" style="border-radius: 5px">
                                                    <tr>
                                                        <th>Editar</th>
                                                        <th>Fecha Solicitud</th>
                                                        <th>Tipo</th>
                                                        <th>Estado</th>
                                                        <th>Desde:</th>
                                                        <th>Hasta:</th>
                                                        <th>Observacion</th>
                                                        <th>Cedula</th>
                                                        <th>Firma</th>
                                                    </tr>
                                                </thead>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a href="VerMudanza.aspx?Id=<%#Eval("Id")%>">
                                                        <button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                    </a></td>
                                                    <td><%#Eval("FechaSol","{0:dd/MM/yyyy}") %></td>
                                                    <td>
                                                        <small class="text-secondary"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Tipo") %></i></small>
                                                    </td>
                                                    <td>
                                                        <small class="text-success"><%#Eval("Estado") %></i></small></td>
                                                    <td>
                                                        <small class="text-danger"><i class="fa fa-calendar">&nbsp;<%#Eval("FechaIniMud","{0:dd/MM/yyyy}") %></i></small></td>
                                                    <td>
                                                        <small class="text-danger"><i class="fa fa-calendar">&nbsp;<%#Eval("FechaFinMud","{0:dd/MM/yyyy}") %></i></small></td>
                                                    <td>
                                                        <small><%#Eval("Observacion") %></small></td>
                                                    <td>
                                                        <img class="card-img-top" src="../Mudanzas/Cedula/<%#Eval("Cedula") %>" style="border-radius: 5px" width="40" height="60" alt="Card image cap"></td>
                                                    <td>
                                                        <img class="card-img-top" src="<%#Eval("Firma") %>" style="border-radius: 5px" width="40" height="60" alt="Card image cap"></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                     </table>
                            </div>
                        </div>
                   </div>
                </div>
           </div>
                </div>
            <!-- .animated -->
        </section>
        <section id="tabsc">
            <div class="content mt-3">
                <div class="animated fadeIn">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card" style="border-radius: 7px">
                                <div class="card-header">
                                    <strong class="card-title">SALON SOCIAL</strong>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <asp:Repeater ID="r4" runat="server">
                                            <HeaderTemplate>
                                                <thead class="thead-dark" style="border-radius: 5px">
                                                    <tr>
                                                        <th>Editar</th>
                                                        <th>Fecha Solicitud</th>
                                                        <th>Ubicacion</th>
                                                        <th>Estado</th>
                                                        <th>Fecha Evento</th>
                                                        <th>Fecha Pago</th>
                                                        <th>Encargado</th>
                                                        <th>Observacion</th>
                                                        <th>Recibo</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a href="VerSC.aspx?Id=<%#Eval("Id")%>">
                                                        <button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                    </a></td>
                                                    <td><%#Eval("FechaSol","{0:dd/MM/yyyy}") %></td>
                                                    <td>
                                                        <small class="text-secondary"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("SalCom") %></i></small>
                                                    </td>
                                                    <td>
                                                        <small class="text-success"><%#Eval("Estado") %></i></small></td>
                                                    <td>
                                                        <small class="text-danger"><i class="fa fa-calendar">&nbsp;<%#Eval("Fecha","{0:dd/MM/yyyy}") %></i></small></td>
                                                    <td>
                                                        <small class="text-danger"><i class="fa fa-calendar">&nbsp;<%#Eval("FechaPago","{0:dd/MM/yyyy}") %></i></small></td>
                                                    <td>
                                                        <small class="text-primary"><i class="fa fa-user"><%#Eval("Nombre") %></small></td>
                                                    <td>
                                                        <small><%#Eval("Observacion") %></small></td>
                                                    <td>
                                                        <img class="card-img-top" src="../SC/Recibo/<%#Eval("ReciboSC") %>" style="border-radius: 5px" width="40" height="60" alt="Card image cap"></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                             </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .animated -->
        </section>
        <section id="tblnovsal">
            <div class="content mt-3">
                <div class="animated fadeIn">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card" style="border-radius: 7px">
                                <div class="card-header">
                                    <strong class="card-title">NOVEDADES DE SALDO</strong>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <asp:Repeater ID="r5" runat="server">
                                            <HeaderTemplate>
                                                <thead class="thead-dark" style="border-radius: 5px">
                                                    <tr>
                                                        <th>Editar</th>
                                                        <th>Fecha Solicitud</th>
                                                        <th>Estado</th>
                                                        <th>Observacion</th>
                                                        <th>Respuesta</th>
                                                    </tr>
                                                </thead>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a href="VerNovedad.aspx?Id=<%#Eval("Id")%>">
                                                        <button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                    </a></td>
                                                    <td><%#Eval("Fecha","{0:dd/MM/yyyy}") %></td>
                                                    <td>
                                                        <small class="text-success"><%#Eval("Estado") %></i></small></td>
                                                    <td>
                                                        <small><%#Eval("Observaciones") %></small></td>
                                                    <td>
                                                        <small><%#Eval("Respuesta") %></small></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                           </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .animated -->
        </section>
        <section id="tabsolparq">
            <div class="content mt-3">
                <div class="animated fadeIn">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card" style="border-radius: 7px">
                                <div class="card-header">
                                    <strong class="card-title">SOLICITUDES DE PARQUEADERO</strong>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <asp:Repeater ID="r6" runat="server">
                                            <HeaderTemplate>
                                                <thead class="thead-dark" style="border-radius: 5px">
                                                    <tr>
                                                        <th>Editar</th>
                                                        <th>Fecha Solicitud</th>
                                                        <th>Estado</th>
                                                        <th>Destinado a:</th>
                                                        <th>#Tarjeta</th>
                                                        <th>Respuesta</th>
                                                        <th>Soat</th>
                                                        <th>Vehiculo</th>
                                                    </tr>
                                                </thead>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a href="VerDocumento.aspx?Id=<%#Eval("Id")%>">
                                                        <button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                    </a></td>
                                                    <td><%#Eval("Fecha","{0:dd/MM/yyyy}") %></td>
                                                    <td>
                                                        <small class="text-success"><%#Eval("Estado") %></i></small></td>
                                                    <td>
                                                        <small class="text-primary"><i class="fa fa-user">&nbsp;<%#Eval("Destino") %></i></small></td>
                                                    <td>
                                                        <small class="text-danger"><i class="fa fa-credit-card">&nbsp;<%#Eval("TP") %></i></small></td>
                                                    <td>
                                                        <small><%#Eval("Respuesta") %></small></td>
                                                    <td>
                                                        <img class="card-img-top" src="../Parqueadero/Soat/<%#Eval("Soat") %>" style="border-radius: 5px" width="40" height="60" alt="Card image cap"></td>
                                                    <td>
                                                        <img class="card-img-top" src="../Parqueadero/Vehiculo/<%#Eval("Vehiculo") %>" style="border-radius: 5px" width="40" height="60" alt="Card image cap"></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .animated -->
        </section>
        <section id="tabchip" >
              <div class="content mt-3">
                  <div class="animated fadeIn">
                      <div class="row">
                          <div class="col-md-12">
                              <div class="card" style="border-radius: 7px">
                                  <div class="card-header">
                                      <strong class="card-title">SOLICITUDES DE CHIPS</strong>
                                  </div>
                                  <div class="card-body">
                                      <table class="table">
                                          <asp:Repeater ID="r7" runat="server">
                                              <HeaderTemplate>
                                                  <thead class="thead-dark" style="border-radius: 5px">
                                                      <tr>
                                                          <th>Editar</th>
                                                          <th>Fecha Solicitud</th>
                                                          <th>Estado</th>
                                                          <th>Tipo</th>
                                                          <th>Destinado a:</th>
                                                          <th>Nombre</th>
                                                          <th>#Documento</th>
                                                          <th>Novedad</th>
                                                          <th>Respuesta</th>
                                                          <th>Documento</th>
                                                      </tr>
                                                  </thead>
                                              </HeaderTemplate>
                                              <ItemTemplate>
                                                  <tr>
                                                      <td><a href="VerChip.aspx?Id=<%#Eval("Id")%>">
                                                          <button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                      </a></td>
                                                      <td><%#Eval("Fecha","{0:dd/MM/yyyy}") %></td>
                                                      <td>
                                                          <small class="text-success"><%#Eval("Estado") %></i></small></td>
                                                      <td>
                                                          <small class="text-primary"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Tipo") %></i></small></td>
                                                      <td>
                                                          <small class="text-danger"><i class="fa fa-user">&nbsp;<%#Eval("Destinado") %></i></small></td>
                                                      <td>
                                                          <small class="text-danger"><i class="fa fa-user">&nbsp;<%#Eval("Nombre") %></i></small></td>
                                                      <td>
                                                          <small class="text-danger"><i class="fa fa-credit-card">&nbsp;<%#Eval("Documento") %></i></small></td>
                                                      <td>
                                                          <small><%#Eval("Nuevo") %></small></td>
                                                      <td>
                                                          <small><%#Eval("Respuesta") %></small></td>
                                                      <td>
                                                          <img class="card-img-top" src="../Chip/Documento/<%#Eval("DocIdent") %>" style="border-radius: 5px" width="40" height="60" alt="Card image cap"></td>
                                                  </tr>
                                              </ItemTemplate>
                                          </asp:Repeater>
                                              </table>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <!-- .animated -->
          </section>
           <section id="tabbici" >
              <div class="content mt-3">
                  <div class="animated fadeIn">
                      <div class="row">
                          <div class="col-md-12">
                              <div class="card" style="border-radius: 7px">
                                  <div class="card-header">
                                      <strong class="card-title">SOLICITUDES DE BICICLETERO</strong>
                                  </div>
                                  <div class="card-body">
                                      <table class="table">
                                          <asp:Repeater ID="rcicla" runat="server">
                                              <HeaderTemplate>
                                                  <thead class="thead-dark" style="border-radius: 5px">
                                                      <tr>
                                                          <th>Editar</th>
                                                          <th>Fecha Solicitud</th>
                                                          <th>Estado</th>
                                                          <th>Tipo</th>
                                                          <th>Marca:</th>
                                                          <th>Solicitante</th>
                                                          <th>Respuesta</th>
                                                          <th>Foto Cicla</th>
                                                      </tr>
                                                  </thead>
                                              </HeaderTemplate>
                                              <ItemTemplate>
                                                  <tr>
                                                      <td><a href="VerBicicleta.aspx?Id=<%#Eval("Id")%>">
                                                          <button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                      </a></td>
                                                      <td><%#Eval("Fecha","{0:dd/MM/yyyy}") %></td>
                                                      <td>
                                                          <small class="text-success"><%#Eval("Estado") %></i></small></td>
                                                      <td>
                                                          <small class="text-primary"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Tipo") %></i></small></td>
                                                      <td>
                                                          <small class="text-danger"><i class="fa fa-user">&nbsp;<%#Eval("Marca") %></i></small></td>
                                                      <td>
                                                          <small class="text-danger"><i class="fa fa-user">&nbsp;<%#Eval("TipoSolicitante") %></i></small></td>
                                                      <td>
                                                          <small><%#Eval("Respuesta") %></small></td>
                                                      <td>
                                                          <img class="card-img-top" src="../SC/Bicicleta/bicifoto/<%#Eval("bicifoto") %>" style="border-radius: 5px" width="40" height="60" alt="Card image cap"></td>
                                                  </tr>
                                              </ItemTemplate>
                                          </asp:Repeater>
                                              </table>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <!-- .animated -->
          </section>
            <section id="tabmasco" >
              <div class="content mt-3">
                  <div class="animated fadeIn">
                      <div class="row">
                          <div class="col-md-12">
                              <div class="card" style="border-radius: 7px">
                                  <div class="card-header">
                                      <strong class="card-title">REGISTROS DE MASCOTAS</strong>
                                  </div>
                                  <div class="card-body">
                                      <table class="table">
                                          <asp:Repeater ID="rmascota" runat="server">
                                              <HeaderTemplate>
                                                  <thead class="thead-dark" style="border-radius: 5px">
                                                      <tr>
                                                          <th>Editar</th>
                                                          <th>Estado</th>
                                                          <th>Raza</th>
                                                          <th>Especie</th>
                                                          <th>Nombre</th>
                                                          <th>Carnet</th>
                                                          <th>Foto Mascota</th>
                                                      </tr>
                                                  </thead>
                                              </HeaderTemplate>
                                              <ItemTemplate>
                                                  <tr>
                                                      <td><a href="VerMascota.aspx?Id=<%#Eval("Id")%>">
                                                          <button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                      </a></td>
                                                      <td>
                                                          <small class="text-success"><%#Eval("Estado") %></i></small></td>
                                                      <td>
                                                          <small class="text-danger"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Raza") %></i></small></td>
                                                      <td>
                                                          <small class="text-danger"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Especie") %></i></small></td>
                                                      <td>
                                                          <small class="text-danger"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Nombre") %></i></small></td>
                                                      <td>
                                                          <img class="card-img-top" src="../SC/Mascota/Carnet/<%#Eval("Carnet") %>" style="border-radius: 5px" width="40" height="60" alt="Card image cap"></td>
                                                       <td>
                                                          <img class="card-img-top" src="../SC/Mascota/FotoMascota/<%#Eval("FotoMascota") %>" style="border-radius: 5px" width="40" height="60" alt="Card image cap"></td>
                                                  </tr>
                                              </ItemTemplate>
                                          </asp:Repeater>
                                              </table>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <!-- .animated -->
          </section>
        <section id="tabnotificacion">
              <div class="content mt-3">
                  <div class="animated fadeIn">
                      <div class="row">
                          <div class="col-md-12">
                              <div class="card" style="border-radius: 7px">
                                  <div class="card-header">
                                      <strong class="card-title">BANDEJA DE NOTIFICACIONES</strong>
                                  </div>
                                  <div class="card-body">
                                      <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                          <asp:Repeater ID="r11" runat="server">
                                              <HeaderTemplate>
                                                  <thead class="thead-dark" style="border-radius: 5px">
                                                      <tr>
                                                          <th><small>Ver PDF<small></th>
                                                          <th><small>Codigo<small></th>
                                                          <th><small>Fecha </small></th>
                                                          <th><small>asunto<small></th>
                                                          <th><small>Mensaje<small></th>
                                                          <th><small>Leido<small></th>
                                                      </tr>
                                                  </thead>
                                              </HeaderTemplate>
                                              <ItemTemplate>
                                                  <tr>
                                                      <td><a href="VerPDF.aspx?Id=<%#Eval("DocNotificacion")%>">
                                                          <button class="btn btn-lg btn-primary font-weight-bold" type="button" style="border-radius: 5px" title="Ver pdf"><i class="fa fa-download"></i></button>
                                                      </a></td>
                                                      <td>
                                                          <small class="text-danger"><i class="fa fa-building">&nbsp;<%#Eval("IdCodigo") %></i></small>
                                                      </td>
                                                      <td>
                                                          <small class="text-danger"><i class="fa fa-calendar">&nbsp;<%#Eval("Fecha") %></i></small>
                                                      </td>
                                                      <td>
                                                          <h6 class="text-dark"><i class="fa fa-clipboard">&nbsp;<%#Eval("Asunto") %></i></h6>
                                                      </td>
                                                      <td>
                                                          <small class="text-dark"><i class="fa fa-file-text-o">&nbsp;<%#Eval("Mensaje") %></i></small>
                                                      </td>
                                                      <td>
                                                          <small class="text-dark"><i class="fa fa-file-text-o">&nbsp;<%#Eval("Leido") %></i></small>
                                                      </td>
                                                  </tr>
                                              </ItemTemplate>
                                          </asp:Repeater>
                                         </table>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </section>
       </div>
    </form>
    <script src="../Diseño/assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="../Diseño/assets/js/popper.min.js"></script>
    <script src="../Diseño/assets/js/plugins.js"></script>
    <script src="../Diseño/assets/js/main.js"></script>

    <script src="../Diseño/assets/js/lib/data-table/datatables.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/jszip.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/pdfmake.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="../Diseño/assets/js/lib/data-table/datatables-init.js"></script>
        <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
        } );
    </script>
    
</asp:Content>
