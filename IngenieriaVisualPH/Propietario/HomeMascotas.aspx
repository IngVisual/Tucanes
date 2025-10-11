<%@ Page Title="" Language="C#" MasterPageFile="~/Propietario/Propietario.Master" AutoEventWireup="true" CodeBehind="HomeMascotas.aspx.cs" Inherits="IngenieriaVisualPH.Propietario.Formulario_web170" %>
<asp:Content ID="Content1" ContentPlaceHolderID="c1" runat="server">
     <link href="../Diseño/Color.css" rel="stylesheet" />
    <div class="container">
        <div class="card-body">
            <div class="card-title">
                <h3 class="text-center textocolorinfo font-weight-bold">Mascotas</h3>
            </div>
        </div>
            <div class="alert alert-success" style="margin-top: 10px;">
                <span class="badge badge-pill badge-success">IMPORTANTE</span>
                Las mascotas que no cuenten con este registro deben reportarse ante la Secretaría de Salud. Los guardas y administracion pueden validar en la aplicacion si su mascota esta registrada, por favor evite reportes.
            </div>
        <form id="form1" runat="server">
            <aside class="profile-nav alt">
                <a href="ProMascotas.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor" style="height:120px">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/cat.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Registrar Mascotas</h3>
                                    <p>
                                        <asp:Label ID="lblapa" runat="server" Text="Registro" ForeColor="White"></asp:Label></p>
                                    <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
            <aside class="profile-nav alt">
                <a href="VerMascotas.aspx">
                    <section class="card">
                        <div class="card-header user-header alt bgcolor" style="height:120px">
                            <div class="media">
                                <img class="align-self-center bg-light rounded-circle mr-3" style="width: 85px; height: 85px;" alt="" src="../Diseño/Imagenes/dogcat.png">
                                <div class="media-body">
                                    <h3 class="text-light display-6">Ver o Actualizar Registro de Mascotas</h3>
                                    <p>
                                        <asp:Label ID="Label1" runat="server" Text="Actualizar Registro" ForeColor="White"></asp:Label></p>
                                     <p><span class="badge badge-dark pull-right">> Ver Ventana</span></p>
                                </div>
                            </div>
                        </div>
                    </section>
                </a>
            </aside>
        </form>
    </div>
</asp:Content>
