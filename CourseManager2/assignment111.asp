<%@ Page Language= "VB" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>





<script runat="server">



                                                                                                                   
'firstName = false
'surName = false
'ID = false
'course = false
'allInputsReady = false

dim firstName
    

dim surName
dim ID
dim creditPoint
dim marks 
dim course
dim unitCode
dim allInputsReady 
dim errorCounter = 0
dim credit 
dim unit
dim year
dim UniMarks
dim showMessage
dim message1
Dim message2
Dim message3
Dim message4
Dim yearSem
Dim totalCreditPoints
Dim courseType
dim counter
dim pass
dim passedCredit15
dim passedCredit20
dim unitCounter 
dim failCounter 
dim sumOfUnits
dim average
dim totalUnitsAttempted
dim passedUnits
dim failedUnits

dim total 
dim failcounter1
dim failcounter2
dim failcounter3
dim failcounter4
dim failcounter5
dim failcounter6
dim failcounter7
dim failcounter8
dim failcounter9
dim failcounter10
dim failcounter11
dim failcounter12
dim failcounter13
dim failcounter14
dim failcounter15
dim failcounter16
dim failcounter17
dim failcounter18
dim failcounter19
dim failcounter20
dim failcounter21
dim failcounter22
dim failcounter23
dim failcounter24
dim failcounter25
dim failcounter26
dim failcounter27
dim failcounter28
dim failcounter29
dim failcounter30







    dim unit1  
    dim unit2 
    dim unit3 
    dim unit4  
    dim unit5 
    dim unit6 
    dim unit7  
    dim unit8 
    dim unit9 
    dim unit10  
    dim unit11 
    dim unit12 
    dim unit13 
    dim unit14  
    dim unit15 
    dim unit16 
    dim unit17  
    dim unit18 
    dim unit19 
    dim unit20  
    dim unit21 
    dim unit22 
    dim unit23 
    dim unit24 
    dim unit25  
    dim unit26 
    dim unit27 
    dim unit28  
    dim unit29 
    dim unit30 
    

    dim marks1 
    dim marks2 
    dim marks3
    dim marks4 
    dim marks5 
    dim marks6 
    dim marks7 
    dim marks8 
    dim marks9
    dim marks10 
    dim marks11 
    dim marks12 
    dim marks13 
    dim marks14 
    dim marks15 
    dim marks16 
    dim marks17 
    dim marks18 
    dim marks19 
    dim marks20
    dim marks21
    dim marks22 
    dim marks23
    dim marks24 
    dim marks25 
    dim marks26 
    dim marks27
    dim marks28 
    dim marks29 
    dim marks30 
    

    
    dim UG = 240  'Undergrauate
    dim GD = 80    'Graduate Diploma
    dim MC = 120   'Masters by CourseWork
    dim MR = 160   'Masters by Research
    dim countercoursetype


    dim underGraduate 
    dim graduateDiploma 
    dim mastersCourseWork 
    dim mastersResearch 










sub getCreditPoints()
    counter = 1
    passedCredit15 = 0
    passedCredit20 = 0

    
    Do while counter < 31  
          UniMarks = request.form("UM_" + CStr(counter))
          credit = request.form("CP_" + CStr(counter))
          
          if UniMarks >= "50" and credit = "15" or UniMarks = "100" and credit = "15" then
          passedCredit15 = passedCredit15 + 1
         
          
          elseif UniMarks >= "50" and credit = "20" or UniMarks = "100" and credit = "20" then
          passedCredit20 = passedCredit20 + 1
         
          
          else
          'do nothing
           
          end if
          counter = counter + 1
  
    Loop
    if passedCredit15 = 0 then
    totalCreditPoints = passedCredit15 * 15

         if passedCredit20 = 0 then
         totalCreditPoints = passedCredit20 * 20
         else
         totalCreditPoints = passedCredit15 * 15 + passedCredit20 * 20
         end if
    
    else 
    totalCreditPoints = passedCredit15 * 15 + passedCredit20 * 20
    
    end if


    
    'Print required credit points and passed credit points
  
    coursetype = request.form("CourseType")
    if coursetype = "1" then
    response.write("UnderGraduate degree requires 360 credit points, you only need:  " & 360 - totalCreditPoints & "  credit points to complete this course" & "<br />")
    response.write("Passed Credit Points:  "  &  totalCreditPoints & "<br />")
    
    elseif coursetype = "2" then
    response.write("Graduate Diploma requires 120 credit points, you only need:  " & 120 - totalCreditPoints &  "  credit points to complete this course" &  "<br />")
    response.write("Passed Credit Points:  "  &  totalCreditPoints & "<br />")

    elseif coursetype = "3" then
    response.write("Masters by CourseWork requires 180 credit points, you only need:  " & 180 - totalCreditPoints & " credit points to complete this course"  &  "<br />")
    response.write("Passed Credit Points:  "  &  totalCreditPoints & "<br />")

    elseif coursetype = "4" then
    response.write("Masters by Research requires 240 credit points, you only need:  " & 240 - totalCreditPoints & " credit points to complete this course"  &  "<br />")
    response.write("Passed Credit Points:  "  &  totalCreditPoints & "<br />")

    else
    'do nothing
    end if
end sub







function numberOfSucessfulUnits()
    counter = 1
    dim pass = 0
 

    Do while counter < 31 
          UniMarks = request.form("UM_" + CStr(counter))
           if UniMarks > "49"  then
           pass = pass + 1
           
           elseif  UniMarks = "100" then
           pass = pass + 1

           

           else
           end if
           counter = counter + 1     
           Loop
    
    response.write("Number of Successful Units Attempted:  " & pass & "<br />")
    'response.write(pass)
end function




function numberOfUnitsAttempted()
    counter = 1
    unitCounter = 0
    failCounter = 0

    Do while counter < 31 
          UniMarks = request.form("UM_" + CStr(counter))
          if UniMarks >= "0" then
          unitCounter = unitCounter + 1
          else
          end if
          
          counter = counter + 1
           
          
          Loop
    response.write("Number of Total Units Attempted:  " & unitCounter & "<br/>")        
end function









sub getCourseAverage()
    sumOfUnits = 0
    average = 0
    counter = 1
    totalUnitsAttempted = 0
    passedUnits = 0
    failedUnits = 0

    Do while counter < 31 
          UniMarks = request.form("UM_" + CStr(counter))
          if UniMarks >= "50" and UniMarks <> "" then
          passedUnits = passedUnits + 1      
    
          elseif UniMarks  <= "49" and UniMarks <> "" then
          failedUnits = failedUnits + 1
          else
          'do nothing  
          end if
          counter = counter + 1        
     Loop
    totalUnitsAttempted = passedUnits + failedUnits
    
    counter = 1 



    do while counter < 31
          UniMarks = request.form("UM_" + CStr(counter))
          if UniMarks >= "0" then
          sumOfUnits = sumOfUnits + cint(UniMarks)
          else
     
          end if
          counter = counter + 1 
    Loop
 
    average = cint(sumOfUnits / totalUnitsAttempted)  

    'HD 80 - 100
    'D 70-79
    'CR 60-69
    'C 50-59
    'N 0-49
    
    if average >= cint(80) and average  <= cint(100) then
    response.write("Student's course average:   " & average & "  HD" & "<br />")

    elseif average >= cint(70) and average <= cint(79) then
    response.write("Students course average:   " & average & "  D" & "<br />")
    
     elseif average >= cint(60) and average <= cint(69) then
    response.write("Students course average:   " & average & "  CR" & "<br />")

    elseif average >= cint(50) and average <= cint(59) then
    response.write("Students course average:   " & average & "  C" & "<br />")

    elseif average >= cint(0) and average <= cint(49) then
    response.write("Students course average:   " & average & "  N" & "<br />")

    else
    end if

end sub











