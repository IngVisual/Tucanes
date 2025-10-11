<%@ Page Title="" Language="C#" MasterPageFile="~/Empleados/Empleados.Master" AutoEventWireup="true" CodeBehind="AlquilerResultadosPorTiempo.aspx.cs" Inherits="IngenieriaVisualPH.Empleados.Formulario_web118" %>
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
           <div class="card-body" style="border-radius: 7px; border-color: black">
               <div class="row">
                   <div class="col-6">
                       <asp:TextBox ID="txtfechaini" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtfechaini_TextChanged" TextMode="DateTimeLocal"></asp:TextBox>
                   </div>
                   <div class="col-6">
                       <asp:TextBox ID="txtfechafinal" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtfechafinal_TextChanged" TextMode="DateTimeLocal"></asp:TextBox>
                   </div>
               </div>
           </div>
           <div class="card" style="width: 25rem; border-radius: 7px; border-color: black">
               <div class="card-body bg-success">
                   <div class="lead">TOTAL FACTURADO</div>
                   <h2 class="card-title">$&nbsp;<asp:Label ID="lbltotal" runat="server"></asp:Label></h2>
                   <p class="small text-white">
                       <asp:Label ID="lblfechaIni" runat="server"></asp:Label>&nbsp;<i class="fa fa-calendar"></i> Fecha Inicial</p>
                   <p class="small text-white">
                       <asp:Label ID="lblfechafin" runat="server"></asp:Label>&nbsp;   <i class="fa fa-calendar"></i>Fecha Final</p>
               </div>
           </div>
           <div class="card" style="width: 25rem; border-radius: 7px; border-color: green">
               <div class="card-body">
                   <div class="lead">PAGO_FACTURADO</div>
                   <h2 class="card-title">$&nbsp;<asp:Label ID="lblfacturado" runat="server"></asp:Label></h2>
               </div>
           </div>
           <div class="card" style="width: 25rem; border-radius: 7px; border-color: green">
               <div class="card-body">
                   <div class="lead">PAGO_NOVEDAD</div>
                   <h2 class="card-title">$&nbsp;<asp:Label ID="lblnovedad" runat="server"></asp:Label></h2>
               </div>
           </div>
           <div class="card" style="width: 25rem; border-radius: 7px; border-color: black">
               <div class="card-body bg-danger">
                   <div class="lead text-white">ALQUILER_SIN_PAGO</div>
                   <h2 class="card-title text-white">$&nbsp;<asp:Label ID="lblcancelado" runat="server"></asp:Label></h2>
               </div>
           </div>
           <div class="card-body">
               <div class="col-md-12">
                   <table id="bootstrap-data-table" class="table table-striped table-bordered">
                       <asp:Repeater ID="r1" runat="server">
                           <HeaderTemplate>
                               <thead class="thead-dark">
                                   <tr>
                                       <th class="small">Codigo</th>
                                       <th class="small">Estado</th>
                                       <th class="small">Tipo_Alquiler</th>
                                       <th class="small">Placa</th>
                                       <th class="small">Fecha Ini</th>
                                       <th class="small">Fecha Fin</th>
                                       <th class="small">Horas</th>
                                       <th class="small">Total</th>
                                       <th class="small">Observaciones</th>
                                   </tr>
                               </thead>
                               <tbody>
                           </HeaderTemplate>
                           <ItemTemplate>
                               <tr>
                                   <td class="small"><%#Eval("Codigo") %></td>
                                   <td class="small"><%#Eval("Estado") %></td>
                                   <td class="small"><%#Eval("TipoAlquiler") %></td>
                                   <td class="small"><%#Eval("Placa") %></td>
                                   <td class="small"><%#Eval("FechaIni","{0:dd/MM/yyyy HH:mm:ss}") %></td>
                                   <td class="small"><%#Eval("FechaFin","{0:dd/MM/yyyy HH:mm:ss}") %></td>
                                   <td class="small"><%#Eval("Horas") %></td>
                                   <td class="small">$&nbsp;<%#Eval("Total") %></td>
                                   <td class="small"><%#Eval("Observaciones") %></td>
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
           $(document).ready(function () {
               $('#bootstrap-data-table-export').DataTable();
           });
       </script>
</asp:Content>