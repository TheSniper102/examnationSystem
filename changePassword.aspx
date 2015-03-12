<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="changePassword.aspx.cs" Inherits="changePassword" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:Label ID="Message_lbl" runat="server" CssClass="Message"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 176px">
                        <asp:Label ID="Label1" runat="server" Text="oldPassword"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="oldpass_txt" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="oldpass_txt" ErrorMessage="old password is required" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 176px">
                        <asp:Label ID="Label2" runat="server" Text="new password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="newPass_txt" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="newPass_txt" ErrorMessage="please type new password" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 176px">
                        <asp:Label ID="Label3" runat="server" Text="confirm new password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="cnewPass_txt" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="newPass_txt" ControlToValidate="cnewPass_txt" ErrorMessage="confirm password does not match new password" ForeColor="#CC0000">!</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="change_btn" runat="server" CssClass="four1" OnClick="change_btn_Click" Text="chnage password" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC0000" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
