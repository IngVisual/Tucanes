<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="VerTablaAlquiler.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web121" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
      <link href="../Diseño/Banner.css" rel="stylesheet" />
<script>
    function DesactivarBoton() {
        document.getElementById("conta").style.display = "none";
        document.getElementById("procesando").style.display = "block";
    }
    window.onbeforeunload = DesactivarBoton;
</script>
  <form id="form1" runat="server">
    <div id="procesando" class="ventana">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando.....</h5>
    </div>
    <div class="container" id="conta">
        <h5 class="text-center">Alquiler Parqueaderos</h5>
            <div class="card-body"> 
                <div class="col-md-12">
                    <table id="bootstrap-data-table" class="table table-striped table-bordered">
                        <asp:Repeater ID="r1" runat="server">
                            <HeaderTemplate>
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Pagar</th>
                                        <th>Codigo</th>
                                        <th>Placa</th>
                                        <th>Fecha Inicio</th>
                                    </tr>
                                </thead>
                                <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><a href="CajaParqueadero.aspx?id=<%#Eval("IDAlquiler")%>">
                                        <button class="btn btn-primary font-weight-bold" type="button" style="border-radius: 5px"><i class="fa fa-money"></i></button>
                                    </a>
                                    </td>
                                    <td><%#Eval("Codigo") %></td>
                                    <td><%#Eval("Placa") %></td>
                                    <td><%#Eval("FechaInicial") %></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                              </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <br />
                        <br />
                        <br />
                        <br />
                </div>
            </div>
            <br />

            <!-- .animated -->
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
                $(document).ready(function () {
                    $('#bootstrap-data-table-export').DataTable();
                });
            </script>
            <br />
            <br />
            <br />
            <br />
            <br />
    </div>
        </form>
</asp:Content>
