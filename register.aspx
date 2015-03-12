<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>

            <table style="width: 100%;">
                <tr>
                    <td colspan="6">
                        <asp:Label ID="Msg_lbl" runat="server" CssClass="message"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 152px">
                        <asp:Label ID="Label1" runat="server" Text="username"></asp:Label>
                    </td>
                    <td style="width: 170px">
                        <asp:TextBox ID="username_txt" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 88px" colspan="2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username_txt" Display="Dynamic" ErrorMessage="username required" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 107px">
                        <asp:Label ID="Label2" runat="server" Text="password"></asp:Label></td>
                    <td style="width: 304px">

                        <asp:TextBox ID="pass_txt" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pass_txt" ErrorMessage="password is required" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 152px">
                        <asp:Label ID="Label3" runat="server" Text="email"></asp:Label>
                    </td>
                    <td style="width: 170px">
                        <asp:TextBox ID="email_txt" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 88px" colspan="2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="email_txt" ErrorMessage="email is required" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email_txt" ErrorMessage="Invalid email" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">!</asp:RegularExpressionValidator>
                    </td>
                    <td style="width: 107px">
                        <asp:Label ID="address_lbl" runat="server" Text="address"></asp:Label>
                    </td>
                    <td style="width: 304px">
                        <asp:TextBox ID="address_txt" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="address_txt" ErrorMessage="address is required" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 152px">
                        <asp:Label ID="Label4" runat="server" Text="department"></asp:Label>
                    </td>
                    <td style="width: 170px">
                        <asp:DropDownList ID="dept_ddl" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Dept_Name" DataValueField="Dept_Id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DepartmentSelect %>" SelectCommand="SELECT [Dept_Id], [Dept_Name] FROM [Department]"></asp:SqlDataSource>
                    </td>
                    <td style="width: 88px" colspan="2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="dept_ddl" ErrorMessage="department required" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 107px">
                        <asp:Label ID="Label5" runat="server" Text="phone"></asp:Label>
                    </td>
                    <td style="width: 304px">
                        <asp:TextBox ID="phone_txt" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="phone_txt" ErrorMessage="phone is rquired" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 152px">
                        <asp:Label ID="Label6" runat="server" Text="security question"></asp:Label>
                    </td>
                    <td style="width: 170px">
                        <asp:TextBox ID="sq_txt" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 88px" colspan="2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="sq_txt" ErrorMessage="security question required" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 107px">
                        <asp:Label ID="Label7" runat="server" Text="question answer"></asp:Label>
                    </td>
                    <td style="width: 304px">
                        <asp:TextBox ID="answ_txt" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="answ_txt" ErrorMessage="question answer required" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td style="width: 152px">
                        <asp:Label ID="Label8" runat="server" Text="job"></asp:Label>
                    </td>
                    <td style="width: 170px">
                        <asp:DropDownList ID="job_ddl" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="0">student</asp:ListItem>
                            <asp:ListItem Value="1">instructor</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 88px" colspan="2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="job_ddl" ErrorMessage="job is required" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 107px">
                        <asp:Label ID="Label10" runat="server" Text="Gender"></asp:Label>
                    </td>
                    <td style="width: 304px">
                        <asp:DropDownList ID="gndr_ddl" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="male">male</asp:ListItem>
                            <asp:ListItem Value="female">female</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="gndr_ddl" ErrorMessage="gender is required" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="6">
                        <asp:Button ID="register_btn" runat="server" OnClick="register_btn_Click" Text="Register" CssClass="four1" Width="137px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC0000" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
