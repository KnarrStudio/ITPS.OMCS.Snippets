$m = @'


$Parms = @{
  Path                       = 'C:\Test\Temp-Scriptfile.ps1'
  Version                    = '1.0'
  Author                    = 'Erik@home.com'
  Companyname                = 'KnarrStudio'
  Copyright                = '2021 KnarrStudio'
  ExternalScriptDependencies = 'Stop-ContosoServerScript'
  Tags                       = @('Tag1', 'Tag2', 'Tag3')
  ProjectUri                 = 'https://contoso.com'
  LicenseUri                 = 'https://contoso.com/License'
  IconUri                    = 'https://contoso.com/Icon'
  PassThru                   = $True
  ReleaseNotes               = @('Contoso script now supports the following features:', 
    'Feature 1', 
    'Feature 2', 
    'Feature 3', 
    'Feature 4', 
  'Feature 5')
  RequiredModules            = '1', 
  '2', 
  'RequiredModule1', 
  @{
    ModuleName    = 'RequiredModule2'
    ModuleVersion = '1.0'
  }, 
  @{
    ModuleName      = 'RequiredModule3'
    RequiredVersion = '2.0'
  }, 
  'ExternalModule1'
  Description = ''
}



New-ScriptFileInfo @Parms
'@

New-IseSnippet -Text $m -Title 'ks: New-ScriptFileInfo' -Description 'Create a Standard group of Metadata for your scripts' -Author 'Knarr Studio'
