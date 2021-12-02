Imports System.Data.SqlClient


Public Class _Login
    Inherits System.Web.UI.Page

    Protected Sub ButtonTry_Click(sender As Object, e As EventArgs) Handles ButtonTry.Click
      

        

        'Create a connection object
        Dim connection = New SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\NewDatabase.mdf;Integrated Security=True")
        Dim connection2 = New SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\NewDatabase.mdf;Integrated Security=True")
        Dim connection3 = New SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\NewDatabase.mdf;Integrated Security=True")





        Dim command As New SqlCommand("Select * from Users where Username = @username and Password = @password", connection)
        command.Parameters.Add("@username", SqlDbType.VarChar).Value = TextBoxUsername.Text
        command.Parameters.Add("@password", SqlDbType.VarChar).Value = TextBoxPassword.Text



        Dim adapter As New SqlDataAdapter(command)
        Dim table As New DataTable()
        adapter.Fill(table)



        If table.Rows.Count() <= 0 Then
            MsgBox("Login Not Successfull")



        Else
            MsgBox("Successfull Login")

            Dim loginCheck As SqlDataReader
            connection.Open()
            loginCheck = command.ExecuteReader

            








            If loginCheck.Read() Then


                Dim username As String = loginCheck("username").ToString()

                ' Dim dataReader As SqlDataReader


                If loginCheck("user_type").ToString() = "0" Then
                    ' Create new session variable named "MySession" and add some data
                    Session("MySession") = TextBoxUsername.Text

                    Dim command2 As New SqlCommand("INSERT into LoggingEvents (event_name, event_description, event_time) VALUES (@event_name, @event_description, CURRENT_TIMESTAMP) ", connection2)

                    command2.Parameters.Add("@event_name", SqlDbType.VarChar).Value = "Admin"
                    command2.Parameters.Add("@event_description", SqlDbType.VarChar).Value = "Admin Logged in successfully"

                    connection2.Open()
                    command2.ExecuteReader()
                   

                    Response.Redirect("AdminHome.aspx")

                    

                End If


                If loginCheck("user_type").ToString() = "1" Then

                    ' Create new session variable named "MySession" and add some data
                    Session("MySession") = TextBoxUsername.Text

                    Dim command3 As New SqlCommand("INSERT into LoggingEvents (event_name, event_description, event_time) VALUES (@event_name, @event_description, CURRENT_TIMESTAMP) ", connection3)

                    command3.Parameters.Add("@event_name", SqlDbType.VarChar).Value = "Result Manager"
                    command3.Parameters.Add("@event_description", SqlDbType.VarChar).Value = "Result Manager Logged in successfully"

                    connection3.Open()
                    command3.ExecuteReader()


                    Response.Redirect("ResultManagerHome.aspx")


                End If


            End If

        End If






    End Sub

End Class
