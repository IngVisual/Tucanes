<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="AdmCartelera.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web114" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
        <style>
        body {
            background: rgb(249,244,242);
            background: linear-gradient(90deg, rgba(249,244,242,1) 0%, rgba(22,27,38,0.8267682072829132) 50%);
        }
     </style>
    <link href="../Diseño/Banner.css" rel="stylesheet" />
        <script>
            function DesactivarBoton() {
             document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
        }
        window.onbeforeunload = DesactivarBoton;
    </script>
            <div id="procesando" class="ventana" style="border-radius: 7px; display: none">
               <h5 class="text-light text-center font-weight-bold">Administrador Trabajando...</h5>
            <img src="../Diseño/Imagenes/oficina.gif" />     
        </div>
    <div class="container" id="conta">
        <div class="card-body">
            <div class="card-title">
                <h3 class="text-center font-weight-bold text-light">Solicitudes de Cartelera</h3>
            </div>
        </div>
        <form id="form1" runat="server">
            <section class="content">
                <div class="row">
                    <div class="col-xs-6 col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>Buscar por Estado</strong><small></small>
                            </div>
                            <div class="card-body card-block">
                                <div class="col-xs-6 col-sm-6">
                                    <div class="form-group">
                                        <label class=" form-control-label">ESTADO</label>
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-search"></i></div>
                                            <asp:DropDownList ID="ddestado" Font-Bold="true" ForeColor="Red" CssClass="form-control standardSelect" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddestado_SelectedIndexChanged">
                                                <asp:ListItem>Solicitud</asp:ListItem>
                                                <asp:ListItem>No Autorizado</asp:ListItem>
                                                <asp:ListItem>Autorizado</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <br />
            <div class="content mt-3">
                <div class="animated fadeIn">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <strong class="card-title">Tablero de Carteleras</strong>
                                </div>
                                <div class="card-body">
                                    <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                        <asp:Repeater ID="r1" runat="server">
                                            <HeaderTemplate>
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>Solicitud</th>
                                                        <th>Codigo</th>
                                                        <th>Fecha de Solicitud</th>
                                                        <th>Descripción de cartelera</th>
                                                        <th>Estado</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a href="VerCartelera.aspx?Id=<%#Eval("IdCartelera")%>">
                                                        <button class="btn btn-primary" type="button" title="Actualizar">Editar Solictud</i></button>
                                                    </a></td>
                                                    <td><%#Eval("Codigo") %></td>
                                                    <td><%#Eval("Fecha") %></td>
                                                    <td><%#Eval("Observaciones") %></td>
                                                    <td><%#Eval("Estado") %></td>
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
     <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>


            <script src="assets/js/lib/data-table/datatables.min.js"></script>
            <script src="assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
            <script src="assets/js/lib/data-table/dataTables.buttons.min.js"></script>
            <script src="assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
            <script src="assets/js/lib/data-table/jszip.min.js"></script>
            <script src="assets/js/lib/data-table/pdfmake.min.js"></script>
            <script src="assets/js/lib/data-table/vfs_fonts.js"></script>
            <script src="assets/js/lib/data-table/buttons.html5.min.js"></script>
            <script src="assets/js/lib/data-table/buttons.print.min.js"></script>
            <script src="assets/js/lib/data-table/buttons.colVis.min.js"></script>
            <script src="assets/js/lib/data-table/datatables-init.js"></script>


            <script type="text/javascript">
                $(document).ready(function () {
                    $('#bootstrap-data-table-export').DataTable();
                });
            </script>
            <br />
            <br />
            <br />
            <br />
            <br />
        </form>
    </div>
</asp:Content>
