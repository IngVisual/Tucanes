<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="VigParquea.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
        <form  id="fo2" runat="server">
            <br />
                 <div class="content mt-3">
                <div class="animated fadeIn">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <strong class="card-title">Tablero de Parqueadero</strong>
                                </div>
                                <div class="card-body">
                                    <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                        <asp:Repeater ID="r1" runat="server">
                                            <HeaderTemplate>
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>#Parqu</th>
                                                        <th>Codigo</th>
                                                        <th>Placa1</th>
                                                        <th>Placa2</th>
                                                        <th>Placa3</th>
                                                        <th>Placa4</th>
                                                        <th>Observaciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#Eval("Parqueadero") %></td>
                                                    <td><%#Eval("Codigo") %></td>
                                                    <td><%#Eval("PlacaVehiculo1") %></td>
                                                    <td><%#Eval("PlacaVehiculo2") %></td>
                                                    <td><%#Eval("PlacaVehiculo3") %></td>
                                                    <td><%#Eval("PlacaVehiculo4") %></td>
                                                    <td><%#Eval("Obseravacion") %></td>
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
<%--    <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>--%>
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
                $(document).ready(function () {
                    $('#bootstrap-data-table-export').DataTable();
                });
            </script>
        </form>
</asp:Content>