sub courseExcluded()
    total = 0
    failcounter1 = 0
    failcounter2 = 0
    failcounter3 =0
    failcounter4 = 0
    failcounter5 = 0
    failcounter6 = 0
    failcounter7 =0
    failcounter8 = 0
    failcounter9 = 0
    failcounter10 = 0
    failcounter11 = 0
    failcounter12 = 0
    failcounter13 = 0
    failcounter14 = 0
    failcounter15 =0
    failcounter16 = 0
    failcounter17 = 0
    failcounter18 = 0
    failcounter19 = 0
    failcounter20 = 0
    failcounter21 = 0
    failcounter22 =0
    failcounter22 = 0
    failcounter23 = 0
    failcounter24 = 0
    failcounter25 = 0
    failcounter26 = 0
    failcounter27 = 0
    failcounter28 = 0
    failcounter29 = 0
    failcounter30 = 0

    unit1  = request.form("UnitCode_1")
    unit2 = request.form("UnitCode_2")
    unit3 = request.form("UnitCode_3")
    unit4  = request.form("UnitCode_4")
    unit5 = request.form("UnitCode_5")
    unit6 = request.form("UnitCode_6")
    unit7  = request.form("UnitCode_7")
    unit8 = request.form("UnitCode_8")
    unit9 = request.form("UnitCode_9")
    unit10  = request.form("UnitCode_10")
    unit11 = request.form("UnitCode_11")
    unit12 = request.form("UnitCode_12")
    unit13 = request.form("UnitCode_13")
    unit14  = request.form("UnitCode_14")
    unit15 = request.form("UnitCode_15")
    unit16 = request.form("UnitCode_16")
    unit17  = request.form("UnitCode_17")
    unit18 = request.form("UnitCode_18")
    unit19 = request.form("UnitCode_19")
    unit20  = request.form("UnitCode_20")
    unit21 = request.form("UnitCode_21")
    unit22  = request.form("UnitCode_22")
    unit23 = request.form("UnitCode_23")
    unit24 = request.form("UnitCode_24")
    unit25  = request.form("UnitCode_25")
    unit26 = request.form("UnitCode_26")
    unit27 = request.form("UnitCode_27")
    unit28  = request.form("UnitCode_28")
    unit29 = request.form("UnitCode_29")
    unit30 = request.form("UnitCode_30")
    

    marks1 = request.form("UM_1")
    marks2 = request.form("UM_2")
    marks3 = request.form("UM_3")
    marks4 = request.form("UM_4")
    marks5 = request.form("UM_5")
    marks6 = request.form("UM_6")
    marks7 = request.form("UM_7")
    marks8 = request.form("UM_8")
    marks9 = request.form("UM_9")
    marks10 = request.form("UM_10")
    marks11 = request.form("UM_11")
    marks12 = request.form("UM_12")
    marks13 = request.form("UM_13")
    marks14 = request.form("UM_14")
    marks15 = request.form("UM_15")
    marks16 = request.form("UM_16")
    marks17 = request.form("UM_17")
    marks18 = request.form("UM_18")
    marks19 = request.form("UM_19")
    marks20 = request.form("UM_20")
    marks21 = request.form("UM_21")
    marks22 = request.form("UM_22")
    marks23 = request.form("UM_23")
    marks24 = request.form("UM_24")
    marks25 = request.form("UM_25")
    marks26 = request.form("UM_26")
    marks27 = request.form("UM_27")
    marks28 = request.form("UM_28")
    marks29 = request.form("UM_29")
    marks30 = request.form("UM_30")
    
      
    if marks1 < "50" and marks1 <> "" and unit1 <>"" and marks1 <> "100" then
        if marks1 < "50" and marks2 < "50" or marks1 < "50" and marks3 < "50" or marks1 < "50" and marks4  < "50" or marks1 < "50" and marks5 < "50" or marks1 < "50" and marks6 < "50" or marks1 < "50" and marks7 < "50" or marks1 < "50" and marks8 < "50" or marks1 < "50" and marks9  < "50" or marks1 < "50" and marks10 < "50" or marks1 < "50" and marks11 < "50" or marks1 < "50" and marks12 < "50" or marks1 < "50" and marks13 < "50" or marks1 < "50" and marks14  < "50" or marks1 < "50" and marks15 < "50" or marks1 < "50" and marks16 < "50" or marks1 < "50" and marks17 < "50" or marks1 < "50" and marks18 < "50" or marks1 < "50" and marks19  < "50" or marks1 < "50" and marks20 < "50" or marks1 < "50" and marks21 < "50" or marks1 < "50" and marks22 < "50" or marks1 < "50" and marks23 < "50" or marks1 < "50" and marks24  < "50" or marks1 < "50" and marks25 < "50" or marks1 < "50" and marks26 < "50" or marks1 < "50" and marks27 < "50" or marks1 < "50" and marks28 < "50" or marks1 < "50" and marks29  < "50" or marks1 < "50" and marks30 < "50"  then
            if unit1 = unit2 or unit1 = unit3 or unit1 = unit4 or unit1 =  unit5 or unit1 = unit6 or unit1 = unit7 or unit1 = unit8 or unit1 = unit9 or unit1 =  unit10 or unit1 = unit11 or unit1 = unit12 or unit1 = unit13 or unit1 =  unit14 or  unit1 = unit15  or unit1 = unit16 or unit1 = unit17 or unit1 = unit18 or unit1 = unit19 or unit1 = unit20 or unit1 = unit21 or unit1 = unit22 or unit1 = unit23 or unit1 = unit24 or unit1 = unit25 or unit1 = unit26 or unit1 = unit27 or unit1 = unit28 or unit1 = unit29 or unit1 = unit30 then
            failcounter1 = failcounter1 + 1
            else
            end if
        else
        end if

    else
    end if

    if marks2 < "50" and marks2 <> "" and unit2 <> "" and marks2 <> "100" then
        if marks2 < "50" and marks1 < "50" or marks2 < "50" and marks3 < "50" or marks2 < "50" and marks4  < "50" or marks2 < "50" and marks5 < "50" or marks2 < "50" and marks6 < "50" or marks2 < "50" and marks7 < "50" or marks2 < "50" and marks8 < "50" or marks2 < "50" and marks9  < "50" or marks2 < "50" and marks10 < "50" or marks2 < "50" and marks11 < "50" or marks2 < "50" and marks12 < "50" or marks2 < "50" and marks13 < "50" or marks2 < "50" and marks14  < "50" or marks2 < "50" and marks15 < "50" or marks2 < "50" and marks16 < "50" or marks2 < "50" and marks17 < "50" or marks2 < "50" and marks18 < "50" or marks2 < "50" and marks19  < "50" or marks2 < "50" and marks20 < "50" or marks2 < "50" and marks21 < "50" or marks2 < "50" and marks22 < "50" or marks2 < "50" and marks23 < "50" or marks2 < "50" and marks24  < "50" or marks2 < "50" and marks25 < "50" or marks2 < "50" and marks26 < "50" or marks2 < "50" and marks27 < "50" or marks2 < "50" and marks28 < "50" or marks2 < "50" and marks29  < "50" or marks2 < "50" and marks30 < "50" then
            if unit2 = unit1 or unit2 = unit3 or unit2 = unit4 or unit2 = unit5 or unit2 = unit6 or unit2 = unit7 or unit2 = unit8 or unit2 = unit9 or unit2 = unit10 or unit2 = unit11 or unit2 = unit12 or unit2 = unit13 or unit2 = unit14 or unit2 = unit15 or unit2 = unit16 or unit2 = unit17 or unit2 = unit18 or unit2 = unit19 or unit2 = unit20 or unit2 = unit21 or unit2 = unit22 or unit2 = unit23 or unit2 = unit24 or unit2 = unit25 or unit2 = unit26 or unit2 = unit27 or unit2 = unit28 or unit2 = unit29 or unit2 = unit30 then
            failcounter2 = failcounter2 + 1
            else
            end if
        else
        end if

    else
    end if

    if marks3 < "50" and marks3 <> "" and unit3 <> "" and marks3 <> "100" then
        if marks3 < "50" and marks1 < "50" or marks3 < "50" and marks2 < "50" or marks3 < "50" and marks4  < "50" or marks3 < "50" and marks5 < "50" or marks3 < "50" and marks6 < "50" or marks3 < "50" and marks7 < "50" or marks3 < "50" and marks8 < "50" or marks3 < "50" and marks9  < "50" or marks3 < "50" and marks10 < "50" or marks3 < "50" and marks11 < "50" or marks3 < "50" and marks12 < "50" or marks3 < "50" and marks13 < "50" or marks3 < "50" and marks14  < "50" or marks3 < "50" and marks15 < "50" or marks3 < "50" and marks16 < "50" or marks3 < "50" and marks17 < "50" or marks3 < "50" and marks18 < "50" or marks3 < "50" and marks19  < "50" or marks3 < "50" and marks20 < "50" or marks3 < "50" and marks21 < "50" or marks3 < "50" and marks22 < "50" or marks3 < "50" and marks23 < "50" or marks3 < "50" and marks24  < "50" or marks3 < "50" and marks25 < "50" or marks3 < "50" and marks26 < "50" or marks3 < "50" and marks27 < "50" or marks3 < "50" and marks28 < "50" or marks3 < "50" and marks29  < "50" or marks3 < "50" and marks30 < "50" then
             if unit3 = unit1 or unit3 = unit2 or unit3 = unit4 or unit3 = unit5 or unit3 = unit6 or unit3 = unit7 or unit3 = unit8 or unit3 = unit9 or unit3 = unit10 or unit3 = unit11 or unit3 = unit12 or unit3 = unit13 or unit3 = unit14 or unit3 = unit15 or unit3 = unit16 or unit3 = unit17 or unit3 = unit18 or unit3 = unit19 or unit3 = unit20 or unit3 = unit21 or unit3 = unit22 or unit3 = unit23 or unit3 = unit24 or unit3 = unit25 or unit3 = unit26 or unit3 = unit27 or unit3 = unit28 or unit3 = unit29 or unit3 = unit30 then
             failcounter3 = failcounter3 + 1
             else
             end if
        else
        end if

    else
    end if

    if marks4 < "50" and marks4 <> "" and unit4 <> "" and marks4 <> "100" then
        if marks4 < "50" and marks1 < "50" or marks4 < "50" and marks2 < "50" or marks4 < "50" and marks4  < "50" or marks4 < "50" and marks5 < "50" or marks4 < "50" and marks6 < "50" or marks4 < "50" and marks7 < "50" or marks4 < "50" and marks8 < "50" or marks4 < "50" and marks9  < "50" or marks4 < "50" and marks10 < "50" or marks4 < "50" and marks11 < "50" or marks4 < "50" and marks12 < "50" or marks4 < "50" and marks13 < "50" or marks4 < "50" and marks14  < "50" or marks4 < "50" and marks15 < "50" or marks4 < "50" and marks16 < "50" or marks4 < "50" and marks17 < "50" or marks4 < "50" and marks18 < "50" or marks4 < "50" and marks19  < "50" or marks4 < "50" and marks20 < "50" or marks4 < "50" and marks21 < "50" or marks4 < "50" and marks22 < "50" or marks4 < "50" and marks23 < "50" or marks4 < "50" and marks24  < "50" or marks4 < "50" and marks25 < "50" or marks4 < "50" and marks26 < "50" or marks4 < "50" and marks27 < "50" or marks4 < "50" and marks28 < "50" or marks4 < "50" and marks29  < "50" or marks4 < "50" and marks30 < "50" then
            if unit4 = unit1 or unit4 = unit2 or unit4 = unit3 or unit4 = unit5 or unit4 = unit6 or unit4 = unit7 or unit4 = unit8 or unit4 = unit9 or unit4 = unit10 or unit4 = unit11 or unit4 = unit12 or unit4 = unit13 or unit4 = unit14 or unit4 = unit15 or unit4 = unit16 or unit4 = unit17 or unit4 = unit18 or unit4 = unit19 or unit4 = unit20 or unit4 = unit21 or unit4 = unit22 or unit4 = unit23 or unit4 = unit24 or unit4 = unit25 or unit4 = unit26 or unit4 = unit27 or unit4 = unit28 or unit4 = unit29 or unit4 = unit30 then
            failcounter4 = failcounter4 + 1
            else
            end if
        else
        end if

    else
    end if


      if marks5 < "50" and marks5 <> "" and unit5 <> "" and marks5 <> "100" then
          if marks5 < "50" and marks1 < "50" or marks5 < "50" and marks2 < "50" or marks5 < "50" and marks3  < "50" or marks5 < "50" and marks4 < "50" or marks5 < "50" and marks6 < "50" or marks5 < "50" and marks7 < "50" or marks5 < "50" and marks8 < "50" or marks5 < "50" and marks9  < "50" or marks5 < "50" and marks10 < "50" or marks5 < "50" and marks11 < "50" or marks5 < "50" and marks12 < "50" or marks5 < "50" and marks13 < "50" or marks5 < "50" and marks14  < "50" or marks5 < "50" and marks15 < "50" or marks5 < "50" and marks16 < "50" or marks5 < "50" and marks17 < "50" or marks5 < "50" and marks18 < "50" or marks5 < "50" and marks19  < "50" or marks5 < "50" and marks20 < "50" or marks5 < "50" and marks21 < "50" or marks5 < "50" and marks22 < "50" or marks5 < "50" and marks23 < "50" or marks5 < "50" and marks24  < "50" or marks5 < "50" and marks25 < "50" or marks5 < "50" and marks26 < "50" or marks5 < "50" and marks27 < "50" or marks5 < "50" and marks28 < "50" or marks5 < "50" and marks29  < "50" or marks5 < "50" and marks30 < "50" then
              if unit5 = unit1 or unit5 = unit2 or unit5 = unit3 or unit5 = unit4 or unit5 = unit6 or unit5 = unit7 or unit5 = unit8 or unit5 = unit9 or unit5 = unit10 or unit5 = unit11 or unit5 = unit12 or unit5 = unit13 or unit5 = unit14 or unit5 = unit15 or unit5 = unit16 or unit5 = unit17 or unit5 = unit18 or unit5 = unit19 or unit5 = unit20 or unit5 = unit21 or unit5 = unit22 or unit5 = unit23 or unit5 = unit24 or unit5 = unit25 or unit5 = unit26 or unit5 = unit27 or unit5 = unit28 or unit5 = unit29 or unit5 = unit30 then
              failcounter5 = failcounter5 + 1
              else
              end if
        else
        end if

    else
    end if


      if marks6 < "50" and marks6 <> "" and unit6 <> "" and marks6 <> "100" then
          if marks6 < "50" and marks1 < "50" or marks6 < "50" and marks2 < "50" or marks6 < "50" and marks3  < "50" or marks6 < "50" and marks4 < "50" or marks6 < "50" and marks5 < "50" or marks6 < "50" and marks7 < "50" or marks6 < "50" and marks8 < "50" or marks6 < "50" and marks9  < "50" or marks6 < "50" and marks10 < "50" or marks6 < "50" and marks11 < "50" or marks6 < "50" and marks12 < "50" or marks6 < "50" and marks13 < "50" or marks6 < "50" and marks14  < "50" or marks6 < "50" and marks15 < "50" or marks6 < "50" and marks16 < "50" or marks6 < "50" and marks17 < "50" or marks6 < "50" and marks18 < "50" or marks6 < "50" and marks19  < "50" or marks6 < "50" and marks20 < "50" or marks6 < "50" and marks21 < "50" or marks6 < "50" and marks22 < "50" or marks6 < "50" and marks23 < "50" or marks6 < "50" and marks24  < "50" or marks6 < "50" and marks25 < "50" or marks6 < "50" and marks26 < "50" or marks6 < "50" and marks27 < "50" or marks6 < "50" and marks28 < "50" or marks6 < "50" and marks29  < "50" or marks6 < "50" and marks30 < "50" then
              if unit6 = unit1 or unit6 = unit2 or unit6 = unit3 or unit6 = unit4 or unit6 = unit5 or unit6 = unit7 or unit6 = unit8 or unit6 = unit9 or unit6 = unit10 or unit6 = unit11 or unit6 = unit12 or unit6 = unit13 or unit6 = unit14 or  unit6 = unit15 or unit6 = unit16 or unit6 = unit17 or unit6 = unit18 or unit6 = unit19 or unit6 = unit20 or unit6 = unit21 or unit6 = unit22 or unit6 = unit23 or unit6 = unit24  or unit6 = unit25 or unit6 = unit26 or unit6 = unit27 or unit6 = unit28 or unit6 = unit29 or unit6 = unit30 then
              failcounter6 = failcounter6 + 1 
              else
              end if
        else
        end if

    else
    end if


      if marks7 < "50" and marks7 <> "" and unit7 <> "" and marks7 <> "100" then
          if marks7 < "50" and marks1 < "50" or marks7 < "50" and marks2 < "50" or marks7 < "50" and marks3  < "50" or marks7 < "50" and marks4 < "50" or marks7 < "50" and marks5 < "50" or marks7 < "50" and marks6 < "50" or marks7 < "50" and marks8 < "50" or marks7 < "50" and marks9  < "50" or marks7 < "50" and marks10 < "50" or marks7 < "50" and marks11 < "50" or marks7 < "50" and marks12 < "50" or marks7 < "50" and marks13 < "50" or marks7 < "50" and marks14  < "50" or marks7 < "50" and marks15 < "50" or marks7 < "50" and marks16 < "50" or marks7 < "50" and marks17 < "50" or marks7 < "50" and marks18 < "50" or marks7 < "50" and marks19  < "50" or marks7 < "50" and marks20 < "50" or marks7 < "50" and marks21 < "50" or marks7 < "50" and marks22 < "50" or marks7 < "50" and marks23 < "50" or marks7 < "50" and marks24  < "50" or marks7 < "50" and marks25 < "50" or marks7 < "50" and marks26 < "50" or marks7 < "50" and marks27 < "50" or marks7 < "50" and marks28 < "50" or marks7 < "50" and marks29  < "50" or marks7 < "50" and marks30 < "50" then
              if unit7 = unit1 or unit7 = unit2 or unit7 = unit3 or unit7 = unit4 or unit7 = unit5 or unit7 = unit6 or unit7 = unit8 or unit7 = unit9 or unit7 = unit10 or unit7 = unit11 or unit7 = unit12 or unit7 = unit13 or unit7 = unit14 or unit7 = unit15 or unit7 = unit16 or unit7 = unit17 or unit7 = unit18 or unit7 = unit19 or unit7 = unit20 or unit7 = unit21 or unit7 = unit22 or unit7 = unit23 or unit7 = unit24 or unit7 = unit25 or unit7 = unit26 or unit7 = unit27 or unit7 = unit28 or unit7 = unit29 or unit7 = unit30 then
              failcounter7 = failcounter7 + 1
              else
              end if
        else
        end if

    else
    end if


      if marks8 < "50" and marks8 <> "" and unit8 <> "" and marks8 <> "100" then
          if marks8 < "50" and marks1 < "50" or marks8 < "50" and marks2 < "50" or marks8 < "50" and marks3  < "50" or marks8 < "50" and marks4 < "50" or marks8 < "50" and marks5 < "50" or marks8 < "50" and marks6 < "50" or marks8 < "50" and marks7 < "50" or marks8 < "50" and marks9  < "50" or marks8 < "50" and marks10 < "50" or marks8 < "50" and marks11 < "50" or marks8 < "50" and marks12 < "50" or marks8 < "50" and marks13 < "50" or marks8 < "50" and marks14  < "50" or marks8 < "50" and marks15 < "50" or marks8 < "50" and marks16 < "50" or marks8 < "50" and marks17 < "50" or marks8 < "50" and marks18 < "50" or marks8 < "50" and marks19  < "50" or marks8 < "50" and marks20 < "50" or marks8 < "50" and marks21 < "50" or marks8 < "50" and marks22 < "50" or marks8 < "50" and marks23 < "50" or marks8 < "50" and marks24  < "50" or marks8 < "50" and marks25 < "50" or marks8 < "50" and marks26 < "50" or marks8 < "50" and marks27 < "50" or marks8 < "50" and marks28 < "50" or marks8 < "50" and marks29  < "50" or marks8 < "50" and marks30 < "50" then
              if unit8 = unit1 or unit8 = unit2 or unit8 = unit3 or unit8 = unit4 or unit8 = unit5 or unit8 = unit6 or unit8 = unit7 or unit8 = unit9 or unit8 = unit10 or unit8 = unit11 or unit8 = unit12 or unit8 = unit13 or unit8 = unit14 or unit8 = unit15 or unit8 = unit16 or unit8 = unit17 or unit8 = unit18 or unit8 = unit19 or unit8 = unit20 or unit8 = unit21 or unit8 = unit22 or unit8 = unit23 or unit8 = unit24 or unit8 = unit25 or unit8 = unit26 or unit8 = unit27 or unit8 = unit28 or unit8 = unit29 or unit8 = unit30 then
              failcounter8 = failcounter8 + 1
              else
              end if
        else
        end if

    else
    end if

      if marks9 < "50" and marks9 <> "" and unit9 <> "" and marks9 <> "100" then
          if marks9 < "50" and marks1 < "50" or marks9 < "50" and marks2 < "50" or marks9 < "50" and marks3  < "50" or marks9 < "50" and marks4 < "50" or marks9 < "50" and marks5 < "50" or marks9 < "50" and marks6 < "50" or marks9 < "50" and marks7 < "50" or marks9 < "50" and marks8  < "50" or marks9 < "50" and marks10 < "50" or marks9 < "50" and marks11 < "50" or marks9 < "50" and marks12 < "50" or marks9 < "50" and marks13 < "50" or marks9 < "50" and marks14  < "50" or marks9 < "50" and marks15 < "50" or marks9 < "50" and marks16 < "50" or marks9 < "50" and marks17 < "50" or marks9 < "50" and marks18 < "50" or marks9 < "50" and marks19  < "50" or marks9 < "50" and marks20 < "50" or marks9 < "50" and marks21 < "50" or marks9 < "50" and marks22 < "50" or marks9 < "50" and marks23 < "50" or marks9 < "50" and marks24  < "50" or marks9 < "50" and marks25 < "50" or marks9 < "50" and marks26 < "50" or marks9 < "50" and marks27 < "50" or marks9 < "50" and marks28 < "50" or marks9 < "50" and marks29  < "50" or marks9 < "50" and marks30 < "50" then
              if unit9 = unit1 or unit9 = unit2 or unit9 = unit3 or unit9 = unit4 or unit9 = unit5 or unit9 = unit6 or unit9 = unit7 or unit9 = unit8 or unit9 = unit9 or unit9  = unit10 or unit9 = unit11 or unit9 = unit12 or unit9 = unit13 or unit9 = unit14 or unit9 = unit15 or unit9 = unit16 or unit9 = unit17 or unit9 = unit18 or unit9 = unit19 or unit9 = unit20 or unit9 = unit21 or unit9 = unit22 or  unit9 = unit23 or unit9 = unit24 or unit9 = unit25 or unit9 = unit26  or unit9 = unit27 or unit9 = unit28 or unit9 = unit29 or unit9 = unit10 then
              failcounter9 = failcounter9 + 1
              else
              end if
        else
        end if

    else
    end if


      if marks10 < "50" and marks10 <> "" and unit10 <> "" and marks10 <> "100" then
          if marks10 < "50" and marks1 < "50" or marks10 < "50" and marks2 < "50" or marks10 < "50" and marks3  < "50" or marks10 < "50" and marks4 < "50" or marks10 < "50" and marks5 < "50" or marks10 < "50" and marks6 < "50" or marks10 < "50" and marks7 < "50" or marks10 < "50" and marks8  < "50" or marks10 < "50" and marks9 < "50" or marks10 < "50" and marks11 < "50" or marks10 < "50" and marks12 < "50" or marks10 < "50" and marks13 < "50" or marks10 < "50" and marks14  < "50" or marks10 < "50" and marks15 < "50" or marks10 < "50" and marks16 < "50" or marks10 < "50" and marks17 < "50" or marks10 < "50" and marks18 < "50" or marks10 < "50" and marks19  < "50" or marks10 < "50" and marks20 < "50" or marks10 < "50" and marks21 < "50" or marks10 < "50" and marks22 < "50" or marks10 < "50" and marks23 < "50" or marks10 < "50" and marks24  < "50" or marks10 < "50" and marks25 < "50" or marks10 < "50" and marks26 < "50" or marks10 < "50" and marks27 < "50" or marks10 < "50" and marks28 < "50" or marks10 < "50" and marks29  < "50" or marks10 < "50" and marks30 < "50" then
              if unit10 = unit1 or unit10 = unit2 or unit10 = unit3 or unit10 = unit4 or unit10 = unit5 or unit10 = unit6 or unit10 = unit7 or unit10 = unit8 or unit10 = unit9 or unit10 = unit11 or unit10 = unit12 or unit10 = unit13 or unit10 = unit14 or unit10 = unit15 or unit10 = unit16 or unit10 = unit17 or unit10 = unit18 or unit10 = unit19 or unit10 = unit20 or unit10 = unit21 or unit10 = unit22 or  unit10 = unit23 or unit10 = unit24 or unit10 = unit25 or unit10 = unit26 or unit10 = unit27 or unit10 = unit28 or unit10 = unit29 or unit10 = unit30 then
              failcounter10 = failcounter10 + 1
              else
              end if
        else
        end if

    else
    end if

    if marks11 < "50" and marks11 <> "" and unit11 <> "" and marks11 <> "100" then
        if marks11 < "50" and marks1 < "50" or marks11 < "50" and marks2 < "50" or marks11 < "50" and marks3  < "50" or marks11 < "50" and marks4 < "50" or marks11 < "50" and marks5 < "50" or marks11 < "50" and marks6 < "50" or marks11 < "50" and marks7 < "50" or marks11 < "50" and marks8  < "50" or marks11 < "50" and marks9 < "50" or marks11 < "50" and marks10 < "50" or marks11 < "50" and marks12 < "50" or marks11 < "50" and marks13 < "50" or marks11 < "50" and marks14  < "50" or marks11 < "50" and marks15 < "50" or marks11 < "50" and marks16 < "50" or marks11 < "50" and marks17 < "50" or marks11 < "50" and marks18 < "50" or marks11 < "50" and marks19  < "50" or marks11 < "50" and marks20 < "50" or marks11 < "50" and marks21 < "50" or marks11 < "50" and marks22 < "50" or marks11 < "50" and marks23 < "50" or marks11 < "50" and marks24  < "50" or marks11 < "50" and marks25 < "50" or marks11 < "50" and marks26 < "50" or marks11 < "50" and marks27 < "50" or marks11 < "50" and marks28 < "50" or marks11 < "50" and marks29  < "50" or marks11 < "50" and marks30 < "50" then
            if unit11 = unit1 or unit11 = unit2 or unit11 = unit3 or unit11 = unit4 or unit11 = unit5 or unit11 = unit6 or unit11 = unit7 or unit11 = unit8 or unit11 = unit9 or unit11 = unit10 or unit11 = unit12 or unit11 = unit13 or unit11 = unit14 or unit11 = unit15 or unit11 = unit16 or unit11 = unit17 or unit11 = unit18 or unit11 = unit19 or unit11 = unit20 or unit11 = unit21 or unit11 = unit22 or unit11 = unit23 or unit11 = unit24 or unit11 = unit25 or unit11 = unit26 or unit11 = unit27 or unit11 = unit28 or unit11 = unit29 or unit11 = unit30 then
            failcounter11 = failcounter11 + 1
            else
            end if
        else
        end if

    else
    end if


    if marks12 < "50" and marks12 <> "" and unit12 <> "" and marks12 <> "100" then
         if marks12 < "50" and marks1 < "50" or marks12 < "50" and marks2 < "50" or marks12 < "50" and marks3  < "50" or marks12 < "50" and marks4 < "50" or marks12 < "50" and marks5 < "50" or marks12 < "50" and marks6 < "50" or marks12 < "50" and marks7 < "50" or marks12 < "50" and marks8  < "50" or marks12 < "50" and marks9 < "50" or marks12 < "50" and marks10 < "50" or marks12 < "50" and marks11 < "50" or marks12 < "50" and marks13 < "50" or marks12 < "50" and marks14  < "50" or marks12 < "50" and marks15 < "50" or marks12 < "50" and marks16 < "50" or marks12 < "50" and marks17 < "50" or marks12 < "50" and marks18 < "50" or marks12 < "50" and marks19  < "50" or marks12 < "50" and marks20 < "50" or marks12 < "50" and marks21 < "50" or marks12 < "50" and marks22 < "50" or marks12 < "50" and marks23 < "50" or marks12 < "50" and marks24  < "50" or marks12 < "50" and marks25 < "50" or marks12 < "50" and marks26 < "50" or marks12 < "50" and marks27 < "50" or marks12 < "50" and marks28 < "50" or marks12 < "50" and marks29  < "50" or marks12 < "50" and marks30 < "50" then
             if unit12 = unit1 or unit12 = unit2 or unit12 = unit3 or unit12 = unit4 or unit12 = unit5 or unit12 = unit6 or unit12 = unit7 or unit12 = unit8 or unit12 = unit9 or unit12 = unit10 or unit12 = unit11 or unit12 = unit13 or unit12 = unit14 or unit12 = unit15 or unit12 = unit16 or unit12 = unit17 or unit12 = unit18 or unit12 = unit19 or unit12 = unit20 or unit12 = unit21 or unit12 = unit22 or unit12 = unit23 or unit12 = unit24 or unit12 = unit25 or unit12 = unit26 or unit12 = unit27 or unit12 = unit28 or unit12 = unit29 or unit12 = unit30 then
             failcounter12 = failcounter12 + 1
             else
             end if
        else
        end if

    else
    end if


    if marks13 < "50" and marks13 <> "" and unit13 <> "" and marks13 <> "100" then
        if marks13 < "50" and marks1 < "50" or marks13 < "50" and marks2 < "50" or marks13 < "50" and marks3  < "50" or marks13 < "50" and marks4 < "50" or marks13 < "50" and marks5 < "50" or marks13 < "50" and marks6 < "50" or marks13 < "50" and marks7 < "50" or marks13 < "50" and marks8  < "50" or marks13 < "50" and marks9 < "50" or marks13 < "50" and marks10 < "50" or marks13 < "50" and marks11 < "50" or marks13 < "50" and marks12 < "50" or marks13 < "50" and marks14  < "50" or marks13 < "50" and marks15 < "50" or marks13 < "50" and marks16 < "50" or marks13 < "50" and marks17 < "50" or marks13 < "50" and marks18 < "50" or marks13 < "50" and marks19  < "50" or marks13 < "50" and marks20 < "50" or marks13 < "50" and marks21 < "50" or marks13 < "50" and marks22 < "50" or marks13 < "50" and marks23 < "50" or marks13 < "50" and marks24  < "50" or marks13 < "50" and marks25 < "50" or marks13 < "50" and marks26 < "50" or marks13 < "50" and marks27 < "50" or marks13 < "50" and marks28 < "50" or marks13 < "50" and marks29  < "50" or marks13 < "50" and marks30 < "50" then
            if unit13 = unit1 or unit13 = unit2 or unit13 = unit3 or unit13 = unit4 or unit13 = unit5 or unit13 = unit6 or unit13 = unit7 or unit13 = unit8 or unit13 = unit9 or unit13 = unit10 or unit13 = unit11 or unit13 = unit12 or unit13 = unit14 or unit13 = unit15 or unit13 = unit16 or unit13 = unit17 or unit13 = unit18 or unit13 = unit19 or unit13 = unit20 or unit13 = unit21 or unit13 = unit22 or unit13 = unit23 or unit13 = unit24 or unit13 = unit25 or unit13 = unit26 or unit13 = unit27 or unit13 = unit28 or unit13 = unit29 or unit13 = unit30 then
            failcounter13 = failcounter13 + 1
            else
            end if
        else
        end if

    else
    end if


    if marks14 < "50" and marks14 <> "" and unit14 <> "" and marks14 <> "100" then
        if marks14 < "50" and marks1 < "50" or marks14 < "50" and marks2 < "50" or marks14 < "50" and marks3  < "50" or marks14 < "50" and marks4 < "50" or marks14 < "50" and marks5 < "50" or marks14 < "50" and marks6 < "50" or marks14 < "50" and marks7 < "50" or marks14 < "50" and marks8  < "50" or marks14 < "50" and marks9 < "50" or marks14 < "50" and marks10 < "50" or marks14 < "50" and marks11 < "50" or marks14 < "50" and marks12 < "50" or marks14 < "50" and marks13  < "50" or marks14 < "50" and marks15 < "50" or marks14 < "50" and marks16 < "50" or marks14 < "50" and marks17 < "50" or marks14 < "50" and marks18 < "50" or marks14 < "50" and marks19  < "50" or marks14 < "50" and marks20 < "50" or marks14 < "50" and marks21 < "50" or marks14 < "50" and marks22 < "50" or marks14 < "50" and marks23 < "50" or marks14 < "50" and marks24  < "50" or marks14 < "50" and marks25 < "50" or marks14 < "50" and marks26 < "50" or marks14 < "50" and marks27 < "50" or marks14 < "50" and marks28 < "50" or marks14 < "50" and marks29  < "50" or marks14 < "50" and marks30 < "50" then
           if unit14 = unit1 or unit14 = unit2 or unit14 = unit3 or unit14 = unit4 or unit14 = unit5 or unit14 = unit6 or unit14 = unit7 or unit14 = unit8 or unit14 = unit9 or unit14 = unit10 or unit14 = unit11 or unit14 = unit12 or unit14 = unit13 or unit14 = unit15 or unit14 = unit16 or unit14 = unit17 or unit14 = unit18 or unit14 = unit19 or unit14 = unit20 or unit14 = unit21 or unit14 = unit22 or unit14 = unit23 or unit14 = unit24 or unit14 = unit25 or unit14 = unit26 or unit14 = unit27 or unit14 = unit28 or unit14 = unit29 or unit14 = unit30 then
           failcounter14 = failcounter14 + 1
            else
            end if
        else
        end if

    else
    end if


    if marks15 < "50" and marks15 <> "" and unit15 <> "" and marks15 <> "100" then
        if marks15 < "50" and marks1 < "50" or marks15 < "50" and marks2 < "50" or marks15 < "50" and marks3  < "50" or marks15 < "50" and marks4 < "50" or marks15 < "50" and marks5 < "50" or marks15 < "50" and marks6 < "50" or marks15 < "50" and marks7 < "50" or marks15 < "50" and marks8  < "50" or marks15 < "50" and marks9 < "50" or marks15 < "50" and marks10 < "50" or marks15 < "50" and marks11 < "50" or marks15 < "50" and marks12 < "50" or marks15 < "50" and marks13  < "50" or marks15 < "50" and marks14 < "50" or marks15 < "50" and marks16 < "50" or marks15 < "50" and marks17 < "50" or marks15 < "50" and marks18 < "50" or marks15 < "50" and marks19  < "50" or marks15 < "50" and marks20 < "50" or marks15 < "50" and marks21 < "50" or marks15 < "50" and marks22 < "50" or marks15 < "50" and marks23 < "50" or marks15 < "50" and marks24  < "50" or marks15 < "50" and marks25 < "50" or marks15 < "50" and marks26 < "50" or marks15 < "50" and marks27 < "50" or marks15 < "50" and marks28 < "50" or marks15 < "50" and marks29  < "50" or marks15 < "50" and marks30 < "50" then
            if unit15 = unit1 or unit15 = unit2 or unit15 = unit3 or unit5 = unit4 or unit15 = unit5 or unit15 = unit6 or unit15 = unit7 or unit15 = unit8 or unit15 = unit9 or unit15 = unit10 or unit15 = unit11 or unit15 = unit12 or unit15 = unit13 or unit15  = unit14 or unit15 = unit16 or unit15 = unit17 or unit15 = unit18 or unit15 = unit19 or unit15 = unit20 or unit15 = unit21 or unit15 = unit22 or unit15 = unit23 or unit15 = unit24 or unit15 = unit25 or unit15 = unit26 or unit15 = unit27 or unit15 = unit28 or unit15 = unit29 or unit15 = unit30 then 
            failcounter15 = failcounter15 + 1
            else
            end if
        else
        end if

    else
    end if



    if marks16 < "50" and marks16 <> "" and unit16 <> "" and marks18 <> "100" then
        if marks16 < "50" and marks1 < "50" or marks16 < "50" and marks2 < "50" or marks16 < "50" and marks3  < "50" or marks16 < "50" and marks4 < "50" or marks16 < "50" and marks5 < "50" or marks16 < "50" and marks6 < "50" or marks16 < "50" and marks7 < "50" or marks16 < "50" and marks8  < "50" or marks16 < "50" and marks9 < "50" or marks16 < "50" and marks10 < "50" or marks16 < "50" and marks11 < "50" or marks16 < "50" and marks12 < "50" or marks16 < "50" and marks13  < "50" or marks16 < "50" and marks14 < "50" or marks16 < "50" and marks15 < "50" or marks16 < "50" and marks17 < "50" or marks16 < "50" and marks18 < "50" or marks16 < "50" and marks19  < "50" or marks16 < "50" and marks20 < "50" or marks16 < "50" and marks21 < "50" or marks16 < "50" and marks22 < "50" or marks16 < "50" and marks23 < "50" or marks16 < "50" and marks24  < "50" or marks16 < "50" and marks25 < "50" or marks16 < "50" and marks26 < "50" or marks16 < "50" and marks27 < "50" or marks16 < "50" and marks28 < "50" or marks16 < "50" and marks29  < "50" or marks16 < "50" and marks30 < "50" then
            if unit16 = unit1 or unit16 = unit2 or unit16 = unit3  or unit16 = unit4 or unit16 = unit5 or unit16 = unit6 or unit16 = unit7 or unit16 = unit8 or unit16 = unit9 or unit16 = unit10 or unit16 = unit11 or unit16 = unit12 or unit16 = unit13 or unit16 = unit14 or unit16 = unit15 or unit16 = unit17 or unit16 = unit18 or unit16 = unit19 or unit16 = unit20 or unit16 = unit21 or unit16 = unit22 or unit16 = unit23 or unit16 = unit24 or unit16 = unit25 or unit16 = unit26 or unit16 = unit27 or unit16 = unit28 or unit16 = unit29 or unit16 = unit30 then
            failcounter16 = failcounter16 + 1
            else
            end if
        else
        end if

    else
    end if


     if marks17 < "50" and marks17 <> "" and unit17 <> "" and marks17 <>  "100" then
         if marks17 < "50" and marks1 < "50" or marks17 < "50" and marks2 < "50" or marks17 < "50" and marks3  < "50" or marks17 < "50" and marks4 < "50" or marks17 < "50" and marks5 < "50" or marks17 < "50" and marks6 < "50" or marks17 < "50" and marks7 < "50" or marks17 < "50" and marks8  < "50" or marks17 < "50" and marks9 < "50" or marks17 < "50" and marks10 < "50" or marks17 < "50" and marks11 < "50" or marks17 < "50" and marks12 < "50" or marks17 < "50" and marks13  < "50" or marks17 < "50" and marks14 < "50" or marks17 < "50" and marks15 < "50" or marks17 < "50" and marks16 < "50" or marks17 < "50" and marks18 < "50" or marks17 < "50" and marks19  < "50" or marks17 < "50" and marks20 < "50" or marks17 < "50" and marks21 < "50" or marks17 < "50" and marks22 < "50" or marks17 < "50" and marks23 < "50" or marks17 < "50" and marks24  < "50" or marks17 < "50" and marks25 < "50" or marks17 < "50" and marks26 < "50" or marks17 < "50" and marks27 < "50" or marks17 < "50" and marks28 < "50" or marks17 < "50" and marks29  < "50" or marks17 < "50" and marks30 < "50" then
             if unit17 = unit1 or unit17 = unit2 or unit17 = unit3 or unit17 = unit4 or unit17 = unit5 or unit17 = unit6 or unit17 = unit7 or unit17 = unit8 or unit17 = unit9 or unit17 = unit10 or unit17 = unit11 or unit17 = unit12 or unit17 = unit13 or unit17 = unit14 or unit17 = unit15 or unit17 = unit16 or unit17 = unit18 or unit17 = unit19 or unit17 = unit20 or unit17 = unit21 or unit17 = unit22 or unit17 = unit23 or unit17 = unit24 or unit17 = unit25 or unit17 = unit26 or unit17 = unit27 or unit17 = unit28 or unit17 = unit29 or unit17 = unit30 then
             failcounter17 = failcounter17 + 1
             else
             end if
        else
        end if

    else
    end if


     if marks18 < "50" and marks18 <> "" and unit18 <> "" and marks18 <> "100" then
         if marks18 < "50" and marks1 < "50" or marks18 < "50" and marks2 < "50" or marks18 < "50" and marks3  < "50" or marks18 < "50" and marks4 < "50" or marks18 < "50" and marks5 < "50" or marks18 < "50" and marks6 < "50" or marks18 < "50" and marks7 < "50" or marks18 < "50" and marks8  < "50" or marks18 < "50" and marks9 < "50" or marks18 < "50" and marks10 < "50" or marks18 < "50" and marks11 < "50" or marks18 < "50" and marks12 < "50" or marks18 < "50" and marks13  < "50" or marks18 < "50" and marks14 < "50" or marks18 < "50" and marks15 < "50" or marks18 < "50" and marks16 < "50" or marks18 < "50" and marks17 < "50" or marks18 < "50" and marks19  < "50" or marks18 < "50" and marks20 < "50" or marks18 < "50" and marks21 < "50" or marks18 < "50" and marks22 < "50" or marks18 < "50" and marks23 < "50" or marks18 < "50" and marks24  < "50" or marks18 < "50" and marks25 < "50" or marks18 < "50" and marks26 < "50" or marks18 < "50" and marks27 < "50" or marks18 < "50" and marks28 < "50" or marks18 < "50" and marks29  < "50" or marks18 < "50" and marks30 < "50" then
             if unit18 = unit1 or unit18 = unit2 or unit18 = unit3 or unit18 = unit4 or unit18 = unit5 or unit18 = unit6 or unit18 = unit7 or unit18 = unit8 or unit18 = unit9 or unit18 = unit10 or unit18 = unit11 or unit18 = unit12 or unit18 = unit13 or unit18 = unit14 or unit18 = unit15 or unit18 = unit16 or unit18 = unit17 or unit18 = unit19 or unit18 = unit20 or unit18 = unit21 or unit18 = unit22 or unit18 = unit23 or unit18 = unit24 or unit18 = unit25 or unit18 = unit26 or unit18 = unit27 or unit18 = unit28 or unit18 = unit29 or unit18 = unit30 then 
             failcounter18 = failcounter18 + 1
             else
             end if
        else
        end if

    else
    end if


     if marks19 < "50" and marks19 <> "" and unit19 <> "" and marks19 <> "100" then
         if marks19 < "50" and marks1 < "50" or marks19 < "50" and marks2 < "50" or marks19 < "50" and marks3  < "50" or marks19 < "50" and marks4 < "50" or marks19 < "50" and marks5 < "50" or marks19 < "50" and marks6 < "50" or marks19 < "50" and marks7 < "50" or marks19 < "50" and marks8  < "50" or marks19 < "50" and marks9 < "50" or marks19 < "50" and marks10 < "50" or marks19 < "50" and marks11 < "50" or marks19 < "50" and marks12 < "50" or marks19 < "50" and marks13  < "50" or marks19 < "50" and marks14 < "50" or marks19 < "50" and marks15 < "50" or marks19 < "50" and marks16 < "50" or marks19 < "50" and marks17 < "50" or marks19 < "50" and marks18  < "50" or marks19 < "50" and marks20 < "50" or marks19 < "50" and marks21 < "50" or marks19 < "50" and marks22 < "50" or marks19 < "50" and marks23 < "50" or marks19 < "50" and marks24  < "50" or marks19 < "50" and marks25 < "50" or marks19 < "50" and marks26 < "50" or marks19 < "50" and marks27 < "50" or marks19 < "50" and marks28 < "50" or marks19 < "50" and marks29  < "50" or marks19 < "50" and marks30 < "50" then
             if unit19 = unit1 or unit19 = unit2 or unit19 = unit3 or unit19 = unit4 or unit19 = unit5 or unit19 = unit6 or unit19 = unit7 or unit19 = unit8 or unit19 = unit9 or unit19 = unit10 or unit19 = unit11 or unit19 = unit12 or unit19 = unit13 or unit19 = unit14 or unit19 = unit15 or unit19 = unit16 or unit19 = unit17 or unit19 = unit18 or unit19 = unit20 or unit19 = unit21 or unit19 = unit22 or unit19 = unit23 or unit19 = unit24 or unit19 = unit25 or unit19 = unit26 or unit19 = unit27 or unit19 = unit28 or unit19 = unit29 or unit19 = unit30 then
             failcounter19 = failcounter19 + 1
             else
             end if
        else
        end if

    else
    end if

     if marks20 < "50" and marks20 <> "" and unit20 <> "" and marks20 <> "100" then
         if marks20 < "50" and marks1 < "50" or marks20 < "50" and marks2 < "50" or marks20 < "50" and marks3  < "50" or marks20 < "50" and marks4 < "50" or marks20 < "50" and marks5 < "50" or marks20 < "50" and marks6 < "50" or marks20 < "50" and marks7 < "50" or marks20 < "50" and marks8  < "50" or marks20 < "50" and marks9 < "50" or marks20 < "50" and marks10 < "50" or marks20 < "50" and marks11 < "50" or marks20 < "50" and marks12 < "50" or marks20 < "50" and marks13  < "50" or marks20 < "50" and marks14 < "50" or marks20 < "50" and marks15 < "50" or marks20 < "50" and marks16 < "50" or marks20 < "50" and marks17 < "50" or marks20 < "50" and marks18  < "50" or marks20 < "50" and marks19 < "50" or marks20 < "50" and marks21 < "50" or marks20 < "50" and marks22 < "50" or marks20 < "50" and marks23 < "50" or marks20 < "50" and marks24  < "50" or marks20 < "50" and marks25 < "50" or marks20 < "50" and marks26 < "50" or marks20 < "50" and marks27 < "50" or marks20 < "50" and marks28 < "50" or marks20 < "50" and marks29  < "50" or marks20 < "50" and marks30 < "50" then
             if unit20 = unit1 or unit20 = unit2 or unit20 = unit3 or unit20 = unit4 or unit20 = unit5 or unit20 = unit6 or unit20 = unit7 or unit20 = unit8 or unit20 = unit9 or unit20 = unit10 or unit20 = unit11 or unit20 = unit12 or unit20 = unit13 or unit20 = unit14 or unit20 = unit15 or unit20 = unit16 or unit20 = unit17 or unit20 = unit18 or unit20 = unit19 or unit20 = unit21 or unit20 = unit22 or unit20 = unit23 or unit20 = unit24 or unit20 = unit25 or unit20 = unit26 or unit20 = unit27 or unit20 = unit28 or unit20 = unit29 or unit20 = unit30 then
             failcounter20 = failcounter20 + 1
             else
             end if
        else
        end if

    else
    end if

     if marks21 < "50" and marks21 <> "" and unit21 <> "" and marks21 <> "100" then
         if marks21 < "50" and marks1 < "50" or marks21 < "50" and marks2 < "50" or marks21 < "50" and marks3  < "50" or marks21 < "50" and marks4 < "50" or marks21 < "50" and marks5 < "50" or marks21 < "50" and marks6 < "50" or marks21 < "50" and marks7 < "50" or marks21 < "50" and marks8  < "50" or marks21 < "50" and marks9 < "50" or marks21 < "50" and marks10 < "50" or marks21 < "50" and marks11 < "50" or marks21 < "50" and marks12 < "50" or marks21 < "50" and marks13  < "50" or marks21 < "50" and marks14 < "50" or marks21 < "50" and marks15 < "50" or marks21 < "50" and marks16 < "50" or marks21 < "50" and marks17 < "50" or marks21 < "50" and marks18  < "50" or marks21 < "50" and marks19 < "50" or marks21 < "50" and marks20 < "50" or marks21 < "50" and marks22 < "50" or marks21 < "50" and marks23 < "50" or marks21 < "50" and marks24  < "50" or marks21 < "50" and marks25 < "50" or marks21 < "50" and marks26 < "50" or marks21 < "50" and marks27 < "50" or marks21 < "50" and marks28 < "50" or marks21 < "50" and marks29  < "50" or marks21 < "50" and marks30 < "50" then
             if unit21 = unit1 or unit21 = unit2 or unit21 = unit3 or unit21 = unit4 or unit21 = unit5 or unit21 = unit6 or unit21 = unit7 or unit21 = unit8 or unit21 = unit9 or unit21 = unit10 or unit21 = unit11 or unit21 = unit12 or unit21 = unit13 or unit21 = unit14 or unit21 = unit15 or unit21 = unit16 or unit21 = unit17 or unit21 = unit18 or unit21 = unit19 or unit21 = unit20 or unit21 = unit22 or unit21 = unit23 or unit21 = unit24 or unit21 = unit25 or unit21 = unit26 or unit21 = unit27 or unit21 = unit28 or unit21 = unit29 or unit21 = unit30 then
             failcounter21 = failcounter21 + 1
             else
             end if
        else
        end if

    else
    end if



     if marks22 < "50" and marks22 <> "" and unit22 <> "" and marks22 <> "100" then
         if marks22 < "50" and marks1 < "50" or marks22 < "50" and marks2 < "50" or marks22 < "50" and marks3  < "50" or marks22 < "50" and marks4 < "50" or marks22 < "50" and marks5 < "50" or marks22 < "50" and marks6 < "50" or marks22 < "50" and marks7 < "50" or marks22 < "50" and marks8  < "50" or marks22 < "50" and marks9 < "50" or marks22 < "50" and marks10 < "50" or marks22 < "50" and marks11 < "50" or marks22 < "50" and marks12 < "50" or marks22 < "50" and marks13  < "50" or marks22 < "50" and marks14 < "50" or marks22 < "50" and marks15 < "50" or marks22 < "50" and marks16 < "50" or marks22 < "50" and marks17 < "50" or marks22 < "50" and marks18  < "50" or marks22 < "50" and marks19 < "50" or marks22 < "50" and marks20 < "50" or marks22 < "50" and marks21 < "50" or marks22 < "50" and marks23 < "50" or marks22 < "50" and marks24  < "50" or marks22 < "50" and marks25 < "50" or marks22 < "50" and marks26 < "50" or marks22 < "50" and marks27 < "50" or marks22 < "50" and marks28 < "50" or marks22 < "50" and marks29  < "50" or marks22 < "50" and marks30 < "50" then
             if unit22 = unit1 or unit22 = unit2 or unit22 = unit3 or unit22 = unit4 or unit22 = unit5 or unit22 = unit6 or unit22 = unit7 or unit22 = unit8 or unit22 = unit9 or unit22 = unit10 or unit22 = unit11 or unit22 = unit12 or unit22 = unit13 or unit22 = unit14 or unit22 = unit15 or unit22 = unit16 or unit22 = unit17 or unit22 = unit18 or unit22 = unit19 or unit22 = unit20 or unit22 = unit21 or unit22 = unit23 or unit22 = unit24 or unit22 = unit25 or unit22 = unit26 or unit22 = unit27 or unit22 = unit28 or unit22 = unit29 or unit22 = unit30 then
             failcounter22 = failcounter22 + 1
             else
             end if
        else
        end if

    else
    end if
    


    if marks23 < "50" and marks23 <> "" and unit23 <> "" and marks23 <> "100" then
        if marks23 < "50" and marks1 < "50" or marks23 < "50" and marks2 < "50" or marks23 < "50" and marks3  < "50" or marks23 < "50" and marks4 < "50" or marks23 < "50" and marks5 < "50" or marks23 < "50" and marks6 < "50" or marks23 < "50" and marks7 < "50" or marks23 < "50" and marks8  < "50" or marks23 < "50" and marks9 < "50" or marks23 < "50" and marks10 < "50" or marks23 < "50" and marks11 < "50" or marks23 < "50" and marks12 < "50" or marks23 < "50" and marks13  < "50" or marks23 < "50" and marks14 < "50" or marks23 < "50" and marks15 < "50" or marks23 < "50" and marks16 < "50" or marks23 < "50" and marks17 < "50" or marks23 < "50" and marks18  < "50" or marks23 < "50" and marks19 < "50" or marks23 < "50" and marks20 < "50" or marks23 < "50" and marks21 < "50" or marks23 < "50" and marks22 < "50" or marks23 < "50" and marks24  < "50" or marks23 < "50" and marks25 < "50" or marks23 < "50" and marks26 < "50" or marks23 < "50" and marks27 < "50" or marks23 < "50" and marks28 < "50" or marks23 < "50" and marks29  < "50" or marks23 < "50" and marks30 < "50" then
            if unit23 = unit1 or unit23 = unit2 or unit23 = unit3 or unit23 = unit4 or unit23 = unit5 or unit23 = unit6 or unit23 = unit7 or unit23 = unit8 or unit23 = unit9 or unit23 = unit10 or unit23 = unit11 or unit23 = unit12 or unit23 = unit13 or unit23 = unit14 or unit23 = unit15 or unit23 = unit16 or unit23 = unit17 or unit23 = unit18  or unit23 = unit19 or unit23 = unit20 or unit23 = unit21 or unit23 = unit22 or unit23 = unit24 or unit23 = unit25 or unit23 = unit26 or unit23 = unit27 or unit23 = unit28 or unit23 = unit29 or unit23 = unit30 then 
            failcounter23 = failcounter23 + 1
            else
            end if
        else
        end if

    else
    end if

    if marks24 < "50" and marks24 <> "" and unit24 <> "" and marks24 <> "100" then
        if marks24 < "50" and marks1 < "50" or marks24 < "50" and marks2 < "50" or marks24 < "50" and marks3  < "50" or marks24 < "50" and marks4 < "50" or marks24 < "50" and marks5 < "50" or marks24 < "50" and marks6 < "50" or marks24 < "50" and marks7 < "50" or marks24 < "50" and marks8  < "50" or marks24 < "50" and marks9 < "50" or marks24 < "50" and marks10 < "50" or marks24 < "50" and marks11 < "50" or marks24 < "50" and marks12 < "50" or marks24 < "50" and marks13  < "50" or marks24 < "50" and marks14 < "50" or marks24 < "50" and marks15 < "50" or marks24 < "50" and marks16 < "50" or marks24 < "50" and marks17 < "50" or marks24 < "50" and marks18  < "50" or marks24 < "50" and marks19 < "50" or marks24 < "50" and marks20 < "50" or marks24 < "50" and marks21 < "50" or marks24 < "50" and marks24 < "50" or marks24 < "50" and marks23  < "50" or marks24 < "50" and marks25 < "50" or marks24 < "50" and marks26 < "50" or marks24 < "50" and marks27 < "50" or marks24 < "50" and marks28 < "50" or marks24 < "50" and marks29  < "50" or marks24 < "50" and marks30 < "50" then
            if unit24 = unit1 or unit24 = unit2 or unit24 = unit3 or unit24 = unit4 or unit24 = unit5 or unit24 = unit6 or unit24 = unit7 or unit24 = unit8 or unit24 = unit9 or unit24 = unit10 or unit24 = unit11 or unit24 = unit12 or unit24 = unit13 or unit24 = unit14 or unit24 = unit15 or unit24 = unit16 or unit24 = unit17 or unit24 = unit18 or unit24 = unit19 or unit24 = unit20 or unit24 = unit21 or unit24 = unit22 or unit24 = unit23 or unit24 = unit25 or unit24 = unit26 or unit24 = unit27 or unit24 = unit28 or unit24 = unit29 or unit24 = unit30 then
            failcounter24 = failcounter24 + 1
            else
            end if
        else
        end if

    else
    end if

    if marks25 < "50" and marks25 <> "" and unit25 <> "" and marks25 <> "100" then
        if marks25 < "50" and marks1 < "50" or marks25 < "50" and marks2 < "50" or marks25 < "50" and marks3  < "50" or marks25 < "50" and marks4 < "50" or marks25 < "50" and marks5 < "50" or marks25 < "50" and marks6 < "50" or marks25 < "50" and marks7 < "50" or marks25 < "50" and marks8  < "50" or marks25 < "50" and marks9 < "50" or marks25 < "50" and marks10 < "50" or marks25 < "50" and marks11 < "50" or marks25 < "50" and marks12 < "50" or marks25 < "50" and marks13  < "50" or marks25 < "50" and marks14 < "50" or marks25 < "50" and marks15 < "50" or marks25 < "50" and marks16 < "50" or marks25 < "50" and marks17 < "50" or marks25 < "50" and marks18  < "50" or marks25 < "50" and marks19 < "50" or marks25 < "50" and marks20 < "50" or marks25 < "50" and marks21 < "50" or marks25 < "50" and marks23 < "50" or marks25 < "50" and marks24  < "50" or marks25 < "50" and marks26 < "50" or marks25 < "50" and marks27 < "50" or marks25 < "50" and marks28 < "50" or marks25 < "50" and marks28 < "50" or marks25 < "50" and marks29  < "50" or marks25 < "50" and marks30 < "50" then
            if unit25 = unit1 or unit25 = unit2 or unit25 = unit3 or unit25 = unit4 or unit25 = unit5 or unit25 = unit6 or unit25 = unit7 or unit25 = unit8 or unit25 = unit9 or unit25 = unit10 or unit25 = unit11 or unit25 = unit12 or unit25 = unit13 or unit25 = unit14 or unit25 = unit15 or unit25 = unit16 or unit25 = unit17 or unit25 = unit18 or unit25 = unit19 or unit25 = unit20 or unit25 = unit21 or unit25 = unit22 or unit25 = unit23 or unit25 = unit24 or unit25 = unit26 or unit25 = unit27 or unit25 = unit28 or unit25 = unit29 or unit25 = unit30 then
            failcounter25 = failcounter25 + 1
            else
            end if
        else
        end if

    else
    end if


    if marks26 < "50" and marks26 <> "" and unit26 <> "" and marks26 <> "100" then
        if marks26 < "50" and marks1 < "50" or marks26 < "50" and marks2 < "50" or marks26 < "50" and marks3  < "50" or marks26 < "50" and marks4 < "50" or marks26 < "50" and marks5 < "50" or marks26 < "50" and marks6 < "50" or marks26 < "50" and marks7 < "50" or marks26 < "50" and marks8  < "50" or marks26 < "50" and marks9 < "50" or marks26 < "50" and marks10 < "50" or marks26 < "50" and marks11 < "50" or marks26 < "50" and marks12 < "50" or marks26 < "50" and marks13  < "50" or marks26 < "50" and marks14 < "50" or marks26 < "50" and marks15 < "50" or marks26 < "50" and marks16 < "50" or marks26 < "50" and marks17 < "50" or marks26 < "50" and marks18  < "50" or marks26 < "50" and marks19 < "50" or marks26 < "50" and marks20 < "50" or marks26 < "50" and marks21 < "50" or marks26 < "50" and marks22 < "50" or marks26 < "50" and marks23  < "50" or marks26 < "50" and marks24 < "50" or marks26 < "50" and marks25 < "50" or marks26 < "50" and marks27 < "50" or marks26 < "50" and marks28 < "50" or marks26 < "50" and marks29  < "50" or marks26 < "50" and marks30 < "50" then
            if unit26 = unit1 or unit26 = unit2 or unit26 = unit3 or unit26 = unit4 or unit26 = unit5 or unit26 = unit6 or unit26 = unit7 or unit26 = unit8 or unit26 = unit9 or unit26 = unit10 or unit26 = unit11 or unit26 = unit12 or unit26 = unit13 or unit26 = unit14 or unit26 = unit15 or unit26 = unit16 or unit26 = unit17 or unit26 = unit18 or unit26 = unit19 or unit26 = unit20 or unit26 = unit21 or unit26 = unit22 or unit26 = unit23 or unit26 = unit24 or unit26 = unit25 or unit26 = unit27 or unit26 = unit28 or unit26 = unit29 or unit26 = unit30 then
            failcounter26 = failcounter26 + 1
            else
            end if
        else
        end if

    else
    end if


    if marks27 < "50" and marks27 <> "" and unit27 <> "" and marks27 <> "100" then
        if marks27 < "50" and marks1 < "50" or marks27 < "50" and marks2 < "50" or marks27 < "50" and marks3  < "50" or marks27 < "50" and marks4 < "50" or marks27 < "50" and marks5 < "50" or marks27 < "50" and marks6 < "50" or marks27 < "50" and marks7 < "50" or marks27 < "50" and marks8  < "50" or marks27 < "50" and marks9 < "50" or marks27 < "50" and marks10 < "50" or marks27 < "50" and marks11 < "50" or marks27 < "50" and marks12 < "50" or marks27 < "50" and marks13  < "50" or marks27 < "50" and marks14 < "50" or marks27 < "50" and marks15 < "50" or marks27 < "50" and marks16 < "50" or marks27 < "50" and marks17 < "50" or marks27 < "50" and marks18  < "50" or marks27 < "50" and marks19 < "50" or marks27 < "50" and marks20 < "50" or marks27 < "50" and marks21 < "50" or marks27 < "50" and marks22 < "50" or marks27 < "50" and marks23  < "50" or marks27 < "50" and marks24 < "50" or marks27 < "50" and marks25 < "50" or marks27 < "50" and marks26 < "50" or marks27 < "50" and marks28 < "50" or marks27 < "50" and marks29  < "50" or marks27 < "50" and marks30 < "50" then
            if unit27 = unit1 or unit27 = unit2 or unit27 = unit3 or unit27 = unit4 or unit27 = unit5 or unit27 = unit6 or unit27 = unit7 or unit27 = unit8 or unit27 = unit9 or unit27 = unit10 or unit27 = unit11 or unit27 = unit12 or unit27 = unit13 or unit27 = unit14 or unit27 = unit15 or unit27 = unit16 or unit27 = unit17 or unit27 = unit18 or unit27 = unit19 or unit27 = unit20 or unit27 = unit21 or unit27 = unit22 or unit27 = unit23 or unit27 = unit24 or unit27 = unit25 or unit27 = unit26 or unit27 = unit28 or unit27 = unit29 or unit27 = unit30 then
            failcounter27 = failcounter27 + 1
            else
            end if
        else
        end if

    else
    end if


    if marks28 < "50" and marks28 <> "" and unit28 <> "" and marks28 <>  "100" then
        if marks28 < "50" and marks1 < "50" or marks28 < "50" and marks2 < "50" or marks28 < "50" and marks3  < "50" or marks28 < "50" and marks4 < "50" or marks28 < "50" and marks5 < "50" or marks28 < "50" and marks6 < "50" or marks28 < "50" and marks7 < "50" or marks28 < "50" and marks8  < "50" or marks28 < "50" and marks9 < "50" or marks28 < "50" and marks10 < "50" or marks28 < "50" and marks11 < "50" or marks28 < "50" and marks12 < "50" or marks28 < "50" and marks13  < "50" or marks28 < "50" and marks14 < "50" or marks28 < "50" and marks15 < "50" or marks28 < "50" and marks16 < "50" or marks28 < "50" and marks17 < "50" or marks28 < "50" and marks18  < "50" or marks28 < "50" and marks19 < "50" or marks28 < "50" and marks20 < "50" or marks28 < "50" and marks21 < "50" or marks28 < "50" and marks22 < "50" or marks28 < "50" and marks23  < "50" or marks28 < "50" and marks24 < "50" or marks28 < "50" and marks25 < "50" or marks28 < "50" and marks26 < "50" or marks28 < "50" and marks27 < "50" or marks28 < "50" and marks29  < "50" or marks28 < "50" and marks30 < "50" then
            if unit28 = unit1 or unit28 = unit2 or unit28 = unit3 or unit28 = unit4 or unit28 = unit5 or unit28 = unit6 or unit28 = unit7 or unit28 = unit8 or unit28 = unit9 or unit28 = unit10 or unit28 = unit11 or unit28 = unit12 or unit28 = unit13 or unit28 = unit14 or unit28 = unit15 or unit28 = unit16 or unit28 = unit17 or unit28 = unit18 or unit28 = unit19 or unit28 = unit20 or unit28 = unit21 or unit28 = unit22 or unit28 = unit23 or unit28 = unit24 or unit28 = unit25 or unit28 = unit26 or unit28 = unit27 or unit28 = unit29 or unit28 = unit30 then
            failcounter28 = failcounter28 + 1
            else
            end if
        else
        end if

    else
    end if


    if marks29 < "50" and marks29 <> "" and unit29 <> "" and marks29 <> "100" then
        if marks29 < "50" and marks1 < "50" or marks29 < "50" and marks2 < "50" or marks29 < "50" and marks3  < "50" or marks29 < "50" and marks4 < "50" or marks29 < "50" and marks5 < "50" or marks29 < "50" and marks6 < "50" or marks29 < "50" and marks7 < "50" or marks29 < "50" and marks8  < "50" or marks29 < "50" and marks9 < "50" or marks29 < "50" and marks10 < "50" or marks29 < "50" and marks11 < "50" or marks29 < "50" and marks12 < "50" or marks29 < "50" and marks13  < "50" or marks29 < "50" and marks14 < "50" or marks29 < "50" and marks15 < "50" or marks29 < "50" and marks16 < "50" or marks29 < "50" and marks17 < "50" or marks29 < "50" and marks18  < "50" or marks29 < "50" and marks19 < "50" or marks29 < "50" and marks20 < "50" or marks29 < "50" and marks21 < "50" or marks29 < "50" and marks22 < "50" or marks29 < "50" and marks23  < "50" or marks29 < "50" and marks24 < "50" or marks29 < "50" and marks25 < "50" or marks29 < "50" and marks26 < "50" or marks29 < "50" and marks27 < "50" or marks29 < "50" and marks28  < "50" or marks29 < "50" and marks30 < "50" then
            if unit29 = unit1 or unit29 = unit2 or unit29 = unit3 or unit29 = unit4 or unit29 = unit5 or unit29 = unit6 or unit29 = unit7 or unit29 = unit8 or unit29 = unit9 or unit29 = unit10 or unit29 = unit11 or unit29 = unit12 or unit29 = unit13 or unit29 = unit14 or unit29 = unit15 or unit29 = unit16 or unit29 = unit17 or unit29 = unit18 or unit29 = unit19 or unit29 = unit20 or unit29 = unit21 or unit29 = unit22 or unit29 = unit23 or unit29 = unit24 or unit29 = unit25 or unit29 = unit26 or unit29 = unit27 or unit29 = unit28 or unit29 = unit30 then
            failcounter29 = failcounter29 + 1
            else
            end if
        else
        end if

    else
    end if



    if marks30 < "50" and marks30 <> "" and unit30 <> "" and marks30 <> "100" then
        if marks30 < "50" and marks1 < "50" or marks30 < "50" and marks2 < "50" or marks30 < "50" and marks3  < "50" or marks30 < "50" and marks4 < "50" or marks30 < "50" and marks5 < "50" or marks30 < "50" and marks6 < "50" or marks30 < "50" and marks7 < "50" or marks30 < "50" and marks8  < "50" or marks30 < "50" and marks9 < "50" or marks30 < "50" and marks10 < "50" or marks30 < "50" and marks11 < "50" or marks30 < "50" and marks12 < "50" or marks30 < "50" and marks13  < "50" or marks30 < "50" and marks14 < "50" or marks30 < "50" and marks15 < "50" or marks30 < "50" and marks16 < "50" or marks30 < "50" and marks17 < "50" or marks30 < "50" and marks18  < "50" or marks30 < "50" and marks19 < "50" or marks30 < "50" and marks20 < "50" or marks30 < "50" and marks21 < "50" or marks30 < "50" and marks22 < "50" or marks30 < "50" and marks23  < "50" or marks30 < "50" and marks24 < "50" or marks30 < "50" and marks25 < "50" or marks30 < "50" and marks26 < "50" or marks30 < "50" and marks27 < "50" or marks30 < "50" and marks28  < "50" or marks30 < "50" and marks29 < "50" then
            if unit30 = unit1 or unit30 = unit2 or unit30 = unit3 or unit30 = unit4 or unit30 = unit5 or unit30 = unit6 or unit30 = unit7 or unit30 = unit8 or unit30 = unit9 or unit30 = unit10 or unit30 = unit11 or unit30 = unit12 or unit30 = unit13 or unit30 = unit14 or unit30 = unit15 or unit30 = unit16 or unit30 = unit17 or unit30 = unit18 or unit30 = unit19 or unit30 = unit20 or unit30 = unit21 or unit30 = unit22 or unit30 = unit23 or unit30 = unit24 or unit30 = unit25 or unit30 = unit26 or unit30 = unit27 or unit30 = unit28 or unit30 = unit29 then
            failcounter30 = failcounter30 + 1
            else
            end if
        else
        end if

    else
    end if


    total = failcounter1 + failcounter2 + failcounter3 + failcounter4 + failcounter5 + failcounter6 + failcounter7 + failcounter8 + failcounter9 + failcounter10 + failcounter11 + failcounter12 + failcounter13 + failcounter14 + failcounter15 + failcounter16 + failcounter17 + failcounter18 + failcounter19 + failcounter20 + failcounter21 + failcounter22 + failcounter23 + failcounter24 + failcounter25 + failcounter26 + failcounter27 + failcounter28 + failcounter29 + failcounter30 

    if total > "2" then
    response. write("Excluded from course" & "<br />" )


    
    else
    end if
