<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="Admin_Update_Ins.aspx.cs" Inherits="Admin_Update_Ins" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:DropDownList ID="drp_Ins_Data" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource2" DataTextField="Ins_Name" DataValueField="Ins_Id" OnSelectedIndexChanged="drp_Ins_Data_SelectedIndexChanged"></asp:DropDownList>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="select_Ins_ById" TypeName="Update_Ins_Data"></asp:ObjectDataSource>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="822px">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:TemplateField HeaderText="Ins_Id">
                        <EditItemTemplate>
                            <asp:Label ID="Ins_Id" runat="server" Text='<%# Bind("Ins_Id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="crs_id_design" runat="server" Text='<%# Bind("Ins_Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ins_Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_edit_InsName" runat="server" Text='<%# Bind("Ins_Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ins_name_degin" runat="server" Text='<%# Bind("Ins_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ins_Address">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_edit_InsAddress" runat="server" Text='<%# Bind("Ins_Address") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Ins_Address") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ins_Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_edit_InsEmail" runat="server" Text='<%# Bind("Ins_Email") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Ins_Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Salary">
                        <EditItemTemplate>
                            <asp:TextBox ID="Ins_Salary" runat="server" Text='<%# Bind("Salary") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Salary") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ins_Phone">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_edit_InsPhone" runat="server" Text='<%# Bind("Ins_Phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Ins_Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Dept_Id">
                        <EditItemTemplate>
                            <asp:DropDownList ID="edit_drp_IdNam" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="Dept_Name" DataValueField="Dept_Id" SelectedValue='<%# Bind("Dept_id") %>'>
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="select_dept" TypeName="B_Instractor"></asp:ObjectDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Dept_Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>



            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:Label ID="Message_lbl" runat="server" CssClass="Message"></asp:Label></td>
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
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
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

