# ITPS.OMCS.Snippets 

When using the PowerShell ISE , similar to other scripting editors, you have access to what are known as ‘code snippets’. These are quick start ways to generate frequently used code, for instance if there is something you use regularly and can never remember the syntax for, or maybe it is too long to be practical to remember it.

PowerShell ISE ships with some default snippets. In the Windows PowerShell ISE **Edit** menu, click **Start
Snippets** or press <kbd>Ctrl</kbd>+<kbd>J</kbd>.

It is also possible to add some custom snippets of your own. This repository is a set of snippets that I use.

## QUICK HOW-TO
All you need is either the **snippet** folder or the **scripts** folder. 
- If you copy the **scripts** then all you have to do is run as many of the scripts as you want.
- If you copy the **snippet** folder then you can either copy the files to the `$home\Documents\WindowsPowershell\Snippets` folder and restart the PowerShell ISE.

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

This example imports the snippets from the `\\Server01\Public\Snippets` directory into the current
session. It uses the **Recurse** parameter to get snippets from all subdirectories of the Snippets
directory.

```powershell
Import-IseSnippet -Path \\Server01\Public\Snippets -Recurse
```

## OTHER COMMANDS
The `Get-IseSnippet` cmdlet, which gets user-created snippets in the local snippets directory, does
not get imported snippets.

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
