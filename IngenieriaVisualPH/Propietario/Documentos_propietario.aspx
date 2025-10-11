<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="Documentos_propietario.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web126" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <link href="../Diseño/Color.css" rel="stylesheet" />
       <link href="../Diseño/Banner.css" rel="stylesheet" />
       <link href="../Diseño/Firma.css" rel="stylesheet" />
    <script>
        function cerrarVideo() {
            var video = document.getElementById("miVideo");
            video.pause();
        }
        function pregunta1SI() {
            document.getElementById("pregunta1").style.display = "none";
            document.getElementById("form1").style.display = "block";
        }
        function ContratoSI() {
            document.getElementById("form1").style.display = "none";
            document.getElementById("form2").style.display = "block";
        }
        function Opcion1() {
            document.getElementById("opcion1").style.display = "block";
            document.getElementById("opcion2").style.display = "none";
            document.getElementById("opcion3").style.display = "none";
            document.getElementById("rd1").checked = true;
            document.getElementById("rd2").checked = false;

        }
        function Opcion2() {
            document.getElementById("opcion1").style.display = "none";
            document.getElementById("opcion2").style.display = "block";
            document.getElementById("opcion3").style.display = "none";
            document.getElementById("rd1").checked = false;
            document.getElementById("rd2").checked = true;
        }
        function Opcion3() {
            document.getElementById("opcion1").style.display = "none";
            document.getElementById("opcion2").style.display = "none";
            document.getElementById("opcion3").style.display = "block";
            document.getElementById("rd1").checked = false;
            document.getElementById("rd2").checked = false;
        }
    </script>
    <script>
        function DesactivarBoton() {
            document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
            document.getElementById('<%=btnenviardocuemnto.ClientID%>').disabled = true;
            document.getElementById('<%=FileUpload1.ClientID%>').disabled = true;
            document.getElementById('<%=FileUpload2.ClientID%>').disabled = true;
        document.getElementById('<%=FileUpload3.ClientID%>').disabled = true;
        document.getElementById('<%=FileUpload4.ClientID%>').disabled = true;
            document.getElementById('<%=FileUpload5.ClientID%>').disabled = true;
        }
        window.onbeforeunload = DesactivarBoton;
    </script>
    <script>
        function f1SI() {
            document.getElementById("foto1").style.display = "none";
            document.getElementById("foto2").style.display = "block";
        }
        function f2SI() {
            document.getElementById("foto2").style.display = "none";
            document.getElementById("foto3").style.display = "block";
        }
        function f3SI() {
            document.getElementById("foto3").style.display = "none";
            document.getElementById("foto4").style.display = "block";
        }
        function f4SI() {
            document.getElementById("foto4").style.display = "none";
            document.getElementById("foto5").style.display = "block";
        }
        function f5SI() {
            document.getElementById("form3").style.display = "none";
            document.getElementById("button").style.display = "block";
        }
        function f2NO() {
            document.getElementById("foto1").style.display = "block";
            document.getElementById("foto2").style.display = "none";
        }
        function f3NO() {
            document.getElementById("foto2").style.display = "block";
            document.getElementById("foto3").style.display = "none";
        }
        function f4NO() {
            document.getElementById("foto3").style.display = "block";
            document.getElementById("foto4").style.display = "none";
        }
        function f5NO() {
            document.getElementById("foto4").style.display = "block";
            document.getElementById("foto5").style.display = "none";
        }
        function f6NO() {
            document.getElementById("form3").style.display = "block";
            document.getElementById("foto5").style.display = "block";
            document.getElementById("button").style.display = "none";
        }
    </script>
