Imports Microsoft.VisualBasic.CompilerServices
Imports Mono.Cecil
Imports Mono.Cecil.Cil
Imports System
Imports System.Collections
Imports System.Collections.Generic
Imports System.IO
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class MON

    Public orn As List(Of String) = New List(Of String)
    Public T1 As TextBox

    ' Methods
    Public Function RandArray(ByVal a As Array) As Array
        Dim list2 As New List(Of Object)
        list2.AddRange(DirectCast(a, IEnumerable(Of Object)))
        Dim list As New List(Of Object)
        Do While (list2.Count <> 0)
            Dim index As Integer = rnd(0, (list2.Count - 1))
            list.Add(RuntimeHelpers.GetObjectValue(list2.Item(index)))
            list2.RemoveAt(index)
        Loop
        Return list.ToArray
    End Function

    Public Function randz(ByVal f As String) As String
        Dim str As String
        f = f.Replace("""", "")
        If File.Exists((f & ".il")) Then
            File.Delete((f & ".il"))
        End If
        File.Move(f, (f & ".il"))
        Dim definition As AssemblyDefinition = AssemblyDefinition.ReadAssembly((f & ".il"))
        Dim definition2 As ModuleDefinition
        For Each definition2 In definition.Modules
            wrt(("Module: " & definition2.Name))
            Dim definition3 As TypeDefinition
            For Each definition3 In definition2.Types
                Dim str2 As String = RN()
                wrt(("CLASS: " & definition3.Name & " > " & str2))
                definition3.Name = str2
                Dim definition4 As PropertyDefinition
                For Each definition4 In definition3.Properties
                    str2 = RN()
                    wrt(("Properties: " & definition4.Name & " > " & str2))
                    definition4.Name = str2
                    str2 = RN()
                    definition4.PropertyType = definition2.Import(GetType(Object))
                    wrt(("*Type " & definition4.PropertyType.Name & " > " & str2))
                    definition4.PropertyType.Name = str2
                Next
                If (definition3.Properties.Count > 0) Then
                    Dim enumerator As IEnumerator = Nothing
                    Dim array As Array = RandArray(definition3.Properties.ToArray)
                    definition3.Properties.Clear()
                    Try
                        enumerator = array.GetEnumerator
                        Do While enumerator.MoveNext
                            Dim objectValue As Object = RuntimeHelpers.GetObjectValue(enumerator.Current)
                            definition3.Properties.Add(DirectCast(objectValue, PropertyDefinition))
                        Loop
                    Finally
                        If TypeOf enumerator Is IDisposable Then
                            TryCast(enumerator, IDisposable).Dispose()
                        End If
                    End Try
                End If
                Dim definition5 As EventDefinition
                For Each definition5 In definition3.Events
                    str2 = RN()
                    wrt(("Event " & definition5.Name & " > " & str2))
                    definition5.Name = str2
                    definition5.EventType = definition2.Import(GetType(Object))
                    str2 = RN()
                    wrt(("*Type " & definition5.EventType.Name & " > " & str2))
                    definition5.EventType.Name = str2
                Next
                If (definition3.Events.Count > 0) Then
                    Dim enumerator6 As IEnumerator = Nothing
                    Dim array2 As Array = RandArray(definition3.Events.ToArray)
                    definition3.Events.Clear()
                    Try
                        enumerator6 = array2.GetEnumerator
                        Do While enumerator6.MoveNext
                            Dim obj3 As Object = RuntimeHelpers.GetObjectValue(enumerator6.Current)
                            definition3.Events.Add(DirectCast(obj3, EventDefinition))
                        Loop
                    Finally
                        If TypeOf enumerator6 Is IDisposable Then
                            TryCast(enumerator6, IDisposable).Dispose()
                        End If
                    End Try
                End If
                Dim definition6 As FieldDefinition
                For Each definition6 In definition3.Fields
                    str2 = RN()
                    wrt(("Field " & definition6.Name & " > " & str2))
                    str2 = RN()
                    wrt(("*Type " & definition6.FieldType.Name & " > " & str2))
                    definition6.FieldType = definition2.Import(GetType(Object))
                    definition6.FieldType.Name = str2
                    definition6.Name = str2
                Next
                If (definition3.Fields.Count > 0) Then
                    Dim enumerator8 As IEnumerator = Nothing
                    Dim array3 As Array = RandArray(definition3.Fields.ToArray)
                    definition3.Fields.Clear()
                    Try
                        enumerator8 = array3.GetEnumerator
                        Do While enumerator8.MoveNext
                            Dim obj4 As Object = RuntimeHelpers.GetObjectValue(enumerator8.Current)
                            definition3.Fields.Add(DirectCast(obj4, FieldDefinition))
                        Loop
                    Finally
                        If TypeOf enumerator8 Is IDisposable Then
                            TryCast(enumerator8, IDisposable).Dispose()
                        End If
                    End Try
                End If
                Dim definition7 As MethodDefinition
                For Each definition7 In definition3.Methods
                    If Not definition7.ToString.Contains(".") Then
                        str2 = RN()
                        wrt(("Method " & definition7.Name & " > " & str2))
                        definition7.Name = str2
                        If definition7.HasBody Then
                            Dim instruction As Instruction
                            For Each instruction In definition7.Body.Instructions
                                Dim instruction2 As Instruction = instruction
                                instruction2.Offset = (instruction2.Offset + -1)
                            Next
                        End If
                        Dim definition8 As ParameterDefinition
                        For Each definition8 In definition7.Parameters
                            str2 = RN()
                            wrt(("*Param " & definition8.Name & " > " & str2))
                            definition8.Name = str2
                        Next
                    End If
                Next
                If (definition3.Methods.Count > 0) Then
                    Dim enumerator12 As IEnumerator = Nothing
                    Dim array4 As Array = RandArray(definition3.Methods.ToArray)
                    definition3.Methods.Clear()
                    Try
                        enumerator12 = array4.GetEnumerator
                        Do While enumerator12.MoveNext
                            Dim obj5 As Object = RuntimeHelpers.GetObjectValue(enumerator12.Current)
                            definition3.Methods.Add(DirectCast(obj5, MethodDefinition))
                        Loop
                    Finally
                        If TypeOf enumerator12 Is IDisposable Then
                            TryCast(enumerator12, IDisposable).Dispose()
                        End If
                    End Try
                End If
            Next
        Next
        definition.Write(f)
        File.Delete((f & ".il"))
        Return str
    End Function

    Public Function RN() As String
        Dim str3 As String
        Do
            Dim random As New Random
            str3 = ""
            Dim str As String = "☺☻♥♦♣♠•◘○◙♀♪♫☼►◄↕‼¶§▬↨↑↓→←∟↔▲▼ أآؤءئةابتثجحخدذرزسشصضطظعغفقكلمنهـوي"
            Dim num2 As Integer = random.Next(1, 3)
            Dim i As Integer = 1
            Do While (i <= num2)
                str3 = (str3 & Convert.ToString(str.Chars(random.Next(0, str.Length))))
                i += 1
            Loop
        Loop While orn.Contains(str3)
        orn.Add(str3)
        Return str3
    End Function

    Public Function rnd(ByVal min As Integer, ByVal max As Integer) As Integer
        Dim random As New Random
        Return random.Next(min, (max + 1))
    End Function

    Public Sub wrt(ByVal t As String)
        T1.AppendText((t & ChrW(13) & ChrW(10)))
        T1.ScrollToCaret()
        Application.DoEvents()
    End Sub


    ' Fields

End Class