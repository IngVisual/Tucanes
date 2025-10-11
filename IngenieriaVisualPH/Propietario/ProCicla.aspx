<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProCicla.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web18" %>
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
                document.getElementById('<%=btnactualizar.ClientID%>').disabled = true;
            document.getElementById('<%=FileUpload1.ClientID%>').disabled = true;
            document.getElementById('<%=FileUpload2.ClientID%>').disabled = true;
            document.getElementById('<%=FileUpload3.ClientID%>').disabled = true;
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
            function f6NO() {
                document.getElementById("foto4").style.display = "block";
                document.getElementById("button").style.display = "none";
            }
        </script>
    <div id="procesando" class="ventana3">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando Solicitud.....</h5>
    </div>
    <div class="container" id="conta">
        <h3 class="text-center textocolorinfo font-weight-bold">Solicitud de Bicicletero</h3>
        <td colspan="2">
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" CssClass="form-control alert alert-danger" Visible="False"></asp:Label>
        </td>
        <form id="fo1" runat="server">
             <div id="pregunta1">
               <strong class="card-title textocolorinfo font-weight-bold">¿Tienes listos los siguientes documentos para adjuntar? EN FORMATO IMAGEN, FOTO O CAPTURA DE PANTALLA (NO ACEPTA PDF) </strong>
                <p></p>
                <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">DOCUMENTO DE IDENTIDAD (CC o TI)</i></p>
                <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">TARJETA DE PROPIEDAD O FACTURA</i></p>
                <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">FOTO DE LA BICICLETA</i></p>
                <br />
                 <p class="card-title textocolorinfo font-weight-bold">Para que tu solicitud se cargue mas rapido, se recomienda que las imagenes sean capturas de pantalla y un Internet estable.</p>
                <p>
                    <button id="btn1" onclick="pregunta1SI()" type="button" class="btn btn-lg btncolorinfo border border-light font-weight-bold" style="border-radius: 3px">Si, Los tengo listos</button>
                </p>
            </div>
            <div id="form1" style="display: none">
                <div class="card bordercolorinfo">
                    <div class="card-header">
                        <strong>Politica de Bicicleteros</strong>
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
            <div class="alert alert-success" style="margin-top: 10px;">
                <span class="badge badge-pill badge-success">IMPORTANTE</span>
                Las bicicletas siempre deben estar aseguradas, el Conjunto NO será responsable
                cuando el daño, pérdida, deterioro o hurto provenga de fuerza mayor, caso
                fortuito o el uso indebido del servicio por parte del usuario. 
            </div>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="true" ForeColor="Red" />
                </td>
            </tr>
           <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">NOMBRE SOLICITANTE</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-bicycle"></i></div>
                    <asp:TextBox ID="txtxnombre" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                        ErrorMessage="El nombre es requerido" ControlToValidate="txtxnombre" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">TIPO DE SOLICITANTE</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                    <asp:DropDownList ID="ddtiposoli" CssClass="form-control" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>PROPIETARIO</asp:ListItem>
                        <asp:ListItem>ARRENDATARIO</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic"
                        ErrorMessage="El tipo de solicitante es requerido" ControlToValidate="ddtiposoli" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">MARCA</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-bicycle"></i></div>
                    <asp:TextBox ID="txtmarca" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorusuario" runat="server" Display="Dynamic"
                        ErrorMessage="La marca es requerida" ControlToValidate="txtmarca" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">COLOR</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-bicycle"></i></div>
                    <asp:TextBox ID="txtcolor" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                        ErrorMessage="El color es requerido" ControlToValidate="txtcolor" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">SERIE</label>-Opcional
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-bicycle"></i></div>
                    <asp:TextBox ID="txtserie" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">TIPO DE CICLA</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-bicycle"></i></div>
                    <asp:DropDownList ID="ddtipo" CssClass="form-control" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Todo Terreno</asp:ListItem>
                        <asp:ListItem>Croos</asp:ListItem>
                        <asp:ListItem>Montañismo</asp:ListItem>
                        <asp:ListItem>Carrera de ruta</asp:ListItem>
                        <asp:ListItem>Carreras BMX</asp:ListItem>
                        <asp:ListItem>BMX</asp:ListItem>
                        <asp:ListItem>Scooter Electrica</asp:ListItem>
                        <asp:ListItem>Bicicleta Electrica</asp:ListItem>
                        <asp:ListItem>Bicicleta Clasica</asp:ListItem>
                        <asp:ListItem>Bicicleta Discapacidad</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                        ErrorMessage="El tipo de cicla es requerido" ControlToValidate="ddtipo" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">TIPO DE CONDUCTOR</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                    <asp:DropDownList ID="ddper" CssClass="form-control" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>NIÑO</asp:ListItem>
                        <asp:ListItem>ADULTO</asp:ListItem>
                        <asp:ListItem>DISCAPACIDAD</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorcon" runat="server" Display="Dynamic"
                        ErrorMessage="El tipo de conductor es requerido" ControlToValidate="ddper" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <asp:Label ID="lblcodigo" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            <asp:Label ID="lblestado" runat="server" Text="Solicitud" Visible="False"></asp:Label>

            <div class="card-body">
                <div class="form-group" id="foto1">
                    <asp:Label ID="Label5" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="DOCUMENTO DE IDENTIDAD(Cara de frente)" Font-Bold="True"></asp:Label>
                    <asp:FileUpload ID="FileUpload1" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                        ErrorMessage="DOCUMENTO DE IDENTIDAD requerido" ControlToValidate="FileUpload1" Text="* Requerido">
                    </asp:RequiredFieldValidator>
                    <label class="text-danger">Click en Seleccionar Archivo para buscar tu IMAGEN y despues Click en Siguiente</label>
                    <p></p>
                    <p>
                        <button id="f1" onclick="f1SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente >></button>
                    </p>
                </div>
                <div class="form-group" id="foto2" style="display: none">
                    <asp:Label ID="Label1" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="TARJETA DE PROPIEDAD O FACTURA" Font-Bold="True"></asp:Label>
                    <asp:FileUpload ID="FileUpload2" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic"
                        ErrorMessage="IMAGEN DE LA TARJETA DE PROPIEDAD O FACTURA requerida" ControlToValidate="FileUpload2" Text="* Requerido">
                    </asp:RequiredFieldValidator>
                    <label class="text-danger">Click en Seleccionar Archivo para buscar tu IMAGEN y despues Click en Siguiente</label>
                    <p></p>
                    <p>
                        <button id="f2no" onclick="f2NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                        <button id="f2" onclick="f2SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                    </p>
                </div>
                <div class="form-group" id="foto3" style="display: none">
                    <asp:Label ID="Label2" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="FOTO DE LA BICICLETA" Font-Bold="True"></asp:Label>
                    <asp:FileUpload ID="FileUpload3" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfos" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic"
                        ErrorMessage="IMAGEN DE LA BICICLETA requerida" ControlToValidate="FileUpload3" Text="*Requerido">
                    </asp:RequiredFieldValidator>
                    <label class="text-danger">Click en Seleccionar Archivo para buscar tu IMAGEN y despues Click en Siguiente</label>
                    <p></p>
                    <p>
                        <button id="f3no" onclick="f3NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                        <button id="f3" onclick="f3SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                    </p>
                </div>
                <div class="form-group" id="foto4" style="display: none">
                    <div>
                            
                            <asp:Label ID="Label4" runat="server" CssClass="textocolorinfo" Font-Size="Small" Text="Con esta firma como PROPIETARIO me hago responsable de cumplir las politicas antes mencionadas y así mismo hacerlas cumplir de mi arrendatario en caso de que la solicitud sea para él. Por favor tenga presente que si no realiza la firma la solicitud NO SERA AUTORIZADA" Font-Bold="True"></asp:Label>
                            <div class="clear-btn">
                                <button id="clear-signature" type="button" data-tool="eraser" class="btn-block btn-secondary btn-lg border border-success font-weight-bold"><span>Borrar </span></button>
                            </div>
                            <div class="card">
                                <div class="card-body border border-primary">
                                    <canvas id="signature" width="350" height="200"></canvas>
                                </div>
                            </div>
                            <asp:HiddenField ID="hfImageData" runat="server" />
                           <asp:Label ID="Label3" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="INGRESE FIRMA PROPIETARIO" Font-Bold="True"></asp:Label>
                            <p></p>
                            <p></p>
                            <p></p>
                            <p></p>
                            <p>
                                <button id="f4no" onclick="f4NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                                <button id="f4" onclick="f4SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                            </p>
                        </div>
                </div>
            </div>

            <div id="button" style="display: none">
                    <p></p>
                    <p>
                        <button id="f6no" onclick="f6NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                    </p>
                <asp:Button ID="btnactualizar" UseSubmitBehavior="false" OnClientClick="return ConvertToImage(this)" runat="server" class="btn-lg btncolorinfo font-weight-bold border border-light form-control btn-block" Text="Enviar Solicitud" OnClick="btnactualizar_Click" />
            </div>


            <br />
            <br />
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
    </div><!--/.col-->
</asp:Content>
