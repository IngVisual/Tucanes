<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="EmailsMasivos.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web145" %>
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
                <h5 class="text-light text-center font-weight-bold">Enviando Mensajes...</h5>
        <img src="../Diseño/Imagenes/coheteLoading2.gif" />
    </div>
    <div class="container" id="conta">
        <form id="f2" runat="server">
            <div class="col-xs-6 col-lg-8">
                <div class="card border border-success" style="border-radius: 7px">
                    <div class="card-header">
                        <strong>Mials Masivos</strong>
                    </div>
                    <div class="card-body">
                        <div class="col-xs-6 col-lg-12">
                            <label class=" form-control-label">Asunto</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-bullhorn"></i></div>
                                <asp:TextBox ID="txttitulo" CssClass="form-control font-weight-bold" Font-Size="Medium" MaxLength="30" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                    ErrorMessage="" ForeColor="Red" ControlToValidate="txttitulo" Text="*">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-xs-6 col-lg-12">
                            <label class=" form-control-label">Link</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-bullhorn"></i></div>
                                <asp:TextBox ID="txtLink" CssClass="form-control font-weight-bold" Font-Size="Medium"  runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-6 col-lg-12">
                            <label class=" form-control-label">Mensaje</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-file-text-o"></i></div>
                                <asp:TextBox ID="txtmsg" CssClass="form-control" Font-Size="Medium" runat="server"  TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                    ErrorMessage="" ForeColor="Red" ControlToValidate="txtmsg" Text="*">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-xs-3 col-lg-3">
                            <br />
                            <asp:Button ID="BtnEnviar" Style="border-radius: 5px" runat="server" OnClientClick="return confirm('¿Esta seguro(a) de enviar este Mensaje?');" Font-Bold="true" class="btn btn-lg btn-success btn-block" Text="Enviar" OnClick="BtnEnviar_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
