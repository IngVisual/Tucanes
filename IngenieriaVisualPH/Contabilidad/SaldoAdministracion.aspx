<%@ Page Title="" Language="C#" MasterPageFile="~/Contabilidad/Contabilidad.Master" AutoEventWireup="true" CodeBehind="SaldoAdministracion.aspx.cs" Inherits="IngenieriaVisualPH.Contabilidad.Formulario_web1" %>
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
        <h5 class="text-light text-center font-weight-bold">Espere un momento por favor....</h5>
        <img src="../Diseño/Imagenes/oficina.gif" />
    </div>
    <div class="container" id="conta">
        <form id="form1" runat="server">
            <div class="card-body">
                <div class="card-title">
                    <h3 class="text-center text-light font-weight-bold">Saldos de Cuenta</h3>
                </div>
            </div>
            <section class="content">
                <div class="row">
                    <div class="col-xs-6 col-lg-6">
                        <div class="card" style="border-radius: 7px">
                            <div class="card-body">
                                <div class="form-group">
                                    <asp:Button ID="btneliminar" style="border-radius:7px" Font-Bold="true" runat="server" class="btn btn-lg btn-danger" Text="Borrar Base" OnClick="btneliminar_Click1" />
                                </div>
                                <td><a href="https://onlineconvertfree.com/es/convert-format/xls-to-csv/">
                                    <button type="button" style="border-radius: 7px" class="btn btn-success btn-sm font-weight-bold"><i class="fa fa-rocket"></i>&nbsp; Convertir de EXCEL a CSV</button></a></td>
                                <br />
                                <br />
                                <div class="form-group">
                                    <p class="font-weight-bold">Adjuntar Excel.CSV</p>
                                    <asp:FileUpload ID="f1" Font-Bold="true" runat="server" CssClass="form-control" />
                                </div>
                                <br />
                                <div class="form-group">
                                    <asp:Button ID="btnbuscar" Style="border-radius: 7px" Font-Bold="true" runat="server" class="btn btn-lg btn-primary" Text="Subir Archivo" OnClick="btnbuscar_Click" />
                                </div>
                                <br />
                                <asp:Label ID="lblmensage" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-lg-6">
                        <div class="card" style="border-radius: 7px">
                            <div class="card-body">
                                <p class="font-weight-bold">Fecha Actualizacion __<asp:Label ID="lblfecha" runat="server" CssClass="font-weight-bold text-success"></asp:Label></p>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    <asp:TextBox ID="txtfecha" runat="server" CssClass="form-control" Text="" TextMode="Date"></asp:TextBox>
                                    <p></p>
                                </div>
                                <div class="alert alert-danger" runat="server" style="display: none" id="error3">
                                    <strong>Ingrese Fecha</strong>
                                </div>
                                <p></p>
                                <p class="font-weight-bold">Mensaje</p>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-mail-reply"></i></div>
                                    <asp:TextBox ID="txtres" ForeColor="Red" CssClass="form-control" MaxLength="300" runat="server" Text="Ingrese su Mensaje" TextMode="MultiLine" Enabled="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                        ErrorMessage="Asigne un Mensaje" ForeColor="Red" ControlToValidate="txtres" Text="*">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <p></p>
                                <div class="form-group">
                                    <asp:Button ID="btnnot" Style="border-radius: 7px" Font-Bold="true" runat="server" class="btn btn-lg btn-success" Text="Enviar Notificacion" OnClick="btnnot_Click"/>
                                    <div class="alert alert-success" runat="server" style="display: none; margin-top:10px" id="div1">
                                        <strong>Actualizado Correctamente</strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <br />
            <asp:Label ID="lblMessage" runat="server" Font-Bold="true" />
            <br />
            <div class="card" style="border-radius:7px">
                <div class="card-body">
                    <div class="col-xs-6 col-sm-3">
                        <div class="alert alert-danger" runat="server" style="display: none" id="error1">
                            <strong>Ingrese Codigo</strong>
                        </div>
                        <div class="form-group">
                            <label class=" form-control-label font-weight-bold text-dark">Buscar por Codigo</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-search"></i></div>
                                <asp:TextBox ID="txtbuscar" TextMode="Number" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtbuscar_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                    </div>
            <section id="tabsc">
                <div class="content mt-3">
                    <div class="animated fadeIn">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card" style="border-radius: 7px">
                                    <div class="card-header">
                                        <strong class="card-title">Tabla de Saldos</strong>
                                    </div>
                                    <div class="card-body">
                                        <table class="table">
                                            <asp:Repeater ID="r1" runat="server">
                                                <HeaderTemplate>
                                                    <thead class="thead-dark" style="border-radius: 5px">
                                                        <tr>                                                            
                                                            <th><small>Editar<small></th>
                                                            <th><small>Codigo</small></th>
                                                            <th><small>Administracion<small></th>
                                                            <th><small>Intereses<small></th>
                                                            <th><small>Deposito<small></th>
                                                            <th><small>Parqueaderos<small></th>
                                                            <th><small>Sanciones<small></th>
                                                            <th><small>Extraordinaria<small></th>
                                                            <th><small>Total a Pagar<small></th>
                                                            <th><small>Saldo a Favor<small></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><a href="VerSaldos.aspx?Id=<%#Eval("Codigo")%>">
                                                            <button class="btn btn-primary font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button>
                                                        </a></td>
                                                           <td><small class="text-danger"><i class="fa fa-building">&nbsp;<%#Eval("Codigo") %></i></small></td>
                                                            <td><small class="text-dark"><i class="fa fa-usd">&nbsp;<%#Eval("Admi") %></i></small></td>
                                                        <td>
                                                            <small class="text-dark"><i class="fa fa-usd">&nbsp;<%#Eval("Favor") %></i></small></td>
                                                        <td>
                                                            <small class="text-dark"><i class="fa fa-usd">&nbsp;<%#Eval("Inter") %></i></small></td>
                                                        <td>
                                                            <small class="text-dark"><i class="fa fa-usd">&nbsp;<%#Eval("Sancion") %></i></small></td>
                                                        <td>
                                                            <small class="text-dark"><i class="fa fa-usd">&nbsp;<%#Eval("Moto") %></i></small></td>
                                                        <td>
                                                            <small class="text-dark"><i class="fa fa-usd">&nbsp;<%#Eval("Carro") %></i></small></td>
                                                        <td>
                                                            <small class="text-danger"><i class="fa fa-usd">&nbsp;<%#Eval("Total") %></i></small></td>
                                                        <td>
                                                            <small class="text-success"><i class="fa fa-usd">&nbsp;<%#Eval("Juridico") %></small></td>
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
                    </div>
                </div>
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
                $(document).ready(function () {
                    $('#bootstrap-data-table-export').DataTable();
                });
            </script>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </form>

    </div>
</asp:Content>
