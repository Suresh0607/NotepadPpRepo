#  Notepad++ 

 This repo contains parameterized PowerShell script to install and uninstall test software (https://notepad-plus-plus.org)

## CONFIG

1.  `Path` value is where the git clone https://github.com/Suresh0607/NotedPadPlusPlus.git is done.
     Example cd C:\git Note : This can be changed
	`Path` = "C:\git"
	 Then do Git Clone https://github.com/Suresh0607/NotedPadPlusPlus.git
	
2.   Operating System is Windows 10 

3.   Copy the Get.Software folder onto your workstation into the PowerShell Module path `%ProgramFiles%\WindowsPowerShell\Modules\`.

5.   Get.Software Module is used to fectch the Latest Notepad++ Uri & Version

4.   All Notepad++ need to be closed.

	 
## RUN

1 . Open a `Windows PowerShell ISE` console with the Run as Administrator option.

2 . Run `Set-ExecutionPolicy` using the parameter `RemoteSigned` or `Bypass`.
    Example: Set-ExecutionPolicy RemoteSigned

3 . Validate that the module exists by running 
	Get-Module -ListAvailable Get.Software 
	


## Install Notepad++ Software LastesVersion

4. For `NotepadPpExe_Location`  Provide any location to install the NotePadPlusPlus_x64

   For Example `C:\NotepadPpExe_Location\`	

5. For `NotepadPpInstalltionPath`  provide path where Notepad++ is installed in the system
   
   For Example `C:\Program Files\`


5. Update the varilables in the command and Run 
		& '`Path`\InstallSoftware.ps1' NotepadPlusPlusExe_Location NotepadPpInstalltionPath
    
       Example:
        & 'C:\git\InstallSoftware.ps1' 'C:\NotepadPpExe_Location\' 'C:\Program Files\'


## UnInstall Notepad++ Software

7.  For `NotepadPpInstalltionPath` provide path where Notepad++ is installed in the system
    For Example `C:\Program Files\` 

6.  Update the varilables in the command and Run 
        & '`Path`\UnistallSoftware.ps1' NotepadPpInstalltionPath 

    	Example:
    	& 'C:\git\UnistallSoftware.ps1' 'C:\Program Files\'
