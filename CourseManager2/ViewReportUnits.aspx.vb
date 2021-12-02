Imports System.Data.SqlClient
Imports System.IO


Public Class _ViewReportUnits
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


        Dim command As New SqlCommand("Select * from Results where unitcode = @unitcode", connection)
        command.Parameters.Add("@unitcode", SqlDbType.VarChar).Value = SearchBox.Text



        Dim command2 As New SqlCommand("INSERT into LoggingEvents (event_name, event_description, event_time) VALUES (@event_name, @event_description, CURRENT_TIMESTAMP) ", connection2)

        command2.Parameters.Add("@event_name", SqlDbType.VarChar).Value = "Result Manager"
        command2.Parameters.Add("@event_description", SqlDbType.VarChar).Value = "Viewed Report Units " + SearchBox.Text



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



















        ''if there is no dividing by 0 do this 
        If counter > 0 And total > 0 Then

            Dim average As Integer = total / counter

            Label1.Visible = True
            Label1.Text = SearchBox.Text

            Label2.Visible = True
            Dim rowcounter As Integer = 0
            Label2.Text = counter

            Label3.Visible = True
            Label3.Text = average

        End If

        'if counter = 0 or total = 0 means if dividing by zero then do this
        If counter > 0 And total = 0 Or counter = 0 And total = 0 Then

            'Dim average As Integer = total / counter

            Label1.Visible = True
            Label1.Text = SearchBox.Text

            Label2.Visible = True
            Dim rowcounter As Integer = 0
            Label2.Text = counter

            Label3.Visible = True
            Label3.Text = 0

        End If
    End Sub




    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        Dim gvrow As GridViewRow = e.Row

        Dim refresh As Integer = refresh + 1


        If gvrow.RowType = DataControlRowType.DataRow Then

            Dim rowcounter As Integer = rowcounter + 1

            ' 2,3,4
            Dim Assignment_1 As Integer = Integer.Parse(e.Row.Cells(2).Text)
            Dim Assignment_2 As Integer = Integer.Parse(e.Row.Cells(3).Text)
            Dim Exam As Integer = Integer.Parse(e.Row.Cells(4).Text)

            '' add assignment 1 and 2 to get unit score 
            ''and once you get uniscore- set if thats HD - D - CR - PASS - Fail
            Dim unitscores As Integer = Assignment_1 + Assignment_2 + Exam

            Dim labelUnitScore As New Label() 'Gumawa ng label
            labelUnitScore.Text = unitscores   ' iasign ang value ng label
            e.Row.Cells(7).Controls.Add(labelUnitScore)  ' ilagay ang label sa row



            'Label3.Text = unitscores


            '''''''''''''''''''''''''''''''''''''''''''
            '''''''''''''''''''''''''''''''''''''''''''

            'Undergraduate - 360 , Graduate Diploma - 120, Masters by Coursework - 180, Masters by Research - 240
            'HD 	HIGH DISTINCTION 	80-100
            'D 	DISTINCTION 	70-79
            'CR 	CREDIT 	60-69
            'C 	PASS 	50-59
            'N FAIL



            Dim mark As String

            If unitscores >= 80 Then
                mark = "HD"

            End If


            If unitscores >= 70 And unitscores < 80 Then
                mark = "D"

            End If


            If unitscores >= 60 And unitscores < 70 Then
                mark = "Cr"
            End If



            If unitscores > 49 And unitscores < 60 Then
                mark = "Pass"
            End If

            If unitscores = 0 Or unitscores = Nothing Or unitscores < 50 Then
                mark = "Fail"
            End If

            Dim markdefinition As New Label()
            markdefinition.Text = mark
            e.Row.Cells(8).Controls.Add(markdefinition)







            '''''''''''''''''''''''''''''''''''''''''''
            '''''''''''''''''''''''''''''''''''''''''''

            '' Add the labels and output to a row

            'e.Row.Cells(7).Controls.Add(labelUnitScore)

            'Dim labelStudentID As New Label()
            'Label1.Text = "Yes"


        End If

    End Sub




















    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
      
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



        Session.RemoveAll()
        Response.Redirect("Login.aspx")
    End Sub
End Class