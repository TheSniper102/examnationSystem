<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="forgotPassword.aspx.cs" Inherits="forgotPassword" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:MultiView ID="forgt_mv" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">

                    <table style="width: 100%;">
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="rest_lbl" runat="server" ForeColor="#CC0000"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 215px">
                                <asp:Label ID="Label1" runat="server" Text="Enter username to reset password"></asp:Label>
                            </td>
                            <td style="width: 387px">
                                <asp:TextBox ID="username_txt" runat="server" ValidationGroup="reset"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="username is required" ForeColor="#CC0000" ControlToValidate="username_txt" ValidationGroup="reset">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            
                            <td colspan="3">
                                <asp:Button ID="reset_btn" runat="server" CssClass="four1" OnClick="reset_btn_Click" Text="Reset" Width="134px" ValidationGroup="reset" />
                            </td>
                        </tr>
                        
                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:Label ID="Mesasage" runat="server" ForeColor="#CC0000"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 222px">
                                <asp:Label ID="Label2" runat="server" Text="security question"></asp:Label>
                            </td>
                            <td style="width: 376px">
                                <asp:TextBox ID="sq_txt" runat="server" ReadOnly="True" ValidationGroup="securityQuestion"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="sq_txt" ErrorMessage="seurity question is required" ForeColor="#CC0000" ValidationGroup="securityQuestion">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 222px">
                                <asp:Label ID="Label3" runat="server" Text="Answer"></asp:Label>
                            </td>
                            <td style="width: 376px">
                                <asp:TextBox ID="ans_txt" runat="server" ValidationGroup="securityQuestion"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ans_txt" ErrorMessage="answer is required" ForeColor="#CC0000" ValidationGroup="securityQuestion">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="vaidate_btn" runat="server" CssClass="four1" Text="validate" ValidationGroup="securityQuestion" Width="129px" OnClick="vaidate_btn_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <table>
                        <tr>
                            <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                        </tr>
                        <tr>
                            <td style="width: 204px">
                                <asp:Label ID="Label4" runat="server" Text="New Password"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="new_txt" runat="server" ValidationGroup="newPass" Width="173px" TextMode="Password"></asp:TextBox></td>
                            <td style="width: 344px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" ForeColor="#CC0000" ValidationGroup="newPass" ControlToValidate="new_txt">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 204px">
                                <asp:Label ID="Label5" runat="server" Text="New Password confirmation"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="cpass_txt" runat="server" ValidationGroup="newPass" Width="165px" TextMode="Password"></asp:TextBox>
                            <td style="width: 344px">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="password does not match" ControlToCompare="new_txt" ControlToValidate="cpass_txt" ForeColor="#CC0000" ValidationGroup="newPass">*</asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="chng_btn" runat="server" CssClass="four1" Text="change" ValidationGroup="newPass" Width="133px" OnClick="chng_btn_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
