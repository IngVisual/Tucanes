<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProSolChip.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web145" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
    <link href="../Diseño/Banner.css" rel="stylesheet" />
    <script>
        function DesactivarBoton() {
            document.getElementById("conta").style.display = "none";
            document.getElementById("procesando").style.display = "block"
            document.getElementById('<%=btnsave.ClientID%>').disabled = true;
            document.getElementById('<%=btnsave2.ClientID%>').disabled = true;
        }
        window.onbeforeunload = DesactivarBoton;
    </script>
    <script>
        function btnsi() {
            document.getElementById("tablero1").style.display = "none";
            document.getElementById("tablero2").style.display = "block";
        }
        function f1si() {
            document.getElementById("tablero2").style.display = "none";
            document.getElementById("tablero3").style.display = "block";
            document.getElementById("displayerror").style.display = "none";
        }
        function f2NO() {
            document.getElementById("tablero3").style.display = "none";
            document.getElementById("tablero2").style.display = "block";
            document.getElementById("displayerror").style.display = "block";
        }
    </script>
    <div id="procesando" class="ventana3">
        <img src="../Diseño/Imagenes/coheteLoading.gif" />
        <h5 class="text-right text-center font-weight-bold">Por favor espere un momento, Cargando Solicitud.....</h5>
    </div>
    <div class="container" id="conta">
        <h3 class="text-center textocolorinfo font-weight-bold ">Enviar Solicitud de Chip</h3>
        <div>
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" CssClass="form-control alert alert-danger" Visible="False"></asp:Label>
        </div>
        <form id="fo1" runat="server">
            <div id="mensaje" runat="server" style="display: none">
                <div class="col-lg-6">
                    <div class="alert alert-warning">
                        <span class="badge badge-pill badge-secondary">Importante</span>
                        <strong>
                            <asp:Label ID="lblmsg2" runat="server"></asp:Label>
                        </strong>
                        <br />
                    </div>
                </div>
                <br />
                <br />
            </div>
            <div>
                <br />
            </div>
            <div class="alert alert-success" id="error3" runat="server" style="margin-top: 10px; display: none">
                <span class="badge badge-pill badge-success">Listo</span>
                <strong>Su solicitud se envió correctamente. Ultimo paso: Realiza el pago en la administración y reclama tu chip. ¿Desea solicitar otro Chip? 
                    &nbsp;&nbsp;<a href="ProSolChip.aspx">
                        <button id="btnsiotra" type="button" class="btn-block btn-success font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite">Si Quiero</button></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="ProTabResChip.aspx">
                        <button id="btnnomas" type="button" class="btn-block btn-secondary font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite">No, Gracias</button></a>
                </strong>
                <br />
            </div>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="true" CssClass="text-danger" />
            </td>
            <br />
            <div id="tablero1" >
                <table>
                    <tr>
                        <td>
                            <asp:Repeater ID="r1" runat="server">
                                <ItemTemplate>
                                    <div class="card col-lg-2 col-md-6 no-padding bg-flat-color-4 ">
                                        <div class="card-body">
                                            <div class="h1 text-muted text-right mb-4">
                                                <i class="fa fa-bullseye text-light"></i>
                                            </div>
                                            <div class="h4 mb-0">
                                                <span class="text-light font-weight-bold">
                                                    <asp:Label ID="Label26" runat="server" Text='<%#Eval("Chip") %>'></asp:Label></span>
                                            </div>
                                            <h3 class="text-uppercase text-light font-weight-bold">$&nbsp
                                            <asp:Label ID="Label21" runat="server" Text='<%#Eval("ValorChip") %>'></asp:Label></h3>
                                            <div class="progress progress-xs mt-3 mb-0 bg-light" style="width: 40%; height: 5px;"></div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <SeparatorTemplate>
                                </SeparatorTemplate>
                            </asp:Repeater>
                        </td>
                    </tr>
                </table>
                <div class="alert alert-danger" id="error1" runat="server" style="margin-top: 10px;">
                    <span class="badge badge-pill badge-danger">Leer con Atención</span>
                    <p></p>
                    <strong class="text-danger font-weight-bold">Por favor tenga listos los siguientes Documentos:</strong>
                    <p></p>
                    <p class="text-dark font-weight-bold">Primero: FOTO DEL DOCUMENTO DE IDENTIDAD DE LA PERSONA QUE PORTARA EL CHIP, en Formato Imagen png, jpg, jpeg, foto directa o captura de pantalla</p>
                    <p class="text-dark font-weight-bold">Segundo: Solo se puede realizar una solicitud por chip. </p>
                    <p class="text-dark font-weight-bold">Tercero: Una vez finalice la solicitud debe realizar el pago en la Administracion.</p>
                    <p></p>
                    <p></p>
                    <p class="text-danger font-weight-bold">¿Tiene listos los documentos para continuar con la solicitud?</p>   
                    &nbsp;&nbsp;
                     <button id="btn1" type="button" onclick="btnsi()" class="btn-block btncolorinfo font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite">Si, Los tengo listos</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="Home.aspx">
                        <button id="btnno" type="button" class="btn-block btn-secondary font-weight-bold form-control border-light animate__animated animate__pulse animate__infinite">No, Aun no los tengo</button></a>
                </div>
            </div>
            <div id="tablero2" style="display: none">
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Seleccione Tipo de Chip " CssClass="textocolorinfo font-weight-bold"></asp:Label>
                    <asp:DropDownList ID="ddtipo" runat="server" CssClass="form-control" ForeColor="Red">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Peatonal</asp:ListItem>
                        <asp:ListItem>Vehicular</asp:ListItem>
                        <asp:ListItem>Bicicletero</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic"
                        ErrorMessage="Tipo de chip es requerido" ControlToValidate="ddtipo" Text="*">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblperdida" runat="server" Text="¿Para quien es el CHIP? " CssClass="textocolorinfo font-weight-bold"></asp:Label>
                    <asp:DropDownList ID="ddcanti" runat="server" CssClass="form-control" ForeColor="Red">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Propietario</asp:ListItem>
                        <asp:ListItem>Inquilino</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorusuario" runat="server" Display="Dynamic"
                        ErrorMessage="Debe llenar la casilla ¿para quien es el CHIP?" ControlToValidate="ddcanti" Text="*">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class=" form-control-label textocolorinfo font-weight-bold">Nombre del residente que tendra el chip</label>
                    <div class="input-group">
                        <div class="input-group-addon"><i class="fa fa-user"></i></div>
                        <asp:TextBox ID="txtnombre" runat="server" Text="" CssClass="form-control" Enabled="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                            ErrorMessage="El nombre es requerido" ControlToValidate="txtnombre" Text="*">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class=" form-control-label textocolorinfo font-weight-bold"># Documento de Identidad del residente que tendra el chip</label>
                    <div class="input-group">
                        <div class="input-group-addon"><i class="fa fa-credit-card"></i></div>
                        <asp:TextBox ID="txtcedula" runat="server" Text="" CssClass="form-control" MaxLength="20" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                            ErrorMessage="El documento es requerido" ControlToValidate="txtcedula" Text="*">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="¿El chip es nuevo o es por perdida? " CssClass="textocolorinfo font-weight-bold"></asp:Label>
                    <asp:DropDownList ID="ddnuevo" runat="server" CssClass="form-control" ForeColor="Red">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Nuevo</asp:ListItem>
                        <asp:ListItem>Perdida</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic"
                        ErrorMessage="El chip es nuevo o por perdida" ControlToValidate="ddnuevo" Text="*">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class=" form-control-label textocolorinfo font-weight-bold">Si es por perdida, Ingrese a nombre de quien estaba</label>
                    <div class="input-group">
                        <div class="input-group-addon"><i class="fa fa-bullseye"></i></div>
                        <asp:TextBox ID="txtperdida" runat="server" Text="" CssClass="form-control" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="form-group" id="foto1">
                    <asp:Label ID="Label5" runat="server" CssClass=" form-control-label textocolorinfo font-weight-bold" Text="DOCUMENTO DE IDENTIDAD(Cara de frente donde se vea el NUMERO DE DOCUMENTO Y FIRMA) Formato png,jpg,jpeg" Font-Bold="True"></asp:Label>
                    <asp:FileUpload ID="FileUpload1" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                        ErrorMessage="Debe subir una Imagen o foto del documento" ControlToValidate="FileUpload1" Text="* Requerido">
                    </asp:RequiredFieldValidator>
                    <p></p>
                    <div id="imagenrec" runat="server">
