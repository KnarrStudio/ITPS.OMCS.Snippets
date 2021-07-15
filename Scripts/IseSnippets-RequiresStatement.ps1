#requires -Version 2.0 -Modules ISE

$SnipData = @{
Title = 'ks: Requires Statement' 
Author = 'Erik' 
Description = 'Prevents a script from running without the required elements.' 
}

$SnipText = @'
#Requires -Version <N>[.<n>]
#Requires -PSSnapin <PSSnapin-Name> [-Version <N>[.<n>]]
#Requires -Modules { <Module-Name> | <Hashtable> }
#Requires -PSEdition <PSEdition-Name>
#Requires -ShellId <ShellId> -PSSnapin <PSSnapin-Name> [-Version <N>[.<n>]]
#Requires -RunAsAdministrator

https://ss64.com/ps/syntax-requires.html
'@

New-IseSnippet  @SnipData -Text $SnipText


