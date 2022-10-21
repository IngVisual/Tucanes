<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="VerificarDisponibilidadSC.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web142" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <link href="../Diseño/Banner.css" rel="stylesheet" />
    <script>
        function DesactivarBoton() {
            document.getElementById("conta").style.display = "none"
            document.getElementById('<%=btnsi.ClientID%>').disabled = true;
            document.getElementById("procesando").style.display = "block"
            document.getElementById("error").style.display = "none"
        }
        window.onbeforeunload = DesactivarBoton;
    </script>
    <script>
        function OcultarDisplay() {
            document.getElementById("error1").style.display = "none";
        }
    </script>
    <div id="procesando" class="ventana3" style="display: none">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando Imagenes.....</h5>
    </div>
    <div class="container" id="conta">
        <h3 class="text-center textocolorinfo font-weight-bold">Solicitud Salon Comunal</h3>
        <br />
        <form id="fo1" runat="server">
            <div id="tablero1" runat="server">
                <div class="alert alert-success" id="error" runat="server" style="margin-top: 10px; display: none">
                    <div id="mensaje2" runat="server">
                        <div class="col-lg-6">
                                    <div class="alert alert-warning">
                                        <span class="badge badge-pill badge-secondary">Importante</span>
                                        <strong>
                                            <asp:Label ID="lblmag23" runat="server"></asp:Label>
                                        </strong>
                                        <br />
                                    </div>
                        </div>
                    </div>
                    <span class="badge badge-pill badge-success">Libre</span>
                    <strong>Esto es genial, tenemos disponibilidad del &nbsp;<asp:Label ID="lblsc" runat="server"></asp:Label>,
                        el día: &nbsp;<asp:Label ID="lblfecha" runat="server"></asp:Label>&nbsp;&nbsp;
                    <p></p>
                        <strong class="font-weight-bold text-secondary">IMPORTANTE:&nbsp;Tienes 3 Dias de corrido para realizar el pago por este medio:&nbsp;<asp:Label ID="lblmsm" runat="server"></asp:Label>,&nbsp;
                        de lo contrario la reserva quedara DISPONIBLE nuevamente.
                    <p></p>
                            Despues de realizar el pago debes terminar la solictud cargando la imagen del recibo.
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
                <p></p>
                <div class="alert alert-danger" id="error1" runat="server" style="margin-top: 10px;">
                    <div id="mensaje" runat="server">
                        <div class="col-lg-6">
                            <div class="card" style="border-radius: 7px">
                                <div class=" card-body">
                                    <div class="alert alert-warning">
                                        <span class="badge badge-pill badge-secondary">Importante</span>
                                        <strong>
                                            <asp:Label ID="lblmsg22" runat="server"></asp:Label>
                                        </strong>
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <span class="badge badge-pill badge-danger">Leer con Atención</span>
                    <p></p>
                    <strong class="text-danger font-weight-bold">Para separar el Salon Comunal debe seguir los siguientes pasos:</strong>
                    <p></p>
                    <p class="text-dark font-weight-bold"><strong class="text-danger font-weight-bold">Pirmero:</strong> Debe ingresar Tipo de Salón Comunal y fecha del evento.</p>
                    <p class="text-dark font-weight-bold"><strong class="text-danger font-weight-bold">Segundo:</strong> Si la fecha esta disponible puede separar el Salon Comunal.</p>
                    <p class="text-dark font-weight-bold"><strong class="text-danger font-weight-bold">Tercero:</strong> Después de separar el Salón Comunal tiene 3 días de corrido para pagar y cargar el recibo de pago.</p>
                    <p class="text-dark font-weight-bold"><strong class="text-danger font-weight-bold">Cuarto:</strong> Si al pasar los 3 dias no ha enviado la solicitud con el recibo de pago, El Salon Comunal quedara disponible nuevamente.</p>
                    <p class="text-dark font-weight-bold"><strong class="text-danger font-weight-bold">Quinto:</strong> Debe estar al día en cartera con la Administación.</p>
                    <p></p>
                </div>
                <div class="card bordercolorinfo" id="buscar" runat="server" style="border-radius: 5px">
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" CssClass="form-control alert alert-danger" Visible="False"></asp:Label>
                    <td colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="true" ForeColor="Red" />
                    </td>
                    <div class=" text-center">
                        <h5>Buscar Disponibilidad</h5>
                    </div>
                    <div class="card-body">
                        <p class="font-weight-bold textocolorinfo">Elija Salon Comunal</p>
                        <asp:DropDownList ID="ddsc" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddsc_SelectedIndexChanged" ForeColor="#333333" DataSourceID="SqlDataSource2" DataTextField="SalCom" DataValueField="IdSC" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>' SelectCommand="SELECT [SalCom], [IdSC] FROM [tblValorSC]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                            ErrorMessage="la fecha es requerida" ForeColor="Red" ControlToValidate="ddsc" Text="*">
                        </asp:RequiredFieldValidator>
                        <p class="font-weight-bold text-danger">Precio:&nbsp;&nbsp;$&nbsp;<asp:Label ID="lblprecio" runat="server" Text=""></asp:Label></p>
                        <p class="font-weight-bold textocolorinfo">Elija Fecha</p>
                        <div class="input-group">
                            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                            <asp:TextBox ID="txtfecha" runat="server" CssClass="form-control" Text="" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                ErrorMessage="Asigne una fecha para buscar disponibilidad" ForeColor="Red" ControlToValidate="txtfecha" Text="*">
                            </asp:RequiredFieldValidator>
                        </div>
                        <p></p>
                        <div>
                            <asp:Button ID="btnbuscar" runat="server" OnClientClick="OcultarDisplay()" OnClick="btnbuscar_Click" Text="Buscar" CssClass=" btn-lg btn-block btncolorinfo  font-weight-bold form-control border-light animate__animated animate__pulse" />
                        </div>
                        &nbsp;&nbsp;&nbsp;
                    </div>
                </div>
                <div id="programacion" runat="server">
                    <h3 class="font-weight-bold text-capitalize textocolorinfo text-center">PROGRAMACIÓN</h3>
                    <p></p>
                    <asp:Repeater ID="r1" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-3 col-md-6">
                                <div class="card bordercolorinfo" style="border-radius: 5px">
                                    <div class="card-body">
                                        <div class="stat-widget-one">
                                            <div class="stat-icon dib"><i class="ti-calendar text-success border-success"></i></div>
                                            <div class="stat-content dib">
                                                <h5 class="stat-text text-success">
                                                    <asp:Label ID="label1" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("Fecha","{0:d}") %></asp:Label></h5>
                                                <h5 class="stat-text text-success">Valor de Alquiler $&nbsp
                                                    <asp:Label ID="label4" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("ValorSC") %></asp:Label></h5>
                                                <h5 class="stat-text text-success">Vivienda: &nbsp;&nbsp
                                                    <asp:Label ID="label5" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("Codigo") %></asp:Label></h5>
                                                <div class="stat-digit">
                                                    &nbsp;&nbsp<h5 class="text-primary font-weight-bold">
                                                        <asp:Label ID="label2" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("SalCom") %></asp:Label></h5>
                                                </div>
                                                <div class="row">
                                                    <div>
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    &nbsp;&nbsp<div class="text-light">
                                                        <asp:Label ID="label3" runat="server" BackColor="#3366cc" Font-Size="Smaller" CssClass="text-light font-weight-bold form-control"><%#Eval("Estado") %></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
            </div>
            <div id="tablero2" runat="server">
                <asp:Label ID="lblid" runat="server" Text="" Visible="false"></asp:Label>
                <div class="alert alert-secondary" id="error4" runat="server" style="margin-top: 10px;">
                    <span class="badge badge-pill badge-success">Listo</span>
                    <strong>Perfecto, ya esta reservado. El siguiente paso es realizar el pago por este medio: &nbsp;<asp:Label ID="lblmsg2" runat="server"></asp:Label>
                        <p></p>
                        <strong class="text-danger font-weight-bold">IMPORTANTE: Tienes plazo de pagar hasta la fecha: &nbsp;<asp:Label ID="lblfechapago" runat="server"></asp:Label>&nbsp;&nbsp;</strong>
                        <p></p>
                        <strong class="font-weight-bold text-secondary">Cuando tengas listo el recibo, debes ingresar nuevamente para finalizar la solicitud.&nbsp;
                        </strong>
                        <p></p>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnfinSol" OnClick="btnfinSol_Click" runat="server" Text="Finalizar Solictud" OnClientClick="return confirm('¿Tiene listo su recibo de pago?');" class="btn-block btn-success font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btncancelar" OnClick="btncancelar_Click" runat="server" Text="Cancelar Reserva" OnClientClick="return confirm('¿Esta seguro(a) de cancelar la reserva?');" class="btn-block btn-danger font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite" />
                    </strong>
                    <br />
                </div>
                <br />
                <asp:Repeater ID="r2" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-6">
                            <div class="card bordercolorinfo" style="border-radius: 5px">
                                <div class="card-body">
                                    <div class="stat-widget-one">
                                        <div class="stat-icon dib"><i class="ti-calendar text-success border-success"></i></div>
                                        <div class="stat-content dib">
                                            <h5 class="stat-text text-success">
                                                <asp:Label ID="label1" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("Fecha","{0:d}") %></asp:Label></h5>
                                            <h5 class="stat-text text-success">Valor de Alquiler $&nbsp
                                                    <asp:Label ID="label4" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("ValorSC") %></asp:Label></h5>
                                            <h5 class="stat-text text-success">Vivienda: &nbsp;&nbsp
                                                    <asp:Label ID="label5" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("Codigo") %></asp:Label></h5>
                                            <div class="stat-digit">
                                                &nbsp;&nbsp<h5 class="text-primary font-weight-bold">
                                                    <asp:Label ID="label2" runat="server" CssClass="text-secondary font-weight-bold"><%#Eval("SalCom") %></asp:Label></h5>
                                            </div>
                                            <div class="row">
                                                <div>
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                &nbsp;&nbsp<div class="text-light">
                                                    <asp:Label ID="label3" runat="server" BackColor="#339933" Font-Size="Smaller" CssClass="text-light font-weight-bold form-control"><%#Eval("Estado") %></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </form>
    </div>
</asp:Content>
