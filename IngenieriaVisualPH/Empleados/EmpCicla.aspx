<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="EmpCicla.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
     <div class="container">
        <div class="card-body">
            <div class="card-title">
                <h3 class="text-center">Bicicletero</h3>
            </div>
        </div>
        <form id="form1" runat="server">
            <section class="content">
                <div class="row">
                    <div class="col-xs-6 col-sm-6">
                        <div class="card">
                            <div class="card-header">
                                <strong>Buscar Ciclas por Apartamento</strong><small></small>
                            </div>
                            <div class="card-body card-block">
                                <div class="col-xs-6 col-sm-6">
                                    <div class="form-group">
                                        <label class=" form-control-label">Buscar Codigo</label>
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-search"></i></div>
                                            <asp:TextBox ID="txtbuscar" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <asp:Button ID="Button2" Font-Bold="true" runat="server" class="btn btn-lg btn-danger" Text="Buscar" OnClick="Button2_Click" />
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
                                    <strong class="card-title">Tablero de Bicicletas</strong>
                                </div>
                                <div class="card-body">
                                    <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                        <asp:Repeater ID="r1" runat="server">
                                            <HeaderTemplate>
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>Marca</th>
                                                        <th>Color</th>
                                                        <th>Tipo</th>
                                                        <th>Bicicletero</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#Eval("Marca") %></td>
                                                    <td><%#Eval("Color") %></td>
                                                    <td><%#Eval("Tipo") %></td>
                                                    <td><%#Eval("ObservacionAdm") %></td>
                                                </tr>
                                                 <div class="card border-danger" style="border-radius: 7px">
                                                    <img class="card-img-top" src="../SC/Bicicleta/bicifoto/<%#Eval("bicifoto") %>" alt="Card image cap">
                                                </div>
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
<%--    <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>--%>
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
