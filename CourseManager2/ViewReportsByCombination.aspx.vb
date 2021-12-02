Imports System.Data.SqlClient
Imports System.IO


Public Class _ViewReportsByCombination
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ' Session data will persists across pages, then
        ' when needed, you can read its value
        Dim mySession As String = Session("MySession")

        If mySession IsNot Nothing Then    'if mySession 
            Dim email As String = mySession.ToString()

            If email <> "manager@ecu.com" Then
                Response.Redirect("Login.aspx")
            End If
        Else
            Response.Redirect("Login.aspx")
        End If



    End Sub




    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim connection = New SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\NewDatabase.mdf;Integrated Security=True")
        Dim connection2 = New SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\NewDatabase.mdf;Integrated Security=True")


        Dim command As New SqlCommand("Select * from Results where unitcode = @unitcode AND year = @year AND semester = @semester", connection)
        command.Parameters.Add("@unitcode", SqlDbType.VarChar).Value = DropDownList1.Text
        command.Parameters.Add("@year", SqlDbType.VarChar).Value = DropDownList2.Text
        command.Parameters.Add("@semester", SqlDbType.VarChar).Value = DropDownList3.Text



        Dim command2 As New SqlCommand("INSERT into LoggingEvents (event_name, event_description, event_time) VALUES (@event_name, @event_description, CURRENT_TIMESTAMP) ", connection2)

        command2.Parameters.Add("@event_name", SqlDbType.VarChar).Value = "Result Manager"
        command2.Parameters.Add("@event_description", SqlDbType.VarChar).Value = "Viewed Reports By Combination of values"

        connection2.Open()
        command2.ExecuteReader()


















        Dim adapter As SqlDataAdapter = New SqlDataAdapter(command)
        ' Dim adapter As New SqlDataAdapter(command)
        'Dim table As New DataTable()
        Dim dt As New DataTable
        Dim dr As DataRow

        'adapter.Fill(dt)


        Dim counter As Integer
        Dim total As Integer

        adapter.Fill(dt)



        For Each dr In dt.Rows


            counter = counter + 1


            Dim intAssignment1 As Integer = dr.Item("assignment_1")
            Dim intAssignment2 As Integer = dr.Item("assignment_2")
            Dim intExam As Integer = dr.Item("exam")

            ''get average 
            total = total + intAssignment1 + intAssignment2 + intExam



        Next

        ''can still access the data outside the loop



        'three c onditions
        '1counter 0 total 0        ,  counter 1  total 0.      total 1 counter 1


        If counter > 0 And total > 0 Then

            Dim average As Integer = total / counter

            Label1.Visible = True
            Label1.Text = DropDownList1.Text

            Label2.Visible = True
            Label2.Text = counter

            Label3.Visible = True
            Label3.Text = average

            Label4.Visible = True
            Label4.Text = DropDownList2.Text

            Label5.Visible = True
            Label5.Text = DropDownList3.Text

        End If


        If counter > 0 And total = 0 Or counter = 0 And total = 0 Then

            'Dim average As Integer = total / counter

            Label1.Visible = True
            Label1.Text = DropDownList1.Text

            Label2.Visible = True
            Label2.Text = counter

            Label3.Visible = True
            Label3.Text = 0

            Label4.Visible = True
            Label4.Text = DropDownList2.Text

            Label5.Visible = True
            Label5.Text = DropDownList3.Text


        End If






    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

        Dim connection4 = New SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\NewDatabase.mdf;Integrated Security=True")
        Dim command4 As New SqlCommand("INSERT into LoggingEvents (event_name, event_description, event_time) VALUES (@event_name, @event_description, CURRENT_TIMESTAMP) ", connection4)

        command4.Parameters.Add("@event_name", SqlDbType.VarChar).Value = "Result Manager"
        command4.Parameters.Add("@event_description", SqlDbType.VarChar).Value = "Logged Out"

        connection4.Open()
        command4.ExecuteReader()



        Session.RemoveAll()
        Response.Redirect("Login.aspx")

    End Sub
End Class