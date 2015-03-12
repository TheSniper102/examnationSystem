<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="Student" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <table>
        <tr>
            <td>Choose search type</td>
            <td>
                <asp:DropDownList ID="ddl_search" runat="server" CssClass="col-xs-5">
                    <asp:ListItem Value="0">search by id</asp:ListItem>
                    <asp:ListItem Value="1">search by name</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>Enter search word</td>
            <td>
                <asp:TextBox ID="txt_seach" runat="server" CssClass="col-xs-5"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_seach" Display="Dynamic" ErrorMessage="please enter seach word" ForeColor="#990000" SetFocusOnError="True" ValidationGroup="search_vg">*</asp:RequiredFieldValidator>
                <asp:Label ID="lbl_search" runat="server" ForeColor="#990000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="btn_search_Click" ValidationGroup="search_vg" CssClass="btn btn-primary btn-lg" /></td>
        </tr>
    </table>

    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Responsive Hover Table</h3>
                </div>

                <div class="box-body table-responsive no-padding">
                    <asp:GridView ID="Student_GridView" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="Student_GridView_RowCancelingEdit" OnRowDeleting="Student_GridView_RowDeleting" OnRowEditing="Student_GridView_RowEditing" OnRowUpdating="Student_GridView_RowUpdating" CellPadding="4" Font-Bold="True" Font-Size="Medium" ForeColor="#333333" GridLines="None" Width="216px" CssClass="table table-hover no-streach">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:TemplateField HeaderText="St_id">
                                <EditItemTemplate>
                                    <asp:Label ID="lbl_edit_stid" runat="server" Text='<%# Bind("ST_id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_des_stid" runat="server" Text='<%# Bind("ST_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="St_name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_edit_name" runat="server"  Text='<%# Bind("Name") %>' CssClass="small_inpt" ></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_des_name" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="St_age">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_edit_age" runat="server" Text='<%# Bind("Age") %>' CssClass="small_inpt"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_des_age" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="St_phone">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_edit_phone" runat="server" Text='<%# Bind("phone") %>' CssClass="small_inpt" ></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_des_phone" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="St_Address">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_edit_address" runat="server" Text='<%# Bind("Address") %>' CssClass="small_inpt" ></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_des_address" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="St_Email">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_edit_email" runat="server" Text='<%# Bind("E_Mail") %>' CssClass="small_inpt" ></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_des_email" runat="server" Text='<%# Bind("E_Mail") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Dept_id">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddl_edit_dept" runat="server" DataSourceID="ObjectDataSource1" AppendDataBoundItems="true" DataTextField="Dept_Name" DataValueField="Dept_Id" SelectedValue='<%# Bind("DeptNo") %>' CssClass="small_inpt">
                                        <asp:ListItem Value="">null</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectDept" TypeName="StudentBusinessLayer"></asp:ObjectDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_des_dept" runat="server" Text='<%# Bind("DeptNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <EmptyDataTemplate>
                            sorry no student found
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>

                    <asp:Image ID="img_gvres" runat="server" Width="20" Height="20" ImageUrl="~/images/ok_16x16.gif" Visible="false" />
                    <asp:Label ID="lbl_res" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="Medium" ForeColor="#009933"></asp:Label>
                </div>
            </div>
        </div>
        </div>

        <asp:MultiView ID="MV_Student" runat="server" ActiveViewIndex="0">
            <asp:View ID="V_Add" runat="server">
                <asp:LinkButton ID="LinkBtn" runat="server" Font-Bold="true" OnClick="LinkBtn_Click">Add New Student</asp:LinkButton>
            </asp:View>
            <div class="row">


                <div class="col-md-4">
                            <!-- Info box -->
                            <div class="box box-info">
                                <div class="box-header">
                                    <h3 class="box-title">Info Box</h3>
                                    <div class="box-tools pull-right">
                                        <div class="label bg-aqua">Label</div>
                                    </div>
                                </div>
                                <div class="box-body">
                                   <asp:View ID="V_Insert" runat="server">
                <table>
                    <caption>
                        Add new Student
                    </caption>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Student Name"></asp:Label></td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txt_name" runat="server" AutoPostBack="True" OnTextChanged="txt_name_TextChanged" CssClass="col-xs-5"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="lbl_name_error" runat="server" ForeColor="#990000"></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name" Display="Dynamic" ErrorMessage="Please enter name" ForeColor="#990000" ValidationGroup="VG_Student">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Password
                        </td>
                        <td>
                            <asp:TextBox ID="txt_pass" runat="server" TextMode="Password" CssClass="col-xs-5"></asp:TextBox>
                        </td>
                        <td>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_pass" Display="Dynamic" ErrorMessage="please enter password" ForeColor="#990000" SetFocusOnError="True" ValidationGroup="VG_Student">*</asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>Confirm Password
                        </td>
                        <td>
                            <asp:TextBox ID="txt_conf" runat="server" TextMode="Password" CssClass="col-xs-5"></asp:TextBox>
                        </td>
                        <td>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txt_conf" Display="Dynamic" ErrorMessage="please enter password confirmation" ForeColor="#990000" SetFocusOnError="True" ValidationGroup="VG_Student">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_pass" ControlToValidate="txt_conf" Display="Dynamic" ErrorMessage="password and confirm are not matched" ForeColor="#990000" SetFocusOnError="True" ValidationGroup="VG_Student">*</asp:CompareValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Gender
                        </td>
                        <td class="auto-style1">
                            <asp:DropDownList ID="ddl_gender" runat="server" CssClass="col-xs-5">
                                <asp:ListItem Value="0">--Select Gender--</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style1">

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddl_gender" Display="Dynamic" ErrorMessage="please choose gender" ForeColor="#990000" InitialValue="0" SetFocusOnError="True" ValidationGroup="VG_Student">*</asp:RequiredFieldValidator>

                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Student Age"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txt_age" runat="server" CssClass="col-xs-5"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_age" Display="Dynamic" ErrorMessage="Please enter age" ForeColor="#990000" ValidationGroup="VG_Student">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txt_age" Display="Dynamic" ErrorMessage="please enter valid age" ForeColor="#990000" MaximumValue="30" MinimumValue="20" SetFocusOnError="True" Type="Integer" ValidationGroup="VG_Student">age between 20 and 30</asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Student Phone"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txt_phone" runat="server" CssClass="col-xs-5"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_phone" Display="Dynamic" ErrorMessage="Please enter phone" ForeColor="#990000" ValidationGroup="VG_Student">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_phone" Display="Dynamic" ErrorMessage="please enter valid phone number" ForeColor="#990000" SetFocusOnError="True" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{8}" ValidationGroup="VG_Student">invalid phone</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Student Address"></asp:Label></td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txt_address" runat="server" AutoPostBack="True" OnTextChanged="txt_address_TextChanged" CssClass="col-xs-5"></asp:TextBox>

                                    <br />
                                    <asp:Label ID="lbl_address_error" runat="server" ForeColor="#990000"></asp:Label>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_address" Display="Dynamic" ErrorMessage="Please enter address" ForeColor="#990000" ValidationGroup="VG_Student">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Student Email"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txt_email" runat="server" CssClass="col-xs-5"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_email" Display="Dynamic" ErrorMessage="Please enter email" ForeColor="#990000" ValidationGroup="VG_Student">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_email" Display="Dynamic" ErrorMessage="please enter valid email" ForeColor="#990000" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="VG_Student">invalid email</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label6" runat="server" Text="Department"></asp:Label></td>
                        <td class="auto-style1">
                            <asp:DropDownList ID="ddl_dept" runat="server" AppendDataBoundItems="true" CssClass="col-xs-5">
                                <asp:ListItem Value="0">--Select Department--</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Security Question
                        </td>
                        <td>
                            <asp:TextBox ID="txt_secq" runat="server" CssClass="col-xs-5"></asp:TextBox>
                        </td>
                        <td>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_secq" Display="Dynamic" ErrorMessage="please enter security question" ForeColor="#990000" SetFocusOnError="True" ValidationGroup="VG_Student">*</asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>Security Answer
                        </td>
                        <td>
                            <asp:TextBox ID="txt_secans" runat="server" CssClass="col-xs-5"></asp:TextBox>
                        </td>
                        <td>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txt_secans" Display="Dynamic" ErrorMessage="please enter security answer" ForeColor="#990000" ValidationGroup="VG_Student">*</asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>

                            <asp:Button ID="btn_save" runat="server" Text="Save" ValidationGroup="VG_Student" OnClick="btn_save_Click" CssClass="btn btn-success btn-flat" Height="34px" Width="133px" />

                            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="btn_cancel_Click" CssClass="btn btn-default btn-flat" Width="131px" Height="35px" />
                        </td>
                        <td>
                            <asp:Image ID="img_result" runat="server" Width="20" Height="20" ImageUrl="~/images/ok_16x16.gif" Visible="false" />
                            <asp:Label ID="lbl_result" runat="server" Text="" Font-Bold="true"></asp:Label></td>
                    </tr>
                </table>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="False" Font-Italic="True" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="Maroon" HeaderText="Errors" ValidationGroup="VG_Student" />
                <br />
            </asp:View>
                                </div><!-- /.box-body -->
                                <div class="box-footer">
                                    <code>.box-footer</code>
                                </div><!-- /.box-footer-->
                            </div><!-- /.box -->
                        </div>
            </div>
            
        </asp:MultiView>
</asp:Content>

