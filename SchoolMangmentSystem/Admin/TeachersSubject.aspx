<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="TeachersSubject.aspx.cs" Inherits="SchoolMangmentSystem.Admin.TeachersSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-label { font-weight: 600; margin-bottom: 5px; }
        .form-section { background: rgba(255, 255, 255, 0.92); padding: 25px; border-radius: 10px; box-shadow: 0 6px 15px rgba(0,0,0,0.15); }
        .page-title { font-size: 26px; font-weight: bold; margin-bottom: 20px; color: #333; }
        .btn-custom { background-color: #5558C9 !important; color: white !important; font-weight: 600; padding: 10px; border-radius: 8px; width: 100%; }
        .btn-custom:hover { background-color: #4446a8 !important; }
        .grid-container { margin-top: 25px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image:url('../Images/bg.jpg'); width:100%; min-height:100vh; background-repeat:no-repeat; background-size:cover; background-attachment:fixed; padding:40px 0;">
        <div class="container">
            
            <!-- Message Label -->
            <div class="mb-3 text-center">
                <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </div>

            <!-- Form Section -->
            <div class="form-section">
                <h3>Assign Teacher to Subject</h3>

                <!-- Inputs -->
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label for="ddlClass" class="form-label">Class</label>
                        <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control form-control-lg"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Class is required" ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="0" />
                    </div>

                    <div class="col-md-4 mb-3">
                        <label for="ddlTeacher" class="form-label">Teacher</label>
                        <asp:DropDownList ID="ddlTeacher" runat="server" CssClass="form-control form-control-lg">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Teacher is required" ControlToValidate="ddlTeacher" Display="Dynamic" ForeColor="Red" InitialValue="0" />
                    </div>

                    <div class="col-md-4 mb-3">
                        <label for="ddlSubject" class="form-label">Subject</label>
                        <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control form-control-lg">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Subject is required" ControlToValidate="ddlSubject" Display="Dynamic" ForeColor="Red" InitialValue="0" />
                    </div>
                </div>

                <!-- Add Button -->
                <div class="row mt-3">
                    <div class="col-md-12 text-center">
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-custom" Text="Assign Subject" OnClick="btnAdd_Click" />
                    </div>
                </div>
            </div>

            <!-- Grid Section -->
            <asp:GridView 
                ID="GridView1" 
                runat="server"
                EmptyDataText="No record to display!"
                CssClass="table table-hover table-bordered"
                AutoGenerateColumns="False"
                Width="100%" 
                AllowPaging="True" 
                PageSize="6" 
                OnPageIndexChanging="GridView1_PageIndexChanging" 
                DataKeyNames="Id"
                OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                OnRowEditing="GridView1_RowEditing"
                OnRowUpdated="GridView1_RowUpdated" 
                OnRowUpdating="GridView1_RowUpdating" 
                OnRowCommand="GridView1_RowCommand" 
                OnRowDeleting="GridView1_RowDeleting">

                <Columns>
                    <asp:BoundField DataField="SrNo" HeaderText="Sr.No" ItemStyle-HorizontalAlign="Center" />

                    <asp:BoundField DataField="ClassName" HeaderText="Class" ItemStyle-HorizontalAlign="Center" />

                    <asp:BoundField DataField="SubjectName" HeaderText="Subject" ItemStyle-HorizontalAlign="Center" />

                    <asp:BoundField DataField="TeacherName" HeaderText="Teacher" ItemStyle-HorizontalAlign="Center" />

                    <asp:CommandField HeaderText="Operation" CausesValidation="false" ShowEditButton="True" ItemStyle-HorizontalAlign="Center" />
                </Columns>

                <HeaderStyle BackColor="#5558C9" ForeColor="White" Font-Bold="true"/>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
