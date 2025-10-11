<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProMascotas.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web171" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <link href="../Diseño/Color.css" rel="stylesheet" />
           <link href="../Diseño/Banner.css" rel="stylesheet" />

    <script> 
        function pregunta1SI() {
            document.getElementById("pregunta1").style.display = "none";
            document.getElementById("form2").style.display = "block";
        }
        //function ContratoSI() {
        //    document.getElementById("form1").style.display = "none";
        //    document.getElementById("form2").style.display = "block";
        //}

    </script>
        <script>
        function DesactivarBoton() {
            document.getElementById("conta").style.display = "none"
            document.getElementById("procesando").style.display = "block"
            document.getElementById('<%=btnactualizar.ClientID%>').disabled = true;
            document.getElementById('<%=FileUpload1.ClientID%>').disabled = true;
            document.getElementById('<%=FileUpload2.ClientID%>').disabled = true;
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
                document.getElementById("button").style.display = "block";
            }
            function f2NO() {
                document.getElementById("foto1").style.display = "block";
                document.getElementById("foto2").style.display = "none";
            }
            function f6NO() {
                document.getElementById("foto2").style.display = "block";
                document.getElementById("button").style.display = "none";
            }
        </script>
    <div id="procesando" class="ventana3">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando Solicitud.....</h5>
    </div>
    <div class="container" id="conta">
        <h3 class="text-center textocolorinfo font-weight-bold">Registro de Mascota</h3>
        <td colspan="2">
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" CssClass="form-control alert alert-danger" Visible="False"></asp:Label>
        </td>
        <form id="fo1" runat="server">
             <div id="pregunta1">
               <strong class="card-title textocolorinfo font-weight-bold">¿Tienes listos los siguientes documentos para adjuntar? EN FORMATO IMAGEN, FOTO O CAPTURA DE PANTALLA (NO ACEPTA PDF) </strong>
                <p></p>
                <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">CARNET DE VACUNAS</i></p>
                <p class="card-title textocolorinfo font-weight-bold"><i class="fa fa-hand-o-right">FOTO DE LA MASCOTA</i></p>
                <br />
                 <p class="card-title textocolorinfo font-weight-bold">Para que tu solicitud se cargue mas rapido, se recomienda que las imagenes sean capturas de pantalla y un Internet estable.</p>
                <p>
                    <button id="btn1" onclick="pregunta1SI()" type="button" class="btn btn-lg btncolorinfo border border-light font-weight-bold" style="border-radius: 3px">Si, Los tengo listos</button>
                </p>
            </div>