end sub













sub courseProgressCheck()


    marks1 = request.form("UM_1")
    marks2 = request.form("UM_2")
    marks3 = request.form("UM_3")
    marks4 = request.form("UM_4")
    marks5 = request.form("UM_5")
    marks6 = request.form("UM_6")
    marks7 = request.form("UM_7")
    marks8 = request.form("UM_8")
    marks9 = request.form("UM_9")
    marks10 = request.form("UM_10")
    marks11 = request.form("UM_11")
    marks12 = request.form("UM_12")
    marks13 = request.form("UM_13")
    marks14 = request.form("UM_14")
    marks15 = request.form("UM_15")
    marks16 = request.form("UM_16")
    marks17 = request.form("UM_17")
    marks18 = request.form("UM_18")
    marks19 = request.form("UM_19")
    marks20 = request.form("UM_20")
    marks21 = request.form("UM_21")
    marks22 = request.form("UM_22")
    marks23 = request.form("UM_23")
    marks24 = request.form("UM_24")
    marks25 = request.form("UM_25")
    marks26 = request.form("UM_26")
    marks27 = request.form("UM_27")
    marks28 = request.form("UM_28")
    marks29 = request.form("UM_29")
    marks30 = request.form("UM_30")

 
    
    counter = 1
    passedCredit15 = 0
    passedCredit20 = 0
    
    


    Do while counter < 31  
          UniMarks = request.form("UM_" + CStr(counter))
          credit = request.form("CP_" + CStr(counter))
          
          if UniMarks >= "50" and credit = "15" or UniMarks = "100" and credit = "15" then
          passedCredit15 = passedCredit15 + 1
          ''response.write(passedCredit15)
          
          elseif UniMarks >= "50" and credit = "20" or UniMarks = "100" and credit = "20" then
          passedCredit20 = passedCredit20 + 1
          ''response.write(passedCredit20)
         
          else
          ''do nothing
           ''response.write("no pwedes")
          end if
          counter = counter + 1
  
    Loop
    if passedCredit15 = 0 then
    totalCreditPoints = passedCredit15 * 15

         if passedCredit20 = 0 then
         totalCreditPoints = passedCredit20 * 20
         else
         totalCreditPoints = passedCredit15 * 15 + passedCredit20 * 20
         end if
    
    else 
    totalCreditPoints = passedCredit15 * 15 + passedCredit20 * 20
    
    end if





    












    UG = 240  'Undergrauate
    GD = 80    'Graduate Diploma
    MC = 120   'Masters by CourseWork
    MR = 160   'Masters by Research



    coursetype = request.form("CourseType")
   countercoursetype = 1
   
     if coursetype = "1" then                     'for undergraduate students do this
         if totalCreditPoints >= UG then       'if completed 66 percent above, then check all marks and if there is one fail
             if marks1 <= "49" or marks2 <= "49" or marks3 <= "49" or marks4 <= "49" or marks5 <= "49" or marks6 <= "49" or marks7 <= "49" or marks8 <= "49" or marks9 <= "49" or marks10 <= "49" or marks11 <= "49" or marks12 <= "49" or marks13 <= "49" or marks14 <= "49" or marks15 <= "49" or marks16 <= "49" or marks17 <= "49" or marks18 <= "49" or marks19 <= "49" or marks20 <= "49" or marks21 <= "49" or marks22 <= "49" or marks23 <= "49" or marks24 <= "49" or marks26 <= "49" or marks27 <= "49" or marks28 <= "49" or marks29 <= "49" or marks30 <= "49" then
             'response.write("is working")
              do while countercoursetype <31
                   UniMarks = request.form("UM_" + CStr(countercoursetype))
                   unit  = request.form("UnitCode_" + CStr(countercoursetype))
                   if UniMarks >= "40" then   
                       if UniMarks <= "45" then  
                       response.write(unit & "   'Supplementary assesment'" & "<br />")
                       else
                       end if
                   else
                   end if
                       
                   if UniMarks >= "46" then 
                        if UniMarks <= "49" then
                        response.write(unit & "   'Conceded Pass'" & "<br />")
                       else
                       end if
                   else 
                   end if
                   countercoursetype =countercoursetype + 1


                Loop    
            else
            end if
      else
      end if
    else
    end if








    
    coursetype = request.form("CourseType")
   countercoursetype = 1
   
     if coursetype = "2" then                     'for undergraduate students do this
         if totalCreditPoints >= GD then       'if completed 66 percent above, then check all marks and if there is one fail
             if marks1 <= "49" or marks2 <= "49" or marks3 <= "49" or marks4 <= "49" or marks5 <= "49" or marks6 <= "49" or marks7 <= "49" or marks8 <= "49" or marks9 <= "49" or marks10 <= "49" or marks11 <= "49" or marks12 <= "49" or marks13 <= "49" or marks14 <= "49" or marks15 <= "49" or marks16 <= "49" or marks17 <= "49" or marks18 <= "49" or marks19 <= "49" or marks20 <= "49" or marks21 <= "49" or marks22 <= "49" or marks23 <= "49" or marks24 <= "49" or marks26 <= "49" or marks27 <= "49" or marks28 <= "49" or marks29 <= "49" or marks30 <= "49" then
             'response.write("is working")
              do while countercoursetype <31
                   UniMarks = request.form("UM_" + CStr(countercoursetype))
                   unit  = request.form("UnitCode_" + CStr(countercoursetype))
                   if UniMarks >= "40" then   '39
                       if UniMarks <= "45" then  '46
                       response.write(unit & "   'Supplementary assesment'" & "<br />")
                       else
                       end if
                   else
                   end if
                       
                   if UniMarks >= "46" then 'check 46 to 47
                        if UniMarks <= "49" then
                        response.write(unit & "   'Conceded Pass'" & "<br />")
                       else
                       end if
                   else 
                   end if
                   countercoursetype =countercoursetype + 1
                Loop    
            else
            end if
      else
      end if
    else
    end if



    
    coursetype = request.form("CourseType")
   countercoursetype = 1
   
     if coursetype = "3" then                     'for undergraduate students do this
         if totalCreditPoints >= MC then       'if completed 66 percent above, then check all marks and if there is one fail
             if marks1 <= "49" or marks2 <= "49" or marks3 <= "49" or marks4 <= "49" or marks5 <= "49" or marks6 <= "49" or marks7 <= "49" or marks8 <= "49" or marks9 <= "49" or marks10 <= "49" or marks11 <= "49" or marks12 <= "49" or marks13 <= "49" or marks14 <= "49" or marks15 <= "49" or marks16 <= "49" or marks17 <= "49" or marks18 <= "49" or marks19 <= "49" or marks20 <= "49" or marks21 <= "49" or marks22 <= "49" or marks23 <= "49" or marks24 <= "49" or marks26 <= "49" or marks27 <= "49" or marks28 <= "49" or marks29 <= "49" or marks30 <= "49" then
           
              do while countercoursetype <31
                   UniMarks = request.form("UM_" + CStr(countercoursetype))
                   unit  = request.form("UnitCode_" + CStr(countercoursetype))
                   if UniMarks >= "40" then   
                       if UniMarks <= "45" then  
                       response.write(unit & "   'Supplementary assesment'" & "<br />")
                       else
                       end if
                   else
                   end if
                       
                   if UniMarks >= "46" then 
                        if UniMarks <= "49" then
                        response.write(unit & "   'Conceded Pass'" & "<br />")
                       else
                       end if
                   else 
                   end if
                   countercoursetype =countercoursetype + 1
                Loop    
            else
            end if
      else
      end if
    else
    end if



    
    coursetype = request.form("CourseType")
   countercoursetype = 1
   
     if coursetype = "4" then                     'for undergraduate students do this
         if totalCreditPoints >= MR then       'if completed 66 percent above, then check all marks and if there is one fail
             if marks1 <= "49" or marks2 <= "49" or marks3 <= "49" or marks4 <= "49" or marks5 <= "49" or marks6 <= "49" or marks7 <= "49" or marks8 <= "49" or marks9 <= "49" or marks10 <= "49" or marks11 <= "49" or marks12 <= "49" or marks13 <= "49" or marks14 <= "49" or marks15 <= "49" or marks16 <= "49" or marks17 <= "49" or marks18 <= "49" or marks19 <= "49" or marks20 <= "49" or marks21 <= "49" or marks22 <= "49" or marks23 <= "49" or marks24 <= "49" or marks26 <= "49" or marks27 <= "49" or marks28 <= "49" or marks29 <= "49" or marks30 <= "49" then
          
              do while countercoursetype <31
                   UniMarks = request.form("UM_" + CStr(countercoursetype))
                   unit  = request.form("UnitCode_" + CStr(countercoursetype))
                   if UniMarks >= "40" then   
                       if UniMarks <= "45" then  
                       response.write(unit & "   'Supplementary assesment'" & "<br />")
                       else
                       end if
                   else
                   end if
                       
                   if UniMarks >= "46" then 
                        if UniMarks <= "49" then
                        response.write(unit & "   'Conceded Pass'" & "<br />")
                       else
                       end if
                   else 
                   end if
                   countercoursetype =countercoursetype + 1
                Loop    
            else
            end if
      else
      end if
    else
    end if


    
    underGraduate = 360
    graduateDiploma = 120
    mastersCourseWork = 180
    mastersResearch = 240
  

    if coursetype = "1" and totalCreditPoints >= underGraduate  then 
    response.write("UnderGraduate 'COURSE COMPLETED" & "<br / >")
   
   

    elseif coursetype = "2" and totalCreditPoints >= graduateDiploma then 
    response.write("Graduate Diploma 'COURSE COMPLETED'" & "<br / >")
    
    


    elseif coursetype = "3" and totalCreditPoints  >= mastersCourseWork then 
    response.write("Masters by Course Work 'COURSE COMPLETED'" & "<br / >")
   
    

    elseif coursetype = "4" and totalCreditPoints  >= mastersResearch then 
    response.write("Masters by Research 'COURSE COMPLETED'" & "<br / >")

    else
    end if 

