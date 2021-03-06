# ITPS.OMCS.Snippets 

When using the PowerShell ISE , similar to other scripting editors, you have access to what are known as ‘code snippets’. These are _quick-start_ ways to generate frequently used code.  PowerShell ISE ships with some default snippets. In the Windows PowerShell ISE **Edit** menu, click **Start Snippets** or press <kbd>Ctrl</kbd>+<kbd>J</kbd>.  It is also possible to add some custom snippets of your own. 

This repository is for the creation and storage of homemade snippets.  Sure the default ones are good, but sometimes you might need more information or have it filled out completely.  That is where this repo comes into play.  If there is code that you use regularly and too long to remember or type each time, the snippet is for you.  If you find yourself "Binging" the solution because you can't get the syntax correct, then the snippet is for you.  If you like shortcuts, then the snippet is for you.

This repository is a set of snippets that I use.

## QUICK HOW-TO

This Repo is set up for two different ways to deply the _snippets_.  To get this working on your system you will need to decide whether you want to run multiple scripts or just copy and paste.  
1. If you want to run the _scripts_ then all you have to do is _copy_ the scripts folder and run as many of the scripts as you want.
1. To use the copy/paste method, then you will need to copy the **snippet** folder to your system (This is a nice backup too).  Then copy/paste the _.snippets.ps1xml_ files to the `$env:USERPROFILE\Documents\WindowsPowershell\Snippets` folder and restart the PowerShell ISE.

## DESCRIPTION

To import snippets, they must be properly formatted in the snippet XML for Windows PowerShell ISE
snippets and saved in Snippet.ps1xml files. The snippets in this repository were copied from a currently working set.

### Import-IseSnippet 
Imported snippets are available only in the current session. To import the snippets into all Windows
PowerShell ISE sessions, add an `Import-IseSnippet` command to your Windows PowerShell profile or
copy the snippet files to your local snippets directory
`$home\Documents\WindowsPowershell\Snippets`.

The `Import-IseSnippet` cmdlet imports reusable text "snippets" from a module or a directory into
the current session. The snippets are immediately available for use in Windows PowerShell ISE. This
cmdlet works only in Windows PowerShell Integrated Scripting Environment (ISE).

### FromFolder (Default)

```
Import-IseSnippet [-Path] <String> [-Recurse] [<CommonParameters>]
```

### Example: Import snippets from a directory

This example imports the snippets from the network `\\Server01\Public\Snippets` directory into the current
session. It uses the **Recurse** parameter to get snippets from all subdirectories of the Snippets
directory.

```powershell
Import-IseSnippet -Path \\Server01\Public\Snippets -Recurse
```

## OTHER COMMANDS
The `Get-IseSnippet` cmdlet, returns a list of user-created snippets in the local snippets directory.  It does not get imported snippets.

```powershell
Get-IseSnippet
``` 

```
Directory: C:\Users\erika\Documents\WindowsPowerShell\Snippets

Mode                 LastWriteTime         Length Name                                                                
----                 -------------         ------ ----                                                                
-a----          4/7/2021     06:27           1464 ks_ Compare-FileHash.snippets.ps1xml                                
-a----          4/7/2021     09:07            907 ks_ Credential File.snippets.ps1xml 
``` 


To create eligible snippets, use the `New-IseSnippet`
cmdlet. `New-IseSnippet` creates a `<SnippetTitle>.Snippets.ps1xml` file in the
`$home\Documents\WindowsPowerShell\Snippets` directory. You can move or copy the snippets to the
Snippets directory of a Windows PowerShell module, or to any other directory.

### Example 1: New snippets

```powershell
New-IseSnippet -Title 'Snippet Name' -Author 'Erik' -Description 'How to create a snippet from a file' -Text (Get-Content .\SomeCodeSnippet.ps1 -Raw)
``` 

### Example 2: New snippets

```powershell
$snippet = @'

Function Set-SafetySwitch
{
  <#
      .SYNOPSIS
      Turns on "WhatIf" for the entire script
  #>
  If ($WhatIfPreference -eq $true)
  {
    $Script:WhatIfPreference = $false
    Write-Host 'Safety OFF' -ForegroundColor Red
  }
  else
  {
    $Script:WhatIfPreference = $true
    Write-Host 'Safety ON' -ForegroundColor Green
  }
}

'@
New-IseSnippet -Text $snippet -Title 'ks: Set-SafetySwitch' -Description 'Turns on "WhatIf" for the entire script' -Author 'Knarr Studio'

``` 
### Example 3: New snippets
```powershell
$SnipData = @{
Title = 'ks_ Workflow Examples' 
Author = 'Erik' 
Description = 'How to create a workflow' 
}

$workflow = @'
workflow Test-Workflow
{
    Get-Process -Name PowerShell
    gps -Name Winword
}

workflow Test-Workflow
{
    [CmdletBinding(ConfirmImpact=<String>,
        DefaultParameterSetName=<String>,
        HelpURI=<URI>,
        PositionalBinding=<Boolean>)]

    Param
    (
        [parameter(Mandatory=$true)]
        [String[]]
        $<ParameterName>
    )
}
'@

New-IseSnippet  @SnipData -Text $workflow 
```
