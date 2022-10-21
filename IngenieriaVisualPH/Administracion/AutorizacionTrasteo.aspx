<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="AutorizacionTrasteo.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web19" %>
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
            document.getElementById("tabMudanza").style.display = "none";
        }
        function btnvolveri() {
            document.getElementById("error").style.display = "block";
            document.getElementById("displayReg").style.display = "none";
            document.getElementById("displayEditar").style.display = "block";
            document.getElementById("tabMudanza").style.display = "block";
        }
    </script>
     <script>
        function f0SI() {
            document.getElementById("foto").style.display = "none";
            document.getElementById("fotoTipo").style.display = "block";
         }
        function ftipo(){
            document.getElementById("fotoTipo").style.display = "none";
            document.getElementById("foto1").style.display = "block";
        }
        function f1SI() {
            document.getElementById("foto1").style.display = "none";
            document.getElementById("foto2").style.display = "block";
        }
        function f2SI() {
            document.getElementById("foto2").style.display = "none";
            document.getElementById("foto3").style.display = "block";
        }
        function f3SI() {
            document.getElementById("foto3").style.display = "none";
            document.getElementById("foto4").style.display = "block";
        }
        function f4SI() {
            document.getElementById("foto4").style.display = "none";
            document.getElementById("button").style.display = "block";
        }
       function f1NOtipo() {
            document.getElementById("foto").style.display = "block";
            document.getElementById("fotoTipo").style.display = "none";
        }
       function f1NO() {
            document.getElementById("fotoTipo").style.display = "block";
            document.getElementById("foto1").style.display = "none";
        }
        function f2NO() {
            document.getElementById("foto1").style.display = "block";
            document.getElementById("foto2").style.display = "none";
        }
        function f3NO() {
            document.getElementById("foto2").style.display = "block";
            document.getElementById("foto3").style.display = "none";
        }
        function f4NO() {
            document.getElementById("foto3").style.display = "block";
            document.getElementById("foto4").style.display = "none";
        }
         function f8NO() {
            document.getElementById("foto4").style.display = "block";
            document.getElementById("button").style.display = "none";
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
                <a href="AutorizacionTrasteo.aspx">&#10006;</a>
                <div class="contenido">
                     <iframe width="1000" height="550" src="https://www.youtube.com/embed/Bn2BLuWK6AQ" frameborder="0" allow="accelerometer; 
                        autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
        </div>
<%-- -------------------------------------------------------------------- --%>
    <div class="container" id="conta">
      <h3 class="text-center font-weight-bold text-light">Solicitudes de Mudanza o Articulos</h3>
         <br/>
        <form id="form1" runat="server">
                        <div class="alert alert-danger" id="error2" runat="server" style="margin-top: 10px; display:none">
                <span class="badge badge-pill badge-danger">Error</span>
                <strong>Debe Ingresar Torre y Apartamento,  Administrador Ingrese nuevamente y finalice su registro</strong>
                &nbsp;&nbsp;
            </div>
            <div class="alert alert-success" id="error3" runat="server" style="margin-top: 10px; display: none">
                <span class="badge badge-pill badge-success">Listo</span>
                Registrado correctamente.
            </div>
            <div class="alert alert-warning" id="error" style="margin-top: 10px">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="col-lg-8">
                            <span class="badge badge-pill badge-secondary">Registro de Administrador</span>
                            <strong>¿Desea registrar una MUDANZA o ARTICULOS como Administrador.. ?</strong>
                            &nbsp;&nbsp;
                        </div>
                        <div class="col-lg-4">
                            <button id="btnok" type="button" onclick="btnoki()" style="border-radius: 5px" class=" btn btn-success font-weight-bold form-control border-dark animate__animated animate__pulse animate__infinite">Si Quiero.</button>
                        </div>
                    </div>
                </div>
            </div>
              <section class="content" id="displayReg" style="display:none">
                      <div class="col-lg-4">
                          <button id="btnvolver" type="button" onclick="btnvolveri()" style="border-radius: 5px" class="btn-success font-weight-bold form-control border-dark "><< Vover</button>
                      </div>
                  <div class="card">
                      <tr>
                          <td colspan="2">
                              <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="true" ForeColor="Red" />
                          </td>
                      </tr>
                      <div class="card-body">
                          <div class="form-group" id="foto">
                              <div class="card-body">
                                 <label for="" class="control-label mb-1 font-weight-bold">Ingrese Torre Y Apartamento</label>
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
                                  <p>
                                      <button id="f0" onclick="f0SI()" type="button" class="btn-success btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente >></button>
                                  </p>
                              </div>
                          </div>
                      </div>
                        <div class="card-body">
                          <div class="form-group" id="fotoTipo" style="display:none" >
                              <div class="card-body">
                                 <label for="" class="control-label mb-1 font-weight-bold">Ingrese Tipo de Mudanza</label>
                                  <br />
                                  <div class="col-xs-6 col-lg-12">
                                      <div class="col-xs-6 col-lg-8">
                                          <asp:DropDownList ID="ddtipo" runat="server" CssClass="form-control" ForeColor="#333333" DataSourceID="SqlDataSource2" DataTextField="Tipo" DataValueField="IdTipoMud" >
                                          </asp:DropDownList>
                                        
                                          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>" SelectCommand="SELECT * FROM [tblMudanzaTipo]"></asp:SqlDataSource>
                                        
                                          &nbsp;&nbsp;&nbsp;  
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                           ErrorMessage="El tipo es requerido" ControlToValidate="ddtipo" Text="*">
                                          </asp:RequiredFieldValidator>
                                      </div>
                                  </div>
                                  <p>
                                      <button id="f1notipo" onclick="f1NOtipo()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                      <button id="ftip" onclick="ftipo()" type="button" class="btn-success btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente >></button>
                                  </p>
                              </div>
                          </div>
                      </div>
                      <div class="form-group" id="foto1" style="display: none">
                          <div class="card-body">
                              <label for="" class="control-label mb-1 font-weight-bold"># Cedula del Propietario:--</label><asp:Label ID="lblpropie" CssClass="font-weight-bold text-success" runat="server" Text=""></asp:Label>
                              <asp:TextBox ID="txtcedula" runat="server" TextMode="Number" CssClass="form-control" MaxLength="12"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                  ErrorMessage="# Cedula requerida" ControlToValidate="txtcedula" Text="*">
                              </asp:RequiredFieldValidator>
                              <p></p>
                              <p>
                                   <button id="f1no" onclick="f1NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                  <button id="f1" onclick="f1SI()" type="button" class="btn-success btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente >></button>
                              </p>
                          </div>
                      </div>
                      <div class="form-group" id="foto2" style="display: none">
                          <div class="card-body">
                              <label for="" class="control-label mb-1 font-weight-bold">Nombre de la persona encargada de la Mudanza</label>
                              <asp:TextBox ID="txtencargado" runat="server" CssClass="form-control"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                  ErrorMessage="Nombre encargado de la mudanza es requerido" ControlToValidate="txtencargado" Text="*">
                              </asp:RequiredFieldValidator>
                              <p></p>
                              <p>
                                  <button id="f2no" onclick="f2NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                  <button id="f2" onclick="f2SI()" type="button" class="btn-success btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                              </p>
                          </div>
                      </div>
                      <div class="form-group" id="foto3" style="display: none">
                          <div class="card-body">
                              <label for="" class="control-label mb-1 font-weight-bold">Fecha de Mudanza DESDE:</label>
                              <asp:TextBox ID="txtfechaini" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                                  ErrorMessage="Fecha inicial es requerido" ControlToValidate="txtfechaini" Text="*">
                              </asp:RequiredFieldValidator>
                              <p></p>
                              <label for="" class="control-label mb-1 font-weight-bold">Fecha de Mudanza HASTA:</label>
                              <asp:TextBox ID="txtfechafin" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic"
                                  ErrorMessage="Fecha final es requerido" ControlToValidate="txtfechafin" Text="*">
                              </asp:RequiredFieldValidator>
                              <p></p>
                              <p>
                                  <button id="f3no" onclick="f3NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                  <button id="f3" onclick="f3SI()" type="button" class="btn-success btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                              </p>
                          </div>
                      </div>
                      <div class="form-group" id="foto4" style="display: none">
                          <div class="card-body">
                              <label for="" class="control-label mb-1 font-weight-bold">Observacion breve de la Mudanza</label>
                              <asp:TextBox ID="txtarticulos" runat="server" MaxLength="50" Text="Opcional" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                              <p></p>
                              <p>
                                  <button id="f4no" onclick="f4NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                  <button id="f4" onclick="f4SI()" type="button" class="btn-success btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                              </p>
                          </div>
                      </div>
                  </div>
            <br />
            <div id="button" style="display: none">
                <p></p>
                <button id="f8no" onclick="f8NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                <p></p>
                <asp:Button ID="btnenviardocuemnto" runat="server" Font-Bold="true" class="btn-block btn-lg btn-success border border-light " Text="Enviar Solicitud" OnClick="btnenviardocuemnto_Click1"/>
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
                                                <asp:TextBox ID="txtbuscar" TextMode="Number" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtbuscar_TextChanged"></asp:TextBox>
                                            
                                            </div>
                                        </div>
                                    </div>
                                        <div class="col-xs-6 col-sm-6">
                                            <div class="form-group">
                                                <label class=" form-control-label">Estado</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon"><i class="fa fa-search"></i></div>
                                                    <asp:DropDownList ID="ddestado" Font-Bold="true" ForeColor="Red" CssClass="form-control standardSelect" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddestado_SelectedIndexChanged">
                                                        <asp:ListItem>Solicitud</asp:ListItem>
                                                        <asp:ListItem>Autorizado</asp:ListItem>
                                                        <asp:ListItem>No Autorizado</asp:ListItem>
                                                        <asp:ListItem>Novedad</asp:ListItem>
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
                                <strong>Estados SOLICITUD DE MUDANZA</strong>
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
                                            <small class="text-uppercase font-weight-bold text-light">SOLICITUDES</small>
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
                                            <small class="text-uppercase font-weight-bold text-light">NOVEDAD</small>
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
                                        <asp:Repeater ID="r1" runat="server">
                                            <HeaderTemplate>
                                                <thead class="thead-dark" style="border-radius: 5px">
                                                    <tr>
                                                        <th>Editar</th>
                                                        <th>Fecha Solicitud</th>
                                                        <th>Codigo</th>
                                                        <th>Tipo</th>
                                                        <th>Estado</th>
                                                        <th>Cedula</th>
                                                        <th>Desde:</th>
                                                        <th>Hasta:</th>
                                                        <th>Observacion</th>
                                                        <th>Respuesta</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a href="VerMudanza.aspx?Id=<%#Eval("Id")%>">
                                                        <button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                    </a></td>
                                                    <td><%#Eval("FechaSol","{0:d}") %></td>
                                                       <td>
                                                        <small class="text-danger"><i class="fa fa-building">&nbsp;<%#Eval("Codigo") %></i></small><td>
                                                        <small class="text-secondary"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("Tipo") %></i></small></td>
                                                    <td>
                                                        <small class="text-success"><%#Eval("Estado") %></i></small></td>
                                                    <td>
                                                        <h5 class="text-primary"><%#Eval("Cedula") %></h5></td>
                                                    <td>
                                                        <small class="text-danger"><i class="fa fa-calendar">&nbsp;<%#Eval("FechaIniMud","{0:d}") %></i></small></td>
                                                    <td>
                                                        <small class="text-danger"><i class="fa fa-calendar">&nbsp;<%#Eval("FechaFinMud","{0:d}") %></i></small></td>
                                                    <td>
                                                        <small><%#Eval("Observacion") %></small></td>
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
