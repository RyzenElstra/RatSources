Attribute VB_Name = "XConfiguration"
'This Module works as a Configuration server of the Handle-X Client APP.
Public Sub Configure(ConfigureIndex As Integer, ConfigureValue As Variant)
    
    Select Case ConfigureIndex
           Case 0 'Enable/Disable Firewall
                M_FireWall.RunFirewall = ConfigureValue
    End Select
End Sub
