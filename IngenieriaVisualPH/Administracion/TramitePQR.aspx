<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="TramitePQR.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web13" %>
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
        function btnoki() {
            document.getElementById("error").style.display = "none";
            document.getElementById("displayEditar").style.display = "none";
            document.getElementById("displayReg").style.display = "block";
            document.getElementById("tabla").style.display = "none";
        }
        function btnvolveri() {
            document.getElementById("error").style.display = "block";
            document.getElementById("displayReg").style.display = "none";
            document.getElementById("displayEditar").style.display = "block";
            document.getElementById("tabla").style.display = "block";
        }
    </script>
        <script>
        function pregunta1SI() {
            document.getElementById("pregunta1").style.display = "none";
            document.getElementById("imagen").style.display = "block";
        }
        function pregunta1NO() {
            document.getElementById("pregunta1").style.display = "none";
        }
        function pregunta2SI() {
            document.getElementById("pregunta2").style.display = "none";
            document.getElementById("queja").style.display = "block";
            document.getElementById("button").style.display = "block";
        }
        function pregunta2NO() {
            document.getElementById("pregunta2").style.display = "none";
            document.getElementById("button").style.display = "block";
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
                <a href="TramitePQR.aspx">&#10006;</a>
                <div class="contenido">
                    <iframe width="1000" height="550" src="https://www.youtube.com/embed/gJOsln_CNZw" frameborder="0" allow="accelerometer; 
                        autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
        </div>
<%-- -------------------------------------------------------------------- --%>
     <div class="container" id="conta">
      <h3 class="text-center font-weight-bold text-light">Tramites de PQR</h3>
         <br/>
        <form id="form1" runat="server">
            <div class="alert alert-danger" id="error2" runat="server" style="margin-top: 10px; display:none">
                <span class="badge badge-pill badge-danger">Error</span>
                <strong>Solo permite imagenes .png , .jpg , .jpeg.  Administrador Ingrese nuevamente y finalice su PQR</strong>
                &nbsp;&nbsp;
            </div>
            <div class="alert alert-success" id="error3" runat="server" style="margin-top: 10px; display: none">
                <span class="badge badge-pill badge-success">Listo</span>
                PQR Registrado correctamente.
            </div>
            <div class="alert alert-danger" id="Div1" runat="server" style="margin-top: 10px; display: none">
                <span class="badge badge-pill badge-danger">Error</span>
                Ingrese torre y apartamento. Administrador Ingrese nuevamente y finalice su PQR
            </div>
            <div class="alert alert-warning" id="error" style="margin-top: 10px">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="col-lg-8">
                            <span class="badge badge-pill badge-secondary">Registro de Administrador</span>
                            <strong>¿Desea registrar un PQR o QUEJA como Administrador.. ?</strong>
                            &nbsp;&nbsp;
                        </div>
                        <div class="col-lg-4">
                            <button id="btnok" type="button" onclick="btnoki()" style="border-radius: 5px" class=" btn btn-success font-weight-bold form-control border-dark animate__animated animate__pulse animate__infinite">Si Quiero.</button>
                        </div>
                    </div>
                </div>
            </div>
            <section class="content" id="displayReg" style="display:none">
                <tr>
                    <td colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="true" ForeColor="White" />
                    </td>
                </tr>
            <asp:Label ID="lblrespuesta" runat="server" Text="Tramitado por Administración" Visible="False"></asp:Label>
            <asp:Label ID="lblcodigo1" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="lblcodigo" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblleido" runat="server" Text="no" Visible="false"></asp:Label>
            <asp:Label ID="lblfecha" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblarea" runat="server" Text="Area" CssClass="form-control" ForeColor="Red" Visible="False"></asp:Label>
                <div class="col-lg-4">
                <button id="btnvolver" type="button" onclick="btnvolveri()" style="border-radius: 5px" class="btn-success font-weight-bold form-control border-dark "><< Vover</button>
                </div>
               <div class="row">                     
                    <div class="col-xs-6 col-lg-12 ">
                        <div class="card border-danger" style="border-radius: 7px">
                            <div class="card-header">
                                <strong>Registrar PQR</strong>
                            </div>
                                <div class="card-body ">
                                    <strong style="margin-left:25px">Ingrese quien registra el PQRS o Queja</strong>
                                  <div class="col-xs-6 col-lg-12">
                                      <div class="col-xs-6 col-lg-6">
                                          <asp:DropDownList ID="ddltor" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Torre" DataValueField="Torre">
                                          </asp:DropDownList>
                                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>" SelectCommand="SELECT * FROM [tblVivienda]"></asp:SqlDataSource>
                                          &nbsp;&nbsp;&nbsp;                      
                                      </div>
                                      <div class="col-xs-6 col-lg-6">
                                          <asp:DropDownList ID="ddapa" runat="server" CssClass="form-control" ForeColor="#333333" DataSourceID="SqlDataSource1" DataTextField="Apartamento" DataValueField="Apartamento" >
                                          </asp:DropDownList>&nbsp;&nbsp;&nbsp;
              
                                      </div>
                                  </div>
            <asp:DropDownList ID="ddlista" runat="server" Visible="False">
                <asp:ListItem>Abierta</asp:ListItem>
            </asp:DropDownList>
            <div class="form-group">
                <label class=" form-control-label text-dark font-weight-bold">Nombre</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                    <asp:TextBox ID="txtnombre" runat="server" Text="" CssClass="form-control" Enabled="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorusuario" runat="server" Display="Dynamic"
                        ErrorMessage="El nombre es requerido" ControlToValidate="txtnombre" Text="*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label text-dark font-weight-bold">Tipo de PQR</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                    <asp:DropDownList ID="ddtipo" runat="server" CssClass="form-control" ForeColor="#333333">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Incumplimiento a Reuniones</asp:ListItem>
                        <asp:ListItem>Ruido</asp:ListItem>
                        <asp:ListItem>Mantenimiento</asp:ListItem>
                        <asp:ListItem>Vandalismo o robos</asp:ListItem>
                        <asp:ListItem>Fumigacion</asp:ListItem>
                        <asp:ListItem>Bebidas alcoholicas o estupefacientes</asp:ListItem>
                        <asp:ListItem>Mascotas</asp:ListItem>
                        <asp:ListItem>Estetica del conjunto</asp:ListItem>
                        <asp:ListItem>Vigilancia</asp:ListItem>
                        <asp:ListItem>Shoot de basura</asp:ListItem>
                        <asp:ListItem>Privacidad</asp:ListItem>
                        <asp:ListItem>Agresion verbal o fisica</asp:ListItem>
                        <asp:ListItem>Parqueaderos</asp:ListItem>
                        <asp:ListItem>Zonas comunes</asp:ListItem>
                        <asp:ListItem>Porteria</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                        ErrorMessage="El tipo de pqr es requerido" ControlToValidate="ddtipo" Text="*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label text-dark font-weight-bold">Descripcion del PQR</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-edit"></i></div>
                    <asp:TextBox ID="txtobservacion" runat="server" Text="" CssClass="form-control" Enabled="True" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                        ErrorMessage="La observacion es requerida" ControlToValidate="txtobservacion" Text="*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div id="pregunta1">
                <strong class="card-title text-dark font-weight-bold">¿Desea adjuntar alguna Imagen sobre el PQR?</strong>
                <p>
                    <button id="btn3" onclick="pregunta1SI()" type="button" class="btn-success border border-light font-weight-bold" style="width: 70px; border-radius: 3px">Si</button>
                    <button id="btn4" onclick="pregunta1NO()" type="button" class="btn-secondary border border-light font-weight-bold" style="width: 70px; border-radius: 3px">No</button>
                </p>
            </div>
            <div class="form-group" id="imagen" style="display:none">
                <p>
                    <h4 class="text-dark font-weight-bold"><i class="fa fa-hand-o-right">&nbsp;&nbsp;NO ADMITE PDF, SOLO ADMITE IMAGENES.</i></h4>
                </p>
                <asp:FileUpload ID="f1" AllowMultiple="true" Font-Bold="true" runat="server" CssClass="form-control" />
            </div>
                        <br />
            <div id="pregunta2">
                <strong class="card-title text-dark font-weight-bold">¿Su queja es por el comportamiento de algun vecino?</strong>
                <p>
                    <button id="btn1" type="button" onclick="pregunta2SI()" class="btn-success border border-light font-weight-bold" style="width: 70px; border-radius: 3px">Si</button>
                    <button id="btn2" type="button" onclick="pregunta2NO()" class="btn-secondary border border-light font-weight-bold" style="width: 70px; border-radius: 3px">No</button>
                </p>
            </div>
            <div class="card border border-danger" id="queja" style="display:none">
                <div class="card-header">
                    <strong class="card-title">Ingrese Torre y Apartamento QUE ESTA INFRINGIENDO las normas de convivencia, solo SI es el caso.(OPCIONAL)</strong>
                </div>
                <div class="row">
                    &nbsp;&nbsp; 
                        <div class="card-body">
                            <asp:DropDownList ID="ddltor1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Torre" DataValueField="Torre">
                                          </asp:DropDownList>                                         
                                          &nbsp;&nbsp;&nbsp;    
                        </div>
                    <div class="card-body">
                         <asp:DropDownList ID="ddlapa1" runat="server" CssClass="form-control" ForeColor="#333333" DataSourceID="SqlDataSource1" DataTextField="Apartamento" DataValueField="Apartamento" >
                                          </asp:DropDownList>&nbsp;&nbsp;&nbsp;
                   
                    </div>
                    &nbsp;&nbsp;&nbsp;
                </div>
            </div>
            <div id="button" style="display:none">
                <asp:Button ID="btnenviarpqr" runat="server" Font-Bold="true" class="btn-block btn-lg btn-success border border-light " Text="Enviar PQR" OnClick="btnenviarpqr_Click"  />
            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="content col-xs-6 col-lg-12" id="displayEditar">
                <div class="row">
                    <div class="col-xs-6 col-lg-6">
                        <div class="card" style="border-radius: 7px">
                            <div class="card-header">
                                <strong>Filtrar por Codigo o Estado</strong>
                            </div>
                            <div class="row">
                                <div class="card-body ">
                                          <div class="col-xs-6 col-sm-6">
                                            <div class="alert alert-danger" runat="server" style="display:none" id="error1">
                                           <strong>Ingrese Codigo</strong>
                                          </div>
                                        <div class="form-group">
                                            <label class=" form-control-label">Codigo</label>
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-search"></i></div>
                                                <asp:TextBox ID="txtbuscar" CssClass="form-control" TextMode="Number" runat="server" AutoPostBack="true" OnTextChanged="txtbuscar_TextChanged"></asp:TextBox>
                                            
                                            </div>
                                        </div>
                                    </div>
                                        <div class="col-xs-6 col-sm-6">
                                            <div class="form-group">
                                                <label class=" form-control-label">Estado</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon"><i class="fa fa-search"></i></div>
                                                    <asp:DropDownList ID="ddestado" Font-Bold="true" ForeColor="Red" CssClass="form-control standardSelect" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddestado_SelectedIndexChanged">
                                                        <asp:ListItem>Abierta</asp:ListItem>
                                                        <asp:ListItem>En Proceso</asp:ListItem>
                                                        <asp:ListItem>Queja Cerrada</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6">
                        <div class="card" style="border-radius: 7px">
                            <div class="card-header">
                                <strong>Estados tramite de PQR</strong><small></small>
                            </div>
                            <section class="content">
                                <div class="row">
                                    <div class="card col-lg-6 col-md-6 no-padding no-shado">
                                        <div class="card-body bg-flat-color-5">
                                            <div class="h1 text-right text-light mb-4">
                                                <i class="fa fa-pie-chart"></i>
                                            </div>
                                            <div class="h4 mb-0">
                                                <span class="count">
                                                    <asp:Label ID="lblnot8" runat="server"></asp:Label></span>
                                            </div>
                                            <small class="text-uppercase font-weight-bold text-light">PQR ABIERTOS</small>
                                            <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                        </div>
                                    </div>
                                    <div class="card col-lg-6 col-md-6 no-padding no-shado">
                                        <div class="card-body bg-flat-color-3">
                                            <div class="h1 text-right text-light mb-4">
                                                <i class="fa fa-pie-chart"></i>
                                            </div>
                                            <div class="h4 mb-0">
                                                <span class="count1">
                                                    <asp:Label ID="Label1" runat="server"></asp:Label></span>
                                            </div>
                                            <small class="text-uppercase font-weight-bold text-light">PQR EN PROCESO</small>
                                            <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </section>
            <br />
          <section id="tabla">
            <div class="content mt-3">
                <div class="animated fadeIn">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card" style="border-radius: 7px">
                                <div class="card-header">
                                    <strong class="card-title">PQRS</strong>
                                </div>
                                <div class="card-body">
                                    <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                        <asp:Repeater ID="r1" runat="server">
                                            <HeaderTemplate>
                                                <thead class="thead-dark" style="border-radius: 5px">
                                                    <tr>
                                                        <th>Editar</th>
                                                        <th>Fecha de Solicitud</th>
                                                        <th>Codigo</th>
                                                        <th>Tipo de PQR</th>
                                                        <th>Estado</th>
                                                        <th>Observacion</th>
                                                        <th>Respuesta</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a href="VerPQR.aspx?Id=<%#Eval("Id")%>">
                                                        <button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                    </a></td>
                                                    <td><%#Eval("FechaInicio","{0:d}") %></td>
                                                    <td><%#Eval("Codigo") %></td>
                                                    <td>
                                                        <small class="text-secondary"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Tipo") %></i></small></td>
                                                    <td>
                                                        <small class="text-success"><%#Eval("Estado") %></i></small></td>
                                                    <td>
                                                        <small><%#Eval("DescripcionPQR") %></small></td>
                                                    <td>
                                                        <small><%#Eval("Respuesta") %></small></td>
                                               
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                                              </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .animated -->
        </section>
<%-- <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>--%>
    <script src="..Diseño/assets/js/popper.min.js"></script>
    <script src="..Diseño/assets/js/plugins.js"></script>
    <script src="..Diseño/assets/js/main.js"></script>


    <script src="..Diseño/assets/js/lib/data-table/datatables.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/jszip.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/pdfmake.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="..Diseño/assets/js/lib/data-table/datatables-init.js"></script>


    <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
        } );
    </script>
            <br />
            <br />
            <br />
            <br />         
        </form>
     </div>
</asp:Content>
