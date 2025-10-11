<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="AlquilerParqueaderoCM.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web149" %>
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
    <div id="procesando" class="ventana2" style="display: none">
                <h5 class="text-light text-center font-weight-bold">Administrador trabajando...</h5>
        <img src="../Diseño/Imagenes/oficina.gif" />
    </div>
    <div class="container" id="conta">
        <form id="f2" runat="server">
            <div class="col-lg-12">
                <div>
                    <a href="AlquilerParqCMAddUser.aspx">
                        <button type="button" class="btn btn-success border border-secondary text-light font-weight-bold" style="border-radius: 5px"><i class="fa fa-user"></i>&nbsp; Agregar o Editar GUARDAS</button></a>
                </div>
                <br />
                <div class="alert alert-danger" id="error1" runat="server" style="margin-top: 10px; display: none">
                    <strong>El valor de Caja Menor no puede estar vacio. Debe realizar la transferencia nuevamente.</strong>
                </div>
                <div class="card" style="border-radius: 7px">
                    <div class="card-header font-weight-bold">
                        Transferencias de Caja Menor
                    </div>
                    <div class="card-body" runat="server">
                        <div class="row border-success" id="CMaGuarda" runat="server">
                            <div class="col-lg-5 col-ls-12">
                                Administracion entrega caja menor al Guarda: 
                            <asp:DropDownList ID="ddGuarda" runat="server" CssClass="form-control text-uppercase" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Id">
                                <asp:ListItem>Seleccione Guarda...</asp:ListItem>
                            </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>" SelectCommand="SELECT * FROM [ParqTbl_CMVigilante] WHERE (([Activo] &lt;&gt; @Activo) AND ([Id] &lt;&gt; @Id))">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="False" Name="Activo" Type="Boolean" />
                                        <asp:Parameter DefaultValue="1" Name="Id" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div class="col-lg-5 col-ls-12">
                                Por un valor de:
                                  <asp:TextBox ID="txtguarda" Text="0" CssClass="form-control font-weight-bold" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-lg-2 col-ls-12" style="margin-top:20px">
                                <asp:Button ID="btnentrega" runat="server" Text="Entregar" OnClick="btnentrega_Click" class="btn btn-success border border-secondary text-light font-weight-bold" style="border-radius: 5px"/>
                            </div>
                        </div>

                        
                        <div id="CMRetirar" runat="server" style="display:none">
                            <div class="alert alert-light border-success" runat="server" style="margin-top:10px;">
                                <strong>Administracion tiene: $&nbsp;<asp:Label ID="lblCajaMenorAdmin" runat="server"></asp:Label> en caja menor y de excedente tiene: $&nbsp;<asp:Label ID="lblExcedenteAdmin" runat="server"></asp:Label></strong>&nbsp;
                                 <asp:Button ID="btnRetirar" runat="server" Text="Retirar" OnClick="btnRetirar_Click" class="btn btn-success border border-secondary text-light font-weight-bold" style="border-radius: 5px"/>
                            </div>
                        </div>

                         <div id="CMActualGuarda" runat="server" style="display:none">
                            <div class="alert alert-light border-success" runat="server" style="margin-top:10px;">
                                <strong>El Guarda &nbsp;<asp:Label ID="lblUsuarioDestino" runat="server"></asp:Label> tiene: $&nbsp;<asp:Label ID="lblCajaMenorGuarda" runat="server"></asp:Label>
                                    en caja menor y de excedente tiene: $&nbsp;<asp:Label ID="lblExcedenteGuarda" runat="server"></asp:Label>, transferidos el dia <asp:Label ID="lblFechaTransferencia" runat="server"></asp:Label> </strong>
                            </div>
                        </div>
                    </div>
                </div>

               <div class="card" style="border-radius: 7px">
                    <div class="card-header font-weight-bold">
                        Tablero de Transferencias
                    </div>
                    <div class="card-body">
                            <div class="col-md-12">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <asp:Repeater ID="r1" runat="server">
                                        <HeaderTemplate>
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th class="small">UsuarioRemitente</th>
                                                    <th class="small">UsuarioDestino</th>
                                                    <th class="small">Transferencia</th>
                                                    <th class="small">Fecha</th>
                                                    <th class="small">CajaMenorAdmin</th>
                                                    <th class="small">CajaMenorGuarda</th>
                                                    <th class="small">ExcedenteAdmin</th>
                                                    <th class="small">ExcedenteGuarda</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td class="small text-uppercase"><%#Eval("NombreRemitente") %></td>
                                                <td class="small text-uppercase"><%#Eval("NombreDestino") %></td>
                                                <td class="small">$&nbsp;<%#Eval("Transferencia") %></td>
                                                <td class="small"><%#Eval("FechaTransferencia","{0:dd/MM/yyyy}") %></td>
                                                <td class="small">$&nbsp;<%#Eval("CajaMenorAdmin") %></td>
                                                <td class="small">$&nbsp;<%#Eval("CajaMenorGuarda") %></td>
                                                <td class="small">$&nbsp;<%#Eval("ExcedenteAdmin") %></td>
                                                <td class="small">$&nbsp;<%#Eval("ExcedenteGuarda") %></td>
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
        </form>
    </div>
      <script src="../Diseño/assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="../Diseño/assets/js/popper.min.js"></script>
    <script src="../Diseño/assets/js/plugins.js"></script>
    <script src="../Diseño/assets/js/main.js"></script>

<%--    <script src="../Diseño/assets/js/lib/data-table/datatables.min.js"></script>--%>
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
