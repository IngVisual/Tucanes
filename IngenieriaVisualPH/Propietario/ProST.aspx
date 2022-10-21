<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="ProST.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web157" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
<link href="../Diseño/Color.css" rel="stylesheet" />
     <link href="../Diseño/Banner.css" rel="stylesheet" />
    <script>
        function DesactivarBoton() {
            document.getElementById("conta").style.display = "none";
            document.getElementById("procesando").style.display = "block";
    }
    window.onbeforeunload = DesactivarBoton;
</script>
      <div id="conta">
         <h3 class="card-title textocolorinfo font-weight-bold">Servicios y Productos</h3>
            <div class="card-body">
                <!-- Credit Card -->
                    <form  id="fo1" runat="server" novalidate="novalidate">
                        <div>
                            <asp:Label ID="Label1" Font-Size="Small" runat="server" Text="Si ofreces algún tipo de servicio que puedas atender en la zona de Soacha de manera eficiente y seria, comunícate con nosotros al WhatsApp: +573002435992 para que te puedan ver en todas las apps de conjuntos residenciales en SOACHA. Es totalmente GRATIS. " Font-Bold="True" CssClass="form-control bgcolor" ForeColor="White"></asp:Label>
                        </div>
                        <br />
                        <div class="text-center">
                            <img class="mb-4 animate__animated animate__bounceInLeft" src="../Diseño/Imagenes/call.png" alt="" width="110" height="110" border="0" />
                        </div>                        
                        <div class="btn-group" role="group">
                            <button id="btnGroupDrop1" type="button" style="border-radius:5px" class="btn btn-primary border border-light text-light font-weight-bold dropdown-toggle animate__animated animate__pulse animate__infinite animate__delay-2s" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <li class="fa fa-search-plus">&nbsp;¿Que Estas Buscando?</li>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                <a class="dropdown-item" href="#"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="textocolorinfo" OnClick="LinkButton1_Click">Servicios</asp:LinkButton></a>
                                <a class="dropdown-item" href="#"><asp:LinkButton ID="LinkButton2" runat="server"  CssClass="textocolorinfo" OnClick="LinkButton2_Click">Restaurante</asp:LinkButton></a>
                                <a class="dropdown-item" href="#"><asp:LinkButton ID="LinkButton3" runat="server"   CssClass="textocolorinfo" OnClick="LinkButton3_Click">Productos</asp:LinkButton></a>
                                <a class="dropdown-item" href="#"><asp:LinkButton ID="LinkButton4" runat="server"   CssClass="textocolorinfo" OnClick="LinkButton4_Click">Entretenimiento</asp:LinkButton></a>
                            </div>
                        </div>
                        <table>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" EmptyDataText="No se encontro resultado " GridLines="None" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                                        <Columns>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                                <td>
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>
                                            <div class="card bordercolorinfo" style="border-radius:7px">
                                                <asp:Image ID="Image2" CssClass="card-img-top" 
                                                 ImageUrl='<%# "data:Image/png;base64,"+ Convert.ToBase64String((byte[])Eval("Imagen")) %>' runat="server" />
                                                <div class="card-body">
                                                    <h5 class="card-title">
                                                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("Nombre") %>'></asp:Label></h5>
                                                    <p class="card-text">
                                                        <asp:Label ID="Label5" runat="server" Text='<%#Eval("Servicio") %>'></asp:Label></p>
                                                    <div class="row">
                                                        <a href="tel:<%#Eval("Celular")%>" class="btn btn-secondary"><i class="fa fa-phone">&nbsp;LLamar</i></a>&nbsp;
                                                    <a href="<%#Eval("OtroCelular")%>" class="btn btn-success"><i class="fa fa-whatsapp">&nbsp;WhatsApp</i></a>&nbsp;
                                                    <a href="<%#Eval("Email")%>" class="btn btn-primary"><i class="fa fa-facebook">&nbsp;Facebook</i></a>&nbsp;
                                                     <ul class="list-group list-group-flush">
                                                     <li class="list-group-item">Horario:&nbsp;<asp:Label ID="Label9" runat="server" Text='<%#Eval("Horario") %>'></asp:Label></li>
                                                     </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <SeparatorTemplate>
                                        </SeparatorTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </form>
                </div>
        </div>
</asp:Content>
