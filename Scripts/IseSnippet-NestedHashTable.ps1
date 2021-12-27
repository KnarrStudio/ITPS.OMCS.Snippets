#requires -Version 2.0 -Modules ISE

$SnipData = @{
  Title       = 'ks: Hash Tables Nested'
  Author      = 'Erik'
  Description = 'Nested hash table example'
}

$SnipText = @'
$NestedHashtable = @{
  Main1 = 'apples'
  Main2 = @{
    Sub1 = 'c:\temp\'
    Sub2 = 'Pumkin'
  }
  Main3 = 'testing'
  Main4 = @{
    Sub1 = 'c:\temp\'
    Sub2 = 'grapes'
  }
}

'@

New-IseSnippet  @SnipData -Text $SnipText


