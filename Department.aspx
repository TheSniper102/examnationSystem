<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Department.aspx.cs" Inherits="Department" %>

<%-- Add content controls here --%>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 
    <asp:Label ID="txtbx" runat="server" CssClass="contact-desc"></asp:Label>
 
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <asp:GridView ID="Dept_grd" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Dept_Id" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="Dept_grd_RowCancelingEdit" OnRowDeleting="Dept_grd_RowDeleting" OnRowEditing="Dept_grd_RowEditing" OnRowUpdating="Dept_grd_RowUpdating" Width="918px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="id">
                        <EditItemTemplate>
                            <asp:Label ID="Dept_Id_edit" runat="server" Text='<%# Bind("Dept_Id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Dept_Id" runat="server" Text='<%# Bind("Dept_Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="Dept_Name_edit" runat="server" Text='<%# Bind("Dept_Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Dept_Name" runat="server" Text='<%# Bind("Dept_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="description">
                        <EditItemTemplate>
                            <asp:TextBox ID="Dept_Desc_edit" runat="server" Text='<%# Bind("Dept_Desc") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Dept_Desc" runat="server" Text='<%# Bind("Dept_Desc") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Location">
                        <EditItemTemplate>
                            <asp:TextBox ID="Dept_Location_edit" runat="server" Text='<%# Bind("Dept_Location") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Dept_Location" runat="server" Text='<%# Bind("Dept_Location") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:Button ID="cmdNext" runat="server" Text="insert Department" CommandName="NextView" CssClass="submit" />
        </asp:View>
        <asp:View ID="View2" runat="server">

            <table style="width:100%; height: 162px;">
                <tr>
                    <td style="width: 172px">
                        <asp:Label ID="Label1" runat="server" Text="Department name" CssClass="txt-center"></asp:Label>
                    </td>
                    <td style="width: 266px">
                        <asp:TextBox ID="deptName_txt" runat="server" Width="251px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="deptName_txt" ErrorMessage="Department name required" ForeColor="#CC0000" Display="Dynamic" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="deptName_txt" Display="Dynamic" ErrorMessage="department name must be  at leaest 7  charachters" ClientValidationFunction="validate" ForeColor="#CC0000" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                    </td>
                    
                </tr>
                <tr>
                    <td style="width: 172px">
                        <asp:Label ID="Label3" runat="server" Text="Department Location"></asp:Label>
                    </td>
                    <td style="width: 266px">
                        <asp:TextBox ID="deptLoc_txt" runat="server" Width="251px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="deptLoc_txt" ErrorMessage="Department location required" Font-Size="X-Large" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="deptLoc_txt" Display="Dynamic" ErrorMessage="department location must be  at leaest 7  charachters" ClientValidationFunction="validate" ForeColor="#CC0000" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 172px; height: 36px;">
                        <asp:Label ID="Label2" runat="server" Text="Department description"></asp:Label>
                    </td>
                    <td colspan="2" style="height: 36px">
                        <asp:TextBox ID="deptDesc_txt" runat="server" TextMode="MultiLine" Width="436px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 172px; height: 43px;"></td>
                    <td colspan="2" style="height: 43px"></td>
                </tr>
                <tr>
                    <td colspan="3" class="border">
                        <asp:Button ID="saveDept_btn" runat="server" style="z-index: 1;  width: 112px" Text="Save" OnClick="saveDept_btn_Click" CssClass="four1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3"><asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC0000" /></td>
                   
                </tr>
                <tr> <td><asp:Button ID="cmdPrev" runat="server" Text="Show Departments" CommandName="PrevView" CssClass="four1" /></td></tr>
            </table>
            
        </asp:View>
    </asp:MultiView>
   <script type="text/javascript">
       function validate(ctrlo, args) {
           args.IsValid = args.Value.length >= 7;
       }
    </script>
</asp:Content>