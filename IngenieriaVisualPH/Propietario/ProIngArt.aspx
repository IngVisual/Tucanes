<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProIngArt.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web134" %>
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
            document.getElementById("procesando").style.display = "block"
        }
        window.onbeforeunload = DesactivarBoton;
    </script>
    <script>
        //        function Opcion1() {
        //    document.getElementById("opcion1").style.display = "block";
        //    document.getElementById("opcion2").style.display = "none";
        //    document.getElementById("opcion3").style.display = "none";
        //    //document.getElementById("rd1").checked = true;
        //    document.getElementById("rd2").checked = false;
        //    document.getElementById("rd3").checked = false;

        //}
               function Opcion2() {
            document.getElementById("pregunta1").style.display = "block";
            document.getElementById("pregunta0").style.display = "none";
        }
            //  function Opcion3() {
            //document.getElementById("pregunta1").style.display = "block";
            //document.getElementById("pregunta0").style.display = "none";
        //}
              function preguntaPM() {
            document.getElementById("formPM").style.display = "block";
            document.getElementById("pregunta0").style.display = "none";
        }
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

    </script>
    <div id="procesando" class="ventana3">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando Solicitud.....</h5>
    </div>
    <div class="container" id="conta">
        <h3 class="text-center textocolorinfo font-weight-bold">Ingreso de algunos Articulos, NO ES INGRESO DE MUDANZA COMPLETA</h3>
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
            <div id="pregunta0">
                <div class="card bordercolorinfo">
                    <div class="card-header">
                        <strong class="card-title">Por favor lea con atención y Seleccione una opcion de Solicitud</strong>
                    </div>
                    <div class="card-body">
<%--                        <input id="rd1" type="radio" onclick="Opcion1()" />-- ¿ Ingresa menos de 3 articulos <strong class="text-success">NUEVOS ?</strong> Ej(Cama, nevera, estufa, televisor, etc..)?
                    <p></p>--%>
<%--                        <div class="form-group" id="opcion1" style="display: none">
                            <div class="alert alert-success" id="error1" runat="server" style="margin-top: 10px;">
                                <span class="badge badge-pill badge-success">IMPORTANTE</span>
                                Para esta opción no es necesario enviar la solicitud, solo debe realizar los siguientes pasos:
                               <p>Pirmero: Debe presentar a los Guardas las facturas de compra.</p>
                                <p>Segundo: Debe hacer el ingreso en los horarios permitidos.</p>
                                <p>Tercero: Leer la politica de mudanzas y Aceptar los terminos.</p>
                                <p></p>
                                <p>
                                    <button id="btnpm" onclick="preguntaPM()" type="button" class="btn-danger btn-lg border border-light font-weight-bold" style="border-radius: 3px">Ver Politica de Mudanzas</button>
                                </p>

                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <br />
                            </div>
                            <br />
                        </div>--%>

                        <p></p>
                        <input id="rd2" type="radio" onclick="Opcion2()" />-- ¿ Ingresa algunos articulos y el apartamento ya esta <strong class="text-danger">HABITADO ?</strong> Ej(Cama, nevera, estufa, televisor, etc..)?, <strong class="alert-danger">NO ES UNA MUDANZA COMPLETA .</strong>
                        <p></p>
                        <br />
                      <%--  <p></p>
                        <input id="rd3" type="radio" onclick="Opcion3()" />-- ¿Ingresa articulos de <strong class="text-primary">CONSTRUCCION?</strong>
                        <p></p>--%>
                        <br />
                    </div>
                </div>
            </div>
           <div id="pregunta1" style="display: none">
                <strong class="card-title textocolorinfo font-weight-bold">¿Tienes listos los siguientes documentos para adjuntar o tomarles foto? </strong>
                <p></p>
                <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">FOTO DE LA CEDULA DEL PROPIETARIO  <asp:Label ID="lblpro" runat="server" Font-Bold="true" CssClass="textocolorinfo" Text=""></asp:Label> en Formato Imagen png, jpg, jpeg, foto directa o captura de pantalla </i></p>
<%--                  <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">SI ES MATERIAL DE CONTRUCCION: Nombres y Numeros de Cedula de los maestros de obra. </i></p>
                <p></p>--%>
                <p>
                    <button id="btn1" onclick="pregunta1SI()" type="button" class=" btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Si, Lo tengo listo</button>
                </p>
            </div>
            <div id="formPM" style="display: none">
                <div class="card bordercolorinfo">
                    <div class="card-header">
                        <strong>Politicas de Mudanzas</strong>
                    </div>
                    <div class="card-body">
                        <p>
                            <asp:Button ID="btnAcepto" OnClick="btnAcepto_Click" runat="server" OnClientClick="return confirm('Gracias por Aceptar los terminos, Se envio una copia del compromiso a tu correo electronico registrado');" Text="Acepto" class="btncolorinfo btn-lg border border-light font-weight-bold" Style="border-radius: 3px" />
                        </p>
                        <asp:Label ID="lblmsg2" runat="server" Text=""></asp:Label>
                        <p></p>
                    </div>
                </div>
            </div>
            <div id="form1" style="display: none">
                <div class="card bordercolorinfo">
                    <div class="card-header">
                        <strong>Politicas de Mudanzas</strong>
                    </div>
                    <div class="card-body">
                        <button id="btn2" onclick="ContratoSI()" type="button" class=" btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Acepto</button>
                        <p></p>
                        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
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
                            <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Nombre de la persona encargada del ingreso.</label>
                            <asp:TextBox ID="txtencargado" runat="server"  CssClass="form-control"></asp:TextBox>
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
                            <label for="" class="control-label mb-1 textocolorinfo font-weight-bold">Articulos a Ingresar </label>
                            <asp:TextBox ID="txtarticulos" runat="server" TextMode="MultiLine" MaxLength="90" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                ErrorMessage="Articulos es requerido" ControlToValidate="txtarticulos" Text="* Requerido">
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
                                <button id="f4no" onclick="f4NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                <button id="f4" onclick="f4SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                            </p>
                        </div>
                    </div>
                    <div class="form-group" id="foto5" style="display: none">
                        <div class="card-body">
                            <asp:Label ID="Label5" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="CEDULA PROPIETARIO(Cara de frente donde se vea el NUMERO DE CEDULA Y FIRMA) Formato Imagen png, jpg, jpeg, foto directa o captura de pantalla" Font-Bold="True"></asp:Label>
                            <asp:FileUpload ID="FileUpload1" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic"
                                ErrorMessage="IMAGEN DE LA CEDULA requerida" ControlToValidate="FileUpload1" Text="* Requerido">
                            </asp:RequiredFieldValidator>
                            <label class="text-danger">Click en Seleccionar Archivo para buscar tu IMAGEN y despues Click en Siguiente</label>
                            <p></p>
                            <p>
                                <button id="f5no" onclick="f5NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                <button id="f5" onclick="f5SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                            </p>
                        </div>
                    </div>
                    <div class="form-group" id="foto6" style="display: none">
                        <div>
                            <asp:Label ID="Label1" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="FIRMA DEL PROPIETARIO" Font-Bold="True"></asp:Label>
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
                </div>
            </div>
            <br />
            <div id="button" style="display: none">
                <asp:Button ID="btnenviardocuemnto" UseSubmitBehavior="false" OnClientClick="return ConvertToImage(this)" runat="server" Font-Bold="true" class="btn-block btn-lg btncolorinfo border border-light " Text="Enviar Solicitud" OnClick="btnenviardocuemnto_Click" />
                <br />
            </div>
        </form>
    </div>
</asp:Content>
