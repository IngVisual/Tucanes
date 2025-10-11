<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="AlquilerParqueadero.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web147" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
     <link href="../Diseño/Banner.css" rel="stylesheet" />
        <script>
            function DesactivarBoton() {
                document.getElementById("conta").style.display = "none"
                document.getElementById("procesando").style.display = "block"
            }
            window.onbeforeunload = DesactivarBoton;
        </script>
    <div id="procesando" class="ventana2" style="display: none">
                <h5 class="text-light text-center font-weight-bold">Administrador trabajando...</h5>
        <img src="../Diseño/Imagenes/oficina.gif" />
    </div>
    <div class="container" id="conta">
        <form id="f2" runat="server">
            <section id="tabsc">
                <div class="col-lg-12">
                    <div class="card" style="border-radius: 7px">
                        <div class="card-header">
                            <strong class="card-title">Tablero Alquiler de Parqueaderos</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                             <a href="AlquilerParqueaderoConfig.aspx">
             <button type="button" class="btn btn-success pull-right border border-secondary text-light font-weight-bold" style="border-radius:5px"><i class="fa fa-edit"></i>&nbsp; Crear Tipos de Alquiler</button></a>
                         <a href="AlquilerParqueaderoCM.aspx">
             <button type="button" class="btn btn-success border border-secondary text-light font-weight-bold" style="border-radius:5px"><i class="fa fa-money"></i>&nbsp; Caja Menor</button></a>
                        </div>
                        <div class="card-body" style="border-radius: 7px; border-color: black">
                            <div class="col-6">
                                <div class="row">
                                    <div class="col-6">
                                        Fecha Desde
                                        <asp:TextBox ID="txtfechaini" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtfechaini_TextChanged" TextMode="DateTimeLocal"></asp:TextBox>
                                    </div>
                                    <div class="col-6">
                                        Fecha Hasta
                                        <asp:TextBox ID="txtfechafinal" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtfechafinal_TextChanged" TextMode="DateTimeLocal"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                                <div class="col-12">
                                    <div class="card" style=" border-radius: 7px; border-color: green">
                                        <div class="card-body bg-white">
                                             <div class="row">
                                                  <div class="col-3">
                                            <div class="lead font-weight-bold">TOTAL FACTURADO</div>
                                                      </div>
                                                  <div class="col-3">
                                            <h2 class="card-title">$&nbsp;<asp:Label ID="lbltotal" runat="server"></asp:Label></h2>
                                            </div>
                                                  <div class="col-3">
                                                      <p class="small lead font-weight-bold">
                                                <asp:Label ID="lblfechaIni" runat="server"></asp:Label>&nbsp;<i class="fa fa-calendar"></i> Fecha Inicial
                                            </p></div>
                                                  <div class="col-3">
                                            <p class="small lead font-weight-bold">
                                                <asp:Label ID="lblfechafin" runat="server"></asp:Label>&nbsp;<i class="fa fa-calendar"></i>Fecha Final
                                            </p></div>
                                             </div>
                                        </div>
                                    </div>
                                </div>
                    <div class="col-12">
                            <div class="row">
                                <div class="col-4">
                                    <div class="card" style=" border-radius: 7px; border-color: green">
                                        <div class="card-body">
                                            <div class="lead font-weight-bold">PAGO_FACTURADO</div>
                                            <h2 class="card-title">$&nbsp;<asp:Label ID="lblfacturado" runat="server"></asp:Label></h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="card" style=" border-radius: 7px; border-color: green">
                                        <div class="card-body">
                                            <div class="lead font-weight-bold">PAGO_NOVEDAD</div>
                                            <h2 class="card-title">$&nbsp;<asp:Label ID="lblnovedad" runat="server"></asp:Label></h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="card" style=" border-radius: 7px; border-color: black">
                                        <div class="card-body bg-danger">
                                            <div class="lead font-weight-bold text-white">ALQUILER_SIN_PAGO</div>
                                            <h2 class="card-title text-white">$&nbsp;<asp:Label ID="lblcancelado" runat="server"></asp:Label></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="col-md-12">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <asp:Repeater ID="r1" runat="server">
                                        <HeaderTemplate>
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th>Codigo</th>
                                                    <th>Codigo</th>
                                                    <th>Estado</th>
                                                    <th>Tipo_Alquiler</th>
                                                     <th>Placa</th>
                                                     <th>Marca</th>
                                                     <th>Nombre</th>
                                                     <th>Fecha Ini</th>
                                                     <th>Fecha Fin</th>
                                                     <th>Horas</th>
                                                     <th>Total</th>
                                                     <th>Observaciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td class="small"><a href="EditarAlquiler.aspx?Id=<%#Eval("IDalquiler")%>">
                                                        <button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                    </a></td>
                                                <td class="small"><%#Eval("Codigo") %></td>
                                                <td class="small"><%#Eval("Estado") %></td>
                                                <td class="small"><%#Eval("TipoAlquiler") %></td>
                                                <td class="small"><%#Eval("Placa") %></td>
                                                <td class="small"><%#Eval("Marca") %></td>
                                                <td class="small"><%#Eval("Nombre") %></td>
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
                </div>
                <!-- .animated -->
            </section>
        </form>
    </div>
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
