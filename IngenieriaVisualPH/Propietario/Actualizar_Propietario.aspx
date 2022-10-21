<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="Actualizar_Propietario.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
    <link href="../Diseño/Color.css" rel="stylesheet" />
    <div>
        <div class="col-12">
            <div class="card bordercolorinfo">
                <div class="card-body">
                    <div class="card-title">
                        <h3 class="text-center textocolorinfo font-weight-bold"><i class="fa fa-pencil animate__animated animate__shakeX animate__infinite animate__delay-2s"></i>Actualizar Citofonia y Datos Generales<asp:Label ID="lblcodigo" runat="server" ForeColor="DarkGray"></asp:Label></h3>
                        <br />
                        <form id="fo2" runat="server">
                            <tr>
                                <td colspan="2">
                                    <div class="alert alert-danger" id="error" runat="server" style="margin-top: 10px; display: none">
                                        <strong>La sesion con su usuario ha finalizado. Por favor ingrese nuevamente</strong>
                                    </div>
                                </td>
                                <td colspan="2">
                                    <div class="alert alert-danger" id="error1" runat="server" style="margin-top: 10px; display: none">
                                        <strong>Ingrese los datos requeridos</strong>
                                    </div>
                                </td>
                                <td colspan="2">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true"/>
                                </td>
                            </tr>
                            <div>
                                <div class="form-group">
                                    <label class=" form-control-label">PROPIETARIO</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                        <asp:Label ID="lblnombre" Enabled="false" runat="server" Text="" CssClass="form-control text-light bg-secondary"></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">APARTAMENTO</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-building"></i></div>
                                        <asp:Label ID="lblapa" runat="server" Enabled="false" Text="" CssClass="form-control text-light bg-secondary"></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">CONTRASEÑA</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-lock"></i></div>
                                        <asp:TextBox ID="txtcontraseña" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorcon" runat="server" Display="Dynamic"
                                            ErrorMessage="La contraseña es requerida" ControlToValidate="txtcontraseña" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">CORREO ELECTRONICO</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-envelope-o"></i></div>
                                        <asp:TextBox ID="txtemail" runat="server" Text="" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatoremail" runat="server" Display="Dynamic"
                                            ErrorMessage="El email es requerido" ControlToValidate="txtemail" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">CELULAR 1 PROPIETARIOS<span class="badge badge-success pull-right">&nbsp;&nbsp(Se utilizara para citofonia)</span></label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                        <asp:TextBox ID="txtcelular" runat="server" Text="" CssClass="form-control" TextMode="Phone" MaxLength="10"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorcel" runat="server" Display="Dynamic"
                                            ErrorMessage="El celular1 del propietario es requerido" ControlToValidate="txtcelular" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">CELULAR 2 PROPIETARIOS<span class="badge badge-success pull-right">&nbsp;&nbsp(Se utilizara para citofonia)</span></label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                        <asp:TextBox ID="txtotrocelular" runat="server" Text="" CssClass="form-control" TextMode="Phone" MaxLength="10"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">APARTAMENTO HABITADO POR:</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-users"></i></div>
                                        <asp:DropDownList ID="ddesatdo" CssClass="form-control" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>Propietarios</asp:ListItem>
                                            <asp:ListItem>Arrendado</asp:ListItem>
                                            <asp:ListItem>Desocupado</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                            ErrorMessage="El apartamento habitado por: es requerido" ControlToValidate="ddesatdo" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">CELULAR ARRENDADO<span class="badge badge-success pull-right">&nbsp;&nbsp(Inquilino)(Se utilizara para citofonia)</span></label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                        <asp:TextBox ID="txtcelarr" runat="server" Text="" CssClass="form-control" TextMode="Phone" MaxLength="10"></asp:TextBox>
                                    </div>
                                </div>
                                  <h3 class="textocolorinfo">CENSO RESIDENCIAL(Seguridad Ingreso de Porteria)</h3>
                                <br />
                                <div class="form-group">
                                    <label class=" form-control-label">NUMERO DE ADULTOS QUE HABITAN:</label>
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
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                            ErrorMessage="Los Adultos que habitan es requerido,si no tienen ingrese 0" ControlToValidate="ddNpersonas" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <label class=" form-control-label textocolorinfo">NOMBRES Y APELLIDOS DE LOS ADULTOS</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-check-square"></i></div>
                                        <asp:TextBox ID="txtnomadul" runat="server" Text="" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">NUMERO DE MENORES DE EDAD QUE HABITAN:</label>
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
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                                            ErrorMessage="Los menores que habitan es requerido,si no tienen ingrese 0" ControlToValidate="ddmenores" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <label class=" form-control-label textocolorinfo">NOMBRES Y APELLIDOS DE LOS MENORES</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-check-square"></i></div>
                                        <asp:TextBox ID="txtmennom" runat="server" Text="" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">NUMERO DE MASCOTAS:</label>
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
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                            ErrorMessage="El numero de mascotas es requerido,si no tienen ingrese 0" ControlToValidate="ddmascotas" Text="*">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">NOMBRE DE RAZAS</label>
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
                                <div class="form-group">
                                    <div class="alert alert-danger" role="alert"><i class="fa fa-check">He leído y acepto los términos y condiciones</i></div>
                                    <asp:DropDownList ID="DropDownList1" runat="server" Visible="False">
                                        <asp:ListItem>Si</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Label ID="lblconjunto" runat="server" Visible="false"></asp:Label>
                                    <asp:Label ID="lblmensaje1" runat="server" Visible="false"></asp:Label>
                                    <asp:Label ID="lblasunto" runat="server" Visible="false"></asp:Label>
                                    <i class="menu-icon fa fa-eye"></i><a href="PoliticaDatos.aspx" style="color: #dc3b3b">Ver Política Privacidad de Datos</a>
                                </div>                                                           
                                <asp:Button ID="btnactualizar" runat="server" Font-Bold="true" style="border-radius:7px" class="btn btn-lg btncolorinfo btn-block border border-dark" Text="Acepto Politicas Leídas" OnClick="btnactualizar_Click" />
                            </div>
                        </form>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
