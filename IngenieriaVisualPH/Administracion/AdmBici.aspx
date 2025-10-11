<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="AdmBici.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web152" %>
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
            <div id="procesando" class="ventana" style="border-radius: 7px; display: none">
               <h5 class="text-light text-center font-weight-bold">Administrador Trabajando...</h5>
            <img src="../Diseño/Imagenes/oficina.gif" />     
        </div>

    <div class="container" id="conta">
      <h3 class="text-center font-weight-bold text-light">Solicitudes de Bicicletero</h3>
         <br/>
        <form id="form1" runat="server">
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
                                                <asp:TextBox ID="txtbuscar" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtbuscar_TextChanged"></asp:TextBox>
                                            
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
                                                        <asp:ListItem>En Lista, Esperando Cupo</asp:ListItem>
                                                        <asp:ListItem>Desocupado, Libera el Cupo</asp:ListItem>
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
                                <strong>Estados SOLICITUD DE BICICLETERO</strong>
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
                                            <small class="text-uppercase font-weight-bold text-secondary">EN LISTA DE ESPERA</small>
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
         <section id="tabsolparq" runat="server">
            <div class="content mt-3">
                <div class="animated fadeIn">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card" style="border-radius: 7px">
                                <div class="card-header">
                                    <strong class="card-title">ESTADO DE SOLICITUDES BICICLETEROS</strong>&nbsp;&nbsp;<a href="AdmEspacioBicicletero.aspx"
                                                        <button class="btn btn-success font-weight-bold" type="button" style="border-radius: 5px" title="Ver"><i class="fa fa-bicycle">&nbsp;Ver Tabla de Espacios Autorizados</i></button></a>
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
                                                        <th>Estado</th>
                                                        <th>Solicitante</th>
                                                        <th>Tipo de Cicla</th>
                                                        <th>Tipo de Solicitante</th>
                                                        <th>Respuesta</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a href="VerBicicleta.aspx?Id=<%#Eval("Id")%>">
                                                        <button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                    </a></td>
                                                    <td><%#Eval("Fecha","{0:dd/MM/yyyy}") %></td>
                                                     <td>
                                                        <small class="text-danger"><i class="fa fa-building">&nbsp;<%#Eval("Codigo") %></i></small></td>
                                                     <td>
                                                        <small class="text-danger"><%#Eval("Estado") %></i></small></td>
                                                    <td>
                                                        <small class="text-success"><%#Eval("Nombre") %></i></small></td>
                                                     <td>
                                                        <small class="text-primary"><%#Eval("Tipo") %></i></small></td>
                                                    <td>
                                                        <small class="text-primary"><%#Eval("TipoSolicitante") %></i></small></td>
                                                    <td>
                                                        <small><%#Eval("Respuesta") %></i></small></td>                                               
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
