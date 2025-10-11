<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProAlquilerResultados.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web166" %>
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
    <asp:Label ID="lblcodigo" runat="server" Text="" ForeColor="Red" Visible="False"></asp:Label>
    <div id="procesando" class="ventana">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando.....</h5>
    </div>
      <div class="container" id="conta">
          <div class="alert alert-success" role="alert">
              En esta tabla podras visualizar cuando autorizas visitas con alquiler de parqueadero. Estos valores son cancelados por tu visitante.
          </div>
          <div class="card-body">
              <div class="col-md-12">
                  <table class="table table-bordered" style="border-radius: 7px">
                      <asp:Repeater ID="r1" runat="server">
                          <HeaderTemplate>
                              <thead class="thead-dark">
                                  <tr class="small">
                                      <th>PLACA</th>
                                      <th>TOTAL</th>
                                      <th>ESTADO</th>
                                  </tr>
                              </thead>
                              <tbody>
                          </HeaderTemplate>
                          <ItemTemplate>
                              <tr>
                                  <td class="small"><%#Eval("Placa") %></td>
                                  <td><%#Eval("Total") %></td>
                                  <td><%#Eval("Estado") %></td>
                              </tr>
                              <tr class="small">
                                  <td colspan="3"><%#Eval("TipoAlquiler") %></td>
                              </tr>
                              <tr class="small" style="background-color: lightgreen">
                                  <th>Novedad:</th>
                                  <td colspan="3"><%#Eval("Observaciones") %></td>
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
