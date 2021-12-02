Imports System.Data.SqlClient


Public Class _EditDeleteUnit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim mySession As String = Session("MySession")

        If mySession IsNot Nothing Then    'if mySession 
            Dim email As String = mySession.ToString()

            If email <> "admin@ecu.com" Then
                Response.Redirect("Login.aspx")
            End If
        Else
            Response.Redirect("Login.aspx")
        End If




    End Sub



    Protected Sub EditButtonAdmin_Click(sender As Object, e As EventArgs) Handles EditButtonAdmin.Click

        Dim connection = New SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\NewDatabase.mdf;Integrated Security=True")
        Dim connection2 = New SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\NewDatabase.mdf;Integrated Security=True")







        'UPDATE table_name
        'SET column1 = value1, column2 = value2, ...
        'WHERE condition; 
        'Dim command As New SqlCommand("INSERT into Units (unitcode, unit_name, unit_outline, unit_coordinator) VALUES (@unitcode, @unit_name, @unit_outline, @unit_coordinator) ", connection)
        Dim command As New SqlCommand("UPDATE Units SET unitcode = @unitcode, unit_name = @unit_name, unit_coordinator = @unit_coordinator, unit_outline = @unit_outline WHERE unitcode = @unitcode", connection)
        command.Parameters.Add("@unitcode", SqlDbType.VarChar).Value = UnitCodeEdit.Text
        command.Parameters.Add("@unit_name", SqlDbType.VarChar).Value = UnitNameEdit.Text
        command.Parameters.Add("@unit_outline", SqlDbType.VarChar).Value = FileUpload1.FileName
        command.Parameters.Add("@unit_coordinator", SqlDbType.VarChar).Value = UnitCoordinatorEdit.Text





        'Dim adapter As New SqlDataAdapter(command)
        'Dim table As New DataTable()
        'adapter.Fill(table)
        ''''''''''''''''''''''''''''''''''''''''
        ''''''''''''''''''''''''''''''''''''''''''''
        ''''''''''''''''''''''''''''''''''''''''''''''
        'If unitcode and unit title is empty

        Dim allStatesReady As Boolean = True



        If UnitCodeEdit.Text = "" Then
            MsgBox("UnitCode Cannot be Empty")
            allStatesReady = False
        End If


        If UnitNameEdit.Text = "" Then
            MsgBox("Unit Name  Cannot be Empty")
            allStatesReady = False
        End If





        '''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''
        'unit code 3 char 4 numbers e.g    CSI2223
        '''''''''''''''''''''''''''''''''''''''''''''''''''''

        'first check if all characters = 7
        'second check if 3 chars the first 3 characters, and check last four char consists of 4 numbers

        Dim strLength As String = UnitCodeEdit.Text


        'Dim testString As String = "Hello World"
        ' Returns 11.
        Dim UnitCodeLength As Integer = Len(strLength)

        If UnitCodeLength <> 7 Then
            allStatesReady = False
            MsgBox("Unit Code Should only be 7 characters, 3 letters and 4 numbers e.g AAA8331")

        End If











        '' check if it only includes a letter and a number,    and if it is then get the first, second, and third, check if the first three is a letter

        If Regex.IsMatch(UnitCodeEdit.Text, "[A-Za-z0-9]") And UnitCodeLength = 7 Then

            Dim unitcode As Object = UnitCodeEdit.Text

            'check the first 3 letters if they are integers then set false dont execute
            Dim firstcharacter As Char = unitcode(0)
            Dim secondchar As Char = unitcode(1)
            Dim thirdchar As Char = unitcode(2)

            'check the last 4 positions if they are letters then set false dont execute
            Dim fourthchar As Char = unitcode(3)
            Dim fifthchar As Char = unitcode(4)
            Dim sixthchar As Char = unitcode(5)
            Dim seventhchar As Char = unitcode(6)

            'MsgBox(firstcharacter)

            'CSG33333
            If Not firstcharacter <> "0" Or Not firstcharacter <> "1" Or Not firstcharacter <> "2" Or Not firstcharacter <> "3" Or Not firstcharacter <> "5" Or Not firstcharacter <> "6" Or Not firstcharacter <> "7" Or Not firstcharacter <> "8" Or Not firstcharacter <> "9" Then

                MsgBox("Need to follow correct format e.g CSG2222, first character is not a letter!")
                allStatesReady = False

            End If


            If Not firstcharacter <> "0" Or Not secondchar <> "1" Or Not secondchar <> "2" Or Not secondchar <> "3" Or Not secondchar <> "5" Or Not secondchar <> "6" Or Not secondchar <> "7" Or Not secondchar <> "8" Or Not secondchar <> "9" Then

                MsgBox("Need to follow correct format e.g CSG2222, second character is not a letter!!")
                allStatesReady = False

            End If



            If Not firstcharacter <> "0" Or Not thirdchar <> "1" Or Not thirdchar <> "2" Or Not thirdchar <> "3" Or Not thirdchar <> "5" Or Not thirdchar <> "6" Or Not thirdchar <> "7" Or Not thirdchar <> "8" Or Not thirdchar <> "9" Then

                MsgBox("Need to follow correct format e.g CSG2222, third character is not a letter!")
                allStatesReady = False

            End If


            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            ''''''''''''''''Check the last 4 characters'''''''''''''''''''''''''''''''''

            '''''''''''''''''''fourth char a and A lower case and uppercase letters
            If fourthchar = "a" Or fourthchar = "b" Or fourthchar = "c" Or fourthchar = "d" Or fourthchar = "e" Or fourthchar = "f" Or fourthchar = "g" Or fourthchar = "h" Or fourthchar = "i" Or fourthchar = "j" Or fourthchar = "k" Or fourthchar = "l" Or fourthchar = "m" Or fourthchar = "n" Or fourthchar = "o" Or fourthchar = "p" Or fourthchar = "q" Or fourthchar = "r" Or fourthchar = "s" Or fourthchar = "t" Or fourthchar = "u" Or fourthchar = "v" Or fourthchar = "w" Or fourthchar = "x" Or fourthchar = "y" Or fourthchar = "z" Then

                MsgBox("Need to follow correct format e.g CSG2222, 3 letters and 4 numbers!, fourth character is not a digit")
                allStatesReady = False

            End If



            If fourthchar = "A" Or fourthchar = "B" Or fourthchar = "C" Or fourthchar = "D" Or fourthchar = "E" Or fourthchar = "F" Or fourthchar = "G" Or fourthchar = "H" Or fourthchar = "I" Or fourthchar = "J" Or fourthchar = "K" Or fourthchar = "L" Or fourthchar = "M" Or fourthchar = "N" Or fourthchar = "O" Or fourthchar = "P" Or fourthchar = "Q" Or fourthchar = "R" Or fourthchar = "S" Or fourthchar = "T" Or fourthchar = "U" Or fourthchar = "V" Or fourthchar = "W" Or fourthchar = "X" Or fourthchar = "Y" Or fourthchar = "Z" Then

                MsgBox("Need to follow correct format e.g CSG2222, 3 letters and 4 numbers!,  fourth character is not a digit")
                allStatesReady = False

            End If




            '''''''''''''''''''fifth char a and A lower case and uppercase letters
            If fifthchar = "a" Or fifthchar = "b" Or fifthchar = "c" Or fifthchar = "d" Or fifthchar = "e" Or fifthchar = "f" Or fifthchar = "g" Or fifthchar = "h" Or fifthchar = "i" Or fifthchar = "j" Or fifthchar = "k" Or fifthchar = "l" Or fifthchar = "m" Or fifthchar = "n" Or fifthchar = "o" Or fifthchar = "p" Or fifthchar = "q" Or fifthchar = "r" Or fifthchar = "s" Or fifthchar = "t" Or fifthchar = "u" Or fifthchar = "v" Or fourthchar = "w" Or fourthchar = "x" Or fifthchar = "y" Or fifthchar = "z" Then

                MsgBox("Need to follow correct format e.g CSG2222, 3 letters and 4 numbers!, fifth character is not a digit")
                allStatesReady = False

            End If


            If fifthchar = "A" Or fifthchar = "B" Or fifthchar = "C" Or fifthchar = "D" Or fifthchar = "E" Or fifthchar = "F" Or fifthchar = "G" Or fifthchar = "H" Or fifthchar = "I" Or fifthchar = "J" Or fifthchar = "K" Or fifthchar = "L" Or fifthchar = "M" Or fifthchar = "N" Or fifthchar = "O" Or fifthchar = "P" Or fifthchar = "Q" Or fifthchar = "R" Or fifthchar = "S" Or fifthchar = "T" Or fifthchar = "U" Or fifthchar = "V" Or fourthchar = "W" Or fourthchar = "X" Or fifthchar = "Y" Or fifthchar = "Z" Then

                MsgBox("Need to follow correct format e.g CSG2222, 3 letters and 4 numbers!, fifth character is not a digit")
                allStatesReady = False

            End If


            '''''''''''''''''''sixth char a and A lower case and uppercase letters
            If sixthchar = "a" Or sixthchar = "b" Or sixthchar = "c" Or sixthchar = "d" Or sixthchar = "e" Or sixthchar = "f" Or sixthchar = "g" Or sixthchar = "h" Or sixthchar = "i" Or sixthchar = "j" Or sixthchar = "k" Or sixthchar = "l" Or sixthchar = "m" Or sixthchar = "n" Or sixthchar = "o" Or sixthchar = "p" Or sixthchar = "q" Or sixthchar = "r" Or sixthchar = "s" Or sixthchar = "t" Or sixthchar = "u" Or sixthchar = "v" Or sixthchar = "w" Or sixthchar = "x" Or sixthchar = "y" Or sixthchar = "z" Then

                MsgBox("Need to follow correct format e.g CSG2222, 3 letters and 4 numbers!, sixth character is not a digit")
                allStatesReady = False

            End If



            If sixthchar = "A" Or sixthchar = "B" Or sixthchar = "C" Or sixthchar = "D" Or sixthchar = "E" Or sixthchar = "F" Or sixthchar = "G" Or sixthchar = "H" Or sixthchar = "I" Or sixthchar = "J" Or sixthchar = "K" Or sixthchar = "L" Or sixthchar = "M" Or sixthchar = "N" Or sixthchar = "O" Or sixthchar = "P" Or sixthchar = "Q" Or sixthchar = "R" Or sixthchar = "S" Or sixthchar = "T" Or sixthchar = "U" Or sixthchar = "V" Or sixthchar = "W" Or sixthchar = "X" Or sixthchar = "Y" Or sixthchar = "Z" Then

                MsgBox("Need to follow correct format e.g CSG2222, 3 letters and 4 numbers!, sixth character is not a digit")
                allStatesReady = False

            End If



            '''''''''''''''''''sevent char a and A lower case and uppercase letters
            If seventhchar = "a" Or seventhchar = "b" Or seventhchar = "c" Or seventhchar = "d" Or seventhchar = "e" Or seventhchar = "f" Or seventhchar = "g" Or seventhchar = "h" Or seventhchar = "i" Or seventhchar = "j" Or seventhchar = "k" Or seventhchar = "l" Or seventhchar = "m" Or seventhchar = "n" Or seventhchar = "o" Or seventhchar = "p" Or seventhchar = "q" Or seventhchar = "r" Or seventhchar = "s" Or seventhchar = "t" Or seventhchar = "u" Or seventhchar = "v" Or seventhchar = "w" Or seventhchar = "x" Or seventhchar = "y" Or seventhchar = "z" Then

                MsgBox("Need to follow correct format e.g CSG2222, 3 letters and 4 numbers!, seventh character is not a digit")
                allStatesReady = False

            End If


            If seventhchar = "A" Or seventhchar = "B" Or seventhchar = "C" Or seventhchar = "D" Or seventhchar = "E" Or seventhchar = "F" Or seventhchar = "G" Or seventhchar = "H" Or seventhchar = "I" Or seventhchar = "J" Or seventhchar = "K" Or seventhchar = "L" Or seventhchar = "M" Or seventhchar = "N" Or seventhchar = "O" Or seventhchar = "P" Or seventhchar = "Q" Or seventhchar = "R" Or seventhchar = "S" Or seventhchar = "T" Or seventhchar = "U" Or seventhchar = "V" Or seventhchar = "W" Or seventhchar = "X" Or seventhchar = "Y" Or seventhchar = "Z" Then

                MsgBox("Need to follow correct format e.g CSG2222, 3 letters and 4 numbers!, seventh character is not a digit")
                allStatesReady = False

            End If



        End If





















        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'EXECUTE THE QUERY, show msgbox and refresh the page if all validation are ready to go

        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        





        connection.Open()

        'command.ExecuteReader()

        If command.ExecuteNonQuery() = 1 And allStatesReady = True Then
            'If command.ExecuteNonQuery() = 1 And allStatesReady = True Then


            Dim command2 As New SqlCommand("INSERT into LoggingEvents (event_name, event_description, event_time) VALUES (@event_name, @event_description, CURRENT_TIMESTAMP) ", connection2)

            command2.Parameters.Add("@event_name", SqlDbType.VarChar).Value = "Edit Unit"
            command2.Parameters.Add("@event_description", SqlDbType.VarChar).Value = "Successfull Edit, Edited a Unit called  " + UnitCodeEdit.Text
            connection2.Open()
            command2.ExecuteReader()






            MsgBox("Result Successfully Updated")




            If Not FileUpload1.FileName = "" Then

                FileUpload1.SaveAs(Server.MapPath(FileUpload1.FileName))

            End If




            Response.Redirect("~/AddDeleteUnit.aspx")


            MsgBox("Unit Successfully Updated")



            Response.Redirect("EditDeleteUnit.aspx")





        Else
            MsgBox("Error Editing New Result")
            Response.Redirect("EditDeleteUnit.aspx")
        End If

        connection.Close()

    End Sub



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

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