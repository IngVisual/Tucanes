<%@ Page Title="" Language="C#" MasterPageFile="~/Administracion/Administracion.Master" AutoEventWireup="true" CodeBehind="NotificaPushAppGroup.aspx.cs" Inherits="IngenieriaVisualPH.Administracion.Formulario_web140" %>
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
    <div id="procesando" class="ventana2"  style="display: none">
        <h5 class="text-light text-center font-weight-bold">Enviando Mensajes...</h5>
        <img src="../Diseño/Imagenes/coheteLoading2.gif" />
    </div>
    <div class="container" id="conta">
        <form id="f2" runat="server">
            <div class="col-xs-6 col-lg-12">
                <div class="card border border-success" style="border-radius: 7px">
                    <div class="card-header">
                        <strong>Notificaciones Push y de App Masivas</strong>&nbsp;&nbsp;<a href="https://www.ilovepdf.com/es/unir_pdf" class="text-success right-panel pull-right">Click Aqui si desea Convertir Varios pdf en uno</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="card-body">
                                <div class="col-xs-6 col-lg-6">
                                    <label class=" form-control-label">Titulo</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-bullhorn"></i></div>
                                        <asp:TextBox ID="txttitulo" CssClass="form-control font-weight-bold border border-success" Font-Size="Small" MaxLength="30" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                            ErrorMessage="" ForeColor="Red" ControlToValidate="txttitulo" Text="* Obligatorio">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-lg-5">
                                    <label class=" form-control-label">¿Desea adjuntar algun PDF?</label>
                                    <asp:CheckBox ID="check1" runat="server" AutoPostBack="true" OnCheckedChanged="check1_CheckedChanged" Checked="false" Text="Si Quiero" />
                                    <div class="form-group" id="imagenSi" runat="server" style="display: none">
                                        <label class=" form-control-label alert alert-primary">Adjuntar documento PDF (Max 2mb)</label>
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-paperclip"></i></div>
                                            <asp:FileUpload ID="f1" runat="server" Font-Bold="true" AllowMultiple="true" CssClass="form-control border border-primary" />
                                        </div>
                                        <div class="alert alert-danger" id="error1" runat="server" style="margin-top: 10px; display: none">
                                            <strong>Solo acepta archivos PDF.</strong>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-lg-10">
                            <label class=" form-control-label">Mensaje</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="fa fa-file-text-o"></i></div>
                                <asp:TextBox ID="txtmsg" CssClass="form-control border border-success" Font-Size="Small" runat="server" MaxLength="300" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                    ErrorMessage="" ForeColor="Red" ControlToValidate="txtmsg" Text="* Obligatorio">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-xs-2 col-lg-2">
                            <asp:Button ID="BtnEnviar" Style="border-radius: 5px" runat="server" OnClientClick="return confirm('¿Esta seguro(a) de enviar este Mensaje?');" Font-Bold="true" class="btn btn-lg btn-success btn-block" Text="Enviar" OnClick="BtnEnviar_Click" />
                            <asp:Button ID="BtnEnviar2" Style="border-radius: 5px;" Visible="false" runat="server" OnClientClick="return confirm('¿Esta seguro(a) de enviar este Mensaje?');" Font-Bold="true" class="btn btn-lg btn-success btn-block" Text=">> Enviar" OnClick="BtnEnviar2_Click" />
                        </div>
                    </div>
                </div>                                                                  
            </div>
             <section id="tabsc">
                <div class="content mt-3">
                    <div class="animated fadeIn">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card" style="border-radius: 7px">
                                        <div class="card-body">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource1">
                                                <Columns>
                                                     <asp:TemplateField ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                                                    <asp:BoundField DataField="Torre" HeaderText="Torre" SortExpression="Torre" />
                                                    <asp:BoundField DataField="Apartamento" HeaderText="Apartamento" SortExpression="Apartamento" />
                                                </Columns>

                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IngenieriaVisualPHConnectionString %>" SelectCommand="SELECT * FROM [tblNotifiCodigo]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- .animated -->
            </section>
        </form>
    </div>
</asp:Content>
