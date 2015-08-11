cls
 Function MakeUser
{
  New-ADUser -name $SAMname -GivenName $firstname -Surname $lastname -SamAccountName $SAMname  -UserPrincipalName $email -AccountPassword $password1 -PassThru |  Set-ADUser -ChangePasswordAtLogon:$true 
   Enable-ADAccount $SAMname
      
 $wshell = New-Object -ComObject wscript.shell
 $wshell.popup($SAMname+" Created Email "+ $email,0,"Done")
}
 

$firstname = Read-Host "Type User First Name" ### First Name in AD 
$lastname = Read-Host "Type User Last Name"   ### last name is equal to surename in Active Directory
$password2 = Read-host "Enter Domain Standard Password"

$SAMname = ($firstname.Substring(0,1)+$lastname)
$email = ($samname+"@"+$env:userdomain+".com")
$password1 = ConvertTo-SecureString "$password3" -AsPlainText -Force 
$name =  ($firstname+" "+$lastname) 
$a = 1

if(dsquery user -samid $Samname){
     do
            
       { 
   
       
          $lname= $lastname+$a        
          $SAMname = ($firstname.Substring(0,1)+$lname) 
          $Email = ($firstname.Substring(0,1)+$lname+"@braenstone.com")
          $a++

       }

       while ((dsquery user -samid $Samname) -ne $null)
          Makeuser
  }

Else 
   
   {
   "Succesfull"
   MakeUser 
   cls
   }