<%--El plazo para la carga de documentos ya venció.
<div style="display:none;">--%>
    <div id="procesando" class="ventana3">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando Solicitud.....</h5>
    </div>

    <div class="container" id="conta">
        <h3 class="text-center textocolorinfo font-weight-bold">Solicitud de Parqueadero</h3>
         <br />
        <button type="button" class="btn btn-primary rounded" data-toggle="modal" data-target="#videoModal">
            Ver Video Ayuda
        </button>
        <br />
        <td colspan="2">
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" CssClass="form-control alert alert-danger" Visible="False"></asp:Label>
        </td>
        <div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="videoModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-fullscreen-md-down" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="videoModalLabel">Play para iniciar</h5>
                        <button type="button" onclick="cerrarVideo()" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <video id="miVideo" width="100%" controls>
                            <source src="../Diseño/videos/documentoparqueadero.mp4" type="video/mp4">
                        </video>
                    </div>
                    <div class="modal-footer">
                        <button id="cerrarModalBtn" onclick="cerrarVideo()" type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <form id="fo1" runat="server">
            <div id="mensaje" runat="server" style="display: none">
                <div class="col-lg-6">
                    <div class="alert alert-warning">
                        <span class="badge badge-pill badge-secondary">Importante</span>
                        <strong class="h6">
                            <asp:Label ID="lblmsg2" runat="server"></asp:Label>
                        </strong>
                        <br />
                    </div>
                </div>
            </div>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="text-danger font-weight-bold" />
            </td>
            <div id="pregunta1">
               <strong class="card-title textocolorinfo font-weight-bold">¿Tienes listos los siguientes documentos en foto para adjuntar? Estos se pueden adjuntar como CAPTURAS DE PANTALLA para que la solicitud cargue más rapido. </strong>
                 <p></p>
                <p>TODOS LOS DOCUMENTOS SON OBLIGATORIOS (NO ACEPTA PDF)</p>
                <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">CEDULA</i></p>
                <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">SOAT</i></p>
                <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">TARJETA DE PROPIEDAD</i></p>
                <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">TECNO-MECANICA. Si no tiene, debe adjuntar otra foto del vehiculo</i></p>
                <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">FOTO DEL VEHICULO</i></p>
                <br />
                <p>
                    <button id="btn1" onclick="pregunta1SI()" type="button" class="btn btn-lg btncolorinfo border border-light font-weight-bold" style="border-radius: 3px">Si, Los tengo listos</button>
                </p>
            </div>
            <div id="form1" style="display: none">
                <div class="card bordercolorinfo">
                    <div class="card-header">
                        <strong>Politicas de Parqueaderos</strong>
                    </div>
                    <div class="card-body">
                        <p>
                            <button id="btn2" onclick="ContratoSI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Acepto</button>
                        </p>
                        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div id="form2" style="display: none">
                <h5 class="text-center form-control btncolorinfo font-weight-bold animate__animated animate__pulse animate__infinite">IMPORTANTE: Es una solicitud por parqueadero, si tiene otro vehiculo debe hacer otra solicitud. Gracias</h5>
                <br />
                <div id="opcion" class="card bordercolorinfo">
                    <div class="card-header">
                        <strong class="card-title">Seleccione tipo de Parqueadero</strong>
                    </div>
                    <div class="card-body">
                        <input id="rd1" type="radio" onclick="Opcion1()" />Parqueadero para Carro
                      <p></p>
                        <input id="rd2" type="radio" onclick="Opcion2()" />Parqueadero para Moto
                       <p></p>
                        <div class="form-group" id="opcion1" style="display: none">
                            <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Placa para parqueadero de CARRO</label>
                            <asp:TextBox ID="txtplacacar" runat="server" CssClass="form-control" placeholder="Ingrese Placa Carro" MaxLength="6"></asp:TextBox>
                        </div>
                        <div class="form-group" id="opcion2" style="display: none">
                            <label for="" class="control-label mb-1 textocolorinfo  font-weight-bold">Placa para parqueadero de MOTO</label>
                            <asp:TextBox ID="txtplacamot" runat="server" CssClass="form-control" placeholder="Ingrese Placa Moto" MaxLength="6"></asp:TextBox>
                        </div>
                        <div class="form-group" id="opcion3" style="display: none">
                            <div class="alert alert-success" id="error1" runat="server" style="margin-top: 10px;">
                                <span class="badge badge-pill badge-success">IMPORTANTE</span>
                                Esta opcion es para moto y carro en un solo parqueadero, sin embargo debe hacer una solicitud para cada vehIculo, seleccionando siempre la opcion de CARRO-MOTO.
                                              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                  <span aria-hidden="true">&times;</span>
                                              </button>
                            </div>
                            <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Placas para parqueadero de CARRO-MOTO Compartido</label>
                            <asp:TextBox ID="txtcarmot" runat="server" CssClass="form-control" placeholder="Ingrese Placas Moto-Carro" MaxLength="15"></asp:TextBox>
                        </div>
                        <p></p>
                        <div class="form-group">
                            <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Color/Marca/Modelo</label>
                            <asp:TextBox ID="txtcolor" runat="server" CssClass="form-control" MaxLength="50" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                ErrorMessage="Color, modelo y marca son requeridos" ControlToValidate="txtcolor" Text="*">
                            </asp:RequiredFieldValidator>
                            <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">N°Tarjeta de Propiedad</label>
                            <asp:TextBox ID="txttarjeta" runat="server" TextMode="Number" CssClass="form-control" MaxLength="11"></asp:TextBox>
                            <asp:Label ID="lbltp" runat="server" Visible="false"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                ErrorMessage="Numero de tarjeta de propiedad es requerido" ControlToValidate="txttarjeta" Text="*">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblperdida" runat="server" Text="¿Para quien es el parqueadero? " CssClass="textocolorinfo font-weight-bold"></asp:Label>
                            <asp:DropDownList ID="ddcanti" runat="server" CssClass="form-control" ForeColor="Red">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Propietario</asp:ListItem>
                                <asp:ListItem>Inquilino</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorusuario" runat="server" Display="Dynamic"
                                ErrorMessage="Debe llenar la casilla ¿para quien es el parqueadero?" ControlToValidate="ddcanti" Text="*">
                            </asp:RequiredFieldValidator>
                        </div>
                        <p></p>
                    </div>
                </div>
                <div class="card bordercolorinfo" id="form3">
                    <div class="card-header">
                        <strong class="card-title">Ingrese las Imagenes o fotos de manera ordenada</strong>
                    </div>
                    <div class="card-body">
                        <div class="form-group" id="foto1">
                            <asp:Label ID="Label5" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="CEDULA(Cara de frente)" Font-Bold="True"></asp:Label>
                            <asp:FileUpload ID="FileUpload1" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                ErrorMessage="IMAGEN DE LA CEDULA requerida" ControlToValidate="FileUpload1" Text="* Requerido">
                            </asp:RequiredFieldValidator>
                            <label class="text-danger">Click en Seleccionar Archivo para buscar tu IMAGEN y despues Click en Siguiente</label>
                            <p></p>
                            <p>
                                <button id="f1" onclick="f1SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente >></button>
                            </p>
                        </div>
                        <div class="form-group" id="foto2" style="display: none">
                            <asp:Label ID="Label1" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="SOAT" Font-Bold="True"></asp:Label>
                            <asp:FileUpload ID="FileUpload2" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                                ErrorMessage="IMAGEN DEL SOAT requerida" ControlToValidate="FileUpload2" Text="* Requerido">
                            </asp:RequiredFieldValidator>
                            <label class="text-danger">Click en Seleccionar Archivo para buscar tu IMAGEN y despues Click en Siguiente</label>
                            <p></p>
                            <p>
                                <button id="f2no" onclick="f2NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                <button id="f2" onclick="f2SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                            </p>
                        </div>
                        <div class="form-group" id="foto3" style="display: none">
                            <asp:Label ID="Label2" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="TARJETA DE PROPIEDAD(Cara de frente)" Font-Bold="True"></asp:Label>
                            <asp:FileUpload ID="FileUpload3" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfos" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic"
                                ErrorMessage="IMAGEN DE LA TARJETA DE PROPIEDAD requerida" ControlToValidate="FileUpload3" Text="* Requerido">
                            </asp:RequiredFieldValidator>
                            <label class="text-danger">Click en Seleccionar Archivo para buscar tu IMAGEN y despues Click en Siguiente</label>
                            <p></p>
                            <p>
                                <button id="f3no" onclick="f3NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                <button id="f3" onclick="f3SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                            </p>
                        </div>
                        <div class="form-group" id="foto4" style="display: none">
                            <asp:Label ID="Label3" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="TECNO-MECANICA(Cara de frente)(Vehiculo nuevo NO)" Font-Bold="True"></asp:Label>
                            <asp:FileUpload ID="FileUpload4" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                            <label class="text-danger">Click en Seleccionar Archivo para buscar tu IMAGEN y despues Click en Siguiente</label>
                            <p></p>
                            <p>
                                <button id="f4no" onclick="f4NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                <button id="f4" onclick="f4SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                            </p>
                        </div>
                        <div class="form-group" id="foto5" style="display: none">
                            <asp:Label ID="Label4" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="FOTO VEHICULO" Font-Bold="True"></asp:Label>
                            <asp:FileUpload ID="FileUpload5" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic"
                                ErrorMessage="IMAGEN DEL VEHICULO requerida" ControlToValidate="FileUpload5" Text="* Requerido">
                            </asp:RequiredFieldValidator>
                            <label class="text-danger">Click en Seleccionar Archivo para buscar tu IMAGEN y despues Click en Siguiente</label>
                            <p></p>
                            <p>
                                <button id="f5no" onclick="f5NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                <button id="f5" onclick="f5SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                            </p>
                        </div>
                    </div>
                </div>
                <br />
                <div id="button" style="display: none">
                    <p></p>
                    <p>
                        <button id="f6no" onclick="f6NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                    </p>
                    <asp:Button ID="btnenviardocuemnto" runat="server" Font-Bold="true" class="btn-block btn-lg btncolorinfo border border-light " Text="Enviar Solicitud" OnClick="btnenviardocuemnto_Click" />
                </div>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </form>
    </div>
<%--</div>--%>
</asp:Content>
