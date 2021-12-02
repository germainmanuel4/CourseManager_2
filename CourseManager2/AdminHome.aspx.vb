Imports System.Data.SqlClient



Public Class _AdminHome
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click


        Dim connection4 = New SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\NewDatabase.mdf;Integrated Security=True")
        Dim command4 As New SqlCommand("INSERT into LoggingEvents (event_name, event_description, event_time) VALUES (@event_name, @event_description, CURRENT_TIMESTAMP) ", connection4)

        command4.Parameters.Add("@event_name", SqlDbType.VarChar).Value = "Admin"
        command4.Parameters.Add("@event_description", SqlDbType.VarChar).Value = "Logged Out"

        connection4.Open()
        command4.ExecuteReader()


        Session.RemoveAll()
        Response.Redirect("Login.aspx")
    End Sub
End Class