<%--                        <asp:Repeater ID="repet1" runat="server">
                            <ItemTemplate>
                                <div class="col-5">
                                        <img class="card-img-top" src="../Chip/Recibo/<%#Eval("Recibo") %>" alt="Card image cap" width="60" height="150">
                                 <h6 class="text-light font-weight-bold">Recibo de Pago</h6>
                                </div>
                                    </ItemTemplate>
                        </asp:Repeater>--%>
                    </div>
                    <div id="f2" runat="server">
                    <asp:FileUpload ID="FileUpload2" Font-Bold="true" runat="server" CssClass="form-control bordercolorinfo" />
                    </div>
                    <p>
                        <button id="f1" onclick="f1si()" type="button" class="btncolorinfo btn-lg border border-light font-weight-bold" style="border-radius: 3px">Siguiente >></button>
                    </p>
                </div>
            </div>
            <div id="tablero3" style="display: none">
                <p></p>
                <p>
                    <button id="f2no" onclick="f2NO()" type="button" class="btn-secondary btn-lg border border-light font-weight-bold" style="border-radius: 3px">Atras</button>
                </p>
                <br />
                <br />
                <asp:Button ID="btnsave"  runat="server" Text="Enviar Solicitud" CssClass="btn-block btn-lg form-control btncolorinfo font-weight-bold btn-block border border-light" OnClick="btnsave_Click" />
                <asp:Button ID="btnsave2"  runat="server" Text="Enviar Solicitud" CssClass="btn-block btn-lg form-control btncolorinfo font-weight-bold btn-block border border-light" OnClick="btnsave2_Click" />
            </div>
            <br />
            <br />
            <br />
            <br />
        </form>
    </div>
</asp:Content>
