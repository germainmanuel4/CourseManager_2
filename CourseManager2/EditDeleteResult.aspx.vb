
Imports System.Data.SqlClient
Imports System.IO


Public Class _EditDeleteResult
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



    Protected Sub EditButton_Click(sender As Object, e As EventArgs) Handles EditButton.Click

        Dim connection = New SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\NewDatabase.mdf;Integrated Security=True")
        Dim connection2 = New SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\NewDatabase.mdf;Integrated Security=True")


        'UPDATE table_name
        'SET column1 = value1, column2 = value2, ...
        'WHERE condition; 
        'Dim command As New SqlCommand("INSERT into Results (unitcode, student_id, assignment_1, assignment_2, exam, year, semester) VALUES (@unitcode, @student_id, @assignment_1, @assignment_2, @exam, @year, @semester) ", connection)
        Dim command As New SqlCommand("UPDATE Results SET unitcode = @unitcode, student_id = @student_id, assignment_1 = @assignment_1, assignment_2 = @assignment_2, exam = @exam, year = @year, semester = @semester  WHERE  unitcode= @unitcode AND  student_id= @student_id AND year= @year AND semester = @semester", connection)

        command.Parameters.Add("@unitcode", SqlDbType.VarChar).Value = UnitCodeEdit.Text
        command.Parameters.Add("@student_id", SqlDbType.VarChar).Value = StudentIDEdit.Text
        command.Parameters.Add("@assignment_1", SqlDbType.VarChar).Value = Assignment1Edit.Text
        command.Parameters.Add("@assignment_2", SqlDbType.VarChar).Value = Assignment2Edit.Text
        command.Parameters.Add("@exam", SqlDbType.VarChar).Value = ExamEdit.Text
        command.Parameters.Add("@year", SqlDbType.VarChar).Value = yearOfStudy.Text
        command.Parameters.Add("@semester", SqlDbType.VarChar).Value = SemEdit.Text




        'Dim adapter As New SqlDataAdapter(command)
        'Dim table As New DataTable()
        'adapter.Fill(table)
        ''''''''''''''''''''''''''''''''''''''''
        ''''''''''''''''''''''''''''''''''''''''''''
        ''''''''''''''''''''''''''''''''''''''''''''''
        'VALIDATE ALL IF EMPTY SHOW ERROR BOX

        'VALIDATE ALL IF EMPTY SHOW ERROR BOX

        Dim allStatesReady As Boolean = True

        If UnitCodeEdit.Text = "" Then
            MsgBox("UnitCode Cannot be Empty")
            allStatesReady = False
        End If


        If StudentIDEdit.Text = "" Then
            MsgBox("Student ID  Cannot be Empty")
            allStatesReady = False
        End If



        If yearOfStudy.Text = "" Then
            MsgBox("Year Cannot be Empty")
            allStatesReady = False
        End If



        If SemEdit.Text = "" Then
            MsgBox("Semester Cannot be Empty")
            allStatesReady = False
        End If





        '''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''
        'Year and Semester must be numeric and have the correct length

        'sem must have 1 lenth only
        Dim sem As String = SemEdit.Text
        'Dim semlength As Integer = sem.Length

        If Not SemEdit.Text = "" Then

            If sem.Length() > 1 Or sem.Length < 1 Then
                MsgBox("Semester Input Length not Accepted")
                allStatesReady = False
            End If


            If Not SemEdit.Text = 1 And Not SemEdit.Text = 2 Then
                MsgBox("Sem can only have 1 digit, e.g 1 or 2 only")
                allStatesReady = False
            End If

            If Not IsNumeric(SemEdit.Text) Then
                MsgBox("Semester Must be numeric")
                allStatesReady = False

            End If

        End If




        If Not yearOfStudy.Text = "" Then

            'year must have 4 length
            Dim year As String = yearOfStudy.Text
            Dim yearlength As Integer = year.Length

            If yearlength <> 4 Then
                MsgBox("Year length must be 4 digits only")
                allStatesReady = False
            End If


        End If

        If Not IsNumeric(yearOfStudy.Text) Then
            MsgBox("Year Must be numeric")
            allStatesReady = False

        End If



        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        ''Should be deleted
        ''assignment 1 and 2 must be numeric 


        'If Not IsNumeric(Assignment1Edit.Text) Then
        'MsgBox("Assignment 1 Must be numeric")
        'allStatesReady = False

        'End If


        'If Not IsNumeric(Assignment2Edit.Text) Then
        'MsgBox("Assignment 2 Must be numeric")
        'allStatesReady = False

        'End If



        ''assignment 1 and 2 must be  0 to 20 only
        'If Assignment1Edit.Text < 0 Or Assignment1Edit.Text > 20 Then
        'MsgBox("Assignment 1 have  0 to 20 marks ")
        'allStatesReady = False

        'End If



        'If Assignment2Edit.Text < 0 Or Assignment2Edit.Text > 20 Then
        'MsgBox("Assignment 2 have  0 to 20 marks ")
        'allStatesReady = False

        'End If

        '''''''''''''''''''''''''''''
        'Exam must be 0 to 60 only   

        'If ExamEdit.Text < 0 Or ExamEdit.Text > 60 Then
        'MsgBox("Exam must be 0 to 60 marks")
        'allStatesReady = False

        'End If

        'Exam not numeric
        'If Not IsNumeric(ExamEdit.Text) Then
        'MsgBox("Exam marks Must be numeric")
        'allStatesReady = False

        'End If


        ''Shoul be deleted up to here





        '''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        If Not Assignment1Edit.Text = "" Then

            'Exam must be 0 to 60 only  
            '' then ready na sila sa if statemetn
            If Assignment1Edit.Text < 0 Or Assignment1Edit.Text > 20 Then
                '' show error
                MsgBox("Assignment 1 have  0 to 20 marks ")
                allStatesReady = False
            End If

            'Assignment 1 not numeric
            If Not IsNumeric(Assignment1Edit.Text) Then
                MsgBox("Assignment 1 Must be numeric")
                allStatesReady = False

            End If


        End If




        If Not Assignment2Edit.Text = "" Then

            'Exam must be 0 to 60 only  
            '' then ready na sila sa if statemetn
            If Assignment2Edit.Text < 0 Or Assignment2Edit.Text > 20 Then
                '' show error
                MsgBox("Assignment 2 have  0 to 20 marks ")
                allStatesReady = False

            End If
            'Assignment 2 not numeric
            If Not IsNumeric(Assignment2Edit.Text) Then
                MsgBox("Assignment 2 Must be numeric")
                allStatesReady = False

            End If

        End If



        If Not ExamEdit.Text = "" Then


            '' then ready na sila sa if statemetn
            'Exam must be 0 to 60 only  
            If ExamEdit.Text < 0 Or ExamEdit.Text > 60 Then
                '' show error
                MsgBox("Exam must be 0 to 60 marks")
                allStatesReady = False

            End If

            'exam not numeric
            If Not IsNumeric(ExamEdit.Text) Then
                MsgBox("Exam marks Must be numeric")
                allStatesReady = False

            End If

        End If





        '''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''
        ''''''''''''''''''''''''''''''''''''''''''''''''''













        '''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''
        ''''''''''''''''''''''''''''''''''''''''''''

        'Student ID must be numeric, and must be 8 length

        If Not StudentIDEdit.Text = "" Then
            If Not IsNumeric(StudentIDEdit.Text) Then
                MsgBox("Student ID Must be numeric")
                allStatesReady = False

            End If




            Dim ID As String = StudentIDEdit.Text


            If ID.Length() > 8 Or ID.Length() < 8 Then
                MsgBox("Student ID length can only be 8 digits")
                allStatesReady = False
            End If


        End If










        Dim UnitCodeLength As String = UnitCodeEdit.Text

        If UnitCodeLength.Length() > 7 Or UnitCodeLength.Length() < 7 Then
            MsgBox("Unit Code Should only be 7 characters, 3 letters and 4 numbers e.g AAA8331")
            allStatesReady = False
        End If




        '''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''


        '' check if it only includes a letter and a number,    and if it is then get the first, second, and third, check if the first three is a letter
        If Regex.IsMatch(UnitCodeEdit.Text, "[A-Za-z0-9]") And ID.Length = 7 Then

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



        Dim command2 As New SqlCommand("INSERT into LoggingEvents (event_name, event_description, event_time) VALUES (@event_name, @event_description, CURRENT_TIMESTAMP) ", connection2)

        command2.Parameters.Add("@event_name", SqlDbType.VarChar).Value = "Result Manager"
        command2.Parameters.Add("@event_description", SqlDbType.VarChar).Value = "Edite New Result  for  " + UnitCodeEdit.Text








        'connection.Open()

        'If command.ExecuteNonQuery() = 1 And allStatesReady = True Then
        If allStatesReady = True Then

            connection.Open()
            command.ExecuteReader()

            connection2.Open()
            command2.ExecuteReader()


            MsgBox("Result Successfully Updated")

            Response.Redirect("EditDeleteResult.aspx")


        Else
            MsgBox("Error Adding New Result, primary keys did not match available")
            Response.Redirect("EditDeleteResult.aspx")
        End If

        connection.Close()

    End Sub

    Protected Sub CancelButton_Click(sender As Object, e As EventArgs) Handles CancelButton.Click

        Response.Redirect("EditDeleteResult.aspx")


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