end sub















</script>









<%
 


firstName = false
surName = false
ID = false
course = false
allInputsReady = false


'validate firstname
if request.form("Firstname") <> "" then
firstName = true
else
response.write("Firstname field is empty <br / >")
firstName = false
end if

'validate surname
if request.form("Surname") <> "" then
surName = true
else
response.write("Surname field is empty <br / >")
surName = false
end if

'validate Student ID
ID = request.form("StudentID")
if IsNumeric(request.form("StudentID")) AND len(ID) >= 8 then
ID = true
else
response.write("The student id field should be numeric and not less than 8 characters in length  <br />")
ID = false
end if








counter = 1
Do while counter  < 31    'while not all units loop through
                'add 1 to counter

    
    unit  = request.form("UnitCode_" + CStr(counter))
    if unit <> "" and len(unit) >= 7 then
     unitCode = true
    else
    unitCode = false
    
    end if  



    'Credit Points
    
    credit = request.form("CP_" + CStr(counter))
    if credit = "15" or credit = "20" and credit <> ""  then
    creditPoint = true
    else
    creditPoint = false
    
    end if



    'Year Semester
    
    year = request.form("YS_" + CStr(counter))
    if len(year) = 3 AND IsNumeric(year) = true then
    
    yearSem = true
    
    else
    yearSem = false
   
    end if



    UniMarks = request.form("UM_" + CStr(counter))
    if IsNumeric(UniMarks) = true then
         if UniMarks = "0"  then
         marks = true
       
         elseif UniMarks = "1" then 
         marks = true 
         
         elseif UniMarks = "2" then
         marks = true
         elseif UniMarks = "3" then
         marks = true
         elseif UniMarks = "4" then
         marks = true
         elseif UniMarks = "5" then
         marks = true
         elseif UniMarks = "6" then
         marks = true
         elseif UniMarks = "7" then
         marks = true
         elseif UniMarks = "8" then
         marks = true
         elseif UniMarks = "9" then
         marks = true
         elseif UniMarks = "10" then
         marks = true
         elseif UniMarks = "11" then
         marks = true
         elseif UniMarks = "12" then
         marks = true
         elseif UniMarks = "13" then
         marks = true
         elseif UniMarks = "14" then 
         marks = true
         elseif UniMarks = "15" then
         marks = true
         elseif UniMarks = "16" then
         marks = true
         elseif UniMarks = "17" then
         marks = true
         elseif UniMarks = "18" then
         marks = true
         elseif UniMarks = "19" then
         marks = true
         elseif UniMarks = "20" then
         marks = true
         elseif UniMarks = "8" then
         marks = true
         elseif UniMarks = "9" then
         marks = true
         elseif UniMarks = "21" then
         marks = true
         elseif UniMarks = "22" then
         marks = true
         elseif UniMarks = "23" then
         marks = true
         elseif UniMarks = "24" then
         marks = true
         elseif UniMarks = "25" then 
         marks = true
         elseif UniMarks = "26" then
         marks = true
         elseif UniMarks = "27" then
         marks = true
         elseif UniMarks = "28" then
         marks = true
         elseif UniMarks = "29" then
         marks = true
         elseif UniMarks = "30" then
         marks = true
         elseif UniMarks = "31" then
         marks = true
         elseif UniMarks = "32" then
         marks = true
         elseif UniMarks = "33" then
         marks = true
         elseif UniMarks = "34" then
         marks = true
         elseif UniMarks = "35" then
         marks = true
         elseif UniMarks = "36" then
         marks = true
         elseif UniMarks = "37" then
         marks = true
         elseif UniMarks = "39" then 
         marks = true
         elseif UniMarks = "40" then
         marks = true
         elseif UniMarks = "41" then
         marks = true
         elseif UniMarks = "42" then
         marks = true
         elseif UniMarks = "43" then
         marks = true
         elseif UniMarks = "44" then
         marks = true
         elseif UniMarks = "45" then
         marks = true
         elseif UniMarks = "46" then
         marks = true
         elseif UniMarks = "47" then
         marks = true
         elseif UniMarks = "48" then
         marks = true
         elseif UniMarks = "49" then
         marks = true
         elseif UniMarks = "50" then
         marks = true
         elseif UniMarks = "51" then
         marks = true
         elseif UniMarks = "52" then 
         marks = true
         elseif UniMarks = "53" then
         marks = true
         elseif UniMarks = "54" then
         marks = true
         elseif UniMarks = "55" then
         marks = true
         elseif UniMarks = "56" then
         marks = true
         elseif UniMarks = "57" then
         marks = true
         elseif UniMarks = "58" then
         marks = true
         elseif UniMarks = "59" then
         marks = true
         elseif UniMarks = "60" then
         marks = true
         elseif UniMarks = "61" then
         marks = true
         elseif UniMarks = "62" then
         marks = true
         elseif UniMarks = "63" then
         marks = true
         elseif UniMarks = "64" then
         marks = true
         elseif UniMarks = "65" then 
         marks = true
         elseif UniMarks = "66" then
         marks = true
         elseif UniMarks = "67" then
         marks = true
         elseif UniMarks = "68" then
         marks = true
         elseif UniMarks = "69" then
         marks = true
         elseif UniMarks = "70" then
         marks = true
         elseif UniMarks = "71" then
         marks = true
         elseif UniMarks = "71" then
         marks = true
         elseif UniMarks = "73" then
         marks = true
         elseif UniMarks = "74" then
         marks = true
         elseif UniMarks = "75" then
         marks = true
         elseif UniMarks = "76" then
         marks = true
         elseif UniMarks = "77" then
         marks = true
         elseif UniMarks = "78" then 
         marks = true
         elseif UniMarks = "79" then
         marks = true
         elseif UniMarks = "80" then
         marks = true
         elseif UniMarks = "81" then
         marks = true
         elseif UniMarks = "82" then
         marks = true
         elseif UniMarks = "83" then
         marks = true
         elseif UniMarks = "84" then
         marks = true
         elseif UniMarks = "85" then
         marks = true
         elseif UniMarks = "86" then
         marks = true
         elseif UniMarks = "87" then
         marks = true
         elseif UniMarks = "88" then
         marks = true
         elseif UniMarks = "89" then
         marks = true
         elseif UniMarks = "90" then
         marks = true
         elseif UniMarks = "91" then 
         marks = true
         elseif UniMarks = "92" then
         marks = true
         elseif UniMarks = "93" then
         marks = true
         elseif UniMarks = "94" then
         marks = true
         elseif UniMarks = "95" then
         marks = true
         elseif UniMarks = "96" then
         marks = true
         elseif UniMarks = "97" then
         marks = true
         elseif UniMarks = "98" then
         marks = true
         elseif UniMarks = "99" then
         marks = true
         elseif UniMarks = "100" then
         marks = true
         elseif UniMarks > "101" then
         marks = false
         
         else
           
         
          end if

    else
    
    
    end if




    'if all rows are correct OR all rows are empty , then set a variable to know if it needs to be printed or not
    'showmessage = false
    if unitCode = false and creditPoint = false and yearSem = false and marks = false OR unitCode = true and creditPoint = true and yearSem = true and marks = true then
    showMessage = false 'dont print error message
    else   
    showMessage = true 'print error message
    errorCounter = errorCounter + 1  ' it knows if all inputs are not ready or it has some invalid inputs
    end if

    

    message1 =  "The Unitcode data item should not be less than 7 characters in length 'ROW'  " & counter  &  "<br />"
    message2 = "The Credit Points field contains only 15 or 20, nothing else 'ROW'  " &  counter  & "<br />"
    message3 = "The year semester field should only contain 3 digits 'ROW'  "  &  counter  &  "<br /> "
    message4 = "The Mark field should be numeric and not less than zero or greater than 100 'ROW'  "  &  counter &  "<br />"

    '1000
    if showMessage = true and unitCode = true and creditPoint = false and yearSem = false and marks = false  then  
    response.write(message2 + message3 + message4 )
    else
    end if 

    '1100
    if showMessage = true and unitCode = true and creditPoint = true and yearSem = false and marks = false  then
    response.write(message3 + message4)
    else
    end if

    '1110
    if showMessage = true and unitCode = true and creditPoint = true and yearSem = true and marks = false  then
    response.write(message4)
    else
    end if

    '0111
    if showMessage = true and unitCode = false and creditPoint = true and yearSem = true and marks = true  then
    response.write(message1)
    else
    end if

    '0011
    if showMessage = true and unitCode = false and creditPoint = false and yearSem = true and marks = true  then
    response.write(message1 + message2)
    else
    end if

    '0001
    if showMessage = true and unitCode = false and creditPoint = false and yearSem = false and marks = true  then
    response.write(message1 + message2 + message3)
    else
    end if

    '1011
    if showMessage = true and unitCode = true and creditPoint = false and yearSem = true and marks = true  then
    response.write(message2)
    else
    end if

    '1010
    if showMessage = true and unitCode = true and creditPoint = false and yearSem = true and marks = false  then
    response.write(message2 + message4)
    else
    end if

    '0101
    if showMessage = true and unitCode = false and creditPoint = true and yearSem = false and marks = true  then
    response.write(message1 + message3)
    else
    end if

    '1101
    if showMessage = true and unitCode = true and creditPoint = true and yearSem = false and marks = true  then
    response.write(message3)
    else
    end if

    '0100
    if showMessage = true and unitCode = false and creditPoint = true and yearSem = false and marks = false  then
    response.write(message1 + message3 + message4)
    else
    end if

    '0110
    if showMessage = true and unitCode = false and creditPoint = true and yearSem = true and marks = false  then
    response.write(message1 + message4)
    else
    end if


    '1001
     if showMessage = true and unitCode = true and creditPoint = false and yearSem = false and marks = true  then
    response.write(message2 + message3)
    else
    end if

    '0010
    if showMessage = true and unitCode = false and creditPoint = false and yearSem = true and marks = false  then
    response.write(message1 + message2 + message3)
    else
    end if

    '0001
    if showMessage = true and unitCode = false and creditPoint = false and yearSem = false and marks = true  then
    response.write(message1 + message2 + message3)
    else
    end if

    counter = counter + 1
    unitCode = false
    creditPoint = false
    yearSem = false
    marks = false
  
Loop 








if firstName = true and surName = true and ID = true and errorCounter = 0 then

response.write("Student Name: " & request.form("Firstname")  & "  " &   request.form("Surname") &  "<br / >" )
response.write("Student ID:  " & request.form("StudentID") & "<br / >")

getCreditPoints()
numberOfSucessfulUnits() 
numberOfUnitsAttempted()
getCourseAverage()
courseExcluded()
courseProgressCheck()

else
end if


     

   
%>















</body>
</html>
