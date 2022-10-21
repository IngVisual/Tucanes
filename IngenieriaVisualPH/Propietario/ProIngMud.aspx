<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProIngMud.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web135" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <link href="../Diseño/Banner.css" rel="stylesheet" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
      <script src="https://cdn.rawgit.com/mobomo/sketch.js/master/lib/sketch.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/signature_pad/1.5.3/signature_pad.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.16.1/lodash.min.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {

            var canvas = document.getElementById("signature");
            var signaturePad = new SignaturePad(canvas);

            $('#clear-signature').on('click', function () {
                signaturePad.clear();
            });

        });
        $(function () {
            $('#signature').sketch();
        });
        function ConvertToImage(btnenviardocuemnto) {
            var base64 = $('#signature')[0].toDataURL();
            $("[id*=hfImageData]").val(base64);
            __doPostBack(btnenviardocuemnto.name, "");
        };
    </script>
    <script>
        function pregunta1SI() {
            document.getElementById("pregunta1").style.display = "none";
            document.getElementById("form1").style.display = "block";
        }
        function ContratoSI() {
            document.getElementById("form1").style.display = "none";
            document.getElementById("form2").style.display = "block";
        }
    </script>
    <script>
        function DesactivarBoton() {
            document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block";
            document.getElementById('<%=btnenviardocuemnto.ClientID%>').disabled = true;
            document.getElementById('<%=FileUpload1.ClientID%>').disabled = true;
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
            document.getElementById("foto5").style.display = "none";
            document.getElementById("foto6").style.display = "block";
        }
        function f6SI() {
            document.getElementById("foto6").style.display = "none";
            document.getElementById("foto7").style.display = "block";
        }
                function f7SI() {
            document.getElementById("foto7").style.display = "none";
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
            document.getElementById("foto5").style.display = "block";
            document.getElementById("foto6").style.display = "none";
        }
                function f7NO() {
            document.getElementById("foto6").style.display = "block";
            document.getElementById("foto7").style.display = "none";
        }

    </script>
    <div id="procesando" class="ventana3">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando Solicitud.....</h5>
    </div>
    <div class="container" id="conta">
        <h3 class="text-center textocolorinfo font-weight-bold">Ingreso de Mudanza Completa</h3>
        <td colspan="2">
            <asp:Label ID="lblMessage3" runat="server" Font-Bold="True" CssClass="form-control alert alert-danger" Visible="False"></asp:Label>
        </td>
        <td colspan="2">
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" CssClass="form-control alert alert-danger" Visible="False"></asp:Label>
        </td>
        <td colspan="2">
            <asp:Label ID="lblMessage2" runat="server" Font-Bold="True" CssClass="form-control alert alert-danger" Visible="False"></asp:Label>
        </td>
        <br />
        <form id="fo1" runat="server">
            <div id="mensaje" runat="server" style="display: none">
                <div class="col-lg-6">
                    <div class="alert alert-warning">
                        <span class="badge badge-pill badge-secondary">Importante</span>
                        <strong>
                            <asp:Label ID="lblmsg22" runat="server"></asp:Label>
                        </strong>
                        <br />
                    </div>
                </div>
            </div>
            <div id="pregunta1">
                 <strong class="card-title textocolorinfo font-weight-bold">¿Tienes listos los siguientes documentos para adjuntar o tomarles foto? </strong>
                <p></p>
                <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">NUMERO DE CELULAR INQUILINO NUEVO</i></p>
                <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">NOMBRES COMPLETOS DE LAS PERSONAS QUE VAN HABITAR EL PREDIO</i></p>
                <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">FOTO DE LA CEDULA DEL PROPIETARIO  <asp:Label ID="lblpro" runat="server" Font-Bold="true" CssClass="textocolorinfo" Text=""></asp:Label> en Formato Imagen png, jpg, jpeg, foto directa o captura de pantalla </i></p>
                 <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">UN SOLO PDF con los siguientes documentos de las personas que van habitar el predio: </i></p>
               
                <div class="alert alert-danger" id="error1" runat="server" style="margin-top: 10px;">
                    <span class="badge badge-pill badge-danger">Leer con Atención (PDF)</span>
                    <p></p>
                    <p class="text-dark font-weight-bold">Pirmero: Cedulas de ciudadania de los mayores de 18.</p>
                    <p class="text-dark font-weight-bold">Segundo: Documentos de Identidad de los menores de 18.</p>
                    <p class="text-dark font-weight-bold">Tercero: Antecedentes de Policia de los mayores de 18.</p>
                    <p class="text-dark font-weight-bold">Cuarto: Sin son extranjeros imagenes del PEP</p>
                    <p></p>
                </div>
                <div class="alert alert-primary" id="error" runat="server" style="margin-top: 10px;">
                    IMPORTANTE: Si no adjunta el PDF con los documentos completos, por norma del conjunto no se podra AUTORIZAR la Mudanza.
                </div>
                <br />
                <p>
                    <button id="btn1" onclick="pregunta1SI()" type="button" class=" btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Si, Los tengo listos</button>
                </p>
            </div>
            <div id="form1" style="display: none">
                <div class="card bordercolorinfo">
                    <div class="card-header">
                        <strong>Politicas de Mudanzas</strong>
                    </div>
                    <div class="card-body">
                        <p>
                            <button id="btn2" onclick="ContratoSI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Acepto</button>
                        </p>
                        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                        <p></p>
                    </div>
                </div>
            </div>
            <div id="form2" style="display: none">
                <div class="card bordercolorinfo">
                    <td colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger font-weight-bold" />
                    </td>
                    <div class="form-group" id="foto1">
                        <div class="card-body">
                            <label for="" class="control-label mb-1 textocolorinfo font-weight-bold"># Cedula del Propietario:--</label><asp:Label ID="lblpropie" CssClass="font-weight-bold text-success" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtcedula" runat="server" TextMode="Number" CssClass="form-control" MaxLength="12"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                ErrorMessage="# Cedula requerida" ControlToValidate="txtcedula" Text="* Requerido">
                            </asp:RequiredFieldValidator>
                            <p></p>
                            <p>
                                <button id="f1" onclick="f1SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente >></button>
                            </p>
                        </div>
                    </div>
                    <div class="form-group" id="foto2" style="display: none">
                        <div class="card-body">
                            <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Nombre de la persona encargada del ingreso</label>
                            <asp:TextBox ID="txtencargado" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                ErrorMessage="Nombre encargado del ingreso es requerido" ControlToValidate="txtencargado" Text="* Requerido">
                            </asp:RequiredFieldValidator>
                            <p></p>
                            <p>
                                <button id="f2no" onclick="f2NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                <button id="f2" onclick="f2SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                            </p>
                        </div>
                    </div>
                    <div class="form-group" id="foto3" style="display: none">
                        <div class="card-body">
                            <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Fecha DESDE:</label>
                            <asp:TextBox ID="txtfechaini" runat="server" TextMode="Date" Enabled="false" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                                ErrorMessage="Fecha inicial es requerido" ControlToValidate="txtfechaini" Text="* Requerido">
                            </asp:RequiredFieldValidator>
                            <p></p>
                            <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Fecha HASTA:</label>
                            <asp:TextBox ID="txtfechafin" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic"
                                ErrorMessage="Fecha final es requerido" ControlToValidate="txtfechafin" Text="* Requerido">
                            </asp:RequiredFieldValidator>
                            <p></p>
                            <p>
                                <button id="f3no" onclick="f3NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                <button id="f3" onclick="f3SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                            </p>
                        </div>
                    </div>
                    <div class="form-group" id="foto4" style="display: none">
                        <div class="card-body">
                            <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Observacion breve de la Mudanza</label>
                            <asp:TextBox ID="txtarticulos" runat="server" MaxLength="50" Text="Opcional" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            <p></p>
                            <p>
                                <button id="f4no" onclick="f4NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                <button id="f4" onclick="f4SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                            </p>
                        </div>

                    </div>
                    <div class="form-group" id="foto5" style="display: none">
                        <div class="card-body">
                            <asp:Label ID="Label5" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="CEDULA DE PROPIETARIO (Cara de frente donde se vea el NUMERO DE CEDULA Y FIRMA) Formato png,jpg,jpeg" Font-Bold="True"></asp:Label>
                            <asp:FileUpload ID="FileUpload1" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic"
                                ErrorMessage="IMAGEN DE LA CEDULA requerida" ControlToValidate="FileUpload1" Text="* Requerido">
                            </asp:RequiredFieldValidator>
                            <label class="text-danger">Click en Seleccionar Archivos para buscar tu IMAGEN</label>
                        </div>
                        <br />
                        <div class="card-body">
                            <asp:Label ID="Label2" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="SUBIR PDF con la documentacion solicitada, formato .pdf" Font-Bold="True"></asp:Label>
                            <asp:FileUpload ID="FileUpload2" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                ErrorMessage="PDF con documentos es requerido" ControlToValidate="FileUpload2" Text="* Requerido">
                            </asp:RequiredFieldValidator>
                            <label class="text-danger">Click en Seleccionar Archivos para buscar tu PDF y despues Click en Siguiente</label>
                            <p></p>
                            <p>
                                <button id="f5no" onclick="f5NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                <button id="f5" onclick="f5SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                            </p>
                        </div>
                    </div>
                    <div class="form-group" id="foto6" style="display: none">
                        <div>
                            <asp:Label ID="Label1" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="INGRESE FIRMA PROPIETARIO" Font-Bold="True"></asp:Label>
                            <br />

                            <div class="clear-btn">
                                <button id="clear-signature" type="button" data-tool="eraser" class="btn-block btn-secondary btn-lg border border-success font-weight-bold"><span>Borrar </span></button>
                            </div>
                            <div class="card">
                                <div class="card-body border border-primary">
                                    <canvas id="signature" width="350" height="200"></canvas>
                                </div>
                            </div>
                            <asp:HiddenField ID="hfImageData" runat="server" />
                            <p></p>
                            <p></p>
                            <p></p>
                            <p></p>
                            <p>
                                <button id="f6no" onclick="f6NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                <button id="f6" onclick="f6SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                            </p>
                        </div>
                    </div>
                    <div id="foto7" style="display: none">
                        <div class="form-group">
                            <div class="card">
                                <div class="card-title">
                                    <h3 class="alert alert-warning">(Importante) Actualizar Datos de la Vivienda</h3>
                                </div>
                                <div class="card-body">
                                    <label class="form-control-label textocolorinfo">NUEVO ESTADO PREDIO HABITADO POR:</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-users"></i></div>
                                        <asp:DropDownList ID="ddesatdo" CssClass="form-control" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>Propietarios</asp:ListItem>
                                            <asp:ListItem>Arrendado</asp:ListItem>
                                            <asp:ListItem>Desocupado</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Display="Dynamic"
                                            ErrorMessage="El Nuevo estado predio habitado por: es requerido" ControlToValidate="ddesatdo" Text="* Requerido">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <p></p>
                                    <div class="form-group">
                                        <label class=" form-control-label textocolorinfo">CELULAR INQUILINO PARA CITOFONIA<span class="badge badge-success pull-right">&nbsp;&nbsp(Inquilino)(Se utilizara para citofonia)</span></label>
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                            <asp:TextBox ID="txtcelarr" runat="server" Text="" CssClass="form-control" TextMode="Phone" MaxLength="10"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Enabled="false" runat="server" Display="Dynamic"
                                                ErrorMessage="Numero del Inquilino requerido" ControlToValidate="txtcelarr" Text="* Requerido">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <h3 class="textocolorinfo">CENSO RESIDENCIAL(Seguridad Ingreso de Porteria)</h3>
                                    <br />
                                    <div class="form-group">
                                        <label class=" form-control-label textocolorinfo">NUMERO DE ADULTOS QUE HABITARAN:</label>
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-users"></i></div>
                                            <asp:DropDownList ID="ddNpersonas" CssClass="form-control" runat="server">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>0</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic"
                                                ErrorMessage="Los Adultos que habitan es requerido, si no tienen ingrese 0" ControlToValidate="ddNpersonas" Text="* Requerido">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <label class=" form-control-label textocolorinfo">NOMBRES Y APELLIDOS DE LOS ADULTOS</label>
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-check-square"></i></div>
                                            <asp:TextBox ID="txtnomadul" runat="server" Text="" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class=" form-control-label textocolorinfo">NUMERO DE MENORES DE EDAD QUE HABITARAN:</label>
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-users"></i></div>
                                            <asp:DropDownList ID="ddmenores" CssClass="form-control" runat="server">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>0</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic"
                                                ErrorMessage="los menores que habitan es requerido,si no tienen ingrese 0" ControlToValidate="ddNpersonas" Text="* Requerido">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <label class=" form-control-label textocolorinfo">NOMBRES Y APELLIDOS DE LOS MENORES</label>
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-check-square"></i></div>
                                            <asp:TextBox ID="txtmennom" runat="server" Text="" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class=" form-control-label textocolorinfo">NUMERO DE MASCOTAS QUE HABITARAN:</label>
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-dot-circle-o"></i></div>
                                            <asp:DropDownList ID="ddmascotas" Visible="True" CssClass="form-control" runat="server">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>0</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic"
                                                ErrorMessage="El numero de mascotas es requerido,si no tienen ingrese 0" ControlToValidate="ddmascotas" Text="* Requerido">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class=" form-control-label textocolorinfo">NOMBRE DE RAZAS</label>
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-check-square"></i></div>
                                            <asp:TextBox ID="txtrazas" runat="server" Text="" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class=" form-control-label textocolorinfo">INGRESE NOMBRE Y APELLIDO DE LAS PERSONAS QUE USTED LES PROHIBE INGRESO EN PORTERIA(Opcinal)</label>
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-check-square"></i></div>
                                            <asp:TextBox ID="txtsanc" runat="server" Text="" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <p></p>
                                    <p>
                                        <button id="f7no" onclick="f7NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                        <button id="f7" onclick="f7SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div id="button" style="display: none">
                <asp:Button ID="btnenviardocuemnto" UseSubmitBehavior="false" OnClientClick="return ConvertToImage(this)" runat="server" Font-Bold="true" class="btn-block btn-lg btncolorinfo border border-light " Text="Enviar Solicitud" OnClick="btnenviardocuemnto_Click" />
            </div>
        </form>
    </div>
</asp:Content>
