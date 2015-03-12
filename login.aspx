<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="auth" EnableEventValidation="false"%>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            
            <div id="login">
               
                <h1>Log in</h1>
                <form class="lgn-form">
                    <asp:Label ID="Msg_lbl" runat="server" CssClass="Message"></asp:Label></td>
                
                        <asp:Label ID="Label1" runat="server" Text="username"></asp:Label>

                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username_txt" Display="Dynamic" ErrorMessage="username is empty" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="username_txt" runat="server"></asp:TextBox></td>
                    
                       
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pass_txt" ErrorMessage="password is empty" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    <asp:Label ID="Label2" runat="server" Text="password"></asp:Label>

                    <asp:TextBox ID="pass_txt" runat="server" TextMode="Password"></asp:TextBox>

                    <asp:CheckBox ID="rmmbr" runat="server" Text="Remember Me" />

                  

                    <asp:Button ID="lgn_btn" runat="server" CssClass="four1" Text="Login" Width="131px" OnClick="lgn_btn_Click" />
                      <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/register.aspx">Register</asp:HyperLink>
                    |<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/forgotPassword.aspx">forgot Password</asp:HyperLink>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC0000" />

                </form>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
