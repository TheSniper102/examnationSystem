<%@ Page Title="student Profile" Language="C#" MasterPageFile="~/StudentMaster.master" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="StudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:MultiView ID="MV_Personal" runat="server" ActiveViewIndex="0">
        <asp:View ID="V_ShowPersonal" runat="server">
            <table class="stPro">
                <caption>
                    Personal Information
                    <asp:LinkButton ID="lbtn_edit" runat="server" OnClick="lbtn_edit_Click" >Edit</asp:LinkButton></caption>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Full Name"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lbl_fullname" runat="server" Text=""></asp:Label>
                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Age"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lbl_age" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>

                        <asp:Label ID="Label4" runat="server" Text="Address"></asp:Label>

                    </td>
                    <td>

                        <asp:Label ID="lbl_address" runat="server" Text=""></asp:Label>

                    </td>

                </tr>
                <tr>
                    <td>

                        <asp:Label ID="Label6" runat="server" Text="Phone"></asp:Label>

                    </td>
                    <td>

                        <asp:Label ID="lbl_phone" runat="server" Text=""></asp:Label>

                    </td>

                </tr>

                <tr>
                    <td>

                        <asp:Label ID="Label10" runat="server" Text="E-Mail"></asp:Label>

                    </td>
                    <td>

                        <asp:Label ID="lbl_email" runat="server" Text=""></asp:Label>

                    </td>

                </tr>
                <tr>
                    <td>

                        <asp:Label ID="Label12" runat="server" Text="Department Name"></asp:Label>

                    </td>
                    <td>

                        <asp:Label ID="lbl_dept" runat="server" Text=""></asp:Label>

                    </td>

                </tr>
                <tr>
                    <td>

                        <asp:Label ID="Label14" runat="server" Text="Department Description"></asp:Label>

                    </td>
                    <td>

                        <asp:Label ID="lbl_desc" runat="server" Text=""></asp:Label>

                    </td>

                </tr>
                <tr>
                    <td>

                        <asp:Label ID="Label15" runat="server" Text="Department Loaction"></asp:Label>

                    </td>
                    <td>

                        <asp:Label ID="lbl_loc" runat="server" Text=""></asp:Label>

                    </td>

                </tr>
            </table>
        </asp:View>
        <asp:View ID="V_editPersonal" runat="server">
            <table>
                <caption>
                    Personal Information
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ValidationGroup="VG_EditInfo">Save Changes</asp:LinkButton></caption>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Full Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_fullname" runat="server"></asp:TextBox>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please enter name" ControlToValidate="txt_fullname" Display="Dynamic" ForeColor="#990000" SetFocusOnError="True" ValidationGroup="VG_EditInfo">*</asp:RequiredFieldValidator>
                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Age"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_age" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="please enter age" ControlToValidate="txt_age" Display="Dynamic" ForeColor="#990000" SetFocusOnError="True" ValidationGroup="VG_EditInfo">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txt_age" Display="Dynamic" ErrorMessage="Age between 20 and 30" ForeColor="#990000" MaximumValue="30" MinimumValue="20" SetFocusOnError="True" Type="Integer" ValidationGroup="VG_EditInfo">*</asp:RangeValidator>
                    </td>

                </tr>
                <tr>
                    <td>

                        <asp:Label ID="Label11" runat="server" Text="Address"></asp:Label>

                    </td>
                    <td>

                        <asp:TextBox ID="txt_address" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="please enter address" ControlToValidate="txt_address" Display="Dynamic" ForeColor="#990000" SetFocusOnError="True" ValidationGroup="VG_EditInfo">*</asp:RequiredFieldValidator>
                    </td>


                </tr>
                <tr>
                    <td>

                        <asp:Label ID="Label16" runat="server" Text="Phone"></asp:Label>

                    </td>
                    <td>

                        <asp:TextBox ID="txt_phone" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="please enter phone" ControlToValidate="txt_phone" Display="Dynamic" ForeColor="#990000" SetFocusOnError="True" ValidationGroup="VG_EditInfo">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_phone" Display="Dynamic" ErrorMessage="invalid phone it must be [0xx-xxxxxxxx]" ForeColor="#990000" SetFocusOnError="True" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{8}" ValidationGroup="VG_EditInfo">*</asp:RegularExpressionValidator>
                    </td>


                </tr>

                <tr>
                    <td>

                        <asp:Label ID="Label20" runat="server" Text="E-Mail"></asp:Label>

                    </td>
                    <td>

                        <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="please enter email" ControlToValidate="txt_email" Display="Dynamic" ForeColor="#990000" SetFocusOnError="True" ValidationGroup="VG_EditInfo">*</asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_email" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="#990000" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="VG_EditInfo">*</asp:RegularExpressionValidator>

                    </td>

                </tr>
                <tr>
                    <td>

                        <asp:Label ID="Label22" runat="server" Text="Department Name"></asp:Label>

                    </td>
                    <td>

                        <asp:DropDownList ID="ddl_dept" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Dept_Name" DataValueField="Dept_Id" AppendDataBoundItems="True">
                            <asp:ListItem Value="">No Department</asp:ListItem>
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectDept" TypeName="StudentBusinessLayer"></asp:ObjectDataSource>

                    </td>

                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>

                        <asp:Label ID="lbl_editRes" runat="server" Font-Italic="True" Font-Size="Medium" ForeColor="#009933"></asp:Label>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Italic="True" Font-Size="Medium" ForeColor="#990000" ValidationGroup="VG_EditInfo" />
                    </td>

                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>

                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    <hr />
    <header>Courses</header>
    <asp:DataList ID="DataList_Courses" runat="server" CellPadding="4" ForeColor="#333333">
        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <ItemTemplate>
            Course Name:<asp:Label ID="Label23" runat="server" Text='<%# Bind("Crs_Name") %>'></asp:Label>
            <br />
            Course Duration:<asp:Label ID="Label24" runat="server" Text='<%# Bind("Crs_Duration") %>'></asp:Label>
            <br />
            Course Instructor:<asp:Label ID="Label25" runat="server" Text='<%# Bind("Ins_Name") %>'></asp:Label>
            <br />
            <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
    <hr />

    <header>
        Exams
    </header>
    <asp:DataList ID="DataList_Exames" runat="server" CellPadding="4" ForeColor="#333333">
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#E3EAEB" />
        <ItemTemplate>
            Course:<asp:Label ID="Label26" runat="server" Text='<%# Bind("Crs_Name") %>'></asp:Label>
            <br />
            Grade:<asp:Label ID="Label27" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
</asp:Content>

