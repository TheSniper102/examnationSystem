<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="Instractor.aspx.cs" Inherits="Instractor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
               
                   <table style="width:100%;">
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="847px" CellPadding="4" GridLines="None" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnPageIndexChanging="GridView1_PageIndexChanging" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:TemplateField HeaderText="Ins_Id">
                            <EditItemTemplate>
                                <asp:Label ID="edit_ins_id" runat="server" Text='<%# Bind("Ins_Id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Ins_Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ins_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="edit_ins_name" runat="server" Text='<%# Bind("Ins_Name") %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Ins_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ins_Address">
                            <EditItemTemplate>
                                <asp:TextBox ID="edit_ins_addrs" runat="server" Text='<%# Bind("Ins_Address") %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Ins_Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ins_Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="edit_ins_email" runat="server" Text='<%# Bind("Ins_Email") %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Ins_Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ins_Phone">
                            <EditItemTemplate>
                                <asp:TextBox ID="edit_ins_phone" runat="server" Text='<%# Bind("Ins_Phone") %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Ins_Phone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salary">
                            <EditItemTemplate>
                                <asp:TextBox ID="edit_ins_salary" runat="server" Text='<%# Bind("Salary") %>' CssClass="small_inpt"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Salary") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Dept_id">
                            <EditItemTemplate>
                                <asp:DropDownList ID="edit_ins_deptid" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Dept_Name" DataValueField="Dept_Id" AutoPostBack="True" SelectedValue='<%# Bind("Dept_id") %>' CssClass="small_inpt">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="select_dept" TypeName="B_Instractor"></asp:ObjectDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Dept_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <br />
                <br />
            </td>
        </tr>
        
    </table>
                    <div>
         <table border="1">
        <tr>
            <th colspan="2">

                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="Maroon" Text="Insert_New_Instractor"></asp:Label>

            </th>
            <th>

                &nbsp;</th>
            <th>

                &nbsp;</th>
        </tr>
        <tr>
            <td style="width: 93px">
                <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Small" ForeColor="#663300" Text="ID"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_ins_Id" runat="server" Width="155px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
             <tr>
                 <td style="width: 93px">
                     <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Small" ForeColor="#663300" Text="Name"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txt_ins_Name" runat="server" Width="155px"></asp:TextBox>
                 </td>
                 <td>&nbsp;</td>
                 <td>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_ins_Name" Display="Dynamic" ErrorMessage="NameRequired" ForeColor="Red" ValidationGroup="K">*</asp:RequiredFieldValidator>
                 </td>
             </tr>
         <tr>
            <td style="width: 93px">
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Small" ForeColor="#663300" Text="Address"></asp:Label>
             </td>
            <td>
                <asp:TextBox ID="txt_ins_address" runat="server" Width="157px"></asp:TextBox>
             </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_ins_address" Display="Dynamic" ErrorMessage="addressRewuired" ForeColor="Red" ValidationGroup="k">*</asp:RequiredFieldValidator>
             </td>
        </tr>
         <tr>
            <td style="width: 93px">
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Small" ForeColor="#663300" Text="Email"></asp:Label>
             </td>
            <td>
                <asp:TextBox ID="txt_ins_Email" runat="server" Width="155px"></asp:TextBox>
             </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_ins_Email" Display="Dynamic" ErrorMessage="EmailRequired" ForeColor="Red" ValidationGroup="k">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_ins_Email" Display="Dynamic" ErrorMessage="WrongFormat" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="k">*</asp:RegularExpressionValidator>
             </td>
        </tr>
         <tr>
            <td style="width: 93px">
                <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Small" ForeColor="#663300" Text="Phone"></asp:Label>
             </td>
            <td>
                <asp:TextBox ID="txt_ins_Phone" runat="server" Width="155px"></asp:TextBox>
             </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_ins_Phone" Display="Dynamic" ErrorMessage="Phonerequired" ForeColor="Red" ValidationGroup="k">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_ins_Phone" Display="Dynamic" ErrorMessage="WrongPhoneNumber" ForeColor="Red" ValidationExpression="^01[0-2]{1}[0-9]{8}" ValidationGroup="k">*</asp:RegularExpressionValidator>
             </td>
        </tr>
         <tr>
            <td style="width: 93px">
                <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Small" ForeColor="#663300" Text="Salary"></asp:Label>
             </td>
            <td>
                <asp:TextBox ID="txt_ins_Salary" runat="server" Width="153px"></asp:TextBox>
             </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_ins_Salary" Display="Dynamic" ErrorMessage="SalaryRequired" ForeColor="Red" ValidationGroup="k">*</asp:RequiredFieldValidator>
             </td>
        </tr>
         <tr>
            <td style="width: 93px">
                <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Small" ForeColor="#663300" Text="Depart"></asp:Label>
             </td>
            <td>
                <asp:DropDownList ID="drp_Dept_Id" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource2" DataTextField="Dept_Name" DataValueField="Dept_Id">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="select_dept" TypeName="B_Instractor"></asp:ObjectDataSource>
             </td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Insert_Instr" runat="server" OnClick="Insert_Instr_Click" Text="Add" Width="97px" ValidationGroup="k" CssClass="four1" />
                <br />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="messag_added" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="#FF0066"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </div>
            </ContentTemplate>
         
        </asp:UpdatePanel>
    
    </asp:Content>


