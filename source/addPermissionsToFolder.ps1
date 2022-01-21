#Written by KramWell.com - 15/NOV/2017
#Use this script in your program to easily add permissions to a folder for a specified user.

$Folder = "c:\test"
$UserName = "KramWell" 

try {            
    New-Item -ItemType directory -Path $Folder -ErrorAction stop

	$rule=new-object System.Security.AccessControl.FileSystemAccessRule ($UserName, "FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")
		if(Test-Path $Folder) {            
			try {            
				$acl = Get-ACL -Path $Folder -ErrorAction stop            
				$acl.SetAccessRule($rule)            
				Set-ACL -Path $Folder -ACLObject $acl -ErrorAction stop            
				Write-Host "Successfully set permissions on $Folder"            
			}catch{            
				Write-Warning "$Folder : Failed to set perms. Details : $_"                     
			}            
		}else{            
		Write-Warning "$Folder : No such folder found"                    
		}    	
	
	
   }catch{            
    Write-Warning "$Folder : Failed to be created"               
   }            


        
 


Read-Host -Prompt "Press Enter to exit"