<%--            <div id="form1" style="display: none">
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
            </div>--%>
        <div id="form2" style="display: none">
            <div class="alert alert-success" style="margin-top: 10px;">
                <span class="badge badge-pill badge-success">IMPORTANTE</span>
                Las mascotas que no cuenten con este registro deben reportarse ante la Secretaría de Salud. Los guardas y administracion pueden validar en la aplicacion si su mascota esta registrada, por favor evite reportes.
            </div>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="true" ForeColor="Red" />
                </td>
            </tr>
           <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">NOMBRE MASCOTA</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-check-circle"></i></div>
                    <asp:TextBox ID="txtnombre" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                        ErrorMessage="El nombre es requerido" ControlToValidate="txtnombre" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">RAZA</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-check-circle"></i></div>
                    <asp:TextBox ID="txtraza" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic"
                        ErrorMessage="La raza es requerida" ControlToValidate="txtraza" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">COLOR</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-check-circle"></i></div>
                    <asp:TextBox ID="txtcolor" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                        ErrorMessage="El color es requerido" ControlToValidate="txtcolor" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">EDAD</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-check-circle"></i></div>
                    <asp:TextBox ID="txtedad" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" Display="Dynamic"
                        ErrorMessage="La edad es requerida" ControlToValidate="txtedad" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
           <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">NUMERO CARNET VACUNAS</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-check-circle"></i></div>
                    <asp:TextBox ID="txtnucar" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
             <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">ESPECIE</label>
                 <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-check-circle"></i></div>
                    <asp:DropDownList ID="ddespecie" CssClass="form-control" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>CANINO</asp:ListItem>
                        <asp:ListItem>FELINO</asp:ListItem>
                        <asp:ListItem>OTRO</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                        ErrorMessage="La especie es requerida" ControlToValidate="ddespecie" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">SEXO</label>
                 <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-check-circle"></i></div>
                    <asp:DropDownList ID="ddsexo" CssClass="form-control" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>MASCULINO</asp:ListItem>
                        <asp:ListItem>FEMENINO</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Display="Dynamic"
                        ErrorMessage="El tipo de sexo es requerido" ControlToValidate="ddsexo" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">RAZA DE TENECIA ESPECIAL</label>
                 <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-check-circle"></i></div>
                    <asp:DropDownList ID="ddespe" CssClass="form-control" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>SI</asp:ListItem>
                        <asp:ListItem>NO</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic"
                        ErrorMessage="La raza especial es requerida" ControlToValidate="ddespe" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">ESTERILIZADO</label>
                 <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-check-circle"></i></div>
                    <asp:DropDownList ID="ddesteri" CssClass="form-control" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>SI</asp:ListItem>
                        <asp:ListItem>NO</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic"
                        ErrorMessage="Esterelizado es requerido" ControlToValidate="ddesteri" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">DISCAPACIDAD</label>
                 <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-check-circle"></i></div>
                    <asp:DropDownList ID="dddiscapa" CssClass="form-control" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>SI</asp:ListItem>
                        <asp:ListItem>NO</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" Display="Dynamic"
                        ErrorMessage="Esterilizado es requerido" ControlToValidate="dddiscapa" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">TIPO DE ENCARGADO</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                    <asp:DropDownList ID="ddtipoencar" CssClass="form-control" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>PROPIETARIO</asp:ListItem>
                        <asp:ListItem>ARRENDATARIO</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic"
                        ErrorMessage="El tipo de encargado es requerido" ControlToValidate="ddtipoencar" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">NOMBRE DE ENCARGADO</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-check-circle"></i></div>
                    <asp:TextBox ID="txtnomencarg" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" Display="Dynamic"
                        ErrorMessage="El nombre del encargado es requerido" ControlToValidate="txtnomencarg" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
                <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">TELEFONO DEL ENCARGADO</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-check-circle"></i></div>
                    <asp:TextBox ID="txttel" TextMode="Number" runat="server"  CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" Display="Dynamic"
                        ErrorMessage="El telefono del encargado es requerido" ControlToValidate="txttel" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
              <div class="form-group">
                <label class=" form-control-label textocolorinfo font-weight-bold">CORREO DEL ENCARGADO</label>
                <div class="input-group">
                    <div class="input-group-addon"><i class="fa fa-check-circle"></i></div>
                    <asp:TextBox ID="txtcorreo" TextMode="Email" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" Display="Dynamic"
                        ErrorMessage="El correo del encargado es requerido" ControlToValidate="txtcorreo" Text="Requerido*">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <asp:Label ID="lblcodigo" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            <asp:Label ID="lblestado" runat="server" Text="Solicitud" Visible="False"></asp:Label>

            <div class="card-body">
                <div class="form-group" id="foto1">
                    <asp:Label ID="Label5" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="CARNET DE VACUNAS(Cara de frente)" Font-Bold="True"></asp:Label>
                    <asp:FileUpload ID="FileUpload1" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                        ErrorMessage="CARNET DE VACUNAS requerido" ControlToValidate="FileUpload1" Text="* Requerido">
                    </asp:RequiredFieldValidator>
                    <label class="text-danger">Click en Seleccionar Archivo para buscar tu IMAGEN y despues Click en Siguiente</label>
                    <p></p>
                    <p>
                        <button id="f1" onclick="f1SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente >></button>
                    </p>
                </div>
                <div class="form-group" id="foto2" style="display: none">
                    <asp:Label ID="Label1" runat="server" CssClass="textocolorinfo" Font-Size="X-Large" Text="FOTO MASCOTA" Font-Bold="True"></asp:Label>
                    <asp:FileUpload ID="FileUpload2" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic"
                        ErrorMessage="FOTO MASCOTA requerida" ControlToValidate="FileUpload2" Text="* Requerido">
                    </asp:RequiredFieldValidator>
                    <label class="text-danger">Click en Seleccionar Archivo para buscar tu IMAGEN y despues Click en Siguiente</label>
                    <p></p>
                    <p>
                        <button id="f2no" onclick="f2NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                        <button id="f2" onclick="f2SI()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente</button>
                    </p>
                </div>              
            </div>

            <div id="button" style="display: none">
                    <p></p>
                    <p>
                        <button id="f6no" onclick="f6NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                    </p>
                <asp:Button ID="btnactualizar" runat="server" class="btn-lg btncolorinfo font-weight-bold border border-light form-control btn-block" Text="Enviar Registro" OnClick="btnactualizar_Click" />
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
