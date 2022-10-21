<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="VerSCGuardar.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web113" %>
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
    <script>
        function OcultarDisplay() {
            document.getElementById("error1").style.display = "none";
        }
    </script>
    <div id="procesando" class="ventana" style="border-radius: 7px; display: none">
        <h5 class="text-light text-center font-weight-bold">Administrador Trabajando...</h5>
        <img src="../Diseño/Imagenes/oficina.gif" />
    </div>
    <div class="container" id="conta">
        <form id="form1" runat="server">
            <div id="tablero1" runat="server">
                <div class="alert alert-success" id="error" runat="server" style="margin-top: 10px; display: none">
                    <span class="badge badge-pill badge-success">Libre</span>
                    <strong>Esto es genial, tenemos disponibilidad del &nbsp;<asp:Label ID="lblsc" runat="server"></asp:Label>,
                        el día: &nbsp;<asp:Label ID="lblfecha" runat="server"></asp:Label>&nbsp;&nbsp;
                    <p></p>
                        <strong class="font-weight-bold text-secondary">IMPORTANTE:&nbsp;Tienes 3 Dias de corrido para realizar el pago por este medio:&nbsp;<asp:Label ID="lblmsm" runat="server"></asp:Label>,&nbsp;
                        de lo contrario la reserva quedara DISPONIBLE nuevamente.
                    <p></p>
                            Despues de realizar el pago debes terminar la solicitud cargando la imagen del recibo.
                        </strong>
                        <p></p>
                        ¿Deseas reservar el Salon Comunal para esta fecha? 
                    &nbsp;&nbsp;
                        <asp:Button ID="btnsi" OnClick="btnsi_Click" runat="server" Text="Si, Quiero" class="btn-block btn-success font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnno" OnClick="btnno_Click" runat="server" Text="No, gracias. Quiero ver otra Fecha Disponible" class="btn-block btn-secondary font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite" />
                    </strong>
                    <br />
                </div>
                <asp:Label ID="lblMessage" runat="server" BackColor="#EC133F" Font-Bold="True" CssClass="form-control" ForeColor="White" Visible="False"></asp:Label>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="true" ForeColor="White" />
                </td>
                <div id="buscar" runat="server" style="border-radius: 5px">
                   <div class="col-lg-6 col-lg-12">
                    <div class="row">
                            <div class="card col-xs-6 col-lg-4" style="border-radius:7px">
                                <div class=" text-center">
                                    <h5>Buscar Disponibilidad</h5>
                                </div>
                                <div class="card-body">
                                    <p class="font-weight-bold">Elija Salon Comunal</p>
                                    <asp:DropDownList ID="ddsc" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddsc_SelectedIndexChanged" ForeColor="#333333" DataSourceID="SqlDataSource2" DataTextField="SalCom" DataValueField="IdSC" AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>' SelectCommand="SELECT [SalCom], [IdSC] FROM [tblValorSC]"></asp:SqlDataSource>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                        ErrorMessage="la fecha es requerida" ForeColor="Red" ControlToValidate="ddsc" Text="*">
                                    </asp:RequiredFieldValidator>
                                    <p class="font-weight-bold text-danger">Precio:&nbsp;&nbsp;$&nbsp;<asp:Label ID="lblprecio" runat="server" Text=""></asp:Label></p>
                                    <p class="font-weight-bold">Elija Fecha</p>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                        <asp:TextBox ID="txtfecha" runat="server" CssClass="form-control" Text="" TextMode="Date"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                            ErrorMessage="Asigne una fecha para buscar disponibilidad" ForeColor="Red" ControlToValidate="txtfecha" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <p></p>
                                    <div>
                                        <asp:Button ID="btnbuscar" runat="server" OnClientClick="OcultarDisplay()" OnClick="btnbuscar_Click" Text="Buscar" CssClass=" btn-lg btn-block btn-success font-weight-bold form-control border-light animate__animated animate__pulse" />
                                    </div>
                                    &nbsp;&nbsp;&nbsp;
                                </div>
                            </div>
                        <div class="card col-xs-6 col-lg-8" style="border-radius: 7px">
                            <div class="content mt-3">
                                <div class="animated fadeIn">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card" style="border-radius: 7px">
                                                <div class="card-header">
                                                    <strong class="card-title">PROGRAMACION</strong>
                                                </div>
                                                <div class="card-body">
                                                    <div class="sufee-alert alert with-close alert-warning alert-dismissible fade show">
                                                        <span class="badge badge-pill badge-warning">IMPORTANTE</span>
                                                        Administrador si realizas una reserva, debes finalizar la solicitud dando Click en editar y despues en Autorizado para que el vigilante vea el alquiler autorizado.
                                              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                  <span aria-hidden="true">&times;</span>
                                              </button>
                                                    </div>
                                                    <table class="table">
                                                        <asp:Repeater ID="r1" runat="server">
                                                            <HeaderTemplate>
                                                                <thead class="thead-dark" style="border-radius: 5px">
                                                                    <tr>
                                                                        <th><small>Editar</small></th>
                                                                        <th><small>Fecha Solicitud</small></th>
                                                                        <th><small>Ubicacion</small></th>
                                                                        <th><small>Codigo</small></th>
                                                                        <th><small>Estado</small></th>
                                                                        <th><small>Fecha Evento</small></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td><a href="VerSC.aspx?Id=<%#Eval("Id")%>">
                                                                        <small><button class="btn btn-danger font-weight-bold" type="button" style="border-radius: 5px" title="Actualizar"><i class="fa fa-edit">&nbsp;Editar</i></button></small>
                                                                    </a></td>
                                                                    <td><small><%#Eval("FechaSol","{0:d}") %></small</td>
                                                                    <td>
                                                                        <small class="text-secondary"><i class="fa fa-dot-circle-o">&nbsp;<%#Eval("SalCom") %></i></small>
                                                                    <td>
                                                                        <small class="text-danger"><i class="fa fa-building">&nbsp;<%#Eval("Codigo") %></i></small>
                                                                    </td>
                                                                    <td>
                                                                        <small class="text-success"><%#Eval("Estado") %></i></small></td>
                                                                    <td>
                                                                        <small class="text-danger"><i class="fa fa-calendar">&nbsp;<%#Eval("Fecha","{0:d}") %></i></small></td>

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
                        </div>
                    </div>
                </div>
            </div>
                </div>
        </form>
    </div>
</asp:Content>
