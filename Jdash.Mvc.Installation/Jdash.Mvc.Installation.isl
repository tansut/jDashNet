<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<?xml-stylesheet type="text/xsl" href="is.xsl" ?>
<!DOCTYPE msi [
   <!ELEMENT msi   (summary,table*)>
   <!ATTLIST msi version    CDATA #REQUIRED>
   <!ATTLIST msi xmlns:dt   CDATA #IMPLIED
                 codepage   CDATA #IMPLIED
                 compression (MSZIP|LZX|none) "LZX">
   
   <!ELEMENT summary       (codepage?,title?,subject?,author?,keywords?,comments?,
                            template,lastauthor?,revnumber,lastprinted?,
                            createdtm?,lastsavedtm?,pagecount,wordcount,
                            charcount?,appname?,security?)>
                            
   <!ELEMENT codepage      (#PCDATA)>
   <!ELEMENT title         (#PCDATA)>
   <!ELEMENT subject       (#PCDATA)>
   <!ELEMENT author        (#PCDATA)>
   <!ELEMENT keywords      (#PCDATA)>
   <!ELEMENT comments      (#PCDATA)>
   <!ELEMENT template      (#PCDATA)>
   <!ELEMENT lastauthor    (#PCDATA)>
   <!ELEMENT revnumber     (#PCDATA)>
   <!ELEMENT lastprinted   (#PCDATA)>
   <!ELEMENT createdtm     (#PCDATA)>
   <!ELEMENT lastsavedtm   (#PCDATA)>
   <!ELEMENT pagecount     (#PCDATA)>
   <!ELEMENT wordcount     (#PCDATA)>
   <!ELEMENT charcount     (#PCDATA)>
   <!ELEMENT appname       (#PCDATA)>
   <!ELEMENT security      (#PCDATA)>                            
                                
   <!ELEMENT table         (col+,row*)>
   <!ATTLIST table
                name        CDATA #REQUIRED>

   <!ELEMENT col           (#PCDATA)>
   <!ATTLIST col
                 key       (yes|no) #IMPLIED
                 def       CDATA #IMPLIED>
                 
   <!ELEMENT row            (td+)>
   
   <!ELEMENT td             (#PCDATA)>
   <!ATTLIST td
                 href       CDATA #IMPLIED
                 dt:dt     (string|bin.base64) #IMPLIED
                 md5        CDATA #IMPLIED>
]>
<msi version="2.0" xmlns:dt="urn:schemas-microsoft-com:datatypes" codepage="65001">
	
	<summary>
		<codepage>1252</codepage>
		<title>Installation Database</title>
		<subject>Jdash Asp.Net Mvc</subject>
		<author>##ID_STRING2##</author>
		<keywords>Installer,MSI,Database</keywords>
		<comments>##ID_STRING3##</comments>
		<template>Intel;1033</template>
		<lastauthor>Administrator</lastauthor>
		<revnumber>{9B0FF80F-8F7E-4A10-88DF-80228AA346BF}</revnumber>
		<lastprinted/>
		<createdtm>06/21/1999 15:00</createdtm>
		<lastsavedtm>07/14/2000 18:50</lastsavedtm>
		<pagecount>200</pagecount>
		<wordcount>0</wordcount>
		<charcount/>
		<appname>InstallShield Express</appname>
		<security>1</security>
	</summary>
	
	<table name="ActionText">
		<col key="yes" def="s72">Action</col>
		<col def="L64">Description</col>
		<col def="L128">Template</col>
		<row><td>Advertise</td><td>##IDS_ACTIONTEXT_Advertising##</td><td/></row>
		<row><td>AllocateRegistrySpace</td><td>##IDS_ACTIONTEXT_AllocatingRegistry##</td><td>##IDS_ACTIONTEXT_FreeSpace##</td></row>
		<row><td>AppSearch</td><td>##IDS_ACTIONTEXT_SearchInstalled##</td><td>##IDS_ACTIONTEXT_PropertySignature##</td></row>
		<row><td>BindImage</td><td>##IDS_ACTIONTEXT_BindingExes##</td><td>##IDS_ACTIONTEXT_File##</td></row>
		<row><td>CCPSearch</td><td>##IDS_ACTIONTEXT_UnregisterModules##</td><td/></row>
		<row><td>CostFinalize</td><td>##IDS_ACTIONTEXT_ComputingSpace3##</td><td/></row>
		<row><td>CostInitialize</td><td>##IDS_ACTIONTEXT_ComputingSpace##</td><td/></row>
		<row><td>CreateFolders</td><td>##IDS_ACTIONTEXT_CreatingFolders##</td><td>##IDS_ACTIONTEXT_Folder##</td></row>
		<row><td>CreateShortcuts</td><td>##IDS_ACTIONTEXT_CreatingShortcuts##</td><td>##IDS_ACTIONTEXT_Shortcut##</td></row>
		<row><td>DeleteServices</td><td>##IDS_ACTIONTEXT_DeletingServices##</td><td>##IDS_ACTIONTEXT_Service##</td></row>
		<row><td>DuplicateFiles</td><td>##IDS_ACTIONTEXT_CreatingDuplicate##</td><td>##IDS_ACTIONTEXT_FileDirectorySize##</td></row>
		<row><td>FileCost</td><td>##IDS_ACTIONTEXT_ComputingSpace2##</td><td/></row>
		<row><td>FindRelatedProducts</td><td>##IDS_ACTIONTEXT_SearchForRelated##</td><td>##IDS_ACTIONTEXT_FoundApp##</td></row>
		<row><td>GenerateScript</td><td>##IDS_ACTIONTEXT_GeneratingScript##</td><td>##IDS_ACTIONTEXT_1##</td></row>
		<row><td>ISLockPermissionsCost</td><td>##IDS_ACTIONTEXT_ISLockPermissionsCost##</td><td/></row>
		<row><td>ISLockPermissionsInstall</td><td>##IDS_ACTIONTEXT_ISLockPermissionsInstall##</td><td/></row>
		<row><td>InstallAdminPackage</td><td>##IDS_ACTIONTEXT_CopyingNetworkFiles##</td><td>##IDS_ACTIONTEXT_FileDirSize##</td></row>
		<row><td>InstallFiles</td><td>##IDS_ACTIONTEXT_CopyingNewFiles##</td><td>##IDS_ACTIONTEXT_FileDirSize2##</td></row>
		<row><td>InstallODBC</td><td>##IDS_ACTIONTEXT_InstallODBC##</td><td/></row>
		<row><td>InstallSFPCatalogFile</td><td>##IDS_ACTIONTEXT_InstallingSystemCatalog##</td><td>##IDS_ACTIONTEXT_FileDependencies##</td></row>
		<row><td>InstallServices</td><td>##IDS_ACTIONTEXT_InstallServices##</td><td>##IDS_ACTIONTEXT_Service2##</td></row>
		<row><td>InstallValidate</td><td>##IDS_ACTIONTEXT_Validating##</td><td/></row>
		<row><td>LaunchConditions</td><td>##IDS_ACTIONTEXT_EvaluateLaunchConditions##</td><td/></row>
		<row><td>MigrateFeatureStates</td><td>##IDS_ACTIONTEXT_MigratingFeatureStates##</td><td>##IDS_ACTIONTEXT_Application##</td></row>
		<row><td>MoveFiles</td><td>##IDS_ACTIONTEXT_MovingFiles##</td><td>##IDS_ACTIONTEXT_FileDirSize3##</td></row>
		<row><td>PatchFiles</td><td>##IDS_ACTIONTEXT_PatchingFiles##</td><td>##IDS_ACTIONTEXT_FileDirSize4##</td></row>
		<row><td>ProcessComponents</td><td>##IDS_ACTIONTEXT_UpdateComponentRegistration##</td><td/></row>
		<row><td>PublishComponents</td><td>##IDS_ACTIONTEXT_PublishingQualifiedComponents##</td><td>##IDS_ACTIONTEXT_ComponentIDQualifier##</td></row>
		<row><td>PublishFeatures</td><td>##IDS_ACTIONTEXT_PublishProductFeatures##</td><td>##IDS_ACTIONTEXT_FeatureColon##</td></row>
		<row><td>PublishProduct</td><td>##IDS_ACTIONTEXT_PublishProductInfo##</td><td/></row>
		<row><td>RMCCPSearch</td><td>##IDS_ACTIONTEXT_SearchingQualifyingProducts##</td><td/></row>
		<row><td>RegisterClassInfo</td><td>##IDS_ACTIONTEXT_RegisterClassServer##</td><td>##IDS_ACTIONTEXT_ClassId##</td></row>
		<row><td>RegisterComPlus</td><td>##IDS_ACTIONTEXT_RegisteringComPlus##</td><td>##IDS_ACTIONTEXT_AppIdAppTypeRSN##</td></row>
		<row><td>RegisterExtensionInfo</td><td>##IDS_ACTIONTEXT_RegisterExtensionServers##</td><td>##IDS_ACTIONTEXT_Extension2##</td></row>
		<row><td>RegisterFonts</td><td>##IDS_ACTIONTEXT_RegisterFonts##</td><td>##IDS_ACTIONTEXT_Font##</td></row>
		<row><td>RegisterMIMEInfo</td><td>##IDS_ACTIONTEXT_RegisterMimeInfo##</td><td>##IDS_ACTIONTEXT_ContentTypeExtension##</td></row>
		<row><td>RegisterProduct</td><td>##IDS_ACTIONTEXT_RegisteringProduct##</td><td>##IDS_ACTIONTEXT_1b##</td></row>
		<row><td>RegisterProgIdInfo</td><td>##IDS_ACTIONTEXT_RegisteringProgIdentifiers##</td><td>##IDS_ACTIONTEXT_ProgID2##</td></row>
		<row><td>RegisterTypeLibraries</td><td>##IDS_ACTIONTEXT_RegisterTypeLibs##</td><td>##IDS_ACTIONTEXT_LibId##</td></row>
		<row><td>RegisterUser</td><td>##IDS_ACTIONTEXT_RegUser##</td><td>##IDS_ACTIONTEXT_1c##</td></row>
		<row><td>RemoveDuplicateFiles</td><td>##IDS_ACTIONTEXT_RemovingDuplicates##</td><td>##IDS_ACTIONTEXT_FileDir##</td></row>
		<row><td>RemoveEnvironmentStrings</td><td>##IDS_ACTIONTEXT_UpdateEnvironmentStrings##</td><td>##IDS_ACTIONTEXT_NameValueAction2##</td></row>
		<row><td>RemoveExistingProducts</td><td>##IDS_ACTIONTEXT_RemoveApps##</td><td>##IDS_ACTIONTEXT_AppCommandLine##</td></row>
		<row><td>RemoveFiles</td><td>##IDS_ACTIONTEXT_RemovingFiles##</td><td>##IDS_ACTIONTEXT_FileDir2##</td></row>
		<row><td>RemoveFolders</td><td>##IDS_ACTIONTEXT_RemovingFolders##</td><td>##IDS_ACTIONTEXT_Folder1##</td></row>
		<row><td>RemoveIniValues</td><td>##IDS_ACTIONTEXT_RemovingIni##</td><td>##IDS_ACTIONTEXT_FileSectionKeyValue##</td></row>
		<row><td>RemoveODBC</td><td>##IDS_ACTIONTEXT_RemovingODBC##</td><td/></row>
		<row><td>RemoveRegistryValues</td><td>##IDS_ACTIONTEXT_RemovingRegistry##</td><td>##IDS_ACTIONTEXT_KeyName##</td></row>
		<row><td>RemoveShortcuts</td><td>##IDS_ACTIONTEXT_RemovingShortcuts##</td><td>##IDS_ACTIONTEXT_Shortcut1##</td></row>
		<row><td>Rollback</td><td>##IDS_ACTIONTEXT_RollingBack##</td><td>##IDS_ACTIONTEXT_1d##</td></row>
		<row><td>RollbackCleanup</td><td>##IDS_ACTIONTEXT_RemovingBackup##</td><td>##IDS_ACTIONTEXT_File2##</td></row>
		<row><td>SelfRegModules</td><td>##IDS_ACTIONTEXT_RegisteringModules##</td><td>##IDS_ACTIONTEXT_FileFolder##</td></row>
		<row><td>SelfUnregModules</td><td>##IDS_ACTIONTEXT_UnregisterModules##</td><td>##IDS_ACTIONTEXT_FileFolder2##</td></row>
		<row><td>SetODBCFolders</td><td>##IDS_ACTIONTEXT_InitializeODBCDirs##</td><td/></row>
		<row><td>StartServices</td><td>##IDS_ACTIONTEXT_StartingServices##</td><td>##IDS_ACTIONTEXT_Service3##</td></row>
		<row><td>StopServices</td><td>##IDS_ACTIONTEXT_StoppingServices##</td><td>##IDS_ACTIONTEXT_Service4##</td></row>
		<row><td>UnmoveFiles</td><td>##IDS_ACTIONTEXT_RemovingMoved##</td><td>##IDS_ACTIONTEXT_FileDir3##</td></row>
		<row><td>UnpublishComponents</td><td>##IDS_ACTIONTEXT_UnpublishQualified##</td><td>##IDS_ACTIONTEXT_ComponentIdQualifier2##</td></row>
		<row><td>UnpublishFeatures</td><td>##IDS_ACTIONTEXT_UnpublishProductFeatures##</td><td>##IDS_ACTIONTEXT_Feature##</td></row>
		<row><td>UnpublishProduct</td><td>##IDS_ACTIONTEXT_UnpublishingProductInfo##</td><td/></row>
		<row><td>UnregisterClassInfo</td><td>##IDS_ACTIONTEXT_UnregisterClassServers##</td><td>##IDS_ACTIONTEXT_ClsID##</td></row>
		<row><td>UnregisterComPlus</td><td>##IDS_ACTIONTEXT_UnregisteringComPlus##</td><td>##IDS_ACTIONTEXT_AppId##</td></row>
		<row><td>UnregisterExtensionInfo</td><td>##IDS_ACTIONTEXT_UnregisterExtensionServers##</td><td>##IDS_ACTIONTEXT_Extension##</td></row>
		<row><td>UnregisterFonts</td><td>##IDS_ACTIONTEXT_UnregisteringFonts##</td><td>##IDS_ACTIONTEXT_Font2##</td></row>
		<row><td>UnregisterMIMEInfo</td><td>##IDS_ACTIONTEXT_UnregisteringMimeInfo##</td><td>##IDS_ACTIONTEXT_ContentTypeExtension2##</td></row>
		<row><td>UnregisterProgIdInfo</td><td>##IDS_ACTIONTEXT_UnregisteringProgramIds##</td><td>##IDS_ACTIONTEXT_ProgID##</td></row>
		<row><td>UnregisterTypeLibraries</td><td>##IDS_ACTIONTEXT_UnregTypeLibs##</td><td>##IDS_ACTIONTEXT_Libid2##</td></row>
		<row><td>WriteEnvironmentStrings</td><td>##IDS_ACTIONTEXT_EnvironmentStrings##</td><td>##IDS_ACTIONTEXT_NameValueAction##</td></row>
		<row><td>WriteIniValues</td><td>##IDS_ACTIONTEXT_WritingINI##</td><td>##IDS_ACTIONTEXT_FileSectionKeyValue2##</td></row>
		<row><td>WriteRegistryValues</td><td>##IDS_ACTIONTEXT_WritingRegistry##</td><td>##IDS_ACTIONTEXT_KeyNameValue##</td></row>
	</table>

	<table name="AdminExecuteSequence">
		<col key="yes" def="s72">Action</col>
		<col def="S255">Condition</col>
		<col def="I2">Sequence</col>
		<col def="S255">ISComments</col>
		<col def="I4">ISAttributes</col>
		<row><td>CostFinalize</td><td/><td>1000</td><td>CostFinalize</td><td/></row>
		<row><td>CostInitialize</td><td/><td>800</td><td>CostInitialize</td><td/></row>
		<row><td>FileCost</td><td/><td>900</td><td>FileCost</td><td/></row>
		<row><td>InstallAdminPackage</td><td/><td>3900</td><td>InstallAdminPackage</td><td/></row>
		<row><td>InstallFiles</td><td/><td>4000</td><td>InstallFiles</td><td/></row>
		<row><td>InstallFinalize</td><td/><td>6600</td><td>InstallFinalize</td><td/></row>
		<row><td>InstallInitialize</td><td/><td>1500</td><td>InstallInitialize</td><td/></row>
		<row><td>InstallValidate</td><td/><td>1400</td><td>InstallValidate</td><td/></row>
		<row><td>ScheduleReboot</td><td>ISSCHEDULEREBOOT</td><td>4010</td><td>ScheduleReboot</td><td/></row>
	</table>

	<table name="AdminUISequence">
		<col key="yes" def="s72">Action</col>
		<col def="S255">Condition</col>
		<col def="I2">Sequence</col>
		<col def="S255">ISComments</col>
		<col def="I4">ISAttributes</col>
		<row><td>AdminWelcome</td><td/><td>1010</td><td>AdminWelcome</td><td/></row>
		<row><td>CostFinalize</td><td/><td>1000</td><td>CostFinalize</td><td/></row>
		<row><td>CostInitialize</td><td/><td>800</td><td>CostInitialize</td><td/></row>
		<row><td>ExecuteAction</td><td/><td>1300</td><td>ExecuteAction</td><td/></row>
		<row><td>FileCost</td><td/><td>900</td><td>FileCost</td><td/></row>
		<row><td>SetupCompleteError</td><td/><td>-3</td><td>SetupCompleteError</td><td/></row>
		<row><td>SetupCompleteSuccess</td><td/><td>-1</td><td>SetupCompleteSuccess</td><td/></row>
		<row><td>SetupInitialization</td><td/><td>50</td><td>SetupInitialization</td><td/></row>
		<row><td>SetupInterrupted</td><td/><td>-2</td><td>SetupInterrupted</td><td/></row>
		<row><td>SetupProgress</td><td/><td>1020</td><td>SetupProgress</td><td/></row>
	</table>

	<table name="AdvtExecuteSequence">
		<col key="yes" def="s72">Action</col>
		<col def="S255">Condition</col>
		<col def="I2">Sequence</col>
		<col def="S255">ISComments</col>
		<col def="I4">ISAttributes</col>
		<row><td>CostFinalize</td><td/><td>1000</td><td>CostFinalize</td><td/></row>
		<row><td>CostInitialize</td><td/><td>800</td><td>CostInitialize</td><td/></row>
		<row><td>CreateShortcuts</td><td/><td>4500</td><td>CreateShortcuts</td><td/></row>
		<row><td>InstallFinalize</td><td/><td>6600</td><td>InstallFinalize</td><td/></row>
		<row><td>InstallInitialize</td><td/><td>1500</td><td>InstallInitialize</td><td/></row>
		<row><td>InstallValidate</td><td/><td>1400</td><td>InstallValidate</td><td/></row>
		<row><td>MsiPublishAssemblies</td><td/><td>6250</td><td>MsiPublishAssemblies</td><td/></row>
		<row><td>PublishComponents</td><td/><td>6200</td><td>PublishComponents</td><td/></row>
		<row><td>PublishFeatures</td><td/><td>6300</td><td>PublishFeatures</td><td/></row>
		<row><td>PublishProduct</td><td/><td>6400</td><td>PublishProduct</td><td/></row>
		<row><td>RegisterClassInfo</td><td/><td>4600</td><td>RegisterClassInfo</td><td/></row>
		<row><td>RegisterExtensionInfo</td><td/><td>4700</td><td>RegisterExtensionInfo</td><td/></row>
		<row><td>RegisterMIMEInfo</td><td/><td>4900</td><td>RegisterMIMEInfo</td><td/></row>
		<row><td>RegisterProgIdInfo</td><td/><td>4800</td><td>RegisterProgIdInfo</td><td/></row>
		<row><td>RegisterTypeLibraries</td><td/><td>4910</td><td>RegisterTypeLibraries</td><td/></row>
		<row><td>ScheduleReboot</td><td>ISSCHEDULEREBOOT</td><td>6410</td><td>ScheduleReboot</td><td/></row>
	</table>

	<table name="AdvtUISequence">
		<col key="yes" def="s72">Action</col>
		<col def="S255">Condition</col>
		<col def="I2">Sequence</col>
		<col def="S255">ISComments</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="AppId">
		<col key="yes" def="s38">AppId</col>
		<col def="S255">RemoteServerName</col>
		<col def="S255">LocalService</col>
		<col def="S255">ServiceParameters</col>
		<col def="S255">DllSurrogate</col>
		<col def="I2">ActivateAtStorage</col>
		<col def="I2">RunAsInteractiveUser</col>
	</table>

	<table name="AppSearch">
		<col key="yes" def="s72">Property</col>
		<col key="yes" def="s72">Signature_</col>
	</table>

	<table name="BBControl">
		<col key="yes" def="s50">Billboard_</col>
		<col key="yes" def="s50">BBControl</col>
		<col def="s50">Type</col>
		<col def="i2">X</col>
		<col def="i2">Y</col>
		<col def="i2">Width</col>
		<col def="i2">Height</col>
		<col def="I4">Attributes</col>
		<col def="L50">Text</col>
	</table>

	<table name="Billboard">
		<col key="yes" def="s50">Billboard</col>
		<col def="s38">Feature_</col>
		<col def="S50">Action</col>
		<col def="I2">Ordering</col>
	</table>

	<table name="Binary">
		<col key="yes" def="s72">Name</col>
		<col def="V0">Data</col>
		<col def="S255">ISBuildSourcePath</col>
		<row><td>ISExpHlp.dll</td><td/><td>&lt;ISRedistPlatformDependentFolder&gt;\ISExpHlp.dll</td></row>
		<row><td>ISSELFREG.DLL</td><td/><td>&lt;ISRedistPlatformDependentFolder&gt;\isregsvr.dll</td></row>
		<row><td>NewBinary1</td><td/><td>&lt;ISProductFolder&gt;\Support\Themes\InstallShield Blue Theme\banner.jpg</td></row>
		<row><td>NewBinary10</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\CompleteSetupIco.ibd</td></row>
		<row><td>NewBinary11</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\CustomSetupIco.ibd</td></row>
		<row><td>NewBinary12</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\DestIcon.ibd</td></row>
		<row><td>NewBinary13</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\NetworkInstall.ico</td></row>
		<row><td>NewBinary14</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\DontInstall.ico</td></row>
		<row><td>NewBinary15</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\Install.ico</td></row>
		<row><td>NewBinary16</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\InstallFirstUse.ico</td></row>
		<row><td>NewBinary17</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\InstallPartial.ico</td></row>
		<row><td>NewBinary18</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\InstallStateMenu.ico</td></row>
		<row><td>NewBinary19</td><td/><td>C:\Projects\Kalitte.JDash\trunk\Documents\setup-banner-2.jpg</td></row>
		<row><td>NewBinary2</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\New.ibd</td></row>
		<row><td>NewBinary20</td><td/><td>C:\Projects\Kalitte.JDash\trunk\Documents\Visuals\banner-jdash.png</td></row>
		<row><td>NewBinary21</td><td/><td>C:\Projects\Kalitte.JDash\trunk\Documents\setup-banner.jpg</td></row>
		<row><td>NewBinary3</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\Up.ibd</td></row>
		<row><td>NewBinary4</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\WarningIcon.ibd</td></row>
		<row><td>NewBinary5</td><td/><td>&lt;ISProductFolder&gt;\Support\Themes\InstallShield Blue Theme\welcome.jpg</td></row>
		<row><td>NewBinary6</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\CustomSetupIco.ibd</td></row>
		<row><td>NewBinary7</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\ReinstIco.ibd</td></row>
		<row><td>NewBinary8</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\RemoveIco.ibd</td></row>
		<row><td>NewBinary9</td><td/><td>&lt;ISProductFolder&gt;\Redist\Language Independent\OS Independent\SetupIcon.ibd</td></row>
		<row><td>SetAllUsers.dll</td><td/><td>&lt;ISRedistPlatformDependentFolder&gt;\SetAllUsers.dll</td></row>
	</table>

	<table name="BindImage">
		<col key="yes" def="s72">File_</col>
		<col def="S255">Path</col>
	</table>

	<table name="CCPSearch">
		<col key="yes" def="s72">Signature_</col>
	</table>

	<table name="CheckBox">
		<col key="yes" def="s72">Property</col>
		<col def="S64">Value</col>
		<row><td>ISCHECKFORPRODUCTUPDATES</td><td>1</td></row>
		<row><td>LAUNCHPROGRAM</td><td>1</td></row>
		<row><td>LAUNCHREADME</td><td>1</td></row>
	</table>

	<table name="Class">
		<col key="yes" def="s38">CLSID</col>
		<col key="yes" def="s32">Context</col>
		<col key="yes" def="s72">Component_</col>
		<col def="S255">ProgId_Default</col>
		<col def="L255">Description</col>
		<col def="S38">AppId_</col>
		<col def="S255">FileTypeMask</col>
		<col def="S72">Icon_</col>
		<col def="I2">IconIndex</col>
		<col def="S32">DefInprocHandler</col>
		<col def="S255">Argument</col>
		<col def="s38">Feature_</col>
		<col def="I2">Attributes</col>
	</table>

	<table name="ComboBox">
		<col key="yes" def="s72">Property</col>
		<col key="yes" def="i2">Order</col>
		<col def="s64">Value</col>
		<col def="L64">Text</col>
	</table>

	<table name="CompLocator">
		<col key="yes" def="s72">Signature_</col>
		<col def="s38">ComponentId</col>
		<col def="I2">Type</col>
	</table>

	<table name="Complus">
		<col key="yes" def="s72">Component_</col>
		<col key="yes" def="I2">ExpType</col>
	</table>

	<table name="Component">
		<col key="yes" def="s72">Component</col>
		<col def="S38">ComponentId</col>
		<col def="s72">Directory_</col>
		<col def="i2">Attributes</col>
		<col def="S255">Condition</col>
		<col def="S72">KeyPath</col>
		<col def="I4">ISAttributes</col>
		<col def="S255">ISComments</col>
		<col def="S255">ISScanAtBuildFile</col>
		<col def="S255">ISRegFileToMergeAtBuild</col>
		<col def="S0">ISDotNetInstallerArgsInstall</col>
		<col def="S0">ISDotNetInstallerArgsCommit</col>
		<col def="S0">ISDotNetInstallerArgsUninstall</col>
		<col def="S0">ISDotNetInstallerArgsRollback</col>
		<row><td>Antlr3.Runtime.dll</td><td>{84101AC8-F37D-488B-A80C-F00E761F3322}</td><td>BIN2</td><td>2</td><td/><td>antlr3.runtime.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>Antlr3.Runtime.dll1</td><td>{4E88BECE-BD75-49B2-AE27-8EB7395322D3}</td><td>LIB8</td><td>2</td><td/><td>antlr3.runtime.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>DotNetOpenAuth.AspNet.dll</td><td>{6BEF2479-31B5-417C-AD5B-7EDE8E25C4BD}</td><td>BIN2</td><td>2</td><td/><td>dotnetopenauth.aspnet.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>DotNetOpenAuth.Core.dll</td><td>{6C1A730E-7AAE-4957-A721-5AD6EA68BC55}</td><td>BIN2</td><td>2</td><td/><td>dotnetopenauth.core.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT</td><td>{AE44E680-8248-4602-9130-6914DF53A065}</td><td>StartMenuFolder</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT10</td><td>{75D99A46-5014-4EBB-89E3-FA3A0F913DAD}</td><td>APP_START</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT100</td><td>{88DBB186-572A-436E-8E4F-5BE8134ADD62}</td><td>CSS1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT101</td><td>{13101674-1DD8-4927-9D69-E6D6C67C03C5}</td><td>FONTS1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT102</td><td>{BFFD77C9-EDA4-48B8-A653-C0356F51E045}</td><td>IMAGES2</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT103</td><td>{E15A94EB-0073-429E-858A-F6706ECD9137}</td><td>THEMES</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT104</td><td>{9AB7942A-8F38-4C7F-A303-10C71E344B55}</td><td>CUSTOM</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT105</td><td>{9D85D84C-5B02-4148-8D04-81AAA5AAC0A2}</td><td>IMAGES3</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT106</td><td>{0B161E02-5249-431C-A011-C626DAB4960C}</td><td>CONTROLLERS3</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT107</td><td>{5C1D2514-8D2C-40E3-ABE6-82A0679A8531}</td><td>HELPERS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT108</td><td>{69F119D0-576A-41B2-8E90-7306E20ECDFB}</td><td>MODELS3</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT109</td><td>{66BD0251-66B1-4E14-B26B-BF88E0E83318}</td><td>OBJ1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT11</td><td>{6472A00A-5A30-4A07-B567-673D4A89BF54}</td><td>AREAS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT110</td><td>{FB8AD7D5-81B9-4729-9713-5A2379D4D8FA}</td><td>DEBUG1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT111</td><td>{81418FA4-47C9-49ED-8020-5F2F1C6A5980}</td><td>TEMPPE1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT112</td><td>{4A04EACB-08E7-4680-9B39-60D46A8A8987}</td><td>PROPERTIES1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT113</td><td>{252F2C84-94D2-4A35-9BD7-5E798B7BD66E}</td><td>PUBLISHPROFILES</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT114</td><td>{F92D0CE4-5A40-48E1-939E-91F0FF30BE81}</td><td>SCRIPTS1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT115</td><td>{64FF0D9B-9939-48C9-BB93-F62B12FA99B8}</td><td>APP1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT116</td><td>{65D27B78-F0CD-4F07-904C-C5798B685B69}</td><td>DASHLETS2</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT117</td><td>{5600C03C-205B-4939-B554-EAF4EA4B3E14}</td><td>ANGULAR1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT118</td><td>{1CA78B55-E8A3-4968-B6C8-9F68A4344734}</td><td>CHARTJS1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT119</td><td>{5C025194-D6E4-4238-B30B-14C30C9D0C3F}</td><td>GOOGLEMAP1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT12</td><td>{6428A0BE-5EAD-4279-BF19-5EA130369EE3}</td><td>DASHLETS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT120</td><td>{26A50EDC-56B5-483F-A7BC-BBBA00A4B340}</td><td>JVECTORMAP1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT121</td><td>{8DBB133D-787B-4A30-8835-5981FABE7ECF}</td><td>MAPS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT122</td><td>{BB8BE222-5D90-46FF-97C9-8AD5E84FB3C6}</td><td>SPARKLINE1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT123</td><td>{45CDCE19-507C-485C-B9B7-32785F9DEF67}</td><td>WEATHERBOARD1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT124</td><td>{C903EC34-7104-4206-A121-B25574F6B98C}</td><td>RESOURCES</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT125</td><td>{EAFC8929-0A42-4B70-A2D2-9301966E0E5D}</td><td>VIEWS4</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT126</td><td>{19A54FEB-2CBB-4B3C-A554-3F408B09C37B}</td><td>DASHBOARD</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT127</td><td>{CD67B1DC-01FF-44DE-B56B-DB474CFC25B7}</td><td>SHARED3</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT128</td><td>{510982C0-93B4-4D65-AE83-A7493D14AF9B}</td><td>INSTALLDIR</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT13</td><td>{07716CB4-2BBA-42AC-A8A9-A72259D65160}</td><td>CONTROLLERS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT14</td><td>{333779AD-8866-4694-A077-C30F1E155B71}</td><td>MODELS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT15</td><td>{301B9257-0A20-49A5-B408-4A19B7EF21A3}</td><td>VIEWS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT16</td><td>{550B7572-7973-4103-8D51-994C67A3B94F}</td><td>HELLOWORLD</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT17</td><td>{B78D1BD0-9635-432C-9015-9C6809C2EDF1}</td><td>SHARED</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT18</td><td>{87C74B71-A6CD-4449-A633-E5298215AA61}</td><td>BIN1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT19</td><td>{3912E429-9C67-4862-9B11-98E3248CE35D}</td><td>CONTROLLERS1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT20</td><td>{9E106AA0-A536-4627-98DC-33357586D30C}</td><td>MODELS1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT21</td><td>{9A0E30D5-C988-4D56-A5E4-F232D867EF7C}</td><td>OBJ</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT22</td><td>{B40713FE-E03F-4AA4-A925-B33D6D1027AC}</td><td>DEBUG</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT23</td><td>{7630F280-0A3C-4DA5-A9FF-27BB0057D74D}</td><td>TEMPPE</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT24</td><td>{E5150C98-CF0C-4AD4-AAA8-590DEB8D7294}</td><td>PROPERTIES</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT25</td><td>{FB4CF81F-3EBC-4A55-8616-816A8A92E522}</td><td>VIEWS1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT26</td><td>{1F93538C-5CA0-4081-9B1D-E347F83AB961}</td><td>HOME</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT27</td><td>{EC31A309-FC21-4A2E-86A8-727D7E9B43C5}</td><td>MANAGEMENT</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT28</td><td>{6545FBB5-8706-42D3-8257-0E222A6FB1CF}</td><td>BIN2</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT29</td><td>{C56C2513-DC02-4187-82AC-0F9C58BE7564}</td><td>SCRIPTS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT30</td><td>{F4F5202C-493F-41F0-8619-3AD746095CA1}</td><td>ANGULAR</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT31</td><td>{5B2CCB57-A46A-4EC6-925B-0A0F32F7DB1C}</td><td>I18N</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT32</td><td>{2A22D663-1848-4679-8CA8-F8CB02068C20}</td><td>APP</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT33</td><td>{894EC4D1-E5B5-4400-ABD7-DDBFC4C5CFAC}</td><td>ADMIN</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT34</td><td>{1A39D5C3-BB0F-4884-848A-CC6AECB6DA77}</td><td>RESOURCE</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT35</td><td>{96D708F6-28BB-4AFA-9277-B556AD698A92}</td><td>IMAGES</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT36</td><td>{825B0CD7-34D5-4C38-A997-E3BB7FA85B50}</td><td>NLS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT37</td><td>{6259B414-0E95-48F4-8095-3F9F2EEA35D5}</td><td>TR</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT38</td><td>{0A95CC55-152E-4CC5-8D60-1F5FA31D0FCE}</td><td>VIEWSOURCEDIALOG</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT39</td><td>{7AEE0CC1-BB26-40F7-A67C-2FAD22C98562}</td><td>RESOURCE1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT40</td><td>{18B8C195-3FE5-4979-9A81-1C2A46BF9B15}</td><td>BOOTSTRAP</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT41</td><td>{B5A30839-74AB-481E-8559-AA75BA9AABFF}</td><td>STYLES</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT42</td><td>{34F4EE01-3A23-4BCF-A2A2-6C5ABB895914}</td><td>CSS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT43</td><td>{8BC7167F-171B-4C41-B839-969076EEE5C4}</td><td>FONTS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT44</td><td>{14265336-907F-4DA4-BDC9-D6366715E9C1}</td><td>IMAGES1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT45</td><td>{13F9F595-C128-4F59-98F3-29C754956D40}</td><td>VIEWS2</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT46</td><td>{8519F2AC-8E1B-4E7C-9450-36E5D805F11E}</td><td>HOME1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT47</td><td>{CC27E1B9-A822-4593-9333-52B47E03D7EC}</td><td>SHARED1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT48</td><td>{632814C8-E116-4D01-A46E-5433E3DD04E6}</td><td>PACKAGES</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT49</td><td>{3BB483EA-E72C-4B59-8291-40AF388F6274}</td><td>JDASH.MVC.REFERENCE</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT50</td><td>{2D297FF5-E43C-482F-90B0-08264188568B}</td><td>MICROSOFT.ASPNET.MVC.4.0.20710.0</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT51</td><td>{F305AD8D-9887-433E-A41A-1BBB94F122EE}</td><td>LIB</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT52</td><td>{A838CA03-3691-4F05-972B-A164D1400128}</td><td>NET40</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT53</td><td>{9C56CCE8-4816-4953-B07D-E5A635F4DD0D}</td><td>MICROSOFT.ASPNET.RAZOR.2.0.20710.0</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT54</td><td>{5482DC5F-11E8-49E6-8A4A-15843EA033B6}</td><td>LIB1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT55</td><td>{5EE1E513-4054-4244-B904-EFCFA1DB0D07}</td><td>NET401</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT56</td><td>{66C4E159-539B-4631-BB42-D49DC570732B}</td><td>MICROSOFT.ASPNET.WEB.OPTIMIZATION.1.0.0</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT57</td><td>{0BE48E51-D2EE-494C-9850-0510A5205F1C}</td><td>LIB2</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT58</td><td>{4FCF10D1-DBB8-41B6-8F2A-4D850D20C365}</td><td>NET402</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT59</td><td>{B9C1EFFA-E99E-45A9-B846-959A68D2B247}</td><td>MICROSOFT.ASPNET.WEBAPI.4.0.20710.0</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT6</td><td>{9600FB78-8811-4F2F-9A8E-E1322BA81B21}</td><td>BIN</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT60</td><td>{3AF48997-C715-4056-A7C6-296CFE2D5BEC}</td><td>MICROSOFT.ASPNET.WEBAPI.CORE.4.0.20710.0</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT61</td><td>{11FB439B-D0B2-41A2-BE71-7AB32514E9C8}</td><td>CONTENT</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT62</td><td>{6B207BDC-5E6D-4A56-A0B6-9A888B0C2865}</td><td>LIB3</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT63</td><td>{06FC32E4-39D3-4E4F-A6EB-4CB77F60C76F}</td><td>NET403</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT64</td><td>{F539D707-15BD-4212-A910-23F79B6765EF}</td><td>MICROSOFT.ASPNET.WEBAPI.WEBHOST.4.0.20710.0</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT65</td><td>{F38E8249-B2AC-4362-A77D-5326FC1E84D8}</td><td>LIB4</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT66</td><td>{3DA25392-4FA4-4974-9964-7CE7291157C0}</td><td>NET404</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT67</td><td>{2272FC60-48A7-4272-A020-0E7367F8BD2F}</td><td>MICROSOFT.ASPNET.WEBPAGES.2.0.20710.0</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT68</td><td>{97DA6E8D-40F0-47CB-8741-20EE812CC4FC}</td><td>LIB5</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT69</td><td>{101FB905-7899-412C-88DD-713617DC9503}</td><td>NET405</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT7</td><td>{93711886-D42E-4152-9514-AA5F13691048}</td><td>DOCUMENTATION</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT70</td><td>{A1B1A881-EFFF-4D6C-AF1E-F4C8A227615D}</td><td>MICROSOFT.NET.HTTP.2.0.20710.0</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT71</td><td>{65A8500A-AC84-4871-975E-4E4644B5DC9E}</td><td>LIB6</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT72</td><td>{92504D89-C5CD-4038-985A-3B7D32916A33}</td><td>NET406</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT73</td><td>{2D87381F-506C-4635-B5C9-226CEA663E9E}</td><td>NET45</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT74</td><td>{F21BB541-D71E-4DF5-A883-EBD9FF5F6958}</td><td>MYSQL.DATAPROVIDER</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT75</td><td>{33CE19A0-479D-45C5-B599-655E6CC576E7}</td><td>NEWTONSOFT.JSON.4.5.6</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT76</td><td>{7ED5AF48-3B57-4928-89ED-C26E1EFCFDE9}</td><td>LIB7</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT77</td><td>{E2F343C5-68B0-4486-8F23-F473F74275E5}</td><td>NET407</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT78</td><td>{57BC9100-436F-4D19-A839-FE5BC17373BA}</td><td>WEBGREASE.1.1.0</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT79</td><td>{02AC616D-C58F-4BE7-B1FF-6D12B471FA73}</td><td>LIB8</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT8</td><td>{570AF577-D3F9-4A4E-9D2E-8A47E8279B9C}</td><td>JDASH.MVC.HELLOWORLD</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT80</td><td>{A4289819-1008-44F5-AE0A-5538D0E7589A}</td><td>TOOLS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT81</td><td>{E488646E-190A-4F69-914E-D75FD392BC5A}</td><td>SAMPLE_APPLICATION</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT82</td><td>{F527EEFF-2E5B-4242-87C0-0401D965EF79}</td><td>APP_DATA1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT83</td><td>{10FBD5B1-99DE-4C77-876E-6EB6DDBB53B8}</td><td>APP_START1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT84</td><td>{0BE7D5B7-EAB0-43E7-9254-D185B52FF388}</td><td>AREAS1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT85</td><td>{92DB5559-4B6F-4C86-ADC8-60EC0BBD02F6}</td><td>DASHLETS1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT86</td><td>{45EC071A-A063-41CB-AE64-E908E6E3E800}</td><td>CONTROLLERS2</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT87</td><td>{541EA4AB-7217-4554-B086-13FA4FB5C6CF}</td><td>MODELS2</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT88</td><td>{7C10FCF5-6AA2-4F48-80CD-FF36DFF71A93}</td><td>VIEWS3</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT89</td><td>{0DFAE11B-8F49-4FE4-A72D-0B6D98BF8D80}</td><td>ANGULARTODO</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT9</td><td>{857E9451-B5ED-4764-88BA-C0DAEB7F9EA4}</td><td>APP_DATA</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT90</td><td>{81CA2FEA-11CB-4B7A-BDCE-656CAF49902D}</td><td>CHARTJS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT91</td><td>{E3242384-8F62-4331-8564-81C349FA9899}</td><td>GOOGLEMAP</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT92</td><td>{9CB44B3A-B737-4FF5-AC72-24287FD46FDE}</td><td>HTML</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT93</td><td>{6BC50119-8535-4AB1-B158-A9B6DB7DB0DF}</td><td>JVECTORMAP</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT94</td><td>{5021A7B8-BB52-4314-9117-01939827AA8D}</td><td>RSS</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT95</td><td>{FEAB133A-E9AB-4177-9650-B2FF811FAF09}</td><td>SHARED2</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT96</td><td>{21734F68-65E8-45CB-B6DA-CEC35ACE155D}</td><td>SPARKLINE</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT97</td><td>{4F58BD18-557A-4649-95B2-924FAE7D058A}</td><td>WEATHERBOARD</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT98</td><td>{45D5E578-0CED-463E-B430-6161EF543E27}</td><td>BIN3</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>ISX_DEFAULTCOMPONENT99</td><td>{5A6CCFC0-5E3E-4106-9386-962F6740B764}</td><td>CONTENT1</td><td>2</td><td/><td/><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.Mvc.PackageInstaller.exe</td><td>{4FEBBEB9-9323-4F3B-AA26-52DC70C75306}</td><td>BIN</td><td>2</td><td/><td>jdash.mvc.packageinstaller.e</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.Mvc.StarterApplication.exe</td><td>{5F161BE9-EFEA-49A6-B086-44CF2A8C334C}</td><td>BIN</td><td>2</td><td/><td>jdash.mvc.starterapplication</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.Mvc.dll</td><td>{8283BA6B-C90A-4BA0-8B5A-3E18BAA13AE1}</td><td>BIN</td><td>2</td><td/><td>jdash.mvc.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.Mvc.dll1</td><td>{442774A4-47D9-4794-AF0F-934C3A009F44}</td><td>BIN2</td><td>2</td><td/><td>jdash.mvc.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.Mvc.dll2</td><td>{E1FE7E1A-6E25-4286-BF2E-5614DC38D7A1}</td><td>JDASH.MVC.REFERENCE</td><td>2</td><td/><td>jdash.mvc.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.MvcDemo.dll1</td><td>{219AE259-B225-43B5-AD1D-0B40BD1B48F6}</td><td>DEBUG1</td><td>2</td><td/><td>jdash.mvcdemo.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.MySqlProvider.dll</td><td>{FB4939FE-B8F5-4B86-8F3B-C4AF8A53B4C6}</td><td>BIN2</td><td>2</td><td/><td>jdash.mysqlprovider.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.MySqlProvider.dll2</td><td>{6A6DE8CB-E35F-4558-8076-22F46CCF1AB8}</td><td>JDASH.MVC.REFERENCE</td><td>2</td><td/><td>jdash.mysqlprovider.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.MySqlProvider.dll3</td><td>{9730CB07-B3DE-4406-83FF-5C2498A18350}</td><td>BIN3</td><td>2</td><td/><td>jdash.mysqlprovider.dll3</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.MySqlProvider.dll4</td><td>{5FA8526B-37EC-4FF1-BDDA-88A66F793A1A}</td><td>BIN</td><td>2</td><td/><td>jdash.mysqlprovider.dll4</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.SessionProvider.dll</td><td>{F643C4BD-7FAD-4966-8EF6-F1B66FEC3F29}</td><td>BIN2</td><td>2</td><td/><td>jdash.sessionprovider.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.SessionProvider.dll1</td><td>{941F98EB-DF7F-4761-8EF9-F153FF2F4A7C}</td><td>JDASH.MVC.REFERENCE</td><td>2</td><td/><td>jdash.sessionprovider.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.SessionProvider.dll2</td><td>{3BA9236F-6158-4E1C-B66F-56D52702E043}</td><td>BIN3</td><td>2</td><td/><td>jdash.sessionprovider.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.SessionProvider.dll3</td><td>{6E68802B-9681-4BDE-A727-6CC774BCD9C9}</td><td>BIN</td><td>2</td><td/><td>jdash.sessionprovider.dll3</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.SqlProvider.dll</td><td>{29C06B3B-7C02-4E97-AFE4-4FF562F779AC}</td><td>BIN2</td><td>2</td><td/><td>jdash.sqlprovider.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.SqlProvider.dll2</td><td>{0188B17A-5E9F-4D8B-B2CA-E545CCD06ED6}</td><td>JDASH.MVC.REFERENCE</td><td>2</td><td/><td>jdash.sqlprovider.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.SqlProvider.dll3</td><td>{16DF49FA-BC94-4349-80F4-E56FC6578F85}</td><td>BIN3</td><td>2</td><td/><td>jdash.sqlprovider.dll3</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.SqlProvider.dll4</td><td>{346C91C2-7DD8-4B8A-8285-0690667B2892}</td><td>BIN</td><td>2</td><td/><td>jdash.sqlprovider.dll4</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.dll</td><td>{D43C70DF-BE81-4250-A3F7-976200B04E15}</td><td>BIN3</td><td>2</td><td/><td>jdash.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.dll1</td><td>{AF29D2FC-5A43-449D-A923-98DF40723C69}</td><td>BIN2</td><td>2</td><td/><td>jdash.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.dll2</td><td>{B3CD2CE7-A3DF-4A76-B5E9-7891CB52D149}</td><td>JDASH.MVC.REFERENCE</td><td>2</td><td/><td>jdash.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDash.dll4</td><td>{0E5BE56C-3DAC-4415-A451-1D538EF5B3D1}</td><td>BIN</td><td>2</td><td/><td>jdash.dll4</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>JDashMvc.Management.dll</td><td>{8F62C7A6-0DCD-4EE8-86D1-A891CDD09D0B}</td><td>BIN2</td><td>2</td><td/><td>jdashmvc.management.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>Microsoft.Web.Infrastructure.dll</td><td>{9275BA3D-94E1-43F3-BC4F-B01DA177E3F0}</td><td>BIN1</td><td>2</td><td/><td>microsoft.web.infrastructure</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>Microsoft.Web.WebPages.OAuth.dll</td><td>{EC212DD0-BB1E-4DDB-B88E-4CA54B228893}</td><td>BIN2</td><td>2</td><td/><td>microsoft.web.webpages.oauth</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>MySql.Data.Entity.dll</td><td>{F9B92749-BF50-4A87-B793-90BB5E97134A}</td><td>BIN1</td><td>2</td><td/><td>mysql.data.entity.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>MySql.Data.Entity.dll1</td><td>{7F64984E-F939-4795-9858-3BB24E1EC07D}</td><td>BIN2</td><td>2</td><td/><td>mysql.data.entity.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>MySql.Data.Entity.dll2</td><td>{0327DC7A-3D51-4F3E-A898-E5C09790BB2D}</td><td>MYSQL.DATAPROVIDER</td><td>2</td><td/><td>mysql.data.entity.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>MySql.Data.Entity.dll3</td><td>{164B3F59-D6EB-476A-AD8E-E89D3538CB41}</td><td>BIN3</td><td>2</td><td/><td>mysql.data.entity.dll3</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>MySql.Data.dll</td><td>{B8E3AD98-05E8-40E6-AC22-8DE1642DB759}</td><td>BIN2</td><td>2</td><td/><td>mysql.data.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>MySql.Data.dll1</td><td>{2996FE56-154C-4855-AB49-3D72B0D95E71}</td><td>MYSQL.DATAPROVIDER</td><td>2</td><td/><td>mysql.data.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>MySql.Data.dll2</td><td>{65F88FDF-07C9-4CBB-8E26-0B088EC06E51}</td><td>BIN3</td><td>2</td><td/><td>mysql.data.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>Newtonsoft.Json.dll</td><td>{74754502-6FAD-4BD5-AA25-7EBACE232B95}</td><td>BIN1</td><td>2</td><td/><td>newtonsoft.json.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>Newtonsoft.Json.dll1</td><td>{B05ACC80-C052-4048-B158-788C26860BE7}</td><td>BIN2</td><td>2</td><td/><td>newtonsoft.json.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>Newtonsoft.Json.dll2</td><td>{486C6D3D-E01F-4B3D-98BA-9DEDDB22D8A5}</td><td>NET407</td><td>2</td><td/><td>newtonsoft.json.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>Newtonsoft.Json.dll3</td><td>{737AA8FE-736A-41A9-9AC7-35E9104E0B04}</td><td>BIN3</td><td>2</td><td/><td>newtonsoft.json.dll3</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Net.Http.Formatting.dll</td><td>{CD32DD01-89D0-4A27-8362-1D76BAF98547}</td><td>BIN1</td><td>2</td><td/><td>system.net.http.formatting.d</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Net.Http.Formatting.dll1</td><td>{1AED3079-6204-43D4-AD67-48A093BE5342}</td><td>BIN2</td><td>2</td><td/><td>system.net.http.formatting.d1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Net.Http.Formatting.dll2</td><td>{AC3D7118-21EE-4716-B612-908CCC6D8E36}</td><td>BIN3</td><td>2</td><td/><td>system.net.http.formatting.d2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Net.Http.WebRequest.dll</td><td>{DD2B3253-09DE-4A3F-9B64-8C8DB98DDC6F}</td><td>BIN1</td><td>2</td><td/><td>system.net.http.webrequest.d</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Net.Http.WebRequest.dll1</td><td>{700793F7-6A4B-4CE6-9236-7FB8E34C5707}</td><td>NET406</td><td>2</td><td/><td>system.net.http.webrequest.d1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Net.Http.dll</td><td>{A572C858-E9E9-4DDB-A6FA-E9260EDBA40F}</td><td>BIN1</td><td>2</td><td/><td>system.net.http.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Net.Http.dll1</td><td>{D6564361-CB4B-4607-92A1-2ACDA11D149E}</td><td>NET406</td><td>2</td><td/><td>system.net.http.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Net.Http.dll2</td><td>{C6AC85A0-86F5-4C4F-AF3E-23C98B0D7666}</td><td>BIN3</td><td>2</td><td/><td>system.net.http.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Helpers.dll</td><td>{8440A015-2955-4196-A7C4-AC4BE20A8614}</td><td>BIN1</td><td>2</td><td/><td>system.web.helpers.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Helpers.dll1</td><td>{61B3E1B5-AD51-46CB-8ED0-C009AE98B9A5}</td><td>BIN2</td><td>2</td><td/><td>system.web.helpers.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Helpers.dll2</td><td>{36FC287C-A1BD-42A0-9116-DD2ABE55D1BC}</td><td>NET405</td><td>2</td><td/><td>system.web.helpers.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Helpers.dll3</td><td>{4473EC9F-BE40-4DF3-BB33-94975526F8FD}</td><td>BIN3</td><td>2</td><td/><td>system.web.helpers.dll3</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Http.WebHost.dll</td><td>{E8A69C2B-B178-45C4-B73F-46CBE669F947}</td><td>BIN1</td><td>2</td><td/><td>system.web.http.webhost.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Http.WebHost.dll1</td><td>{148E99F0-4EB6-4B72-88B8-62E76A8279C6}</td><td>BIN2</td><td>2</td><td/><td>system.web.http.webhost.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Http.WebHost.dll2</td><td>{19792183-1B9A-4AEA-BA5E-15080ED9D8AE}</td><td>NET404</td><td>2</td><td/><td>system.web.http.webhost.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Http.WebHost.dll3</td><td>{4733535C-14E5-4BB8-A9E3-555106885A33}</td><td>BIN3</td><td>2</td><td/><td>system.web.http.webhost.dll3</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Http.dll</td><td>{FAF4B0E4-1A4C-4AE2-88C8-D533EB686F47}</td><td>BIN1</td><td>2</td><td/><td>system.web.http.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Http.dll1</td><td>{4CD646A6-4287-47FB-A9A8-99F6E4859688}</td><td>BIN2</td><td>2</td><td/><td>system.web.http.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Http.dll2</td><td>{DED289AB-C69F-47EE-9FC1-933F0EBE783B}</td><td>NET403</td><td>2</td><td/><td>system.web.http.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Http.dll3</td><td>{E680BA81-5157-478C-A4F0-2D791396D218}</td><td>BIN3</td><td>2</td><td/><td>system.web.http.dll3</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Mvc.dll</td><td>{8D6A34CE-032B-4D7B-A072-C655AFEBAB1B}</td><td>BIN1</td><td>2</td><td/><td>system.web.mvc.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Mvc.dll1</td><td>{2D6AAFD5-EB2C-4A7F-9F49-EFA597666D33}</td><td>BIN2</td><td>2</td><td/><td>system.web.mvc.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Mvc.dll2</td><td>{CCB15278-F4FA-4A49-9111-2398FB5994A0}</td><td>NET40</td><td>2</td><td/><td>system.web.mvc.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Mvc.dll3</td><td>{2312893E-CAB5-4565-AE33-4E04E79304E9}</td><td>BIN3</td><td>2</td><td/><td>system.web.mvc.dll3</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Optimization.dll</td><td>{5037B475-E7A0-459F-AB3A-EBCF3A337703}</td><td>BIN2</td><td>2</td><td/><td>system.web.optimization.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Optimization.dll1</td><td>{8866BB46-2FAF-4547-8832-FAE66E558B38}</td><td>NET402</td><td>2</td><td/><td>system.web.optimization.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Optimization.dll2</td><td>{865E2B43-9F29-42AF-9F1E-0704A44DC131}</td><td>BIN3</td><td>2</td><td/><td>system.web.optimization.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Razor.dll</td><td>{C6CD6F09-08A2-4903-BD0C-95E4BDE87087}</td><td>BIN1</td><td>2</td><td/><td>system.web.razor.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Razor.dll1</td><td>{C4A74343-A0B8-4D6E-A7D6-DECB6BFD4FC1}</td><td>BIN2</td><td>2</td><td/><td>system.web.razor.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Razor.dll2</td><td>{A5957053-A9E9-417A-9415-40F72E9DD3ED}</td><td>NET401</td><td>2</td><td/><td>system.web.razor.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.Razor.dll3</td><td>{1B5AA336-8070-4F73-BEFE-83C5EA761712}</td><td>BIN3</td><td>2</td><td/><td>system.web.razor.dll3</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.WebPages.Deployment.dll</td><td>{352FC711-FE65-469D-B870-4C442A248E60}</td><td>BIN1</td><td>2</td><td/><td>system.web.webpages.deployme</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.WebPages.Deployment.dll1</td><td>{B0C320FE-14DB-4A41-A9E1-C6AAA6F7A553}</td><td>BIN2</td><td>2</td><td/><td>system.web.webpages.deployme1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.WebPages.Deployment.dll2</td><td>{29C9CF4D-6497-4463-B9E5-33CA3B776064}</td><td>NET405</td><td>2</td><td/><td>system.web.webpages.deployme2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.WebPages.Deployment.dll3</td><td>{F68A0848-0B98-42AF-8494-1EBCEB14BC6D}</td><td>BIN3</td><td>2</td><td/><td>system.web.webpages.deployme4</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.WebPages.Razor.dll</td><td>{CAFE15C8-59B9-4E21-B1C6-4905AEA07D9B}</td><td>BIN1</td><td>2</td><td/><td>system.web.webpages.razor.dl</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.WebPages.Razor.dll1</td><td>{83971BE8-F80E-4FEB-944F-E0D72631A732}</td><td>BIN2</td><td>2</td><td/><td>system.web.webpages.razor.dl1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.WebPages.Razor.dll2</td><td>{DC92FB38-09E9-4D4D-98B0-C0A567B1E6AE}</td><td>NET405</td><td>2</td><td/><td>system.web.webpages.razor.dl2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.WebPages.Razor.dll3</td><td>{695ABA98-5CB6-466F-A4C9-FB0D2560F8C6}</td><td>BIN3</td><td>2</td><td/><td>system.web.webpages.razor.dl3</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.WebPages.dll</td><td>{C8CCF283-8F5E-467D-93B0-9AD98AD2BD93}</td><td>BIN1</td><td>2</td><td/><td>system.web.webpages.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.WebPages.dll1</td><td>{022D8A2A-B947-422F-BD00-518147D07561}</td><td>BIN2</td><td>2</td><td/><td>system.web.webpages.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.WebPages.dll2</td><td>{517B75BA-B69E-4187-BA85-5946C4021F4D}</td><td>NET405</td><td>2</td><td/><td>system.web.webpages.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>System.Web.WebPages.dll3</td><td>{18E9F1C8-FB10-4415-A8B1-220D2CD6EDAF}</td><td>BIN3</td><td>2</td><td/><td>system.web.webpages.dll3</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>WG.exe</td><td>{FDA61898-3F59-4562-ADFA-B85D65A1921E}</td><td>TOOLS</td><td>2</td><td/><td>wg.exe</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>WebGrease.dll</td><td>{8A3867C9-C52B-4951-8045-F372C88DDD5B}</td><td>BIN2</td><td>2</td><td/><td>webgrease.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>WebGrease.dll1</td><td>{095DC852-4A65-4AD6-83FD-EC72A08B4611}</td><td>LIB8</td><td>2</td><td/><td>webgrease.dll1</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>WebGrease.dll2</td><td>{852FED4A-936B-483D-9D52-1F727154ACF1}</td><td>BIN3</td><td>2</td><td/><td>webgrease.dll2</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>WebMatrix.Data.dll</td><td>{C0E3EBE4-8561-4FF1-8DE0-97F0F00D40A1}</td><td>BIN2</td><td>2</td><td/><td>webmatrix.data.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
		<row><td>WebMatrix.WebData.dll</td><td>{9DF08407-22B1-4F5F-82ED-0B159C3FCF06}</td><td>BIN2</td><td>2</td><td/><td>webmatrix.webdata.dll</td><td>17</td><td/><td/><td/><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td><td>/LogFile=</td></row>
	</table>

	<table name="Condition">
		<col key="yes" def="s38">Feature_</col>
		<col key="yes" def="i2">Level</col>
		<col def="S255">Condition</col>
	</table>

	<table name="Control">
		<col key="yes" def="s72">Dialog_</col>
		<col key="yes" def="s50">Control</col>
		<col def="s20">Type</col>
		<col def="i2">X</col>
		<col def="i2">Y</col>
		<col def="i2">Width</col>
		<col def="i2">Height</col>
		<col def="I4">Attributes</col>
		<col def="S72">Property</col>
		<col def="L0">Text</col>
		<col def="S50">Control_Next</col>
		<col def="L50">Help</col>
		<col def="I4">ISWindowStyle</col>
		<col def="I4">ISControlId</col>
		<col def="S255">ISBuildSourcePath</col>
		<col def="S72">Binary_</col>
		<row><td>AdminChangeFolder</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>AdminChangeFolder</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>ComboText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>Combo</td><td>DirectoryCombo</td><td>21</td><td>64</td><td>277</td><td>80</td><td>458755</td><td>TARGETDIR</td><td>##IDS__IsAdminInstallBrowse_4##</td><td>Up</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>ComboText</td><td>Text</td><td>21</td><td>50</td><td>99</td><td>14</td><td>3</td><td/><td>##IDS__IsAdminInstallBrowse_LookIn##</td><td>Combo</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsAdminInstallBrowse_BrowseDestination##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsAdminInstallBrowse_ChangeDestination##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>List</td><td>DirectoryList</td><td>21</td><td>90</td><td>332</td><td>97</td><td>7</td><td>TARGETDIR</td><td>##IDS__IsAdminInstallBrowse_8##</td><td>TailText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>NewFolder</td><td>PushButton</td><td>335</td><td>66</td><td>19</td><td>19</td><td>3670019</td><td/><td/><td>List</td><td>##IDS__IsAdminInstallBrowse_CreateFolder##</td><td>0</td><td/><td/><td>NewBinary2</td></row>
		<row><td>AdminChangeFolder</td><td>OK</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_OK##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>Tail</td><td>PathEdit</td><td>21</td><td>207</td><td>332</td><td>17</td><td>3</td><td>TARGETDIR</td><td>##IDS__IsAdminInstallBrowse_11##</td><td>OK</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>TailText</td><td>Text</td><td>21</td><td>193</td><td>99</td><td>13</td><td>3</td><td/><td>##IDS__IsAdminInstallBrowse_FolderName##</td><td>Tail</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminChangeFolder</td><td>Up</td><td>PushButton</td><td>310</td><td>66</td><td>19</td><td>19</td><td>3670019</td><td/><td/><td>NewFolder</td><td>##IDS__IsAdminInstallBrowse_UpOneLevel##</td><td>0</td><td/><td/><td>NewBinary3</td></row>
		<row><td>AdminNetworkLocation</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>InstallNow</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>AdminNetworkLocation</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>Browse</td><td>PushButton</td><td>286</td><td>124</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsAdminInstallPoint_Change##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>SetupPathEdit</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsAdminInstallPoint_SpecifyNetworkLocation##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>DlgText</td><td>Text</td><td>21</td><td>51</td><td>326</td><td>40</td><td>131075</td><td/><td>##IDS__IsAdminInstallPoint_EnterNetworkLocation##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsAdminInstallPoint_NetworkLocationFormatted##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>InstallNow</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsAdminInstallPoint_Install##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>LBBrowse</td><td>Text</td><td>21</td><td>90</td><td>100</td><td>10</td><td>3</td><td/><td>##IDS__IsAdminInstallPoint_NetworkLocation##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminNetworkLocation</td><td>SetupPathEdit</td><td>PathEdit</td><td>21</td><td>102</td><td>330</td><td>17</td><td>3</td><td>TARGETDIR</td><td/><td>Browse</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminWelcome</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminWelcome</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminWelcome</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminWelcome</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary5</td></row>
		<row><td>AdminWelcome</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminWelcome</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>196611</td><td/><td>##IDS__IsAdminInstallPointWelcome_Wizard##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>AdminWelcome</td><td>TextLine2</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>45</td><td>196611</td><td/><td>##IDS__IsAdminInstallPointWelcome_ServerImage##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CancelSetup</td><td>Icon</td><td>Icon</td><td>15</td><td>15</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary4</td></row>
		<row><td>CancelSetup</td><td>No</td><td>PushButton</td><td>135</td><td>57</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsCancelDlg_No##</td><td>Yes</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CancelSetup</td><td>Text</td><td>Text</td><td>48</td><td>15</td><td>194</td><td>30</td><td>131075</td><td/><td>##IDS__IsCancelDlg_ConfirmCancel##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CancelSetup</td><td>Yes</td><td>PushButton</td><td>62</td><td>57</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsCancelDlg_Yes##</td><td>No</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>CustomSetup</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Tree</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>ChangeFolder</td><td>PushButton</td><td>301</td><td>203</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_Change##</td><td>Help</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Details</td><td>PushButton</td><td>93</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_Space##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>DlgDesc</td><td>Text</td><td>17</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsCustomSelectionDlg_SelectFeatures##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>DlgText</td><td>Text</td><td>9</td><td>51</td><td>360</td><td>10</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_ClickFeatureIcon##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>DlgTitle</td><td>Text</td><td>9</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsCustomSelectionDlg_CustomSetup##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>FeatureGroup</td><td>GroupBox</td><td>235</td><td>67</td><td>131</td><td>120</td><td>1</td><td/><td>##IDS__IsCustomSelectionDlg_FeatureDescription##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Help</td><td>PushButton</td><td>22</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_Help##</td><td>Details</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>InstallLabel</td><td>Text</td><td>8</td><td>190</td><td>360</td><td>10</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_InstallTo##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>ItemDescription</td><td>Text</td><td>241</td><td>80</td><td>120</td><td>50</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_MultilineDescription##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Location</td><td>Text</td><td>8</td><td>203</td><td>291</td><td>20</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_FeaturePath##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Size</td><td>Text</td><td>241</td><td>133</td><td>120</td><td>50</td><td>3</td><td/><td>##IDS__IsCustomSelectionDlg_FeatureSize##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetup</td><td>Tree</td><td>SelectionTree</td><td>8</td><td>70</td><td>220</td><td>118</td><td>7</td><td>_BrowseProperty</td><td/><td>ChangeFolder</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>CustomSetupTips</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS_SetupTips_CustomSetupDescription##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS_SetupTips_CustomSetup##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>DontInstall</td><td>Icon</td><td>21</td><td>155</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary14</td></row>
		<row><td>CustomSetupTips</td><td>DontInstallText</td><td>Text</td><td>60</td><td>155</td><td>300</td><td>20</td><td>3</td><td/><td>##IDS_SetupTips_WillNotBeInstalled##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>FirstInstallText</td><td>Text</td><td>60</td><td>180</td><td>300</td><td>20</td><td>3</td><td/><td>##IDS_SetupTips_Advertise##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>Install</td><td>Icon</td><td>21</td><td>105</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary15</td></row>
		<row><td>CustomSetupTips</td><td>InstallFirstUse</td><td>Icon</td><td>21</td><td>180</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary16</td></row>
		<row><td>CustomSetupTips</td><td>InstallPartial</td><td>Icon</td><td>21</td><td>130</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary17</td></row>
		<row><td>CustomSetupTips</td><td>InstallStateMenu</td><td>Icon</td><td>21</td><td>52</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary18</td></row>
		<row><td>CustomSetupTips</td><td>InstallStateText</td><td>Text</td><td>21</td><td>91</td><td>300</td><td>10</td><td>3</td><td/><td>##IDS_SetupTips_InstallState##</td><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>CustomSetupTips</td><td>InstallText</td><td>Text</td><td>60</td><td>105</td><td>300</td><td>20</td><td>3</td><td/><td>##IDS_SetupTips_AllInstalledLocal##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>MenuText</td><td>Text</td><td>50</td><td>52</td><td>300</td><td>36</td><td>3</td><td/><td>##IDS_SetupTips_IconInstallState##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>NetworkInstall</td><td>Icon</td><td>21</td><td>205</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary13</td></row>
		<row><td>CustomSetupTips</td><td>NetworkInstallText</td><td>Text</td><td>60</td><td>205</td><td>300</td><td>20</td><td>3</td><td/><td>##IDS_SetupTips_Network##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>OK</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_SetupTips_OK##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomSetupTips</td><td>PartialText</td><td>Text</td><td>60</td><td>130</td><td>300</td><td>20</td><td>3</td><td/><td>##IDS_SetupTips_SubFeaturesInstalledLocal##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>CustomerInformation</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>NameLabel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>CompanyEdit</td><td>Edit</td><td>21</td><td>100</td><td>237</td><td>17</td><td>3</td><td>COMPANYNAME</td><td>##IDS__IsRegisterUserDlg_Tahoma80##</td><td>SerialLabel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>CompanyLabel</td><td>Text</td><td>21</td><td>89</td><td>75</td><td>10</td><td>3</td><td/><td>##IDS__IsRegisterUserDlg_Organization##</td><td>CompanyEdit</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsRegisterUserDlg_PleaseEnterInfo##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>DlgRadioGroupText</td><td>Text</td><td>21</td><td>161</td><td>300</td><td>14</td><td>2</td><td/><td>##IDS__IsRegisterUserDlg_InstallFor##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsRegisterUserDlg_CustomerInformation##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>NameEdit</td><td>Edit</td><td>21</td><td>63</td><td>237</td><td>17</td><td>3</td><td>USERNAME</td><td>##IDS__IsRegisterUserDlg_Tahoma50##</td><td>CompanyLabel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>NameLabel</td><td>Text</td><td>21</td><td>52</td><td>75</td><td>10</td><td>3</td><td/><td>##IDS__IsRegisterUserDlg_UserName##</td><td>NameEdit</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>RadioGroup</td><td>RadioButtonGroup</td><td>63</td><td>170</td><td>300</td><td>50</td><td>2</td><td>ApplicationUsers</td><td>##IDS__IsRegisterUserDlg_16##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>SerialLabel</td><td>Text</td><td>21</td><td>127</td><td>109</td><td>10</td><td>2</td><td/><td>##IDS__IsRegisterUserDlg_SerialNumber##</td><td>SerialNumber</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>CustomerInformation</td><td>SerialNumber</td><td>MaskedEdit</td><td>21</td><td>138</td><td>237</td><td>17</td><td>2</td><td>ISX_SERIALNUM</td><td/><td>RadioGroup</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>DatabaseFolder</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>ChangeFolder</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>ChangeFolder</td><td>PushButton</td><td>301</td><td>65</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CHANGE##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>DatabaseFolder</td><td>Icon</td><td>21</td><td>52</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary12</td></row>
		<row><td>DatabaseFolder</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__DatabaseFolder_ChangeFolder##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__DatabaseFolder_DatabaseFolder##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>LocLabel</td><td>Text</td><td>57</td><td>52</td><td>290</td><td>10</td><td>131075</td><td/><td>##IDS_DatabaseFolder_InstallDatabaseTo##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>Location</td><td>Text</td><td>57</td><td>65</td><td>240</td><td>40</td><td>3</td><td>_BrowseProperty</td><td>##IDS__DatabaseFolder_DatabaseDir##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DatabaseFolder</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>DestinationFolder</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>ChangeFolder</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>ChangeFolder</td><td>PushButton</td><td>301</td><td>65</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__DestinationFolder_Change##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>DestFolder</td><td>Icon</td><td>21</td><td>52</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary12</td></row>
		<row><td>DestinationFolder</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__DestinationFolder_ChangeFolder##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__DestinationFolder_DestinationFolder##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>LocLabel</td><td>Text</td><td>57</td><td>52</td><td>290</td><td>10</td><td>131075</td><td/><td>##IDS__DestinationFolder_InstallTo##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>Location</td><td>Text</td><td>57</td><td>65</td><td>240</td><td>40</td><td>3</td><td>_BrowseProperty</td><td>##IDS_INSTALLDIR##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DestinationFolder</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>DiskSpaceRequirements</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>DlgDesc</td><td>Text</td><td>17</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsFeatureDetailsDlg_SpaceRequired##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>DlgText</td><td>Text</td><td>10</td><td>185</td><td>358</td><td>41</td><td>3</td><td/><td>##IDS__IsFeatureDetailsDlg_VolumesTooSmall##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>DlgTitle</td><td>Text</td><td>9</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsFeatureDetailsDlg_DiskSpaceRequirements##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>List</td><td>VolumeCostList</td><td>8</td><td>55</td><td>358</td><td>125</td><td>393223</td><td/><td>##IDS__IsFeatureDetailsDlg_Numbers##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>DiskSpaceRequirements</td><td>OK</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsFeatureDetailsDlg_OK##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>FilesInUse</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsFilesInUse_FilesInUseMessage##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>DlgText</td><td>Text</td><td>21</td><td>51</td><td>348</td><td>33</td><td>3</td><td/><td>##IDS__IsFilesInUse_ApplicationsUsingFiles##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsFilesInUse_FilesInUse##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>Exit</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsFilesInUse_Exit##</td><td>List</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>Ignore</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsFilesInUse_Ignore##</td><td>Exit</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>List</td><td>ListBox</td><td>21</td><td>87</td><td>331</td><td>135</td><td>7</td><td>FileInUseProcess</td><td/><td>Retry</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>FilesInUse</td><td>Retry</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsFilesInUse_Retry##</td><td>Ignore</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>InstallChangeFolder</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>ComboText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>Combo</td><td>DirectoryCombo</td><td>21</td><td>64</td><td>277</td><td>80</td><td>4128779</td><td>_BrowseProperty</td><td>##IDS__IsBrowseFolderDlg_4##</td><td>Up</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>ComboText</td><td>Text</td><td>21</td><td>50</td><td>99</td><td>14</td><td>3</td><td/><td>##IDS__IsBrowseFolderDlg_LookIn##</td><td>Combo</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsBrowseFolderDlg_BrowseDestFolder##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsBrowseFolderDlg_ChangeCurrentFolder##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>List</td><td>DirectoryList</td><td>21</td><td>90</td><td>332</td><td>97</td><td>15</td><td>_BrowseProperty</td><td>##IDS__IsBrowseFolderDlg_8##</td><td>TailText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>NewFolder</td><td>PushButton</td><td>335</td><td>66</td><td>19</td><td>19</td><td>3670019</td><td/><td/><td>List</td><td>##IDS__IsBrowseFolderDlg_CreateFolder##</td><td>0</td><td/><td/><td>NewBinary2</td></row>
		<row><td>InstallChangeFolder</td><td>OK</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsBrowseFolderDlg_OK##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>Tail</td><td>PathEdit</td><td>21</td><td>207</td><td>332</td><td>17</td><td>15</td><td>_BrowseProperty</td><td>##IDS__IsBrowseFolderDlg_11##</td><td>OK</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>TailText</td><td>Text</td><td>21</td><td>193</td><td>99</td><td>13</td><td>3</td><td/><td>##IDS__IsBrowseFolderDlg_FolderName##</td><td>Tail</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallChangeFolder</td><td>Up</td><td>PushButton</td><td>310</td><td>66</td><td>19</td><td>19</td><td>3670019</td><td/><td/><td>NewFolder</td><td>##IDS__IsBrowseFolderDlg_UpOneLevel##</td><td>0</td><td/><td/><td>NewBinary3</td></row>
		<row><td>InstallWelcome</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Copyright</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallWelcome</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallWelcome</td><td>Copyright</td><td>Text</td><td>135</td><td>144</td><td>228</td><td>73</td><td>65538</td><td/><td>##IDS__IsWelcomeDlg_WarningCopyright##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallWelcome</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallWelcome</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary19</td></row>
		<row><td>InstallWelcome</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallWelcome</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>196611</td><td/><td>##IDS__IsWelcomeDlg_WelcomeProductName##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>InstallWelcome</td><td>TextLine2</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>45</td><td>196611</td><td/><td>##IDS__IsWelcomeDlg_InstallProductName##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>Agree</td><td>RadioButtonGroup</td><td>8</td><td>190</td><td>291</td><td>40</td><td>3</td><td>AgreeToLicense</td><td/><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>LicenseAgreement</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>ISPrintButton</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsLicenseDlg_ReadLicenseAgreement##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsLicenseDlg_LicenseAgreement##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>ISPrintButton</td><td>PushButton</td><td>301</td><td>188</td><td>65</td><td>17</td><td>3</td><td/><td>##IDS_PRINT_BUTTON##</td><td>Agree</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>LicenseAgreement</td><td>Memo</td><td>ScrollableText</td><td>8</td><td>55</td><td>358</td><td>130</td><td>7</td><td/><td/><td/><td/><td>0</td><td/><td>C:\Projects\Kalitte.JDash\trunk\Documents\Standart License Agreement.rtf</td><td/></row>
		<row><td>LicenseAgreement</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>MaintenanceType</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>RadioGroup</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsMaintenanceDlg_MaitenanceOptions##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsMaintenanceDlg_ProgramMaintenance##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Ico1</td><td>Icon</td><td>35</td><td>75</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary6</td></row>
		<row><td>MaintenanceType</td><td>Ico2</td><td>Icon</td><td>35</td><td>135</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary7</td></row>
		<row><td>MaintenanceType</td><td>Ico3</td><td>Icon</td><td>35</td><td>195</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary8</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>RadioGroup</td><td>RadioButtonGroup</td><td>21</td><td>55</td><td>290</td><td>170</td><td>3</td><td>_IsMaintenance</td><td/><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Text1</td><td>Text</td><td>80</td><td>72</td><td>260</td><td>35</td><td>3</td><td/><td>##IDS__IsMaintenanceDlg_ChangeFeatures##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Text2</td><td>Text</td><td>80</td><td>135</td><td>260</td><td>35</td><td>3</td><td/><td>##IDS__IsMaintenanceDlg_RepairMessage##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceType</td><td>Text3</td><td>Text</td><td>80</td><td>192</td><td>260</td><td>35</td><td>131075</td><td/><td>##IDS__IsMaintenanceDlg_RemoveProductName##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceWelcome</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceWelcome</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceWelcome</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceWelcome</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary5</td></row>
		<row><td>MaintenanceWelcome</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceWelcome</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>196611</td><td/><td>##IDS__IsMaintenanceWelcome_WizardWelcome##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MaintenanceWelcome</td><td>TextLine2</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>50</td><td>196611</td><td/><td>##IDS__IsMaintenanceWelcome_MaintenanceOptionsDescription##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>MsiRMFilesInUse</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Restart</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsFilesInUse_FilesInUseMessage##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>DlgText</td><td>Text</td><td>21</td><td>51</td><td>348</td><td>14</td><td>3</td><td/><td>##IDS__IsMsiRMFilesInUse_ApplicationsUsingFiles##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsFilesInUse_FilesInUse##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>List</td><td>ListBox</td><td>21</td><td>66</td><td>331</td><td>130</td><td>3</td><td>FileInUseProcess</td><td/><td>OK</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>OK</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_OK##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>MsiRMFilesInUse</td><td>Restart</td><td>RadioButtonGroup</td><td>19</td><td>187</td><td>343</td><td>40</td><td>3</td><td>RestartManagerOption</td><td/><td>List</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>OutOfSpace</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsDiskSpaceDlg_DiskSpace##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>DlgText</td><td>Text</td><td>21</td><td>51</td><td>326</td><td>43</td><td>3</td><td/><td>##IDS__IsDiskSpaceDlg_HighlightedVolumes##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsDiskSpaceDlg_OutOfDiskSpace##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>List</td><td>VolumeCostList</td><td>21</td><td>95</td><td>332</td><td>120</td><td>393223</td><td/><td>##IDS__IsDiskSpaceDlg_Numbers##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>OutOfSpace</td><td>Resume</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsDiskSpaceDlg_OK##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>PatchWelcome</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>PatchWelcome</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>PatchWelcome</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>PatchWelcome</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary5</td></row>
		<row><td>PatchWelcome</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsPatchDlg_Update##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>PatchWelcome</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>196611</td><td/><td>##IDS__IsPatchDlg_WelcomePatchWizard##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>PatchWelcome</td><td>TextLine2</td><td>Text</td><td>135</td><td>54</td><td>228</td><td>45</td><td>196611</td><td/><td>##IDS__IsPatchDlg_PatchClickUpdate##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadmeInformation</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1048579</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadmeInformation</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>3</td><td/><td/><td>DlgTitle</td><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>ReadmeInformation</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>ReadmeInformation</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>ReadmeInformation</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>1048579</td><td/><td>##IDS__IsReadmeDlg_Cancel##</td><td>Readme</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadmeInformation</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>232</td><td>16</td><td>65539</td><td/><td>##IDS__IsReadmeDlg_PleaseReadInfo##</td><td>Back</td><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>ReadmeInformation</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>3</td><td/><td/><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>ReadmeInformation</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>193</td><td>13</td><td>65539</td><td/><td>##IDS__IsReadmeDlg_ReadMeInfo##</td><td>DlgDesc</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadmeInformation</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>1048579</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadmeInformation</td><td>Readme</td><td>ScrollableText</td><td>10</td><td>55</td><td>353</td><td>166</td><td>3</td><td/><td/><td>Banner</td><td/><td>0</td><td/><td>&lt;ISProductFolder&gt;\Redist\0409\Readme.rtf</td><td/></row>
		<row><td>ReadyToInstall</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>GroupBox1</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>ReadyToInstall</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>CompanyNameText</td><td>Text</td><td>38</td><td>198</td><td>211</td><td>9</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_Company##</td><td>SerialNumberText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>CurrentSettingsText</td><td>Text</td><td>19</td><td>80</td><td>81</td><td>10</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_CurrentSettings##</td><td>InstallNow</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsVerifyReadyDlg_WizardReady##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>ReadyToInstall</td><td>DlgText1</td><td>Text</td><td>21</td><td>54</td><td>330</td><td>24</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_BackOrCancel##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>DlgText2</td><td>Text</td><td>21</td><td>99</td><td>330</td><td>20</td><td>2</td><td/><td>##IDS__IsRegisterUserDlg_InstallFor##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65538</td><td/><td>##IDS__IsVerifyReadyDlg_ModifyReady##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>DlgTitle2</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65538</td><td/><td>##IDS__IsVerifyReadyDlg_ReadyRepair##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>DlgTitle3</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65538</td><td/><td>##IDS__IsVerifyReadyDlg_ReadyInstall##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>GroupBox1</td><td>Text</td><td>19</td><td>92</td><td>330</td><td>133</td><td>65541</td><td/><td/><td>SetupTypeText1</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>8388611</td><td/><td>##IDS__IsVerifyReadyDlg_Install##</td><td>InstallPerMachine</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>PushButton</td><td>63</td><td>123</td><td>248</td><td>17</td><td>8388610</td><td/><td>##IDS__IsRegisterUserDlg_Anyone##</td><td>InstallPerUser</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>PushButton</td><td>63</td><td>143</td><td>248</td><td>17</td><td>2</td><td/><td>##IDS__IsRegisterUserDlg_OnlyMe##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>SerialNumberText</td><td>Text</td><td>38</td><td>211</td><td>306</td><td>9</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_Serial##</td><td>CurrentSettingsText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>SetupTypeText1</td><td>Text</td><td>23</td><td>97</td><td>306</td><td>13</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_SetupType##</td><td>SetupTypeText2</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>SetupTypeText2</td><td>Text</td><td>37</td><td>114</td><td>306</td><td>14</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_SelectedSetupType##</td><td>TargetFolderText1</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>TargetFolderText1</td><td>Text</td><td>24</td><td>136</td><td>306</td><td>11</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_DestFolder##</td><td>TargetFolderText2</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>TargetFolderText2</td><td>Text</td><td>37</td><td>151</td><td>306</td><td>13</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_Installdir##</td><td>UserInformationText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>UserInformationText</td><td>Text</td><td>23</td><td>171</td><td>306</td><td>13</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_UserInfo##</td><td>UserNameText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToInstall</td><td>UserNameText</td><td>Text</td><td>38</td><td>184</td><td>306</td><td>9</td><td>3</td><td/><td>##IDS__IsVerifyReadyDlg_UserName##</td><td>CompanyNameText</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>RemoveNow</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>ReadyToRemove</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsVerifyRemoveAllDlg_ChoseRemoveProgram##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>DlgText</td><td>Text</td><td>21</td><td>51</td><td>326</td><td>24</td><td>131075</td><td/><td>##IDS__IsVerifyRemoveAllDlg_ClickRemove##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>DlgText1</td><td>Text</td><td>21</td><td>79</td><td>330</td><td>23</td><td>3</td><td/><td>##IDS__IsVerifyRemoveAllDlg_ClickBack##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>DlgText2</td><td>Text</td><td>21</td><td>102</td><td>330</td><td>24</td><td>3</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsVerifyRemoveAllDlg_RemoveProgram##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>ReadyToRemove</td><td>RemoveNow</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>8388611</td><td/><td>##IDS__IsVerifyRemoveAllDlg_Remove##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Finish</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>CheckShowMsiLog</td><td>CheckBox</td><td>151</td><td>172</td><td>10</td><td>9</td><td>2</td><td>ISSHOWMSILOG</td><td/><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>Finish</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsFatalError_Finish##</td><td>Image</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>FinishText1</td><td>Text</td><td>135</td><td>80</td><td>228</td><td>50</td><td>65539</td><td/><td>##IDS__IsFatalError_NotModified##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>FinishText2</td><td>Text</td><td>135</td><td>135</td><td>228</td><td>25</td><td>65539</td><td/><td>##IDS__IsFatalError_ClickFinish##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td>CheckShowMsiLog</td><td/><td>0</td><td/><td/><td>NewBinary5</td></row>
		<row><td>SetupCompleteError</td><td>RestContText1</td><td>Text</td><td>135</td><td>80</td><td>228</td><td>50</td><td>65539</td><td/><td>##IDS__IsFatalError_KeepOrRestore##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>RestContText2</td><td>Text</td><td>135</td><td>135</td><td>228</td><td>25</td><td>65539</td><td/><td>##IDS__IsFatalError_RestoreOrContinueLater##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>ShowMsiLogText</td><td>Text</td><td>164</td><td>172</td><td>198</td><td>10</td><td>65538</td><td/><td>##IDS__IsSetupComplete_ShowMsiLog##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>65539</td><td/><td>##IDS__IsFatalError_WizardCompleted##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteError</td><td>TextLine2</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>25</td><td>196611</td><td/><td>##IDS__IsFatalError_WizardInterrupted##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>OK</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_CANCEL##</td><td>Image</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>CheckBoxUpdates</td><td>CheckBox</td><td>135</td><td>164</td><td>10</td><td>9</td><td>2</td><td>ISCHECKFORPRODUCTUPDATES</td><td>CheckBox1</td><td>CheckShowMsiLog</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>CheckForUpdatesText</td><td>Text</td><td>152</td><td>162</td><td>190</td><td>30</td><td>65538</td><td/><td>##IDS__IsExitDialog_Update_YesCheckForUpdates##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>CheckLaunchProgram</td><td>CheckBox</td><td>151</td><td>114</td><td>10</td><td>9</td><td>2</td><td>LAUNCHPROGRAM</td><td/><td>CheckLaunchReadme</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>CheckLaunchReadme</td><td>CheckBox</td><td>151</td><td>148</td><td>10</td><td>9</td><td>2</td><td>LAUNCHREADME</td><td/><td>CheckBoxUpdates</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>CheckShowMsiLog</td><td>CheckBox</td><td>151</td><td>182</td><td>10</td><td>9</td><td>2</td><td>ISSHOWMSILOG</td><td/><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td>CheckLaunchProgram</td><td/><td>0</td><td/><td/><td>NewBinary21</td></row>
		<row><td>SetupCompleteSuccess</td><td>LaunchProgramText</td><td>Text</td><td>164</td><td>112</td><td>98</td><td>15</td><td>65538</td><td/><td>##IDS__IsExitDialog_LaunchProgram##</td><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>LaunchReadmeText</td><td>Text</td><td>164</td><td>148</td><td>120</td><td>13</td><td>65538</td><td/><td>##IDS__IsExitDialog_ShowReadMe##</td><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>OK</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsExitDialog_Finish##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>ShowMsiLogText</td><td>Text</td><td>164</td><td>182</td><td>198</td><td>10</td><td>65538</td><td/><td>##IDS__IsSetupComplete_ShowMsiLog##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>65539</td><td/><td>##IDS__IsExitDialog_WizardCompleted##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>TextLine2</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>45</td><td>196610</td><td/><td>##IDS__IsExitDialog_InstallSuccess##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>TextLine3</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>45</td><td>196610</td><td/><td>##IDS__IsExitDialog_UninstallSuccess##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>UpdateTextLine1</td><td>Text</td><td>135</td><td>30</td><td>228</td><td>45</td><td>196610</td><td/><td>##IDS__IsExitDialog_Update_SetupFinished##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>UpdateTextLine2</td><td>Text</td><td>135</td><td>80</td><td>228</td><td>45</td><td>196610</td><td/><td>##IDS__IsExitDialog_Update_PossibleUpdates##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupCompleteSuccess</td><td>UpdateTextLine3</td><td>Text</td><td>135</td><td>120</td><td>228</td><td>45</td><td>65538</td><td/><td>##IDS__IsExitDialog_Update_InternetConnection##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>A</td><td>PushButton</td><td>192</td><td>80</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsErrorDlg_Abort##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>C</td><td>PushButton</td><td>192</td><td>80</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL2##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>ErrorIcon</td><td>Icon</td><td>15</td><td>15</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary4</td></row>
		<row><td>SetupError</td><td>ErrorText</td><td>Text</td><td>50</td><td>15</td><td>200</td><td>50</td><td>131075</td><td/><td>##IDS__IsErrorDlg_ErrorText##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>I</td><td>PushButton</td><td>192</td><td>80</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsErrorDlg_Ignore##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>N</td><td>PushButton</td><td>192</td><td>80</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsErrorDlg_NO##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>O</td><td>PushButton</td><td>192</td><td>80</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsErrorDlg_OK##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>R</td><td>PushButton</td><td>192</td><td>80</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsErrorDlg_Retry##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupError</td><td>Y</td><td>PushButton</td><td>192</td><td>80</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsErrorDlg_Yes##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>ActionData</td><td>Text</td><td>135</td><td>125</td><td>228</td><td>12</td><td>65539</td><td/><td>##IDS__IsInitDlg_1##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>ActionText</td><td>Text</td><td>135</td><td>109</td><td>220</td><td>36</td><td>65539</td><td/><td>##IDS__IsInitDlg_2##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary5</td></row>
		<row><td>SetupInitialization</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_NEXT##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>196611</td><td/><td>##IDS__IsInitDlg_WelcomeWizard##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInitialization</td><td>TextLine2</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>30</td><td>196611</td><td/><td>##IDS__IsInitDlg_PreparingWizard##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Finish</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_CANCEL##</td><td>Image</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>CheckShowMsiLog</td><td>CheckBox</td><td>151</td><td>172</td><td>10</td><td>9</td><td>2</td><td>ISSHOWMSILOG</td><td/><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>Finish</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS__IsUserExit_Finish##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>FinishText1</td><td>Text</td><td>135</td><td>80</td><td>228</td><td>50</td><td>65539</td><td/><td>##IDS__IsUserExit_NotModified##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>FinishText2</td><td>Text</td><td>135</td><td>135</td><td>228</td><td>25</td><td>65539</td><td/><td>##IDS__IsUserExit_ClickFinish##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td>CheckShowMsiLog</td><td/><td>0</td><td/><td/><td>NewBinary5</td></row>
		<row><td>SetupInterrupted</td><td>RestContText1</td><td>Text</td><td>135</td><td>80</td><td>228</td><td>50</td><td>65539</td><td/><td>##IDS__IsUserExit_KeepOrRestore##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>RestContText2</td><td>Text</td><td>135</td><td>135</td><td>228</td><td>25</td><td>65539</td><td/><td>##IDS__IsUserExit_RestoreOrContinue##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>ShowMsiLogText</td><td>Text</td><td>164</td><td>172</td><td>198</td><td>10</td><td>65538</td><td/><td>##IDS__IsSetupComplete_ShowMsiLog##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>65539</td><td/><td>##IDS__IsUserExit_WizardCompleted##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupInterrupted</td><td>TextLine2</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>25</td><td>196611</td><td/><td>##IDS__IsUserExit_WizardInterrupted##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>ProgressBar</td><td>59</td><td>113</td><td>275</td><td>12</td><td>65537</td><td/><td>##IDS__IsProgressDlg_ProgressDone##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>ActionText</td><td>Text</td><td>59</td><td>100</td><td>275</td><td>12</td><td>3</td><td/><td>##IDS__IsProgressDlg_2##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary20</td></row>
		<row><td>SetupProgress</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65538</td><td/><td>##IDS__IsProgressDlg_UninstallingFeatures2##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>DlgDesc2</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65538</td><td/><td>##IDS__IsProgressDlg_UninstallingFeatures##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>DlgText</td><td>Text</td><td>59</td><td>51</td><td>275</td><td>30</td><td>196610</td><td/><td>##IDS__IsProgressDlg_WaitUninstall2##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>DlgText2</td><td>Text</td><td>59</td><td>51</td><td>275</td><td>30</td><td>196610</td><td/><td>##IDS__IsProgressDlg_WaitUninstall##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>196610</td><td/><td>##IDS__IsProgressDlg_InstallingProductName##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>DlgTitle2</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>196610</td><td/><td>##IDS__IsProgressDlg_Uninstalling##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>LbSec</td><td>Text</td><td>192</td><td>139</td><td>32</td><td>12</td><td>2</td><td/><td>##IDS__IsProgressDlg_SecHidden##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>LbStatus</td><td>Text</td><td>59</td><td>85</td><td>70</td><td>12</td><td>3</td><td/><td>##IDS__IsProgressDlg_Status##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>SetupIcon</td><td>Icon</td><td>21</td><td>51</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary9</td></row>
		<row><td>SetupProgress</td><td>ShowTime</td><td>Text</td><td>170</td><td>139</td><td>17</td><td>12</td><td>2</td><td/><td>##IDS__IsProgressDlg_Hidden##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupProgress</td><td>TextTime</td><td>Text</td><td>59</td><td>139</td><td>110</td><td>12</td><td>2</td><td/><td>##IDS__IsProgressDlg_HiddenTimeRemaining##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupResume</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupResume</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupResume</td><td>DlgLine</td><td>Line</td><td>0</td><td>234</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupResume</td><td>Image</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>234</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary5</td></row>
		<row><td>SetupResume</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupResume</td><td>PreselectedText</td><td>Text</td><td>135</td><td>55</td><td>228</td><td>45</td><td>196611</td><td/><td>##IDS__IsResumeDlg_WizardResume##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupResume</td><td>ResumeText</td><td>Text</td><td>135</td><td>46</td><td>228</td><td>45</td><td>196611</td><td/><td>##IDS__IsResumeDlg_ResumeSuspended##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupResume</td><td>TextLine1</td><td>Text</td><td>135</td><td>8</td><td>225</td><td>45</td><td>196611</td><td/><td>##IDS__IsResumeDlg_Resuming##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>Banner</td><td>Bitmap</td><td>0</td><td>0</td><td>374</td><td>44</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary1</td></row>
		<row><td>SetupType</td><td>BannerLine</td><td>Line</td><td>0</td><td>44</td><td>374</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>RadioGroup</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>CompText</td><td>Text</td><td>80</td><td>80</td><td>246</td><td>30</td><td>3</td><td/><td>##IDS__IsSetupTypeMinDlg_AllFeatures##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>CompleteIco</td><td>Icon</td><td>34</td><td>80</td><td>24</td><td>24</td><td>5242881</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary10</td></row>
		<row><td>SetupType</td><td>CustText</td><td>Text</td><td>80</td><td>171</td><td>246</td><td>30</td><td>2</td><td/><td>##IDS__IsSetupTypeMinDlg_ChooseFeatures##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>CustomIco</td><td>Icon</td><td>34</td><td>171</td><td>24</td><td>24</td><td>5242880</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary11</td></row>
		<row><td>SetupType</td><td>DlgDesc</td><td>Text</td><td>21</td><td>23</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsSetupTypeMinDlg_ChooseSetupType##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>DlgText</td><td>Text</td><td>22</td><td>49</td><td>326</td><td>10</td><td>3</td><td/><td>##IDS__IsSetupTypeMinDlg_SelectSetupType##</td><td/><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>SetupType</td><td>DlgTitle</td><td>Text</td><td>13</td><td>6</td><td>292</td><td>25</td><td>65539</td><td/><td>##IDS__IsSetupTypeMinDlg_SetupType##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>MinIco</td><td>Icon</td><td>34</td><td>125</td><td>24</td><td>24</td><td>5242880</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary11</td></row>
		<row><td>SetupType</td><td>MinText</td><td>Text</td><td>80</td><td>125</td><td>246</td><td>30</td><td>2</td><td/><td>##IDS__IsSetupTypeMinDlg_MinimumFeatures##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SetupType</td><td>RadioGroup</td><td>RadioButtonGroup</td><td>20</td><td>59</td><td>264</td><td>139</td><td>1048579</td><td>_IsSetupTypeMin</td><td/><td>Back</td><td/><td>0</td><td>0</td><td/><td/></row>
		<row><td>SplashBitmap</td><td>Back</td><td>PushButton</td><td>164</td><td>243</td><td>66</td><td>17</td><td>1</td><td/><td>##IDS_BACK##</td><td>Next</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SplashBitmap</td><td>Branding1</td><td>Text</td><td>4</td><td>229</td><td>50</td><td>13</td><td>3</td><td/><td>##IDS_INSTALLSHIELD_FORMATTED##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SplashBitmap</td><td>Branding2</td><td>Text</td><td>3</td><td>228</td><td>50</td><td>13</td><td>65537</td><td/><td>##IDS_INSTALLSHIELD##</td><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SplashBitmap</td><td>Cancel</td><td>PushButton</td><td>301</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_CANCEL##</td><td>Back</td><td/><td>0</td><td/><td/><td/></row>
		<row><td>SplashBitmap</td><td>DlgLine</td><td>Line</td><td>48</td><td>234</td><td>326</td><td>0</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td/></row>
		<row><td>SplashBitmap</td><td>Image</td><td>Bitmap</td><td>13</td><td>12</td><td>349</td><td>211</td><td>1</td><td/><td/><td/><td/><td>0</td><td/><td/><td>NewBinary5</td></row>
		<row><td>SplashBitmap</td><td>Next</td><td>PushButton</td><td>230</td><td>243</td><td>66</td><td>17</td><td>3</td><td/><td>##IDS_NEXT##</td><td>Cancel</td><td/><td>0</td><td/><td/><td/></row>
	</table>

	<table name="ControlCondition">
		<col key="yes" def="s72">Dialog_</col>
		<col key="yes" def="s50">Control_</col>
		<col key="yes" def="s50">Action</col>
		<col key="yes" def="s255">Condition</col>
		<row><td>CustomSetup</td><td>ChangeFolder</td><td>Hide</td><td>Installed</td></row>
		<row><td>CustomSetup</td><td>Details</td><td>Hide</td><td>Installed</td></row>
		<row><td>CustomSetup</td><td>InstallLabel</td><td>Hide</td><td>Installed</td></row>
		<row><td>CustomerInformation</td><td>DlgRadioGroupText</td><td>Hide</td><td>NOT Privileged</td></row>
		<row><td>CustomerInformation</td><td>DlgRadioGroupText</td><td>Hide</td><td>ProductState &gt; 0</td></row>
		<row><td>CustomerInformation</td><td>DlgRadioGroupText</td><td>Hide</td><td>Version9X</td></row>
		<row><td>CustomerInformation</td><td>DlgRadioGroupText</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>CustomerInformation</td><td>RadioGroup</td><td>Hide</td><td>NOT Privileged</td></row>
		<row><td>CustomerInformation</td><td>RadioGroup</td><td>Hide</td><td>ProductState &gt; 0</td></row>
		<row><td>CustomerInformation</td><td>RadioGroup</td><td>Hide</td><td>Version9X</td></row>
		<row><td>CustomerInformation</td><td>RadioGroup</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>CustomerInformation</td><td>SerialLabel</td><td>Show</td><td>SERIALNUMSHOW</td></row>
		<row><td>CustomerInformation</td><td>SerialNumber</td><td>Show</td><td>SERIALNUMSHOW</td></row>
		<row><td>InstallWelcome</td><td>Copyright</td><td>Hide</td><td>SHOWCOPYRIGHT="No"</td></row>
		<row><td>InstallWelcome</td><td>Copyright</td><td>Show</td><td>SHOWCOPYRIGHT="Yes"</td></row>
		<row><td>LicenseAgreement</td><td>Next</td><td>Disable</td><td>AgreeToLicense &lt;&gt; "Yes"</td></row>
		<row><td>LicenseAgreement</td><td>Next</td><td>Enable</td><td>AgreeToLicense = "Yes"</td></row>
		<row><td>ReadyToInstall</td><td>CompanyNameText</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>CurrentSettingsText</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>DlgText2</td><td>Hide</td><td>VersionNT &lt; "601" OR NOT ISSupportPerUser OR Installed</td></row>
		<row><td>ReadyToInstall</td><td>DlgText2</td><td>Show</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>DlgTitle</td><td>Show</td><td>ProgressType0="Modify"</td></row>
		<row><td>ReadyToInstall</td><td>DlgTitle2</td><td>Show</td><td>ProgressType0="Repair"</td></row>
		<row><td>ReadyToInstall</td><td>DlgTitle3</td><td>Show</td><td>ProgressType0="install"</td></row>
		<row><td>ReadyToInstall</td><td>GroupBox1</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>Disable</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>Enable</td><td>VersionNT &lt; "601" OR NOT ISSupportPerUser OR Installed</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>Hide</td><td>VersionNT &lt; "601" OR NOT ISSupportPerUser OR Installed</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>Show</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>Hide</td><td>VersionNT &lt; "601" OR NOT ISSupportPerUser OR Installed</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>Show</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>SerialNumberText</td><td>Hide</td><td>NOT SERIALNUMSHOW</td></row>
		<row><td>ReadyToInstall</td><td>SerialNumberText</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>SetupTypeText1</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>SetupTypeText2</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>TargetFolderText1</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>TargetFolderText2</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>UserInformationText</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>ReadyToInstall</td><td>UserNameText</td><td>Hide</td><td>VersionNT &gt;= "601" AND ISSupportPerUser AND NOT Installed</td></row>
		<row><td>SetupCompleteError</td><td>Back</td><td>Default</td><td>UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>Back</td><td>Disable</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>Back</td><td>Enable</td><td>UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>Cancel</td><td>Disable</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>Cancel</td><td>Enable</td><td>UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>CheckShowMsiLog</td><td>Show</td><td>MsiLogFileLocation</td></row>
		<row><td>SetupCompleteError</td><td>Finish</td><td>Default</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>FinishText1</td><td>Hide</td><td>UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>FinishText1</td><td>Show</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>FinishText2</td><td>Hide</td><td>UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>FinishText2</td><td>Show</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>RestContText1</td><td>Hide</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>RestContText1</td><td>Show</td><td>UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>RestContText2</td><td>Hide</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>RestContText2</td><td>Show</td><td>UpdateStarted</td></row>
		<row><td>SetupCompleteError</td><td>ShowMsiLogText</td><td>Show</td><td>MsiLogFileLocation</td></row>
		<row><td>SetupCompleteSuccess</td><td>CheckBoxUpdates</td><td>Show</td><td>ISENABLEDWUSFINISHDIALOG And NOT Installed And ACTION="INSTALL"</td></row>
		<row><td>SetupCompleteSuccess</td><td>CheckForUpdatesText</td><td>Show</td><td>ISENABLEDWUSFINISHDIALOG And NOT Installed And ACTION="INSTALL"</td></row>
		<row><td>SetupCompleteSuccess</td><td>CheckLaunchProgram</td><td>Show</td><td>SHOWLAUNCHPROGRAM="-1" And PROGRAMFILETOLAUNCHATEND &lt;&gt; "" And NOT Installed And NOT ISENABLEDWUSFINISHDIALOG</td></row>
		<row><td>SetupCompleteSuccess</td><td>CheckLaunchReadme</td><td>Show</td><td>SHOWLAUNCHREADME="-1"  And READMEFILETOLAUNCHATEND &lt;&gt; "" And NOT Installed And NOT ISENABLEDWUSFINISHDIALOG</td></row>
		<row><td>SetupCompleteSuccess</td><td>CheckShowMsiLog</td><td>Show</td><td>MsiLogFileLocation And NOT ISENABLEDWUSFINISHDIALOG</td></row>
		<row><td>SetupCompleteSuccess</td><td>LaunchProgramText</td><td>Show</td><td>SHOWLAUNCHPROGRAM="-1" And PROGRAMFILETOLAUNCHATEND &lt;&gt; "" And NOT Installed And NOT ISENABLEDWUSFINISHDIALOG</td></row>
		<row><td>SetupCompleteSuccess</td><td>LaunchReadmeText</td><td>Show</td><td>SHOWLAUNCHREADME="-1"  And READMEFILETOLAUNCHATEND &lt;&gt; "" And NOT Installed And NOT ISENABLEDWUSFINISHDIALOG</td></row>
		<row><td>SetupCompleteSuccess</td><td>ShowMsiLogText</td><td>Show</td><td>MsiLogFileLocation And NOT ISENABLEDWUSFINISHDIALOG</td></row>
		<row><td>SetupCompleteSuccess</td><td>TextLine2</td><td>Show</td><td>ProgressType2="installed" And ((ACTION&lt;&gt;"INSTALL") OR (NOT ISENABLEDWUSFINISHDIALOG) OR (ISENABLEDWUSFINISHDIALOG And Installed))</td></row>
		<row><td>SetupCompleteSuccess</td><td>TextLine3</td><td>Show</td><td>ProgressType2="uninstalled" And ((ACTION&lt;&gt;"INSTALL") OR (NOT ISENABLEDWUSFINISHDIALOG) OR (ISENABLEDWUSFINISHDIALOG And Installed))</td></row>
		<row><td>SetupCompleteSuccess</td><td>UpdateTextLine1</td><td>Show</td><td>ISENABLEDWUSFINISHDIALOG And NOT Installed And ACTION="INSTALL"</td></row>
		<row><td>SetupCompleteSuccess</td><td>UpdateTextLine2</td><td>Show</td><td>ISENABLEDWUSFINISHDIALOG And NOT Installed And ACTION="INSTALL"</td></row>
		<row><td>SetupCompleteSuccess</td><td>UpdateTextLine3</td><td>Show</td><td>ISENABLEDWUSFINISHDIALOG And NOT Installed And ACTION="INSTALL"</td></row>
		<row><td>SetupInterrupted</td><td>Back</td><td>Default</td><td>UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>Back</td><td>Disable</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>Back</td><td>Enable</td><td>UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>Cancel</td><td>Disable</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>Cancel</td><td>Enable</td><td>UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>CheckShowMsiLog</td><td>Show</td><td>MsiLogFileLocation</td></row>
		<row><td>SetupInterrupted</td><td>Finish</td><td>Default</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>FinishText1</td><td>Hide</td><td>UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>FinishText1</td><td>Show</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>FinishText2</td><td>Hide</td><td>UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>FinishText2</td><td>Show</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>RestContText1</td><td>Hide</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>RestContText1</td><td>Show</td><td>UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>RestContText2</td><td>Hide</td><td>NOT UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>RestContText2</td><td>Show</td><td>UpdateStarted</td></row>
		<row><td>SetupInterrupted</td><td>ShowMsiLogText</td><td>Show</td><td>MsiLogFileLocation</td></row>
		<row><td>SetupProgress</td><td>DlgDesc</td><td>Show</td><td>ProgressType2="installed"</td></row>
		<row><td>SetupProgress</td><td>DlgDesc2</td><td>Show</td><td>ProgressType2="uninstalled"</td></row>
		<row><td>SetupProgress</td><td>DlgText</td><td>Show</td><td>ProgressType3="installs"</td></row>
		<row><td>SetupProgress</td><td>DlgText2</td><td>Show</td><td>ProgressType3="uninstalls"</td></row>
		<row><td>SetupProgress</td><td>DlgTitle</td><td>Show</td><td>ProgressType1="Installing"</td></row>
		<row><td>SetupProgress</td><td>DlgTitle2</td><td>Show</td><td>ProgressType1="Uninstalling"</td></row>
		<row><td>SetupResume</td><td>PreselectedText</td><td>Hide</td><td>RESUME</td></row>
		<row><td>SetupResume</td><td>PreselectedText</td><td>Show</td><td>NOT RESUME</td></row>
		<row><td>SetupResume</td><td>ResumeText</td><td>Hide</td><td>NOT RESUME</td></row>
		<row><td>SetupResume</td><td>ResumeText</td><td>Show</td><td>RESUME</td></row>
	</table>

	<table name="ControlEvent">
		<col key="yes" def="s72">Dialog_</col>
		<col key="yes" def="s50">Control_</col>
		<col key="yes" def="s50">Event</col>
		<col key="yes" def="s255">Argument</col>
		<col key="yes" def="S255">Condition</col>
		<col def="I2">Ordering</col>
		<row><td>AdminChangeFolder</td><td>Cancel</td><td>EndDialog</td><td>Return</td><td>1</td><td>2</td></row>
		<row><td>AdminChangeFolder</td><td>Cancel</td><td>Reset</td><td>0</td><td>1</td><td>1</td></row>
		<row><td>AdminChangeFolder</td><td>NewFolder</td><td>DirectoryListNew</td><td>0</td><td>1</td><td>0</td></row>
		<row><td>AdminChangeFolder</td><td>OK</td><td>EndDialog</td><td>Return</td><td>1</td><td>0</td></row>
		<row><td>AdminChangeFolder</td><td>OK</td><td>SetTargetPath</td><td>TARGETDIR</td><td>1</td><td>1</td></row>
		<row><td>AdminChangeFolder</td><td>Up</td><td>DirectoryListUp</td><td>0</td><td>1</td><td>0</td></row>
		<row><td>AdminNetworkLocation</td><td>Back</td><td>NewDialog</td><td>AdminWelcome</td><td>1</td><td>0</td></row>
		<row><td>AdminNetworkLocation</td><td>Browse</td><td>SpawnDialog</td><td>AdminChangeFolder</td><td>1</td><td>0</td></row>
		<row><td>AdminNetworkLocation</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>AdminNetworkLocation</td><td>InstallNow</td><td>EndDialog</td><td>Return</td><td>OutOfNoRbDiskSpace &lt;&gt; 1</td><td>3</td></row>
		<row><td>AdminNetworkLocation</td><td>InstallNow</td><td>NewDialog</td><td>OutOfSpace</td><td>OutOfNoRbDiskSpace = 1</td><td>2</td></row>
		<row><td>AdminNetworkLocation</td><td>InstallNow</td><td>SetTargetPath</td><td>TARGETDIR</td><td>1</td><td>1</td></row>
		<row><td>AdminWelcome</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>AdminWelcome</td><td>Next</td><td>NewDialog</td><td>AdminNetworkLocation</td><td>1</td><td>0</td></row>
		<row><td>CancelSetup</td><td>No</td><td>EndDialog</td><td>Return</td><td>1</td><td>0</td></row>
		<row><td>CancelSetup</td><td>Yes</td><td>DoAction</td><td>CleanUp</td><td>ISSCRIPTRUNNING="1"</td><td>1</td></row>
		<row><td>CancelSetup</td><td>Yes</td><td>EndDialog</td><td>Exit</td><td>1</td><td>2</td></row>
		<row><td>CustomSetup</td><td>Back</td><td>NewDialog</td><td>CustomerInformation</td><td>NOT Installed</td><td>0</td></row>
		<row><td>CustomSetup</td><td>Back</td><td>NewDialog</td><td>MaintenanceType</td><td>Installed</td><td>0</td></row>
		<row><td>CustomSetup</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>CustomSetup</td><td>ChangeFolder</td><td>SelectionBrowse</td><td>InstallChangeFolder</td><td>1</td><td>0</td></row>
		<row><td>CustomSetup</td><td>Details</td><td>SelectionBrowse</td><td>DiskSpaceRequirements</td><td>1</td><td>1</td></row>
		<row><td>CustomSetup</td><td>Help</td><td>SpawnDialog</td><td>CustomSetupTips</td><td>1</td><td>1</td></row>
		<row><td>CustomSetup</td><td>Next</td><td>NewDialog</td><td>OutOfSpace</td><td>OutOfNoRbDiskSpace = 1</td><td>0</td></row>
		<row><td>CustomSetup</td><td>Next</td><td>NewDialog</td><td>ReadyToInstall</td><td>OutOfNoRbDiskSpace &lt;&gt; 1</td><td>0</td></row>
		<row><td>CustomSetup</td><td>Next</td><td>[_IsSetupTypeMin]</td><td>Custom</td><td>1</td><td>0</td></row>
		<row><td>CustomSetupTips</td><td>OK</td><td>EndDialog</td><td>Return</td><td>1</td><td>1</td></row>
		<row><td>CustomerInformation</td><td>Back</td><td>NewDialog</td><td>LicenseAgreement</td><td>1</td><td>1</td></row>
		<row><td>CustomerInformation</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>CustomerInformation</td><td>Next</td><td>EndDialog</td><td>Exit</td><td>(SERIALNUMVALRETRYLIMIT) And (SERIALNUMVALRETRYLIMIT&lt;0) And (SERIALNUMVALRETURN&lt;&gt;SERIALNUMVALSUCCESSRETVAL)</td><td>2</td></row>
		<row><td>CustomerInformation</td><td>Next</td><td>NewDialog</td><td>DestinationFolder</td><td>(Not SERIALNUMVALRETURN) OR (SERIALNUMVALRETURN=SERIALNUMVALSUCCESSRETVAL)</td><td>3</td></row>
		<row><td>CustomerInformation</td><td>Next</td><td>[ALLUSERS]</td><td>1</td><td>ApplicationUsers = "AllUsers" And Privileged</td><td>1</td></row>
		<row><td>CustomerInformation</td><td>Next</td><td>[ALLUSERS]</td><td>{}</td><td>ApplicationUsers = "OnlyCurrentUser" And Privileged</td><td>2</td></row>
		<row><td>DatabaseFolder</td><td>Back</td><td>NewDialog</td><td>CustomerInformation</td><td>1</td><td>1</td></row>
		<row><td>DatabaseFolder</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>1</td></row>
		<row><td>DatabaseFolder</td><td>ChangeFolder</td><td>SpawnDialog</td><td>InstallChangeFolder</td><td>1</td><td>1</td></row>
		<row><td>DatabaseFolder</td><td>ChangeFolder</td><td>[_BrowseProperty]</td><td>DATABASEDIR</td><td>1</td><td>2</td></row>
		<row><td>DatabaseFolder</td><td>Next</td><td>NewDialog</td><td>SetupType</td><td>1</td><td>1</td></row>
		<row><td>DestinationFolder</td><td>Back</td><td>NewDialog</td><td>LicenseAgreement</td><td>NOT Installed</td><td>0</td></row>
		<row><td>DestinationFolder</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>1</td></row>
		<row><td>DestinationFolder</td><td>ChangeFolder</td><td>SpawnDialog</td><td>InstallChangeFolder</td><td>1</td><td>1</td></row>
		<row><td>DestinationFolder</td><td>ChangeFolder</td><td>[_BrowseProperty]</td><td>INSTALLDIR</td><td>1</td><td>2</td></row>
		<row><td>DestinationFolder</td><td>Next</td><td>NewDialog</td><td>ReadyToInstall</td><td>1</td><td>0</td></row>
		<row><td>DiskSpaceRequirements</td><td>OK</td><td>EndDialog</td><td>Return</td><td>1</td><td>0</td></row>
		<row><td>FilesInUse</td><td>Exit</td><td>EndDialog</td><td>Exit</td><td>1</td><td>0</td></row>
		<row><td>FilesInUse</td><td>Ignore</td><td>EndDialog</td><td>Ignore</td><td>1</td><td>0</td></row>
		<row><td>FilesInUse</td><td>Retry</td><td>EndDialog</td><td>Retry</td><td>1</td><td>0</td></row>
		<row><td>InstallChangeFolder</td><td>Cancel</td><td>EndDialog</td><td>Return</td><td>1</td><td>2</td></row>
		<row><td>InstallChangeFolder</td><td>Cancel</td><td>Reset</td><td>0</td><td>1</td><td>1</td></row>
		<row><td>InstallChangeFolder</td><td>NewFolder</td><td>DirectoryListNew</td><td>0</td><td>1</td><td>0</td></row>
		<row><td>InstallChangeFolder</td><td>OK</td><td>EndDialog</td><td>Return</td><td>1</td><td>3</td></row>
		<row><td>InstallChangeFolder</td><td>OK</td><td>SetTargetPath</td><td>[_BrowseProperty]</td><td>1</td><td>2</td></row>
		<row><td>InstallChangeFolder</td><td>Up</td><td>DirectoryListUp</td><td>0</td><td>1</td><td>0</td></row>
		<row><td>InstallWelcome</td><td>Back</td><td>NewDialog</td><td>SplashBitmap</td><td>Display_IsBitmapDlg</td><td>0</td></row>
		<row><td>InstallWelcome</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>InstallWelcome</td><td>Next</td><td>NewDialog</td><td>LicenseAgreement</td><td>1</td><td>0</td></row>
		<row><td>LicenseAgreement</td><td>Back</td><td>NewDialog</td><td>InstallWelcome</td><td>1</td><td>0</td></row>
		<row><td>LicenseAgreement</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>LicenseAgreement</td><td>ISPrintButton</td><td>DoAction</td><td>ISPrint</td><td>1</td><td>0</td></row>
		<row><td>LicenseAgreement</td><td>Next</td><td>NewDialog</td><td>DestinationFolder</td><td>AgreeToLicense = "Yes"</td><td>0</td></row>
		<row><td>MaintenanceType</td><td>Back</td><td>NewDialog</td><td>MaintenanceWelcome</td><td>1</td><td>0</td></row>
		<row><td>MaintenanceType</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>NewDialog</td><td>CustomSetup</td><td>_IsMaintenance = "Change"</td><td>12</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>NewDialog</td><td>ReadyToInstall</td><td>_IsMaintenance = "Reinstall"</td><td>13</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>NewDialog</td><td>ReadyToRemove</td><td>_IsMaintenance = "Remove"</td><td>11</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>Reinstall</td><td>ALL</td><td>_IsMaintenance = "Reinstall"</td><td>10</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>ReinstallMode</td><td>[ReinstallModeText]</td><td>_IsMaintenance = "Reinstall"</td><td>9</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType0]</td><td>Modify</td><td>_IsMaintenance = "Change"</td><td>2</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType0]</td><td>Repair</td><td>_IsMaintenance = "Reinstall"</td><td>1</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType1]</td><td>Modifying</td><td>_IsMaintenance = "Change"</td><td>3</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType1]</td><td>Repairing</td><td>_IsMaintenance = "Reinstall"</td><td>4</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType2]</td><td>modified</td><td>_IsMaintenance = "Change"</td><td>6</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType2]</td><td>repairs</td><td>_IsMaintenance = "Reinstall"</td><td>5</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType3]</td><td>modifies</td><td>_IsMaintenance = "Change"</td><td>7</td></row>
		<row><td>MaintenanceType</td><td>Next</td><td>[ProgressType3]</td><td>repairs</td><td>_IsMaintenance = "Reinstall"</td><td>8</td></row>
		<row><td>MaintenanceWelcome</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>MaintenanceWelcome</td><td>Next</td><td>NewDialog</td><td>MaintenanceType</td><td>1</td><td>0</td></row>
		<row><td>MsiRMFilesInUse</td><td>Cancel</td><td>EndDialog</td><td>Exit</td><td>1</td><td>1</td></row>
		<row><td>MsiRMFilesInUse</td><td>OK</td><td>EndDialog</td><td>Return</td><td>1</td><td>1</td></row>
		<row><td>MsiRMFilesInUse</td><td>OK</td><td>RMShutdownAndRestart</td><td>0</td><td>RestartManagerOption="CloseRestart"</td><td>2</td></row>
		<row><td>OutOfSpace</td><td>Resume</td><td>NewDialog</td><td>AdminNetworkLocation</td><td>ACTION = "ADMIN"</td><td>0</td></row>
		<row><td>OutOfSpace</td><td>Resume</td><td>NewDialog</td><td>DestinationFolder</td><td>ACTION &lt;&gt; "ADMIN"</td><td>0</td></row>
		<row><td>PatchWelcome</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>1</td></row>
		<row><td>PatchWelcome</td><td>Next</td><td>EndDialog</td><td>Return</td><td>1</td><td>3</td></row>
		<row><td>PatchWelcome</td><td>Next</td><td>Reinstall</td><td>ALL</td><td>PATCH And REINSTALL=""</td><td>1</td></row>
		<row><td>PatchWelcome</td><td>Next</td><td>ReinstallMode</td><td>omus</td><td>PATCH And REINSTALLMODE=""</td><td>2</td></row>
		<row><td>ReadmeInformation</td><td>Back</td><td>NewDialog</td><td>LicenseAgreement</td><td>1</td><td>1</td></row>
		<row><td>ReadmeInformation</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>1</td></row>
		<row><td>ReadmeInformation</td><td>Next</td><td>NewDialog</td><td>CustomerInformation</td><td>1</td><td>1</td></row>
		<row><td>ReadyToInstall</td><td>Back</td><td>NewDialog</td><td>CustomSetup</td><td>Installed OR _IsSetupTypeMin = "Custom"</td><td>2</td></row>
		<row><td>ReadyToInstall</td><td>Back</td><td>NewDialog</td><td>DestinationFolder</td><td>NOT Installed</td><td>1</td></row>
		<row><td>ReadyToInstall</td><td>Back</td><td>NewDialog</td><td>MaintenanceType</td><td>Installed AND _IsMaintenance = "Reinstall"</td><td>3</td></row>
		<row><td>ReadyToInstall</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>EndDialog</td><td>Return</td><td>OutOfNoRbDiskSpace &lt;&gt; 1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>NewDialog</td><td>OutOfSpace</td><td>OutOfNoRbDiskSpace = 1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>[ProgressType1]</td><td>Installing</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>[ProgressType2]</td><td>installed</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallNow</td><td>[ProgressType3]</td><td>installs</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>EndDialog</td><td>Return</td><td>OutOfNoRbDiskSpace &lt;&gt; 1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>NewDialog</td><td>OutOfSpace</td><td>OutOfNoRbDiskSpace = 1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>[ALLUSERS]</td><td>1</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>[MSIINSTALLPERUSER]</td><td>{}</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>[ProgressType1]</td><td>Installing</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>[ProgressType2]</td><td>installed</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerMachine</td><td>[ProgressType3]</td><td>installs</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>EndDialog</td><td>Return</td><td>OutOfNoRbDiskSpace &lt;&gt; 1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>NewDialog</td><td>OutOfSpace</td><td>OutOfNoRbDiskSpace = 1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>[ALLUSERS]</td><td>2</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>[MSIINSTALLPERUSER]</td><td>1</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>[ProgressType1]</td><td>Installing</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>[ProgressType2]</td><td>installed</td><td>1</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>InstallPerUser</td><td>[ProgressType3]</td><td>installs</td><td>1</td><td>0</td></row>
		<row><td>ReadyToRemove</td><td>Back</td><td>NewDialog</td><td>MaintenanceType</td><td>1</td><td>0</td></row>
		<row><td>ReadyToRemove</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>ReadyToRemove</td><td>RemoveNow</td><td>EndDialog</td><td>Return</td><td>OutOfNoRbDiskSpace &lt;&gt; 1</td><td>2</td></row>
		<row><td>ReadyToRemove</td><td>RemoveNow</td><td>NewDialog</td><td>OutOfSpace</td><td>OutOfNoRbDiskSpace = 1</td><td>2</td></row>
		<row><td>ReadyToRemove</td><td>RemoveNow</td><td>Remove</td><td>ALL</td><td>1</td><td>1</td></row>
		<row><td>ReadyToRemove</td><td>RemoveNow</td><td>[ProgressType1]</td><td>Uninstalling</td><td>1</td><td>0</td></row>
		<row><td>ReadyToRemove</td><td>RemoveNow</td><td>[ProgressType2]</td><td>uninstalled</td><td>1</td><td>0</td></row>
		<row><td>ReadyToRemove</td><td>RemoveNow</td><td>[ProgressType3]</td><td>uninstalls</td><td>1</td><td>0</td></row>
		<row><td>SetupCompleteError</td><td>Back</td><td>EndDialog</td><td>Return</td><td>1</td><td>2</td></row>
		<row><td>SetupCompleteError</td><td>Back</td><td>[Suspend]</td><td>{}</td><td>1</td><td>1</td></row>
		<row><td>SetupCompleteError</td><td>Cancel</td><td>EndDialog</td><td>Return</td><td>1</td><td>2</td></row>
		<row><td>SetupCompleteError</td><td>Cancel</td><td>[Suspend]</td><td>1</td><td>1</td><td>1</td></row>
		<row><td>SetupCompleteError</td><td>Finish</td><td>DoAction</td><td>CleanUp</td><td>ISSCRIPTRUNNING="1"</td><td>1</td></row>
		<row><td>SetupCompleteError</td><td>Finish</td><td>DoAction</td><td>ShowMsiLog</td><td>MsiLogFileLocation And (ISSHOWMSILOG="1")</td><td>3</td></row>
		<row><td>SetupCompleteError</td><td>Finish</td><td>EndDialog</td><td>Exit</td><td>1</td><td>2</td></row>
		<row><td>SetupCompleteSuccess</td><td>OK</td><td>DoAction</td><td>CleanUp</td><td>ISSCRIPTRUNNING="1"</td><td>5</td></row>
		<row><td>SetupCompleteSuccess</td><td>OK</td><td>DoAction</td><td>PackageInstaller</td><td>Not Installed</td><td>1</td></row>
		<row><td>SetupCompleteSuccess</td><td>OK</td><td>DoAction</td><td>ShowMsiLog</td><td>MsiLogFileLocation And (ISSHOWMSILOG="1") And NOT ISENABLEDWUSFINISHDIALOG</td><td>10</td></row>
		<row><td>SetupCompleteSuccess</td><td>OK</td><td>DoAction</td><td>StarterApp</td><td>Not Installed</td><td>3</td></row>
		<row><td>SetupCompleteSuccess</td><td>OK</td><td>EndDialog</td><td>Exit</td><td>1</td><td>6</td></row>
		<row><td>SetupCompleteSuccess</td><td>OK</td><td>[PackageInstaller]</td><td>PackageInstaller</td><td>Not Installed</td><td>2</td></row>
		<row><td>SetupCompleteSuccess</td><td>OK</td><td>[StarterApp]</td><td>StarterApp</td><td>Not Installed</td><td>4</td></row>
		<row><td>SetupError</td><td>A</td><td>EndDialog</td><td>ErrorAbort</td><td>1</td><td>0</td></row>
		<row><td>SetupError</td><td>C</td><td>EndDialog</td><td>ErrorCancel</td><td>1</td><td>0</td></row>
		<row><td>SetupError</td><td>I</td><td>EndDialog</td><td>ErrorIgnore</td><td>1</td><td>0</td></row>
		<row><td>SetupError</td><td>N</td><td>EndDialog</td><td>ErrorNo</td><td>1</td><td>0</td></row>
		<row><td>SetupError</td><td>O</td><td>EndDialog</td><td>ErrorOk</td><td>1</td><td>0</td></row>
		<row><td>SetupError</td><td>R</td><td>EndDialog</td><td>ErrorRetry</td><td>1</td><td>0</td></row>
		<row><td>SetupError</td><td>Y</td><td>EndDialog</td><td>ErrorYes</td><td>1</td><td>0</td></row>
		<row><td>SetupInitialization</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>SetupInterrupted</td><td>Back</td><td>EndDialog</td><td>Exit</td><td>1</td><td>2</td></row>
		<row><td>SetupInterrupted</td><td>Back</td><td>[Suspend]</td><td>{}</td><td>1</td><td>1</td></row>
		<row><td>SetupInterrupted</td><td>Cancel</td><td>EndDialog</td><td>Exit</td><td>1</td><td>2</td></row>
		<row><td>SetupInterrupted</td><td>Cancel</td><td>[Suspend]</td><td>1</td><td>1</td><td>1</td></row>
		<row><td>SetupInterrupted</td><td>Finish</td><td>DoAction</td><td>CleanUp</td><td>ISSCRIPTRUNNING="1"</td><td>1</td></row>
		<row><td>SetupInterrupted</td><td>Finish</td><td>DoAction</td><td>ShowMsiLog</td><td>MsiLogFileLocation And (ISSHOWMSILOG="1")</td><td>3</td></row>
		<row><td>SetupInterrupted</td><td>Finish</td><td>EndDialog</td><td>Exit</td><td>1</td><td>2</td></row>
		<row><td>SetupProgress</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>SetupResume</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>SetupResume</td><td>Next</td><td>EndDialog</td><td>Return</td><td>OutOfNoRbDiskSpace &lt;&gt; 1</td><td>0</td></row>
		<row><td>SetupResume</td><td>Next</td><td>NewDialog</td><td>OutOfSpace</td><td>OutOfNoRbDiskSpace = 1</td><td>0</td></row>
		<row><td>SetupType</td><td>Back</td><td>NewDialog</td><td>CustomerInformation</td><td>1</td><td>1</td></row>
		<row><td>SetupType</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>SetupType</td><td>Next</td><td>NewDialog</td><td>CustomSetup</td><td>_IsSetupTypeMin = "Custom"</td><td>2</td></row>
		<row><td>SetupType</td><td>Next</td><td>NewDialog</td><td>ReadyToInstall</td><td>_IsSetupTypeMin &lt;&gt; "Custom"</td><td>1</td></row>
		<row><td>SetupType</td><td>Next</td><td>SetInstallLevel</td><td>100</td><td>_IsSetupTypeMin="Minimal"</td><td>0</td></row>
		<row><td>SetupType</td><td>Next</td><td>SetInstallLevel</td><td>200</td><td>_IsSetupTypeMin="Typical"</td><td>0</td></row>
		<row><td>SetupType</td><td>Next</td><td>SetInstallLevel</td><td>300</td><td>_IsSetupTypeMin="Custom"</td><td>0</td></row>
		<row><td>SetupType</td><td>Next</td><td>[ISRUNSETUPTYPEADDLOCALEVENT]</td><td>1</td><td>1</td><td>0</td></row>
		<row><td>SetupType</td><td>Next</td><td>[SelectedSetupType]</td><td>[DisplayNameCustom]</td><td>_IsSetupTypeMin = "Custom"</td><td>0</td></row>
		<row><td>SetupType</td><td>Next</td><td>[SelectedSetupType]</td><td>[DisplayNameMinimal]</td><td>_IsSetupTypeMin = "Minimal"</td><td>0</td></row>
		<row><td>SetupType</td><td>Next</td><td>[SelectedSetupType]</td><td>[DisplayNameTypical]</td><td>_IsSetupTypeMin = "Typical"</td><td>0</td></row>
		<row><td>SplashBitmap</td><td>Cancel</td><td>SpawnDialog</td><td>CancelSetup</td><td>1</td><td>0</td></row>
		<row><td>SplashBitmap</td><td>Next</td><td>NewDialog</td><td>InstallWelcome</td><td>1</td><td>0</td></row>
	</table>

	<table name="CreateFolder">
		<col key="yes" def="s72">Directory_</col>
		<col key="yes" def="s72">Component_</col>
		<row><td>APP_DATA</td><td>ISX_DEFAULTCOMPONENT9</td></row>
		<row><td>AREAS</td><td>ISX_DEFAULTCOMPONENT11</td></row>
		<row><td>AREAS1</td><td>ISX_DEFAULTCOMPONENT84</td></row>
		<row><td>BIN1</td><td>ISX_DEFAULTCOMPONENT18</td></row>
		<row><td>BIN2</td><td>ISX_DEFAULTCOMPONENT28</td></row>
		<row><td>CONTENT1</td><td>ISX_DEFAULTCOMPONENT99</td></row>
		<row><td>DASHLETS2</td><td>ISX_DEFAULTCOMPONENT116</td></row>
		<row><td>INSTALLDIR</td><td>ISX_DEFAULTCOMPONENT128</td></row>
		<row><td>JDASH.MVC.REFERENCE</td><td>ISX_DEFAULTCOMPONENT49</td></row>
		<row><td>LIB</td><td>ISX_DEFAULTCOMPONENT51</td></row>
		<row><td>LIB1</td><td>ISX_DEFAULTCOMPONENT54</td></row>
		<row><td>LIB2</td><td>ISX_DEFAULTCOMPONENT57</td></row>
		<row><td>LIB3</td><td>ISX_DEFAULTCOMPONENT62</td></row>
		<row><td>LIB4</td><td>ISX_DEFAULTCOMPONENT65</td></row>
		<row><td>LIB5</td><td>ISX_DEFAULTCOMPONENT68</td></row>
		<row><td>LIB6</td><td>ISX_DEFAULTCOMPONENT71</td></row>
		<row><td>LIB7</td><td>ISX_DEFAULTCOMPONENT76</td></row>
		<row><td>LIB8</td><td>ISX_DEFAULTCOMPONENT79</td></row>
		<row><td>MODELS</td><td>ISX_DEFAULTCOMPONENT14</td></row>
		<row><td>MODELS1</td><td>ISX_DEFAULTCOMPONENT20</td></row>
		<row><td>MYSQL.DATAPROVIDER</td><td>ISX_DEFAULTCOMPONENT74</td></row>
		<row><td>NET402</td><td>ISX_DEFAULTCOMPONENT58</td></row>
		<row><td>OBJ</td><td>ISX_DEFAULTCOMPONENT21</td></row>
		<row><td>OBJ1</td><td>ISX_DEFAULTCOMPONENT109</td></row>
		<row><td>PACKAGES</td><td>ISX_DEFAULTCOMPONENT48</td></row>
		<row><td>PUBLISHPROFILES</td><td>ISX_DEFAULTCOMPONENT113</td></row>
		<row><td>SHARED</td><td>ISX_DEFAULTCOMPONENT17</td></row>
		<row><td>SHARED2</td><td>ISX_DEFAULTCOMPONENT95</td></row>
		<row><td>STYLES</td><td>ISX_DEFAULTCOMPONENT41</td></row>
		<row><td>StartMenuFolder</td><td>ISX_DEFAULTCOMPONENT</td></row>
		<row><td>TEMPPE</td><td>ISX_DEFAULTCOMPONENT23</td></row>
		<row><td>TEMPPE1</td><td>ISX_DEFAULTCOMPONENT111</td></row>
		<row><td>THEMES</td><td>ISX_DEFAULTCOMPONENT103</td></row>
		<row><td>TOOLS</td><td>ISX_DEFAULTCOMPONENT80</td></row>
	</table>

	<table name="CustomAction">
		<col key="yes" def="s72">Action</col>
		<col def="i2">Type</col>
		<col def="S64">Source</col>
		<col def="S0">Target</col>
		<col def="I4">ExtendedType</col>
		<col def="S255">ISComments</col>
		<row><td>ISPreventDowngrade</td><td>19</td><td/><td>[IS_PREVENT_DOWNGRADE_EXIT]</td><td/><td>Exits install when a newer version of this product is found</td></row>
		<row><td>ISPrint</td><td>1</td><td>SetAllUsers.dll</td><td>PrintScrollableText</td><td/><td>Prints the contents of a ScrollableText control on a dialog.</td></row>
		<row><td>ISRunSetupTypeAddLocalEvent</td><td>1</td><td>ISExpHlp.dll</td><td>RunSetupTypeAddLocalEvent</td><td/><td>Run the AddLocal events associated with the Next button on the Setup Type dialog.</td></row>
		<row><td>ISSelfRegisterCosting</td><td>1</td><td>ISSELFREG.DLL</td><td>ISSelfRegisterCosting</td><td/><td/></row>
		<row><td>ISSelfRegisterFiles</td><td>3073</td><td>ISSELFREG.DLL</td><td>ISSelfRegisterFiles</td><td/><td/></row>
		<row><td>ISSelfRegisterFinalize</td><td>1</td><td>ISSELFREG.DLL</td><td>ISSelfRegisterFinalize</td><td/><td/></row>
		<row><td>ISUnSelfRegisterFiles</td><td>3073</td><td>ISSELFREG.DLL</td><td>ISUnSelfRegisterFiles</td><td/><td/></row>
		<row><td>PackageInstaller</td><td>18</td><td>jdash.mvc.packageinstaller.e</td><td/><td/><td/></row>
		<row><td>SetARPINSTALLLOCATION</td><td>51</td><td>ARPINSTALLLOCATION</td><td>[INSTALLDIR]</td><td/><td/></row>
		<row><td>SetAllUsersProfileNT</td><td>51</td><td>ALLUSERSPROFILE</td><td>[%SystemRoot]\Profiles\All Users</td><td/><td/></row>
		<row><td>ShowMsiLog</td><td>226</td><td>SystemFolder</td><td>[SystemFolder]notepad.exe "[MsiLogFileLocation]"</td><td/><td>Shows Property-driven MSI Log</td></row>
		<row><td>StarterApp</td><td>210</td><td>jdash.mvc.starterapplication</td><td/><td/><td/></row>
		<row><td>setAllUsersProfile2K</td><td>51</td><td>ALLUSERSPROFILE</td><td>[%ALLUSERSPROFILE]</td><td/><td/></row>
		<row><td>setUserProfileNT</td><td>51</td><td>USERPROFILE</td><td>[%USERPROFILE]</td><td/><td/></row>
	</table>

	<table name="Dialog">
		<col key="yes" def="s72">Dialog</col>
		<col def="i2">HCentering</col>
		<col def="i2">VCentering</col>
		<col def="i2">Width</col>
		<col def="i2">Height</col>
		<col def="I4">Attributes</col>
		<col def="L128">Title</col>
		<col def="s50">Control_First</col>
		<col def="S50">Control_Default</col>
		<col def="S50">Control_Cancel</col>
		<col def="S255">ISComments</col>
		<col def="S72">TextStyle_</col>
		<col def="I4">ISWindowStyle</col>
		<col def="I4">ISResourceId</col>
		<row><td>AdminChangeFolder</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Tail</td><td>OK</td><td>Cancel</td><td>Install Point Browse</td><td/><td>0</td><td/></row>
		<row><td>AdminNetworkLocation</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>InstallNow</td><td>InstallNow</td><td>Cancel</td><td>Network Location</td><td/><td>0</td><td/></row>
		<row><td>AdminWelcome</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Administration Welcome</td><td/><td>0</td><td/></row>
		<row><td>CancelSetup</td><td>50</td><td>50</td><td>260</td><td>85</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>No</td><td>No</td><td>No</td><td>Cancel</td><td/><td>0</td><td/></row>
		<row><td>CustomSetup</td><td>50</td><td>50</td><td>374</td><td>266</td><td>35</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Tree</td><td>Next</td><td>Cancel</td><td>Custom Selection</td><td/><td>0</td><td/></row>
		<row><td>CustomSetupTips</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>OK</td><td>OK</td><td>OK</td><td>Custom Setup Tips</td><td/><td>0</td><td/></row>
		<row><td>CustomerInformation</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>NameEdit</td><td>Next</td><td>Cancel</td><td>Identification</td><td/><td>0</td><td/></row>
		<row><td>DatabaseFolder</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Database Folder</td><td/><td>0</td><td/></row>
		<row><td>DestinationFolder</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Destination Folder</td><td/><td>0</td><td/></row>
		<row><td>DiskSpaceRequirements</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>OK</td><td>OK</td><td>OK</td><td>Feature Details</td><td/><td>0</td><td/></row>
		<row><td>FilesInUse</td><td>50</td><td>50</td><td>374</td><td>266</td><td>19</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Retry</td><td>Retry</td><td>Exit</td><td>Files in Use</td><td/><td>0</td><td/></row>
		<row><td>InstallChangeFolder</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Tail</td><td>OK</td><td>Cancel</td><td>Browse</td><td/><td>0</td><td/></row>
		<row><td>InstallWelcome</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Welcome Panel</td><td/><td>0</td><td/></row>
		<row><td>LicenseAgreement</td><td>50</td><td>50</td><td>374</td><td>266</td><td>2</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Agree</td><td>Next</td><td>Cancel</td><td>License Agreement</td><td/><td>0</td><td/></row>
		<row><td>MaintenanceType</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>RadioGroup</td><td>Next</td><td>Cancel</td><td>Change, Reinstall, Remove</td><td/><td>0</td><td/></row>
		<row><td>MaintenanceWelcome</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Maintenance Welcome</td><td/><td>0</td><td/></row>
		<row><td>MsiRMFilesInUse</td><td>50</td><td>50</td><td>374</td><td>266</td><td>19</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>OK</td><td>OK</td><td>Cancel</td><td>RestartManager Files in Use</td><td/><td>0</td><td/></row>
		<row><td>OutOfSpace</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Resume</td><td>Resume</td><td>Resume</td><td>Out Of Disk Space</td><td/><td>0</td><td/></row>
		<row><td>PatchWelcome</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS__IsPatchDlg_PatchWizard##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Patch Panel</td><td/><td>0</td><td/></row>
		<row><td>ReadmeInformation</td><td>50</td><td>50</td><td>374</td><td>266</td><td>7</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Readme Information</td><td/><td>0</td><td>0</td></row>
		<row><td>ReadyToInstall</td><td>50</td><td>50</td><td>374</td><td>266</td><td>35</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>InstallNow</td><td>InstallNow</td><td>Cancel</td><td>Ready to Install</td><td/><td>0</td><td/></row>
		<row><td>ReadyToRemove</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>RemoveNow</td><td>RemoveNow</td><td>Cancel</td><td>Verify Remove</td><td/><td>0</td><td/></row>
		<row><td>SetupCompleteError</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Finish</td><td>Finish</td><td>Finish</td><td>Fatal Error</td><td/><td>0</td><td/></row>
		<row><td>SetupCompleteSuccess</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>OK</td><td>OK</td><td>OK</td><td>Exit</td><td/><td>0</td><td/></row>
		<row><td>SetupError</td><td>50</td><td>50</td><td>270</td><td>110</td><td>65543</td><td>##IDS__IsErrorDlg_InstallerInfo##</td><td>ErrorText</td><td>O</td><td>C</td><td>Error</td><td/><td>0</td><td/></row>
		<row><td>SetupInitialization</td><td>50</td><td>50</td><td>374</td><td>266</td><td>5</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Cancel</td><td>Cancel</td><td>Cancel</td><td>Setup Initialization</td><td/><td>0</td><td/></row>
		<row><td>SetupInterrupted</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Finish</td><td>Finish</td><td>Finish</td><td>User Exit</td><td/><td>0</td><td/></row>
		<row><td>SetupProgress</td><td>50</td><td>50</td><td>374</td><td>266</td><td>5</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Cancel</td><td>Cancel</td><td>Cancel</td><td>Progress</td><td/><td>0</td><td/></row>
		<row><td>SetupResume</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Resume</td><td/><td>0</td><td/></row>
		<row><td>SetupType</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>RadioGroup</td><td>Next</td><td>Cancel</td><td>Setup Type</td><td/><td>0</td><td/></row>
		<row><td>SplashBitmap</td><td>50</td><td>50</td><td>374</td><td>266</td><td>3</td><td>##IDS_PRODUCTNAME_INSTALLSHIELD##</td><td>Next</td><td>Next</td><td>Cancel</td><td>Welcome Bitmap</td><td/><td>0</td><td/></row>
	</table>

	<table name="Directory">
		<col key="yes" def="s72">Directory</col>
		<col def="S72">Directory_Parent</col>
		<col def="l255">DefaultDir</col>
		<col def="S255">ISDescription</col>
		<col def="I4">ISAttributes</col>
		<col def="S255">ISFolderName</col>
		<row><td>ADMIN</td><td>APP</td><td>admin</td><td/><td>0</td><td/></row>
		<row><td>ALLUSERSPROFILE</td><td>TARGETDIR</td><td>.:ALLUSE~1|All Users</td><td/><td>0</td><td/></row>
		<row><td>ANGULAR</td><td>SCRIPTS</td><td>angular</td><td/><td>0</td><td/></row>
		<row><td>ANGULAR1</td><td>DASHLETS2</td><td>Angular</td><td/><td>0</td><td/></row>
		<row><td>ANGULARTODO</td><td>VIEWS3</td><td>ANGULA~1|AngularTodo</td><td/><td>0</td><td/></row>
		<row><td>APP</td><td>SCRIPTS</td><td>app</td><td/><td>0</td><td/></row>
		<row><td>APP1</td><td>SCRIPTS1</td><td>app</td><td/><td>0</td><td/></row>
		<row><td>APP_DATA</td><td>JDASH.MVC.HELLOWORLD</td><td>App_Data</td><td/><td>0</td><td/></row>
		<row><td>APP_DATA1</td><td>SAMPLE_APPLICATION</td><td>App_Data</td><td/><td>0</td><td/></row>
		<row><td>APP_START</td><td>JDASH.MVC.HELLOWORLD</td><td>APP_ST~1|App_Start</td><td/><td>0</td><td/></row>
		<row><td>APP_START1</td><td>SAMPLE_APPLICATION</td><td>APP_ST~1|App_Start</td><td/><td>0</td><td/></row>
		<row><td>AREAS</td><td>JDASH.MVC.HELLOWORLD</td><td>Areas</td><td/><td>0</td><td/></row>
		<row><td>AREAS1</td><td>SAMPLE_APPLICATION</td><td>Areas</td><td/><td>0</td><td/></row>
		<row><td>AdminToolsFolder</td><td>TARGETDIR</td><td>.:Admint~1|AdminTools</td><td/><td>0</td><td/></row>
		<row><td>AppDataFolder</td><td>TARGETDIR</td><td>.:APPLIC~1|Application Data</td><td/><td>0</td><td/></row>
		<row><td>BIN</td><td>INSTALLDIR</td><td>Bin</td><td/><td>0</td><td/></row>
		<row><td>BIN1</td><td>JDASH.MVC.HELLOWORLD</td><td>bin</td><td/><td>0</td><td/></row>
		<row><td>BIN2</td><td>MANAGEMENT</td><td>bin</td><td/><td>0</td><td/></row>
		<row><td>BIN3</td><td>SAMPLE_APPLICATION</td><td>bin</td><td/><td>0</td><td/></row>
		<row><td>BOOTSTRAP</td><td>SCRIPTS</td><td>BOOTST~1|bootstrap</td><td/><td>0</td><td/></row>
		<row><td>CHARTJS</td><td>VIEWS3</td><td>ChartJS</td><td/><td>0</td><td/></row>
		<row><td>CHARTJS1</td><td>DASHLETS2</td><td>ChartJS</td><td/><td>0</td><td/></row>
		<row><td>CONTENT</td><td>MICROSOFT.ASPNET.WEBAPI.CORE.4.0.20710.0</td><td>content</td><td/><td>0</td><td/></row>
		<row><td>CONTENT1</td><td>SAMPLE_APPLICATION</td><td>Content</td><td/><td>0</td><td/></row>
		<row><td>CONTROLLERS</td><td>DASHLETS</td><td>CONTRO~1|Controllers</td><td/><td>0</td><td/></row>
		<row><td>CONTROLLERS1</td><td>JDASH.MVC.HELLOWORLD</td><td>CONTRO~1|Controllers</td><td/><td>0</td><td/></row>
		<row><td>CONTROLLERS2</td><td>DASHLETS1</td><td>CONTRO~1|Controllers</td><td/><td>0</td><td/></row>
		<row><td>CONTROLLERS3</td><td>SAMPLE_APPLICATION</td><td>CONTRO~1|Controllers</td><td/><td>0</td><td/></row>
		<row><td>CSS</td><td>STYLES</td><td>css</td><td/><td>0</td><td/></row>
		<row><td>CSS1</td><td>CONTENT1</td><td>css</td><td/><td>0</td><td/></row>
		<row><td>CUSTOM</td><td>THEMES</td><td>Custom</td><td/><td>0</td><td/></row>
		<row><td>CommonAppDataFolder</td><td>TARGETDIR</td><td>.:Common~1|CommonAppData</td><td/><td>0</td><td/></row>
		<row><td>CommonFiles64Folder</td><td>TARGETDIR</td><td>.:Common64</td><td/><td>0</td><td/></row>
		<row><td>CommonFilesFolder</td><td>TARGETDIR</td><td>.:Common</td><td/><td>0</td><td/></row>
		<row><td>DASHBOARD</td><td>VIEWS4</td><td>DASHBO~1|Dashboard</td><td/><td>0</td><td/></row>
		<row><td>DASHLETS</td><td>AREAS</td><td>Dashlets</td><td/><td>0</td><td/></row>
		<row><td>DASHLETS1</td><td>AREAS1</td><td>Dashlets</td><td/><td>0</td><td/></row>
		<row><td>DASHLETS2</td><td>SCRIPTS1</td><td>dashlets</td><td/><td>0</td><td/></row>
		<row><td>DATABASEDIR</td><td>ISYourDataBaseDir</td><td>.</td><td/><td>0</td><td/></row>
		<row><td>DEBUG</td><td>OBJ</td><td>Debug</td><td/><td>0</td><td/></row>
		<row><td>DEBUG1</td><td>OBJ1</td><td>Debug</td><td/><td>0</td><td/></row>
		<row><td>DOCUMENTATION</td><td>INSTALLDIR</td><td>DOCUME~1|Documentation</td><td/><td>0</td><td/></row>
		<row><td>DesktopFolder</td><td>TARGETDIR</td><td>.:Desktop</td><td/><td>3</td><td/></row>
		<row><td>FONTS</td><td>STYLES</td><td>fonts</td><td/><td>0</td><td/></row>
		<row><td>FONTS1</td><td>CONTENT1</td><td>fonts</td><td/><td>0</td><td/></row>
		<row><td>FavoritesFolder</td><td>TARGETDIR</td><td>.:FAVORI~1|Favorites</td><td/><td>0</td><td/></row>
		<row><td>FontsFolder</td><td>TARGETDIR</td><td>.:Fonts</td><td/><td>0</td><td/></row>
		<row><td>GOOGLEMAP</td><td>VIEWS3</td><td>GOOGLE~1|GoogleMap</td><td/><td>0</td><td/></row>
		<row><td>GOOGLEMAP1</td><td>DASHLETS2</td><td>GOOGLE~1|GoogleMap</td><td/><td>0</td><td/></row>
		<row><td>GlobalAssemblyCache</td><td>TARGETDIR</td><td>.:Global~1|GlobalAssemblyCache</td><td/><td>0</td><td/></row>
		<row><td>HELLOWORLD</td><td>VIEWS</td><td>HELLOW~1|HelloWorld</td><td/><td>0</td><td/></row>
		<row><td>HELPERS</td><td>SAMPLE_APPLICATION</td><td>Helpers</td><td/><td>0</td><td/></row>
		<row><td>HOME</td><td>VIEWS1</td><td>Home</td><td/><td>0</td><td/></row>
		<row><td>HOME1</td><td>VIEWS2</td><td>Home</td><td/><td>0</td><td/></row>
		<row><td>HTML</td><td>VIEWS3</td><td>Html</td><td/><td>0</td><td/></row>
		<row><td>I18N</td><td>ANGULAR</td><td>i18n</td><td/><td>0</td><td/></row>
		<row><td>IMAGES</td><td>RESOURCE</td><td>images</td><td/><td>0</td><td/></row>
		<row><td>IMAGES1</td><td>STYLES</td><td>images</td><td/><td>0</td><td/></row>
		<row><td>IMAGES2</td><td>CONTENT1</td><td>images</td><td/><td>0</td><td/></row>
		<row><td>IMAGES3</td><td>CUSTOM</td><td>images</td><td/><td>0</td><td/></row>
		<row><td>INSTALLDIR</td><td>JDASH_ASP.NET_MVC1</td><td>.</td><td/><td>0</td><td/></row>
		<row><td>ISCommonFilesFolder</td><td>CommonFilesFolder</td><td>Instal~1|InstallShield</td><td/><td>0</td><td/></row>
		<row><td>ISMyCompanyDir</td><td>ProgramFilesFolder</td><td>MYCOMP~1|My Company Name</td><td/><td>0</td><td/></row>
		<row><td>ISMyProductDir</td><td>ISMyCompanyDir</td><td>MYPROD~1|My Product Name</td><td/><td>0</td><td/></row>
		<row><td>ISYourDataBaseDir</td><td>INSTALLDIR</td><td>Database</td><td/><td>0</td><td/></row>
		<row><td>JDASH.MVC.HELLOWORLD</td><td>INSTALLDIR</td><td>JDASH_~1|JDash.Mvc.HelloWorld</td><td/><td>0</td><td/></row>
		<row><td>JDASH.MVC.REFERENCE</td><td>PACKAGES</td><td>JDASH_~1|JDash.Mvc.Reference</td><td/><td>0</td><td/></row>
		<row><td>JDASH_ASP.NET_MVC</td><td>KALITTE_INC.</td><td>JDASHA~1|Jdash Asp.Net Mvc</td><td/><td>0</td><td/></row>
		<row><td>JDASH_ASP.NET_MVC1</td><td>KALITTE</td><td>JDASHA~1|Jdash Asp.Net Mvc</td><td/><td>0</td><td/></row>
		<row><td>JVECTORMAP</td><td>VIEWS3</td><td>JVECTO~1|JVectorMap</td><td/><td>0</td><td/></row>
		<row><td>JVECTORMAP1</td><td>DASHLETS2</td><td>JVECTO~1|JVectorMap</td><td/><td>0</td><td/></row>
		<row><td>KALITTE</td><td>ProgramFilesFolder</td><td>Kalitte</td><td/><td>0</td><td/></row>
		<row><td>KALITTE_INC.</td><td>ProgramFilesFolder</td><td>KALITT~1|Kalitte Inc.</td><td/><td>0</td><td/></row>
		<row><td>LIB</td><td>MICROSOFT.ASPNET.MVC.4.0.20710.0</td><td>lib</td><td/><td>0</td><td/></row>
		<row><td>LIB1</td><td>MICROSOFT.ASPNET.RAZOR.2.0.20710.0</td><td>lib</td><td/><td>0</td><td/></row>
		<row><td>LIB2</td><td>MICROSOFT.ASPNET.WEB.OPTIMIZATION.1.0.0</td><td>lib</td><td/><td>0</td><td/></row>
		<row><td>LIB3</td><td>MICROSOFT.ASPNET.WEBAPI.CORE.4.0.20710.0</td><td>lib</td><td/><td>0</td><td/></row>
		<row><td>LIB4</td><td>MICROSOFT.ASPNET.WEBAPI.WEBHOST.4.0.20710.0</td><td>lib</td><td/><td>0</td><td/></row>
		<row><td>LIB5</td><td>MICROSOFT.ASPNET.WEBPAGES.2.0.20710.0</td><td>lib</td><td/><td>0</td><td/></row>
		<row><td>LIB6</td><td>MICROSOFT.NET.HTTP.2.0.20710.0</td><td>lib</td><td/><td>0</td><td/></row>
		<row><td>LIB7</td><td>NEWTONSOFT.JSON.4.5.6</td><td>lib</td><td/><td>0</td><td/></row>
		<row><td>LIB8</td><td>WEBGREASE.1.1.0</td><td>lib</td><td/><td>0</td><td/></row>
		<row><td>LocalAppDataFolder</td><td>TARGETDIR</td><td>.:LocalA~1|LocalAppData</td><td/><td>0</td><td/></row>
		<row><td>MANAGEMENT</td><td>INSTALLDIR</td><td>MANAGE~1|Management</td><td/><td>0</td><td/></row>
		<row><td>MAPS</td><td>JVECTORMAP1</td><td>maps</td><td/><td>0</td><td/></row>
		<row><td>MICROSOFT.ASPNET.MVC.4.0.20710.0</td><td>PACKAGES</td><td>MICROS~1|Microsoft.AspNet.Mvc.4.0.20710.0</td><td/><td>0</td><td/></row>
		<row><td>MICROSOFT.ASPNET.RAZOR.2.0.20710.0</td><td>PACKAGES</td><td>MICROS~1|Microsoft.AspNet.Razor.2.0.20710.0</td><td/><td>0</td><td/></row>
		<row><td>MICROSOFT.ASPNET.WEB.OPTIMIZATION.1.0.0</td><td>PACKAGES</td><td>MICROS~1|Microsoft.AspNet.Web.Optimization.1.0.0</td><td/><td>0</td><td/></row>
		<row><td>MICROSOFT.ASPNET.WEBAPI.4.0.20710.0</td><td>PACKAGES</td><td>MICROS~1|Microsoft.AspNet.WebApi.4.0.20710.0</td><td/><td>0</td><td/></row>
		<row><td>MICROSOFT.ASPNET.WEBAPI.CORE.4.0.20710.0</td><td>PACKAGES</td><td>MICROS~1|Microsoft.AspNet.WebApi.Core.4.0.20710.0</td><td/><td>0</td><td/></row>
		<row><td>MICROSOFT.ASPNET.WEBAPI.WEBHOST.4.0.20710.0</td><td>PACKAGES</td><td>MICROS~1|Microsoft.AspNet.WebApi.WebHost.4.0.20710.0</td><td/><td>0</td><td/></row>
		<row><td>MICROSOFT.ASPNET.WEBPAGES.2.0.20710.0</td><td>PACKAGES</td><td>MICROS~1|Microsoft.AspNet.WebPages.2.0.20710.0</td><td/><td>0</td><td/></row>
		<row><td>MICROSOFT.NET.HTTP.2.0.20710.0</td><td>PACKAGES</td><td>MICROS~1|Microsoft.Net.Http.2.0.20710.0</td><td/><td>0</td><td/></row>
		<row><td>MODELS</td><td>DASHLETS</td><td>Models</td><td/><td>0</td><td/></row>
		<row><td>MODELS1</td><td>JDASH.MVC.HELLOWORLD</td><td>Models</td><td/><td>0</td><td/></row>
		<row><td>MODELS2</td><td>DASHLETS1</td><td>Models</td><td/><td>0</td><td/></row>
		<row><td>MODELS3</td><td>SAMPLE_APPLICATION</td><td>Models</td><td/><td>0</td><td/></row>
		<row><td>MYSQL.DATAPROVIDER</td><td>PACKAGES</td><td>MYSQL_~1|MySql.DataProvider</td><td/><td>0</td><td/></row>
		<row><td>MY_PRODUCT_NAME</td><td>KALITTE_INC.</td><td>MYPROD~1|My Product Name</td><td/><td>0</td><td/></row>
		<row><td>MyPicturesFolder</td><td>TARGETDIR</td><td>.:MyPict~1|MyPictures</td><td/><td>0</td><td/></row>
		<row><td>NET40</td><td>LIB</td><td>net40</td><td/><td>0</td><td/></row>
		<row><td>NET401</td><td>LIB1</td><td>net40</td><td/><td>0</td><td/></row>
		<row><td>NET402</td><td>LIB2</td><td>net40</td><td/><td>0</td><td/></row>
		<row><td>NET403</td><td>LIB3</td><td>net40</td><td/><td>0</td><td/></row>
		<row><td>NET404</td><td>LIB4</td><td>net40</td><td/><td>0</td><td/></row>
		<row><td>NET405</td><td>LIB5</td><td>net40</td><td/><td>0</td><td/></row>
		<row><td>NET406</td><td>LIB6</td><td>net40</td><td/><td>0</td><td/></row>
		<row><td>NET407</td><td>LIB7</td><td>net40</td><td/><td>0</td><td/></row>
		<row><td>NET45</td><td>LIB6</td><td>net45</td><td/><td>0</td><td/></row>
		<row><td>NEWTONSOFT.JSON.4.5.6</td><td>PACKAGES</td><td>NEWTON~1|Newtonsoft.Json.4.5.6</td><td/><td>0</td><td/></row>
		<row><td>NLS</td><td>RESOURCE</td><td>nls</td><td/><td>0</td><td/></row>
		<row><td>NetHoodFolder</td><td>TARGETDIR</td><td>.:NetHood</td><td/><td>0</td><td/></row>
		<row><td>OBJ</td><td>JDASH.MVC.HELLOWORLD</td><td>obj</td><td/><td>0</td><td/></row>
		<row><td>OBJ1</td><td>SAMPLE_APPLICATION</td><td>obj</td><td/><td>0</td><td/></row>
		<row><td>PACKAGES</td><td>INSTALLDIR</td><td>packages</td><td/><td>0</td><td/></row>
		<row><td>PROPERTIES</td><td>JDASH.MVC.HELLOWORLD</td><td>PROPER~1|Properties</td><td/><td>0</td><td/></row>
		<row><td>PROPERTIES1</td><td>SAMPLE_APPLICATION</td><td>PROPER~1|Properties</td><td/><td>0</td><td/></row>
		<row><td>PUBLISHPROFILES</td><td>PROPERTIES1</td><td>PUBLIS~1|PublishProfiles</td><td/><td>0</td><td/></row>
		<row><td>PersonalFolder</td><td>TARGETDIR</td><td>.:Personal</td><td/><td>0</td><td/></row>
		<row><td>PrimaryVolumePath</td><td>TARGETDIR</td><td>.:Primar~1|PrimaryVolumePath</td><td/><td>0</td><td/></row>
		<row><td>PrintHoodFolder</td><td>TARGETDIR</td><td>.:PRINTH~1|PrintHood</td><td/><td>0</td><td/></row>
		<row><td>ProgramFiles64Folder</td><td>TARGETDIR</td><td>.:Prog64~1|Program Files 64</td><td/><td>0</td><td/></row>
		<row><td>ProgramFilesFolder</td><td>TARGETDIR</td><td>.:PROGRA~1|program files</td><td/><td>0</td><td/></row>
		<row><td>ProgramMenuFolder</td><td>TARGETDIR</td><td>.:Programs</td><td/><td>3</td><td/></row>
		<row><td>RESOURCE</td><td>APP</td><td>resource</td><td/><td>0</td><td/></row>
		<row><td>RESOURCE1</td><td>VIEWSOURCEDIALOG</td><td>resource</td><td/><td>0</td><td/></row>
		<row><td>RESOURCES</td><td>WEATHERBOARD1</td><td>RESOUR~1|resources</td><td/><td>0</td><td/></row>
		<row><td>RSS</td><td>VIEWS3</td><td>Rss</td><td/><td>0</td><td/></row>
		<row><td>RecentFolder</td><td>TARGETDIR</td><td>.:Recent</td><td/><td>0</td><td/></row>
		<row><td>SAMPLE_APPLICATION</td><td>INSTALLDIR</td><td>SAMPLE~1|Sample Application</td><td/><td>0</td><td/></row>
		<row><td>SCRIPTS</td><td>MANAGEMENT</td><td>Scripts</td><td/><td>0</td><td/></row>
		<row><td>SCRIPTS1</td><td>SAMPLE_APPLICATION</td><td>Scripts</td><td/><td>0</td><td/></row>
		<row><td>SHARED</td><td>VIEWS</td><td>Shared</td><td/><td>0</td><td/></row>
		<row><td>SHARED1</td><td>VIEWS2</td><td>Shared</td><td/><td>0</td><td/></row>
		<row><td>SHARED2</td><td>VIEWS3</td><td>Shared</td><td/><td>0</td><td/></row>
		<row><td>SHARED3</td><td>VIEWS4</td><td>Shared</td><td/><td>0</td><td/></row>
		<row><td>SPARKLINE</td><td>VIEWS3</td><td>SPARKL~1|SparkLine</td><td/><td>0</td><td/></row>
		<row><td>SPARKLINE1</td><td>DASHLETS2</td><td>SPARKL~1|SparkLine</td><td/><td>0</td><td/></row>
		<row><td>STYLES</td><td>MANAGEMENT</td><td>Styles</td><td/><td>0</td><td/></row>
		<row><td>SendToFolder</td><td>TARGETDIR</td><td>.:SendTo</td><td/><td>3</td><td/></row>
		<row><td>StartMenuFolder</td><td>TARGETDIR</td><td>.:STARTM~1|Start Menu</td><td/><td>3</td><td/></row>
		<row><td>StartupFolder</td><td>TARGETDIR</td><td>.:StartUp</td><td/><td>3</td><td/></row>
		<row><td>System16Folder</td><td>TARGETDIR</td><td>.:System</td><td/><td>0</td><td/></row>
		<row><td>System64Folder</td><td>TARGETDIR</td><td>.:System64</td><td/><td>0</td><td/></row>
		<row><td>SystemFolder</td><td>TARGETDIR</td><td>.:System32</td><td/><td>0</td><td/></row>
		<row><td>TARGETDIR</td><td/><td>SourceDir</td><td/><td>0</td><td/></row>
		<row><td>TEMPPE</td><td>DEBUG</td><td>TempPE</td><td/><td>0</td><td/></row>
		<row><td>TEMPPE1</td><td>DEBUG1</td><td>TempPE</td><td/><td>0</td><td/></row>
		<row><td>THEMES</td><td>CONTENT1</td><td>Themes</td><td/><td>0</td><td/></row>
		<row><td>TOOLS</td><td>WEBGREASE.1.1.0</td><td>tools</td><td/><td>0</td><td/></row>
		<row><td>TR</td><td>NLS</td><td>tr</td><td/><td>0</td><td/></row>
		<row><td>TempFolder</td><td>TARGETDIR</td><td>.:Temp</td><td/><td>0</td><td/></row>
		<row><td>TemplateFolder</td><td>TARGETDIR</td><td>.:ShellNew</td><td/><td>0</td><td/></row>
		<row><td>USERPROFILE</td><td>TARGETDIR</td><td>.:USERPR~1|UserProfile</td><td/><td>0</td><td/></row>
		<row><td>VIEWS</td><td>DASHLETS</td><td>Views</td><td/><td>0</td><td/></row>
		<row><td>VIEWS1</td><td>JDASH.MVC.HELLOWORLD</td><td>Views</td><td/><td>0</td><td/></row>
		<row><td>VIEWS2</td><td>MANAGEMENT</td><td>Views</td><td/><td>0</td><td/></row>
		<row><td>VIEWS3</td><td>DASHLETS1</td><td>Views</td><td/><td>0</td><td/></row>
		<row><td>VIEWS4</td><td>SAMPLE_APPLICATION</td><td>Views</td><td/><td>0</td><td/></row>
		<row><td>VIEWSOURCEDIALOG</td><td>RESOURCE</td><td>VIEWSO~1|ViewSourceDialog</td><td/><td>0</td><td/></row>
		<row><td>WEATHERBOARD</td><td>VIEWS3</td><td>WEATHE~1|WeatherBoard</td><td/><td>0</td><td/></row>
		<row><td>WEATHERBOARD1</td><td>DASHLETS2</td><td>WEATHE~1|weatherBoard</td><td/><td>0</td><td/></row>
		<row><td>WEBGREASE.1.1.0</td><td>PACKAGES</td><td>WEBGRE~1|WebGrease.1.1.0</td><td/><td>0</td><td/></row>
		<row><td>WindowsFolder</td><td>TARGETDIR</td><td>.:Windows</td><td/><td>0</td><td/></row>
		<row><td>WindowsVolume</td><td>TARGETDIR</td><td>.:WinRoot</td><td/><td>0</td><td/></row>
		<row><td>newfolder1</td><td>ProgramMenuFolder</td><td>##ID_STRING11##</td><td/><td>1</td><td/></row>
	</table>

	<table name="DrLocator">
		<col key="yes" def="s72">Signature_</col>
		<col key="yes" def="S72">Parent</col>
		<col key="yes" def="S255">Path</col>
		<col def="I2">Depth</col>
	</table>

	<table name="DuplicateFile">
		<col key="yes" def="s72">FileKey</col>
		<col def="s72">Component_</col>
		<col def="s72">File_</col>
		<col def="L255">DestName</col>
		<col def="S72">DestFolder</col>
	</table>

	<table name="Environment">
		<col key="yes" def="s72">Environment</col>
		<col def="l255">Name</col>
		<col def="L255">Value</col>
		<col def="s72">Component_</col>
	</table>

	<table name="Error">
		<col key="yes" def="i2">Error</col>
		<col def="L255">Message</col>
		<row><td>0</td><td>##IDS_ERROR_0##</td></row>
		<row><td>1</td><td>##IDS_ERROR_1##</td></row>
		<row><td>10</td><td>##IDS_ERROR_8##</td></row>
		<row><td>11</td><td>##IDS_ERROR_9##</td></row>
		<row><td>1101</td><td>##IDS_ERROR_22##</td></row>
		<row><td>12</td><td>##IDS_ERROR_10##</td></row>
		<row><td>13</td><td>##IDS_ERROR_11##</td></row>
		<row><td>1301</td><td>##IDS_ERROR_23##</td></row>
		<row><td>1302</td><td>##IDS_ERROR_24##</td></row>
		<row><td>1303</td><td>##IDS_ERROR_25##</td></row>
		<row><td>1304</td><td>##IDS_ERROR_26##</td></row>
		<row><td>1305</td><td>##IDS_ERROR_27##</td></row>
		<row><td>1306</td><td>##IDS_ERROR_28##</td></row>
		<row><td>1307</td><td>##IDS_ERROR_29##</td></row>
		<row><td>1308</td><td>##IDS_ERROR_30##</td></row>
		<row><td>1309</td><td>##IDS_ERROR_31##</td></row>
		<row><td>1310</td><td>##IDS_ERROR_32##</td></row>
		<row><td>1311</td><td>##IDS_ERROR_33##</td></row>
		<row><td>1312</td><td>##IDS_ERROR_34##</td></row>
		<row><td>1313</td><td>##IDS_ERROR_35##</td></row>
		<row><td>1314</td><td>##IDS_ERROR_36##</td></row>
		<row><td>1315</td><td>##IDS_ERROR_37##</td></row>
		<row><td>1316</td><td>##IDS_ERROR_38##</td></row>
		<row><td>1317</td><td>##IDS_ERROR_39##</td></row>
		<row><td>1318</td><td>##IDS_ERROR_40##</td></row>
		<row><td>1319</td><td>##IDS_ERROR_41##</td></row>
		<row><td>1320</td><td>##IDS_ERROR_42##</td></row>
		<row><td>1321</td><td>##IDS_ERROR_43##</td></row>
		<row><td>1322</td><td>##IDS_ERROR_44##</td></row>
		<row><td>1323</td><td>##IDS_ERROR_45##</td></row>
		<row><td>1324</td><td>##IDS_ERROR_46##</td></row>
		<row><td>1325</td><td>##IDS_ERROR_47##</td></row>
		<row><td>1326</td><td>##IDS_ERROR_48##</td></row>
		<row><td>1327</td><td>##IDS_ERROR_49##</td></row>
		<row><td>1328</td><td>##IDS_ERROR_122##</td></row>
		<row><td>1329</td><td>##IDS_ERROR_1329##</td></row>
		<row><td>1330</td><td>##IDS_ERROR_1330##</td></row>
		<row><td>1331</td><td>##IDS_ERROR_1331##</td></row>
		<row><td>1332</td><td>##IDS_ERROR_1332##</td></row>
		<row><td>1333</td><td>##IDS_ERROR_1333##</td></row>
		<row><td>1334</td><td>##IDS_ERROR_1334##</td></row>
		<row><td>1335</td><td>##IDS_ERROR_1335##</td></row>
		<row><td>1336</td><td>##IDS_ERROR_1336##</td></row>
		<row><td>14</td><td>##IDS_ERROR_12##</td></row>
		<row><td>1401</td><td>##IDS_ERROR_50##</td></row>
		<row><td>1402</td><td>##IDS_ERROR_51##</td></row>
		<row><td>1403</td><td>##IDS_ERROR_52##</td></row>
		<row><td>1404</td><td>##IDS_ERROR_53##</td></row>
		<row><td>1405</td><td>##IDS_ERROR_54##</td></row>
		<row><td>1406</td><td>##IDS_ERROR_55##</td></row>
		<row><td>1407</td><td>##IDS_ERROR_56##</td></row>
		<row><td>1408</td><td>##IDS_ERROR_57##</td></row>
		<row><td>1409</td><td>##IDS_ERROR_58##</td></row>
		<row><td>1410</td><td>##IDS_ERROR_59##</td></row>
		<row><td>15</td><td>##IDS_ERROR_13##</td></row>
		<row><td>1500</td><td>##IDS_ERROR_60##</td></row>
		<row><td>1501</td><td>##IDS_ERROR_61##</td></row>
		<row><td>1502</td><td>##IDS_ERROR_62##</td></row>
		<row><td>1503</td><td>##IDS_ERROR_63##</td></row>
		<row><td>16</td><td>##IDS_ERROR_14##</td></row>
		<row><td>1601</td><td>##IDS_ERROR_64##</td></row>
		<row><td>1602</td><td>##IDS_ERROR_65##</td></row>
		<row><td>1603</td><td>##IDS_ERROR_66##</td></row>
		<row><td>1604</td><td>##IDS_ERROR_67##</td></row>
		<row><td>1605</td><td>##IDS_ERROR_68##</td></row>
		<row><td>1606</td><td>##IDS_ERROR_69##</td></row>
		<row><td>1607</td><td>##IDS_ERROR_70##</td></row>
		<row><td>1608</td><td>##IDS_ERROR_71##</td></row>
		<row><td>1609</td><td>##IDS_ERROR_1609##</td></row>
		<row><td>1651</td><td>##IDS_ERROR_1651##</td></row>
		<row><td>17</td><td>##IDS_ERROR_15##</td></row>
		<row><td>1701</td><td>##IDS_ERROR_72##</td></row>
		<row><td>1702</td><td>##IDS_ERROR_73##</td></row>
		<row><td>1703</td><td>##IDS_ERROR_74##</td></row>
		<row><td>1704</td><td>##IDS_ERROR_75##</td></row>
		<row><td>1705</td><td>##IDS_ERROR_76##</td></row>
		<row><td>1706</td><td>##IDS_ERROR_77##</td></row>
		<row><td>1707</td><td>##IDS_ERROR_78##</td></row>
		<row><td>1708</td><td>##IDS_ERROR_79##</td></row>
		<row><td>1709</td><td>##IDS_ERROR_80##</td></row>
		<row><td>1710</td><td>##IDS_ERROR_81##</td></row>
		<row><td>1711</td><td>##IDS_ERROR_82##</td></row>
		<row><td>1712</td><td>##IDS_ERROR_83##</td></row>
		<row><td>1713</td><td>##IDS_ERROR_123##</td></row>
		<row><td>1714</td><td>##IDS_ERROR_124##</td></row>
		<row><td>1715</td><td>##IDS_ERROR_1715##</td></row>
		<row><td>1716</td><td>##IDS_ERROR_1716##</td></row>
		<row><td>1717</td><td>##IDS_ERROR_1717##</td></row>
		<row><td>1718</td><td>##IDS_ERROR_1718##</td></row>
		<row><td>1719</td><td>##IDS_ERROR_1719##</td></row>
		<row><td>1720</td><td>##IDS_ERROR_1720##</td></row>
		<row><td>1721</td><td>##IDS_ERROR_1721##</td></row>
		<row><td>1722</td><td>##IDS_ERROR_1722##</td></row>
		<row><td>1723</td><td>##IDS_ERROR_1723##</td></row>
		<row><td>1724</td><td>##IDS_ERROR_1724##</td></row>
		<row><td>1725</td><td>##IDS_ERROR_1725##</td></row>
		<row><td>1726</td><td>##IDS_ERROR_1726##</td></row>
		<row><td>1727</td><td>##IDS_ERROR_1727##</td></row>
		<row><td>1728</td><td>##IDS_ERROR_1728##</td></row>
		<row><td>1729</td><td>##IDS_ERROR_1729##</td></row>
		<row><td>1730</td><td>##IDS_ERROR_1730##</td></row>
		<row><td>1731</td><td>##IDS_ERROR_1731##</td></row>
		<row><td>1732</td><td>##IDS_ERROR_1732##</td></row>
		<row><td>18</td><td>##IDS_ERROR_16##</td></row>
		<row><td>1801</td><td>##IDS_ERROR_84##</td></row>
		<row><td>1802</td><td>##IDS_ERROR_85##</td></row>
		<row><td>1803</td><td>##IDS_ERROR_86##</td></row>
		<row><td>1804</td><td>##IDS_ERROR_87##</td></row>
		<row><td>1805</td><td>##IDS_ERROR_88##</td></row>
		<row><td>1806</td><td>##IDS_ERROR_89##</td></row>
		<row><td>1807</td><td>##IDS_ERROR_90##</td></row>
		<row><td>19</td><td>##IDS_ERROR_17##</td></row>
		<row><td>1901</td><td>##IDS_ERROR_91##</td></row>
		<row><td>1902</td><td>##IDS_ERROR_92##</td></row>
		<row><td>1903</td><td>##IDS_ERROR_93##</td></row>
		<row><td>1904</td><td>##IDS_ERROR_94##</td></row>
		<row><td>1905</td><td>##IDS_ERROR_95##</td></row>
		<row><td>1906</td><td>##IDS_ERROR_96##</td></row>
		<row><td>1907</td><td>##IDS_ERROR_97##</td></row>
		<row><td>1908</td><td>##IDS_ERROR_98##</td></row>
		<row><td>1909</td><td>##IDS_ERROR_99##</td></row>
		<row><td>1910</td><td>##IDS_ERROR_100##</td></row>
		<row><td>1911</td><td>##IDS_ERROR_101##</td></row>
		<row><td>1912</td><td>##IDS_ERROR_102##</td></row>
		<row><td>1913</td><td>##IDS_ERROR_103##</td></row>
		<row><td>1914</td><td>##IDS_ERROR_104##</td></row>
		<row><td>1915</td><td>##IDS_ERROR_105##</td></row>
		<row><td>1916</td><td>##IDS_ERROR_106##</td></row>
		<row><td>1917</td><td>##IDS_ERROR_107##</td></row>
		<row><td>1918</td><td>##IDS_ERROR_108##</td></row>
		<row><td>1919</td><td>##IDS_ERROR_109##</td></row>
		<row><td>1920</td><td>##IDS_ERROR_110##</td></row>
		<row><td>1921</td><td>##IDS_ERROR_111##</td></row>
		<row><td>1922</td><td>##IDS_ERROR_112##</td></row>
		<row><td>1923</td><td>##IDS_ERROR_113##</td></row>
		<row><td>1924</td><td>##IDS_ERROR_114##</td></row>
		<row><td>1925</td><td>##IDS_ERROR_115##</td></row>
		<row><td>1926</td><td>##IDS_ERROR_116##</td></row>
		<row><td>1927</td><td>##IDS_ERROR_117##</td></row>
		<row><td>1928</td><td>##IDS_ERROR_118##</td></row>
		<row><td>1929</td><td>##IDS_ERROR_119##</td></row>
		<row><td>1930</td><td>##IDS_ERROR_125##</td></row>
		<row><td>1931</td><td>##IDS_ERROR_126##</td></row>
		<row><td>1932</td><td>##IDS_ERROR_127##</td></row>
		<row><td>1933</td><td>##IDS_ERROR_128##</td></row>
		<row><td>1934</td><td>##IDS_ERROR_129##</td></row>
		<row><td>1935</td><td>##IDS_ERROR_1935##</td></row>
		<row><td>1936</td><td>##IDS_ERROR_1936##</td></row>
		<row><td>1937</td><td>##IDS_ERROR_1937##</td></row>
		<row><td>1938</td><td>##IDS_ERROR_1938##</td></row>
		<row><td>2</td><td>##IDS_ERROR_2##</td></row>
		<row><td>20</td><td>##IDS_ERROR_18##</td></row>
		<row><td>21</td><td>##IDS_ERROR_19##</td></row>
		<row><td>2101</td><td>##IDS_ERROR_2101##</td></row>
		<row><td>2102</td><td>##IDS_ERROR_2102##</td></row>
		<row><td>2103</td><td>##IDS_ERROR_2103##</td></row>
		<row><td>2104</td><td>##IDS_ERROR_2104##</td></row>
		<row><td>2105</td><td>##IDS_ERROR_2105##</td></row>
		<row><td>2106</td><td>##IDS_ERROR_2106##</td></row>
		<row><td>2107</td><td>##IDS_ERROR_2107##</td></row>
		<row><td>2108</td><td>##IDS_ERROR_2108##</td></row>
		<row><td>2109</td><td>##IDS_ERROR_2109##</td></row>
		<row><td>2110</td><td>##IDS_ERROR_2110##</td></row>
		<row><td>2111</td><td>##IDS_ERROR_2111##</td></row>
		<row><td>2112</td><td>##IDS_ERROR_2112##</td></row>
		<row><td>2113</td><td>##IDS_ERROR_2113##</td></row>
		<row><td>22</td><td>##IDS_ERROR_120##</td></row>
		<row><td>2200</td><td>##IDS_ERROR_2200##</td></row>
		<row><td>2201</td><td>##IDS_ERROR_2201##</td></row>
		<row><td>2202</td><td>##IDS_ERROR_2202##</td></row>
		<row><td>2203</td><td>##IDS_ERROR_2203##</td></row>
		<row><td>2204</td><td>##IDS_ERROR_2204##</td></row>
		<row><td>2205</td><td>##IDS_ERROR_2205##</td></row>
		<row><td>2206</td><td>##IDS_ERROR_2206##</td></row>
		<row><td>2207</td><td>##IDS_ERROR_2207##</td></row>
		<row><td>2208</td><td>##IDS_ERROR_2208##</td></row>
		<row><td>2209</td><td>##IDS_ERROR_2209##</td></row>
		<row><td>2210</td><td>##IDS_ERROR_2210##</td></row>
		<row><td>2211</td><td>##IDS_ERROR_2211##</td></row>
		<row><td>2212</td><td>##IDS_ERROR_2212##</td></row>
		<row><td>2213</td><td>##IDS_ERROR_2213##</td></row>
		<row><td>2214</td><td>##IDS_ERROR_2214##</td></row>
		<row><td>2215</td><td>##IDS_ERROR_2215##</td></row>
		<row><td>2216</td><td>##IDS_ERROR_2216##</td></row>
		<row><td>2217</td><td>##IDS_ERROR_2217##</td></row>
		<row><td>2218</td><td>##IDS_ERROR_2218##</td></row>
		<row><td>2219</td><td>##IDS_ERROR_2219##</td></row>
		<row><td>2220</td><td>##IDS_ERROR_2220##</td></row>
		<row><td>2221</td><td>##IDS_ERROR_2221##</td></row>
		<row><td>2222</td><td>##IDS_ERROR_2222##</td></row>
		<row><td>2223</td><td>##IDS_ERROR_2223##</td></row>
		<row><td>2224</td><td>##IDS_ERROR_2224##</td></row>
		<row><td>2225</td><td>##IDS_ERROR_2225##</td></row>
		<row><td>2226</td><td>##IDS_ERROR_2226##</td></row>
		<row><td>2227</td><td>##IDS_ERROR_2227##</td></row>
		<row><td>2228</td><td>##IDS_ERROR_2228##</td></row>
		<row><td>2229</td><td>##IDS_ERROR_2229##</td></row>
		<row><td>2230</td><td>##IDS_ERROR_2230##</td></row>
		<row><td>2231</td><td>##IDS_ERROR_2231##</td></row>
		<row><td>2232</td><td>##IDS_ERROR_2232##</td></row>
		<row><td>2233</td><td>##IDS_ERROR_2233##</td></row>
		<row><td>2234</td><td>##IDS_ERROR_2234##</td></row>
		<row><td>2235</td><td>##IDS_ERROR_2235##</td></row>
		<row><td>2236</td><td>##IDS_ERROR_2236##</td></row>
		<row><td>2237</td><td>##IDS_ERROR_2237##</td></row>
		<row><td>2238</td><td>##IDS_ERROR_2238##</td></row>
		<row><td>2239</td><td>##IDS_ERROR_2239##</td></row>
		<row><td>2240</td><td>##IDS_ERROR_2240##</td></row>
		<row><td>2241</td><td>##IDS_ERROR_2241##</td></row>
		<row><td>2242</td><td>##IDS_ERROR_2242##</td></row>
		<row><td>2243</td><td>##IDS_ERROR_2243##</td></row>
		<row><td>2244</td><td>##IDS_ERROR_2244##</td></row>
		<row><td>2245</td><td>##IDS_ERROR_2245##</td></row>
		<row><td>2246</td><td>##IDS_ERROR_2246##</td></row>
		<row><td>2247</td><td>##IDS_ERROR_2247##</td></row>
		<row><td>2248</td><td>##IDS_ERROR_2248##</td></row>
		<row><td>2249</td><td>##IDS_ERROR_2249##</td></row>
		<row><td>2250</td><td>##IDS_ERROR_2250##</td></row>
		<row><td>2251</td><td>##IDS_ERROR_2251##</td></row>
		<row><td>2252</td><td>##IDS_ERROR_2252##</td></row>
		<row><td>2253</td><td>##IDS_ERROR_2253##</td></row>
		<row><td>2254</td><td>##IDS_ERROR_2254##</td></row>
		<row><td>2255</td><td>##IDS_ERROR_2255##</td></row>
		<row><td>2256</td><td>##IDS_ERROR_2256##</td></row>
		<row><td>2257</td><td>##IDS_ERROR_2257##</td></row>
		<row><td>2258</td><td>##IDS_ERROR_2258##</td></row>
		<row><td>2259</td><td>##IDS_ERROR_2259##</td></row>
		<row><td>2260</td><td>##IDS_ERROR_2260##</td></row>
		<row><td>2261</td><td>##IDS_ERROR_2261##</td></row>
		<row><td>2262</td><td>##IDS_ERROR_2262##</td></row>
		<row><td>2263</td><td>##IDS_ERROR_2263##</td></row>
		<row><td>2264</td><td>##IDS_ERROR_2264##</td></row>
		<row><td>2265</td><td>##IDS_ERROR_2265##</td></row>
		<row><td>2266</td><td>##IDS_ERROR_2266##</td></row>
		<row><td>2267</td><td>##IDS_ERROR_2267##</td></row>
		<row><td>2268</td><td>##IDS_ERROR_2268##</td></row>
		<row><td>2269</td><td>##IDS_ERROR_2269##</td></row>
		<row><td>2270</td><td>##IDS_ERROR_2270##</td></row>
		<row><td>2271</td><td>##IDS_ERROR_2271##</td></row>
		<row><td>2272</td><td>##IDS_ERROR_2272##</td></row>
		<row><td>2273</td><td>##IDS_ERROR_2273##</td></row>
		<row><td>2274</td><td>##IDS_ERROR_2274##</td></row>
		<row><td>2275</td><td>##IDS_ERROR_2275##</td></row>
		<row><td>2276</td><td>##IDS_ERROR_2276##</td></row>
		<row><td>2277</td><td>##IDS_ERROR_2277##</td></row>
		<row><td>2278</td><td>##IDS_ERROR_2278##</td></row>
		<row><td>2279</td><td>##IDS_ERROR_2279##</td></row>
		<row><td>2280</td><td>##IDS_ERROR_2280##</td></row>
		<row><td>2281</td><td>##IDS_ERROR_2281##</td></row>
		<row><td>2282</td><td>##IDS_ERROR_2282##</td></row>
		<row><td>23</td><td>##IDS_ERROR_121##</td></row>
		<row><td>2302</td><td>##IDS_ERROR_2302##</td></row>
		<row><td>2303</td><td>##IDS_ERROR_2303##</td></row>
		<row><td>2304</td><td>##IDS_ERROR_2304##</td></row>
		<row><td>2305</td><td>##IDS_ERROR_2305##</td></row>
		<row><td>2306</td><td>##IDS_ERROR_2306##</td></row>
		<row><td>2307</td><td>##IDS_ERROR_2307##</td></row>
		<row><td>2308</td><td>##IDS_ERROR_2308##</td></row>
		<row><td>2309</td><td>##IDS_ERROR_2309##</td></row>
		<row><td>2310</td><td>##IDS_ERROR_2310##</td></row>
		<row><td>2315</td><td>##IDS_ERROR_2315##</td></row>
		<row><td>2318</td><td>##IDS_ERROR_2318##</td></row>
		<row><td>2319</td><td>##IDS_ERROR_2319##</td></row>
		<row><td>2320</td><td>##IDS_ERROR_2320##</td></row>
		<row><td>2321</td><td>##IDS_ERROR_2321##</td></row>
		<row><td>2322</td><td>##IDS_ERROR_2322##</td></row>
		<row><td>2323</td><td>##IDS_ERROR_2323##</td></row>
		<row><td>2324</td><td>##IDS_ERROR_2324##</td></row>
		<row><td>2325</td><td>##IDS_ERROR_2325##</td></row>
		<row><td>2326</td><td>##IDS_ERROR_2326##</td></row>
		<row><td>2327</td><td>##IDS_ERROR_2327##</td></row>
		<row><td>2328</td><td>##IDS_ERROR_2328##</td></row>
		<row><td>2329</td><td>##IDS_ERROR_2329##</td></row>
		<row><td>2330</td><td>##IDS_ERROR_2330##</td></row>
		<row><td>2331</td><td>##IDS_ERROR_2331##</td></row>
		<row><td>2332</td><td>##IDS_ERROR_2332##</td></row>
		<row><td>2333</td><td>##IDS_ERROR_2333##</td></row>
		<row><td>2334</td><td>##IDS_ERROR_2334##</td></row>
		<row><td>2335</td><td>##IDS_ERROR_2335##</td></row>
		<row><td>2336</td><td>##IDS_ERROR_2336##</td></row>
		<row><td>2337</td><td>##IDS_ERROR_2337##</td></row>
		<row><td>2338</td><td>##IDS_ERROR_2338##</td></row>
		<row><td>2339</td><td>##IDS_ERROR_2339##</td></row>
		<row><td>2340</td><td>##IDS_ERROR_2340##</td></row>
		<row><td>2341</td><td>##IDS_ERROR_2341##</td></row>
		<row><td>2342</td><td>##IDS_ERROR_2342##</td></row>
		<row><td>2343</td><td>##IDS_ERROR_2343##</td></row>
		<row><td>2344</td><td>##IDS_ERROR_2344##</td></row>
		<row><td>2345</td><td>##IDS_ERROR_2345##</td></row>
		<row><td>2347</td><td>##IDS_ERROR_2347##</td></row>
		<row><td>2348</td><td>##IDS_ERROR_2348##</td></row>
		<row><td>2349</td><td>##IDS_ERROR_2349##</td></row>
		<row><td>2350</td><td>##IDS_ERROR_2350##</td></row>
		<row><td>2351</td><td>##IDS_ERROR_2351##</td></row>
		<row><td>2352</td><td>##IDS_ERROR_2352##</td></row>
		<row><td>2353</td><td>##IDS_ERROR_2353##</td></row>
		<row><td>2354</td><td>##IDS_ERROR_2354##</td></row>
		<row><td>2355</td><td>##IDS_ERROR_2355##</td></row>
		<row><td>2356</td><td>##IDS_ERROR_2356##</td></row>
		<row><td>2357</td><td>##IDS_ERROR_2357##</td></row>
		<row><td>2358</td><td>##IDS_ERROR_2358##</td></row>
		<row><td>2359</td><td>##IDS_ERROR_2359##</td></row>
		<row><td>2360</td><td>##IDS_ERROR_2360##</td></row>
		<row><td>2361</td><td>##IDS_ERROR_2361##</td></row>
		<row><td>2362</td><td>##IDS_ERROR_2362##</td></row>
		<row><td>2363</td><td>##IDS_ERROR_2363##</td></row>
		<row><td>2364</td><td>##IDS_ERROR_2364##</td></row>
		<row><td>2365</td><td>##IDS_ERROR_2365##</td></row>
		<row><td>2366</td><td>##IDS_ERROR_2366##</td></row>
		<row><td>2367</td><td>##IDS_ERROR_2367##</td></row>
		<row><td>2368</td><td>##IDS_ERROR_2368##</td></row>
		<row><td>2370</td><td>##IDS_ERROR_2370##</td></row>
		<row><td>2371</td><td>##IDS_ERROR_2371##</td></row>
		<row><td>2372</td><td>##IDS_ERROR_2372##</td></row>
		<row><td>2373</td><td>##IDS_ERROR_2373##</td></row>
		<row><td>2374</td><td>##IDS_ERROR_2374##</td></row>
		<row><td>2375</td><td>##IDS_ERROR_2375##</td></row>
		<row><td>2376</td><td>##IDS_ERROR_2376##</td></row>
		<row><td>2379</td><td>##IDS_ERROR_2379##</td></row>
		<row><td>2380</td><td>##IDS_ERROR_2380##</td></row>
		<row><td>2381</td><td>##IDS_ERROR_2381##</td></row>
		<row><td>2382</td><td>##IDS_ERROR_2382##</td></row>
		<row><td>2401</td><td>##IDS_ERROR_2401##</td></row>
		<row><td>2402</td><td>##IDS_ERROR_2402##</td></row>
		<row><td>2501</td><td>##IDS_ERROR_2501##</td></row>
		<row><td>2502</td><td>##IDS_ERROR_2502##</td></row>
		<row><td>2503</td><td>##IDS_ERROR_2503##</td></row>
		<row><td>2601</td><td>##IDS_ERROR_2601##</td></row>
		<row><td>2602</td><td>##IDS_ERROR_2602##</td></row>
		<row><td>2603</td><td>##IDS_ERROR_2603##</td></row>
		<row><td>2604</td><td>##IDS_ERROR_2604##</td></row>
		<row><td>2605</td><td>##IDS_ERROR_2605##</td></row>
		<row><td>2606</td><td>##IDS_ERROR_2606##</td></row>
		<row><td>2607</td><td>##IDS_ERROR_2607##</td></row>
		<row><td>2608</td><td>##IDS_ERROR_2608##</td></row>
		<row><td>2609</td><td>##IDS_ERROR_2609##</td></row>
		<row><td>2611</td><td>##IDS_ERROR_2611##</td></row>
		<row><td>2612</td><td>##IDS_ERROR_2612##</td></row>
		<row><td>2613</td><td>##IDS_ERROR_2613##</td></row>
		<row><td>2614</td><td>##IDS_ERROR_2614##</td></row>
		<row><td>2615</td><td>##IDS_ERROR_2615##</td></row>
		<row><td>2616</td><td>##IDS_ERROR_2616##</td></row>
		<row><td>2617</td><td>##IDS_ERROR_2617##</td></row>
		<row><td>2618</td><td>##IDS_ERROR_2618##</td></row>
		<row><td>2619</td><td>##IDS_ERROR_2619##</td></row>
		<row><td>2620</td><td>##IDS_ERROR_2620##</td></row>
		<row><td>2621</td><td>##IDS_ERROR_2621##</td></row>
		<row><td>2701</td><td>##IDS_ERROR_2701##</td></row>
		<row><td>2702</td><td>##IDS_ERROR_2702##</td></row>
		<row><td>2703</td><td>##IDS_ERROR_2703##</td></row>
		<row><td>2704</td><td>##IDS_ERROR_2704##</td></row>
		<row><td>2705</td><td>##IDS_ERROR_2705##</td></row>
		<row><td>2706</td><td>##IDS_ERROR_2706##</td></row>
		<row><td>2707</td><td>##IDS_ERROR_2707##</td></row>
		<row><td>2708</td><td>##IDS_ERROR_2708##</td></row>
		<row><td>2709</td><td>##IDS_ERROR_2709##</td></row>
		<row><td>2710</td><td>##IDS_ERROR_2710##</td></row>
		<row><td>2711</td><td>##IDS_ERROR_2711##</td></row>
		<row><td>2712</td><td>##IDS_ERROR_2712##</td></row>
		<row><td>2713</td><td>##IDS_ERROR_2713##</td></row>
		<row><td>2714</td><td>##IDS_ERROR_2714##</td></row>
		<row><td>2715</td><td>##IDS_ERROR_2715##</td></row>
		<row><td>2716</td><td>##IDS_ERROR_2716##</td></row>
		<row><td>2717</td><td>##IDS_ERROR_2717##</td></row>
		<row><td>2718</td><td>##IDS_ERROR_2718##</td></row>
		<row><td>2719</td><td>##IDS_ERROR_2719##</td></row>
		<row><td>2720</td><td>##IDS_ERROR_2720##</td></row>
		<row><td>2721</td><td>##IDS_ERROR_2721##</td></row>
		<row><td>2722</td><td>##IDS_ERROR_2722##</td></row>
		<row><td>2723</td><td>##IDS_ERROR_2723##</td></row>
		<row><td>2724</td><td>##IDS_ERROR_2724##</td></row>
		<row><td>2725</td><td>##IDS_ERROR_2725##</td></row>
		<row><td>2726</td><td>##IDS_ERROR_2726##</td></row>
		<row><td>2727</td><td>##IDS_ERROR_2727##</td></row>
		<row><td>2728</td><td>##IDS_ERROR_2728##</td></row>
		<row><td>2729</td><td>##IDS_ERROR_2729##</td></row>
		<row><td>2730</td><td>##IDS_ERROR_2730##</td></row>
		<row><td>2731</td><td>##IDS_ERROR_2731##</td></row>
		<row><td>2732</td><td>##IDS_ERROR_2732##</td></row>
		<row><td>2733</td><td>##IDS_ERROR_2733##</td></row>
		<row><td>2734</td><td>##IDS_ERROR_2734##</td></row>
		<row><td>2735</td><td>##IDS_ERROR_2735##</td></row>
		<row><td>2736</td><td>##IDS_ERROR_2736##</td></row>
		<row><td>2737</td><td>##IDS_ERROR_2737##</td></row>
		<row><td>2738</td><td>##IDS_ERROR_2738##</td></row>
		<row><td>2739</td><td>##IDS_ERROR_2739##</td></row>
		<row><td>2740</td><td>##IDS_ERROR_2740##</td></row>
		<row><td>2741</td><td>##IDS_ERROR_2741##</td></row>
		<row><td>2742</td><td>##IDS_ERROR_2742##</td></row>
		<row><td>2743</td><td>##IDS_ERROR_2743##</td></row>
		<row><td>2744</td><td>##IDS_ERROR_2744##</td></row>
		<row><td>2745</td><td>##IDS_ERROR_2745##</td></row>
		<row><td>2746</td><td>##IDS_ERROR_2746##</td></row>
		<row><td>2747</td><td>##IDS_ERROR_2747##</td></row>
		<row><td>2748</td><td>##IDS_ERROR_2748##</td></row>
		<row><td>2749</td><td>##IDS_ERROR_2749##</td></row>
		<row><td>2750</td><td>##IDS_ERROR_2750##</td></row>
		<row><td>27500</td><td>##IDS_ERROR_130##</td></row>
		<row><td>27501</td><td>##IDS_ERROR_131##</td></row>
		<row><td>27502</td><td>##IDS_ERROR_27502##</td></row>
		<row><td>27503</td><td>##IDS_ERROR_27503##</td></row>
		<row><td>27504</td><td>##IDS_ERROR_27504##</td></row>
		<row><td>27505</td><td>##IDS_ERROR_27505##</td></row>
		<row><td>27506</td><td>##IDS_ERROR_27506##</td></row>
		<row><td>27507</td><td>##IDS_ERROR_27507##</td></row>
		<row><td>27508</td><td>##IDS_ERROR_27508##</td></row>
		<row><td>27509</td><td>##IDS_ERROR_27509##</td></row>
		<row><td>2751</td><td>##IDS_ERROR_2751##</td></row>
		<row><td>27510</td><td>##IDS_ERROR_27510##</td></row>
		<row><td>27511</td><td>##IDS_ERROR_27511##</td></row>
		<row><td>27512</td><td>##IDS_ERROR_27512##</td></row>
		<row><td>27513</td><td>##IDS_ERROR_27513##</td></row>
		<row><td>27514</td><td>##IDS_ERROR_27514##</td></row>
		<row><td>27515</td><td>##IDS_ERROR_27515##</td></row>
		<row><td>27516</td><td>##IDS_ERROR_27516##</td></row>
		<row><td>27517</td><td>##IDS_ERROR_27517##</td></row>
		<row><td>27518</td><td>##IDS_ERROR_27518##</td></row>
		<row><td>27519</td><td>##IDS_ERROR_27519##</td></row>
		<row><td>2752</td><td>##IDS_ERROR_2752##</td></row>
		<row><td>27520</td><td>##IDS_ERROR_27520##</td></row>
		<row><td>27521</td><td>##IDS_ERROR_27521##</td></row>
		<row><td>27522</td><td>##IDS_ERROR_27522##</td></row>
		<row><td>27523</td><td>##IDS_ERROR_27523##</td></row>
		<row><td>27524</td><td>##IDS_ERROR_27524##</td></row>
		<row><td>27525</td><td>##IDS_ERROR_27525##</td></row>
		<row><td>27526</td><td>##IDS_ERROR_27526##</td></row>
		<row><td>27527</td><td>##IDS_ERROR_27527##</td></row>
		<row><td>27528</td><td>##IDS_ERROR_27528##</td></row>
		<row><td>27529</td><td>##IDS_ERROR_27529##</td></row>
		<row><td>2753</td><td>##IDS_ERROR_2753##</td></row>
		<row><td>27530</td><td>##IDS_ERROR_27530##</td></row>
		<row><td>27531</td><td>##IDS_ERROR_27531##</td></row>
		<row><td>27532</td><td>##IDS_ERROR_27532##</td></row>
		<row><td>27533</td><td>##IDS_ERROR_27533##</td></row>
		<row><td>27534</td><td>##IDS_ERROR_27534##</td></row>
		<row><td>27535</td><td>##IDS_ERROR_27535##</td></row>
		<row><td>27536</td><td>##IDS_ERROR_27536##</td></row>
		<row><td>27537</td><td>##IDS_ERROR_27537##</td></row>
		<row><td>27538</td><td>##IDS_ERROR_27538##</td></row>
		<row><td>27539</td><td>##IDS_ERROR_27539##</td></row>
		<row><td>2754</td><td>##IDS_ERROR_2754##</td></row>
		<row><td>27540</td><td>##IDS_ERROR_27540##</td></row>
		<row><td>27541</td><td>##IDS_ERROR_27541##</td></row>
		<row><td>27542</td><td>##IDS_ERROR_27542##</td></row>
		<row><td>27543</td><td>##IDS_ERROR_27543##</td></row>
		<row><td>27544</td><td>##IDS_ERROR_27544##</td></row>
		<row><td>27545</td><td>##IDS_ERROR_27545##</td></row>
		<row><td>27546</td><td>##IDS_ERROR_27546##</td></row>
		<row><td>27547</td><td>##IDS_ERROR_27547##</td></row>
		<row><td>27548</td><td>##IDS_ERROR_27548##</td></row>
		<row><td>27549</td><td>##IDS_ERROR_27549##</td></row>
		<row><td>2755</td><td>##IDS_ERROR_2755##</td></row>
		<row><td>27550</td><td>##IDS_ERROR_27550##</td></row>
		<row><td>27551</td><td>##IDS_ERROR_27551##</td></row>
		<row><td>27552</td><td>##IDS_ERROR_27552##</td></row>
		<row><td>27553</td><td>##IDS_ERROR_27553##</td></row>
		<row><td>27554</td><td>##IDS_ERROR_27554##</td></row>
		<row><td>27555</td><td>##IDS_ERROR_27555##</td></row>
		<row><td>2756</td><td>##IDS_ERROR_2756##</td></row>
		<row><td>2757</td><td>##IDS_ERROR_2757##</td></row>
		<row><td>2758</td><td>##IDS_ERROR_2758##</td></row>
		<row><td>2759</td><td>##IDS_ERROR_2759##</td></row>
		<row><td>2760</td><td>##IDS_ERROR_2760##</td></row>
		<row><td>2761</td><td>##IDS_ERROR_2761##</td></row>
		<row><td>2762</td><td>##IDS_ERROR_2762##</td></row>
		<row><td>2763</td><td>##IDS_ERROR_2763##</td></row>
		<row><td>2765</td><td>##IDS_ERROR_2765##</td></row>
		<row><td>2766</td><td>##IDS_ERROR_2766##</td></row>
		<row><td>2767</td><td>##IDS_ERROR_2767##</td></row>
		<row><td>2768</td><td>##IDS_ERROR_2768##</td></row>
		<row><td>2769</td><td>##IDS_ERROR_2769##</td></row>
		<row><td>2770</td><td>##IDS_ERROR_2770##</td></row>
		<row><td>2771</td><td>##IDS_ERROR_2771##</td></row>
		<row><td>2772</td><td>##IDS_ERROR_2772##</td></row>
		<row><td>2801</td><td>##IDS_ERROR_2801##</td></row>
		<row><td>2802</td><td>##IDS_ERROR_2802##</td></row>
		<row><td>2803</td><td>##IDS_ERROR_2803##</td></row>
		<row><td>2804</td><td>##IDS_ERROR_2804##</td></row>
		<row><td>2806</td><td>##IDS_ERROR_2806##</td></row>
		<row><td>2807</td><td>##IDS_ERROR_2807##</td></row>
		<row><td>2808</td><td>##IDS_ERROR_2808##</td></row>
		<row><td>2809</td><td>##IDS_ERROR_2809##</td></row>
		<row><td>2810</td><td>##IDS_ERROR_2810##</td></row>
		<row><td>2811</td><td>##IDS_ERROR_2811##</td></row>
		<row><td>2812</td><td>##IDS_ERROR_2812##</td></row>
		<row><td>2813</td><td>##IDS_ERROR_2813##</td></row>
		<row><td>2814</td><td>##IDS_ERROR_2814##</td></row>
		<row><td>2815</td><td>##IDS_ERROR_2815##</td></row>
		<row><td>2816</td><td>##IDS_ERROR_2816##</td></row>
		<row><td>2817</td><td>##IDS_ERROR_2817##</td></row>
		<row><td>2818</td><td>##IDS_ERROR_2818##</td></row>
		<row><td>2819</td><td>##IDS_ERROR_2819##</td></row>
		<row><td>2820</td><td>##IDS_ERROR_2820##</td></row>
		<row><td>2821</td><td>##IDS_ERROR_2821##</td></row>
		<row><td>2822</td><td>##IDS_ERROR_2822##</td></row>
		<row><td>2823</td><td>##IDS_ERROR_2823##</td></row>
		<row><td>2824</td><td>##IDS_ERROR_2824##</td></row>
		<row><td>2825</td><td>##IDS_ERROR_2825##</td></row>
		<row><td>2826</td><td>##IDS_ERROR_2826##</td></row>
		<row><td>2827</td><td>##IDS_ERROR_2827##</td></row>
		<row><td>2828</td><td>##IDS_ERROR_2828##</td></row>
		<row><td>2829</td><td>##IDS_ERROR_2829##</td></row>
		<row><td>2830</td><td>##IDS_ERROR_2830##</td></row>
		<row><td>2831</td><td>##IDS_ERROR_2831##</td></row>
		<row><td>2832</td><td>##IDS_ERROR_2832##</td></row>
		<row><td>2833</td><td>##IDS_ERROR_2833##</td></row>
		<row><td>2834</td><td>##IDS_ERROR_2834##</td></row>
		<row><td>2835</td><td>##IDS_ERROR_2835##</td></row>
		<row><td>2836</td><td>##IDS_ERROR_2836##</td></row>
		<row><td>2837</td><td>##IDS_ERROR_2837##</td></row>
		<row><td>2838</td><td>##IDS_ERROR_2838##</td></row>
		<row><td>2839</td><td>##IDS_ERROR_2839##</td></row>
		<row><td>2840</td><td>##IDS_ERROR_2840##</td></row>
		<row><td>2841</td><td>##IDS_ERROR_2841##</td></row>
		<row><td>2842</td><td>##IDS_ERROR_2842##</td></row>
		<row><td>2843</td><td>##IDS_ERROR_2843##</td></row>
		<row><td>2844</td><td>##IDS_ERROR_2844##</td></row>
		<row><td>2845</td><td>##IDS_ERROR_2845##</td></row>
		<row><td>2846</td><td>##IDS_ERROR_2846##</td></row>
		<row><td>2847</td><td>##IDS_ERROR_2847##</td></row>
		<row><td>2848</td><td>##IDS_ERROR_2848##</td></row>
		<row><td>2849</td><td>##IDS_ERROR_2849##</td></row>
		<row><td>2850</td><td>##IDS_ERROR_2850##</td></row>
		<row><td>2851</td><td>##IDS_ERROR_2851##</td></row>
		<row><td>2852</td><td>##IDS_ERROR_2852##</td></row>
		<row><td>2853</td><td>##IDS_ERROR_2853##</td></row>
		<row><td>2854</td><td>##IDS_ERROR_2854##</td></row>
		<row><td>2855</td><td>##IDS_ERROR_2855##</td></row>
		<row><td>2856</td><td>##IDS_ERROR_2856##</td></row>
		<row><td>2857</td><td>##IDS_ERROR_2857##</td></row>
		<row><td>2858</td><td>##IDS_ERROR_2858##</td></row>
		<row><td>2859</td><td>##IDS_ERROR_2859##</td></row>
		<row><td>2860</td><td>##IDS_ERROR_2860##</td></row>
		<row><td>2861</td><td>##IDS_ERROR_2861##</td></row>
		<row><td>2862</td><td>##IDS_ERROR_2862##</td></row>
		<row><td>2863</td><td>##IDS_ERROR_2863##</td></row>
		<row><td>2864</td><td>##IDS_ERROR_2864##</td></row>
		<row><td>2865</td><td>##IDS_ERROR_2865##</td></row>
		<row><td>2866</td><td>##IDS_ERROR_2866##</td></row>
		<row><td>2867</td><td>##IDS_ERROR_2867##</td></row>
		<row><td>2868</td><td>##IDS_ERROR_2868##</td></row>
		<row><td>2869</td><td>##IDS_ERROR_2869##</td></row>
		<row><td>2870</td><td>##IDS_ERROR_2870##</td></row>
		<row><td>2871</td><td>##IDS_ERROR_2871##</td></row>
		<row><td>2872</td><td>##IDS_ERROR_2872##</td></row>
		<row><td>2873</td><td>##IDS_ERROR_2873##</td></row>
		<row><td>2874</td><td>##IDS_ERROR_2874##</td></row>
		<row><td>2875</td><td>##IDS_ERROR_2875##</td></row>
		<row><td>2876</td><td>##IDS_ERROR_2876##</td></row>
		<row><td>2877</td><td>##IDS_ERROR_2877##</td></row>
		<row><td>2878</td><td>##IDS_ERROR_2878##</td></row>
		<row><td>2879</td><td>##IDS_ERROR_2879##</td></row>
		<row><td>2880</td><td>##IDS_ERROR_2880##</td></row>
		<row><td>2881</td><td>##IDS_ERROR_2881##</td></row>
		<row><td>2882</td><td>##IDS_ERROR_2882##</td></row>
		<row><td>2883</td><td>##IDS_ERROR_2883##</td></row>
		<row><td>2884</td><td>##IDS_ERROR_2884##</td></row>
		<row><td>2885</td><td>##IDS_ERROR_2885##</td></row>
		<row><td>2886</td><td>##IDS_ERROR_2886##</td></row>
		<row><td>2887</td><td>##IDS_ERROR_2887##</td></row>
		<row><td>2888</td><td>##IDS_ERROR_2888##</td></row>
		<row><td>2889</td><td>##IDS_ERROR_2889##</td></row>
		<row><td>2890</td><td>##IDS_ERROR_2890##</td></row>
		<row><td>2891</td><td>##IDS_ERROR_2891##</td></row>
		<row><td>2892</td><td>##IDS_ERROR_2892##</td></row>
		<row><td>2893</td><td>##IDS_ERROR_2893##</td></row>
		<row><td>2894</td><td>##IDS_ERROR_2894##</td></row>
		<row><td>2895</td><td>##IDS_ERROR_2895##</td></row>
		<row><td>2896</td><td>##IDS_ERROR_2896##</td></row>
		<row><td>2897</td><td>##IDS_ERROR_2897##</td></row>
		<row><td>2898</td><td>##IDS_ERROR_2898##</td></row>
		<row><td>2899</td><td>##IDS_ERROR_2899##</td></row>
		<row><td>2901</td><td>##IDS_ERROR_2901##</td></row>
		<row><td>2902</td><td>##IDS_ERROR_2902##</td></row>
		<row><td>2903</td><td>##IDS_ERROR_2903##</td></row>
		<row><td>2904</td><td>##IDS_ERROR_2904##</td></row>
		<row><td>2905</td><td>##IDS_ERROR_2905##</td></row>
		<row><td>2906</td><td>##IDS_ERROR_2906##</td></row>
		<row><td>2907</td><td>##IDS_ERROR_2907##</td></row>
		<row><td>2908</td><td>##IDS_ERROR_2908##</td></row>
		<row><td>2909</td><td>##IDS_ERROR_2909##</td></row>
		<row><td>2910</td><td>##IDS_ERROR_2910##</td></row>
		<row><td>2911</td><td>##IDS_ERROR_2911##</td></row>
		<row><td>2912</td><td>##IDS_ERROR_2912##</td></row>
		<row><td>2919</td><td>##IDS_ERROR_2919##</td></row>
		<row><td>2920</td><td>##IDS_ERROR_2920##</td></row>
		<row><td>2924</td><td>##IDS_ERROR_2924##</td></row>
		<row><td>2927</td><td>##IDS_ERROR_2927##</td></row>
		<row><td>2928</td><td>##IDS_ERROR_2928##</td></row>
		<row><td>2929</td><td>##IDS_ERROR_2929##</td></row>
		<row><td>2932</td><td>##IDS_ERROR_2932##</td></row>
		<row><td>2933</td><td>##IDS_ERROR_2933##</td></row>
		<row><td>2934</td><td>##IDS_ERROR_2934##</td></row>
		<row><td>2935</td><td>##IDS_ERROR_2935##</td></row>
		<row><td>2936</td><td>##IDS_ERROR_2936##</td></row>
		<row><td>2937</td><td>##IDS_ERROR_2937##</td></row>
		<row><td>2938</td><td>##IDS_ERROR_2938##</td></row>
		<row><td>2939</td><td>##IDS_ERROR_2939##</td></row>
		<row><td>2940</td><td>##IDS_ERROR_2940##</td></row>
		<row><td>2941</td><td>##IDS_ERROR_2941##</td></row>
		<row><td>2942</td><td>##IDS_ERROR_2942##</td></row>
		<row><td>2943</td><td>##IDS_ERROR_2943##</td></row>
		<row><td>2944</td><td>##IDS_ERROR_2944##</td></row>
		<row><td>2945</td><td>##IDS_ERROR_2945##</td></row>
		<row><td>3001</td><td>##IDS_ERROR_3001##</td></row>
		<row><td>3002</td><td>##IDS_ERROR_3002##</td></row>
		<row><td>32</td><td>##IDS_ERROR_20##</td></row>
		<row><td>33</td><td>##IDS_ERROR_21##</td></row>
		<row><td>4</td><td>##IDS_ERROR_3##</td></row>
		<row><td>5</td><td>##IDS_ERROR_4##</td></row>
		<row><td>7</td><td>##IDS_ERROR_5##</td></row>
		<row><td>8</td><td>##IDS_ERROR_6##</td></row>
		<row><td>9</td><td>##IDS_ERROR_7##</td></row>
	</table>

	<table name="EventMapping">
		<col key="yes" def="s72">Dialog_</col>
		<col key="yes" def="s50">Control_</col>
		<col key="yes" def="s50">Event</col>
		<col def="s50">Attribute</col>
		<row><td>CustomSetup</td><td>ItemDescription</td><td>SelectionDescription</td><td>Text</td></row>
		<row><td>CustomSetup</td><td>Location</td><td>SelectionPath</td><td>Text</td></row>
		<row><td>CustomSetup</td><td>Size</td><td>SelectionSize</td><td>Text</td></row>
		<row><td>SetupInitialization</td><td>ActionData</td><td>ActionData</td><td>Text</td></row>
		<row><td>SetupInitialization</td><td>ActionText</td><td>ActionText</td><td>Text</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>AdminInstallFinalize</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>InstallFiles</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>MoveFiles</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>RemoveFiles</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>RemoveRegistryValues</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>SetProgress</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>UnmoveFiles</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>WriteIniValues</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionProgress95</td><td>WriteRegistryValues</td><td>Progress</td></row>
		<row><td>SetupProgress</td><td>ActionText</td><td>ActionText</td><td>Text</td></row>
	</table>

	<table name="Extension">
		<col key="yes" def="s255">Extension</col>
		<col key="yes" def="s72">Component_</col>
		<col def="S255">ProgId_</col>
		<col def="S64">MIME_</col>
		<col def="s38">Feature_</col>
	</table>

	<table name="Feature">
		<col key="yes" def="s38">Feature</col>
		<col def="S38">Feature_Parent</col>
		<col def="L64">Title</col>
		<col def="L255">Description</col>
		<col def="I2">Display</col>
		<col def="i2">Level</col>
		<col def="S72">Directory_</col>
		<col def="i2">Attributes</col>
		<col def="S255">ISReleaseFlags</col>
		<col def="S255">ISComments</col>
		<col def="S255">ISFeatureCabName</col>
		<col def="S255">ISProFeatureName</col>
		<row><td>AlwaysInstall</td><td/><td>##DN_AlwaysInstall##</td><td>Enter the description for this feature here.</td><td>0</td><td>1</td><td>INSTALLDIR</td><td>16</td><td/><td>Enter comments regarding this feature here.</td><td/><td/></row>
	</table>

	<table name="FeatureComponents">
		<col key="yes" def="s38">Feature_</col>
		<col key="yes" def="s72">Component_</col>
		<row><td>AlwaysInstall</td><td>Antlr3.Runtime.dll</td></row>
		<row><td>AlwaysInstall</td><td>Antlr3.Runtime.dll1</td></row>
		<row><td>AlwaysInstall</td><td>DotNetOpenAuth.AspNet.dll</td></row>
		<row><td>AlwaysInstall</td><td>DotNetOpenAuth.Core.dll</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT10</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT100</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT101</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT102</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT103</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT104</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT105</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT106</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT107</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT108</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT109</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT11</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT110</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT111</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT112</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT113</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT114</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT115</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT116</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT117</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT118</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT119</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT12</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT120</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT121</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT122</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT123</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT124</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT125</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT126</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT127</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT128</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT13</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT14</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT15</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT16</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT17</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT18</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT19</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT20</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT21</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT22</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT23</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT24</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT25</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT26</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT27</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT28</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT29</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT30</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT31</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT32</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT33</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT34</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT35</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT36</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT37</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT38</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT39</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT40</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT41</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT42</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT43</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT44</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT45</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT46</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT47</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT48</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT49</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT50</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT51</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT52</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT53</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT54</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT55</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT56</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT57</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT58</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT59</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT6</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT60</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT61</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT62</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT63</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT64</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT65</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT66</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT67</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT68</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT69</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT7</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT70</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT71</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT72</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT73</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT74</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT75</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT76</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT77</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT78</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT79</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT8</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT80</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT81</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT82</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT83</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT84</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT85</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT86</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT87</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT88</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT89</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT9</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT90</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT91</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT92</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT93</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT94</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT95</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT96</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT97</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT98</td></row>
		<row><td>AlwaysInstall</td><td>ISX_DEFAULTCOMPONENT99</td></row>
		<row><td>AlwaysInstall</td><td>JDash.Mvc.PackageInstaller.exe</td></row>
		<row><td>AlwaysInstall</td><td>JDash.Mvc.StarterApplication.exe</td></row>
		<row><td>AlwaysInstall</td><td>JDash.Mvc.dll</td></row>
		<row><td>AlwaysInstall</td><td>JDash.Mvc.dll1</td></row>
		<row><td>AlwaysInstall</td><td>JDash.Mvc.dll2</td></row>
		<row><td>AlwaysInstall</td><td>JDash.MvcDemo.dll1</td></row>
		<row><td>AlwaysInstall</td><td>JDash.MySqlProvider.dll</td></row>
		<row><td>AlwaysInstall</td><td>JDash.MySqlProvider.dll2</td></row>
		<row><td>AlwaysInstall</td><td>JDash.MySqlProvider.dll3</td></row>
		<row><td>AlwaysInstall</td><td>JDash.MySqlProvider.dll4</td></row>
		<row><td>AlwaysInstall</td><td>JDash.SessionProvider.dll</td></row>
		<row><td>AlwaysInstall</td><td>JDash.SessionProvider.dll1</td></row>
		<row><td>AlwaysInstall</td><td>JDash.SessionProvider.dll2</td></row>
		<row><td>AlwaysInstall</td><td>JDash.SessionProvider.dll3</td></row>
		<row><td>AlwaysInstall</td><td>JDash.SqlProvider.dll</td></row>
		<row><td>AlwaysInstall</td><td>JDash.SqlProvider.dll2</td></row>
		<row><td>AlwaysInstall</td><td>JDash.SqlProvider.dll3</td></row>
		<row><td>AlwaysInstall</td><td>JDash.SqlProvider.dll4</td></row>
		<row><td>AlwaysInstall</td><td>JDash.dll</td></row>
		<row><td>AlwaysInstall</td><td>JDash.dll1</td></row>
		<row><td>AlwaysInstall</td><td>JDash.dll2</td></row>
		<row><td>AlwaysInstall</td><td>JDash.dll4</td></row>
		<row><td>AlwaysInstall</td><td>JDashMvc.Management.dll</td></row>
		<row><td>AlwaysInstall</td><td>Microsoft.Web.Infrastructure.dll</td></row>
		<row><td>AlwaysInstall</td><td>Microsoft.Web.WebPages.OAuth.dll</td></row>
		<row><td>AlwaysInstall</td><td>MySql.Data.Entity.dll</td></row>
		<row><td>AlwaysInstall</td><td>MySql.Data.Entity.dll1</td></row>
		<row><td>AlwaysInstall</td><td>MySql.Data.Entity.dll2</td></row>
		<row><td>AlwaysInstall</td><td>MySql.Data.Entity.dll3</td></row>
		<row><td>AlwaysInstall</td><td>MySql.Data.dll</td></row>
		<row><td>AlwaysInstall</td><td>MySql.Data.dll1</td></row>
		<row><td>AlwaysInstall</td><td>MySql.Data.dll2</td></row>
		<row><td>AlwaysInstall</td><td>Newtonsoft.Json.dll</td></row>
		<row><td>AlwaysInstall</td><td>Newtonsoft.Json.dll1</td></row>
		<row><td>AlwaysInstall</td><td>Newtonsoft.Json.dll2</td></row>
		<row><td>AlwaysInstall</td><td>Newtonsoft.Json.dll3</td></row>
		<row><td>AlwaysInstall</td><td>System.Net.Http.Formatting.dll</td></row>
		<row><td>AlwaysInstall</td><td>System.Net.Http.Formatting.dll1</td></row>
		<row><td>AlwaysInstall</td><td>System.Net.Http.Formatting.dll2</td></row>
		<row><td>AlwaysInstall</td><td>System.Net.Http.WebRequest.dll</td></row>
		<row><td>AlwaysInstall</td><td>System.Net.Http.WebRequest.dll1</td></row>
		<row><td>AlwaysInstall</td><td>System.Net.Http.dll</td></row>
		<row><td>AlwaysInstall</td><td>System.Net.Http.dll1</td></row>
		<row><td>AlwaysInstall</td><td>System.Net.Http.dll2</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Helpers.dll</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Helpers.dll1</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Helpers.dll2</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Helpers.dll3</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Http.WebHost.dll</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Http.WebHost.dll1</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Http.WebHost.dll2</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Http.WebHost.dll3</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Http.dll</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Http.dll1</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Http.dll2</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Http.dll3</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Mvc.dll</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Mvc.dll1</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Mvc.dll2</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Mvc.dll3</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Optimization.dll</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Optimization.dll1</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Optimization.dll2</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Razor.dll</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Razor.dll1</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Razor.dll2</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.Razor.dll3</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.WebPages.Deployment.dll</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.WebPages.Deployment.dll1</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.WebPages.Deployment.dll2</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.WebPages.Deployment.dll3</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.WebPages.Razor.dll</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.WebPages.Razor.dll1</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.WebPages.Razor.dll2</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.WebPages.Razor.dll3</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.WebPages.dll</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.WebPages.dll1</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.WebPages.dll2</td></row>
		<row><td>AlwaysInstall</td><td>System.Web.WebPages.dll3</td></row>
		<row><td>AlwaysInstall</td><td>WG.exe</td></row>
		<row><td>AlwaysInstall</td><td>WebGrease.dll</td></row>
		<row><td>AlwaysInstall</td><td>WebGrease.dll1</td></row>
		<row><td>AlwaysInstall</td><td>WebGrease.dll2</td></row>
		<row><td>AlwaysInstall</td><td>WebMatrix.Data.dll</td></row>
		<row><td>AlwaysInstall</td><td>WebMatrix.WebData.dll</td></row>
	</table>

	<table name="File">
		<col key="yes" def="s72">File</col>
		<col def="s72">Component_</col>
		<col def="s255">FileName</col>
		<col def="i4">FileSize</col>
		<col def="S72">Version</col>
		<col def="S20">Language</col>
		<col def="I2">Attributes</col>
		<col def="i2">Sequence</col>
		<col def="S255">ISBuildSourcePath</col>
		<col def="I4">ISAttributes</col>
		<col def="S72">ISComponentSubFolder_</col>
		<row><td>_._</td><td>ISX_DEFAULTCOMPONENT73</td><td>_._</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.Net.Http.2.0.20710.0\lib\net45\_._</td><td>1</td><td/></row>
		<row><td>_authorization.cshtml</td><td>ISX_DEFAULTCOMPONENT47</td><td>_AUTHO~1.CSH|_Authorization.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Views\Shared\_Authorization.cshtml</td><td>1</td><td/></row>
		<row><td>_dashletcreatemodal.cshtml</td><td>ISX_DEFAULTCOMPONENT47</td><td>_DASHL~1.CSH|_DashletCreateModal.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Views\Shared\_DashletCreateModal.cshtml</td><td>1</td><td/></row>
		<row><td>_general.cshtml</td><td>ISX_DEFAULTCOMPONENT47</td><td>_GENER~1.CSH|_General.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Views\Shared\_General.cshtml</td><td>1</td><td/></row>
		<row><td>_layout.cshtml</td><td>ISX_DEFAULTCOMPONENT47</td><td>_LAYOU~1.CSH|_Layout.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Views\Shared\_Layout.cshtml</td><td>1</td><td/></row>
		<row><td>_layout.cshtml1</td><td>ISX_DEFAULTCOMPONENT127</td><td>_LAYOU~1.CSH|_Layout.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Views\Shared\_Layout.cshtml</td><td>1</td><td/></row>
		<row><td>_panecommandmodal.cshtml</td><td>ISX_DEFAULTCOMPONENT47</td><td>_PANEC~1.CSH|_PaneCommandModal.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Views\Shared\_PaneCommandModal.cshtml</td><td>1</td><td/></row>
		<row><td>_panecommands.cshtml</td><td>ISX_DEFAULTCOMPONENT47</td><td>_PANEC~1.CSH|_PaneCommands.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Views\Shared\_PaneCommands.cshtml</td><td>1</td><td/></row>
		<row><td>_references.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>_REFER~1.JS|_references.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\_references.js</td><td>1</td><td/></row>
		<row><td>_viewstart.cshtml</td><td>ISX_DEFAULTCOMPONENT45</td><td>_VIEWS~1.CSH|_ViewStart.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Views\_ViewStart.cshtml</td><td>1</td><td/></row>
		<row><td>_viewstart.cshtml1</td><td>ISX_DEFAULTCOMPONENT125</td><td>_VIEWS~1.CSH|_ViewStart.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Views\_ViewStart.cshtml</td><td>1</td><td/></row>
		<row><td>add_dashlet_drag_drop.png</td><td>ISX_DEFAULTCOMPONENT102</td><td>ADD-DA~1.PNG|add-dashlet-drag-drop.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\images\add-dashlet-drag-drop.png</td><td>1</td><td/></row>
		<row><td>admin.css</td><td>ISX_DEFAULTCOMPONENT34</td><td>admin.css</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\admin.css</td><td>1</td><td/></row>
		<row><td>admin.css1</td><td>ISX_DEFAULTCOMPONENT42</td><td>admin.css</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\css\admin.css</td><td>1</td><td/></row>
		<row><td>angular.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>angular.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular.js</td><td>1</td><td/></row>
		<row><td>angular.min.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular.min.js</td><td>1</td><td/></row>
		<row><td>angular.min.js1</td><td>ISX_DEFAULTCOMPONENT114</td><td>ANGULA~1.JS|angular.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\angular.min.js</td><td>1</td><td/></row>
		<row><td>angular_bootstrap.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular-bootstrap.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular-bootstrap.js</td><td>1</td><td/></row>
		<row><td>angular_bootstrap.min.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular-bootstrap.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular-bootstrap.min.js</td><td>1</td><td/></row>
		<row><td>angular_bootstrap_prettify.j</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular-bootstrap-prettify.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular-bootstrap-prettify.js</td><td>1</td><td/></row>
		<row><td>angular_bootstrap_prettify.m</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular-bootstrap-prettify.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular-bootstrap-prettify.min.js</td><td>1</td><td/></row>
		<row><td>angular_cookies.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular-cookies.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular-cookies.js</td><td>1</td><td/></row>
		<row><td>angular_cookies.min.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular-cookies.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular-cookies.min.js</td><td>1</td><td/></row>
		<row><td>angular_loader.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular-loader.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular-loader.js</td><td>1</td><td/></row>
		<row><td>angular_loader.min.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular-loader.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular-loader.min.js</td><td>1</td><td/></row>
		<row><td>angular_locale_am.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_am.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_am.js</td><td>1</td><td/></row>
		<row><td>angular_locale_am_et.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_am-et.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_am-et.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ar.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ar.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ar.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ar_eg.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ar-eg.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ar-eg.js</td><td>1</td><td/></row>
		<row><td>angular_locale_bg.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_bg.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_bg.js</td><td>1</td><td/></row>
		<row><td>angular_locale_bg_bg.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_bg-bg.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_bg-bg.js</td><td>1</td><td/></row>
		<row><td>angular_locale_bn.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_bn.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_bn.js</td><td>1</td><td/></row>
		<row><td>angular_locale_bn_bd.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_bn-bd.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_bn-bd.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ca.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ca.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ca.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ca_es.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ca-es.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ca-es.js</td><td>1</td><td/></row>
		<row><td>angular_locale_cs.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_cs.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_cs.js</td><td>1</td><td/></row>
		<row><td>angular_locale_cs_cz.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_cs-cz.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_cs-cz.js</td><td>1</td><td/></row>
		<row><td>angular_locale_da.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_da.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_da.js</td><td>1</td><td/></row>
		<row><td>angular_locale_da_dk.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_da-dk.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_da-dk.js</td><td>1</td><td/></row>
		<row><td>angular_locale_de.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_de.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_de.js</td><td>1</td><td/></row>
		<row><td>angular_locale_de_at.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_de-at.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_de-at.js</td><td>1</td><td/></row>
		<row><td>angular_locale_de_be.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_de-be.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_de-be.js</td><td>1</td><td/></row>
		<row><td>angular_locale_de_ch.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_de-ch.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_de-ch.js</td><td>1</td><td/></row>
		<row><td>angular_locale_de_de.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_de-de.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_de-de.js</td><td>1</td><td/></row>
		<row><td>angular_locale_de_lu.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_de-lu.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_de-lu.js</td><td>1</td><td/></row>
		<row><td>angular_locale_el.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_el.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_el.js</td><td>1</td><td/></row>
		<row><td>angular_locale_el_gr.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_el-gr.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_el-gr.js</td><td>1</td><td/></row>
		<row><td>angular_locale_el_polyton.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_el-polyton.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_el-polyton.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_as.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-as.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-as.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_au.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-au.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-au.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_dsrt.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-dsrt.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-dsrt.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_dsrt_us.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-dsrt-us.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-dsrt-us.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_gb.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-gb.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-gb.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_gu.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-gu.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-gu.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_ie.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-ie.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-ie.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_in.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-in.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-in.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_iso.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-iso.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-iso.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_mh.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-mh.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-mh.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_mp.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-mp.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-mp.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_sg.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-sg.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-sg.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_um.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-um.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-um.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_us.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-us.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-us.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_vi.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-vi.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-vi.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_za.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-za.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-za.js</td><td>1</td><td/></row>
		<row><td>angular_locale_en_zz.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_en-zz.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_en-zz.js</td><td>1</td><td/></row>
		<row><td>angular_locale_es.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_es.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_es.js</td><td>1</td><td/></row>
		<row><td>angular_locale_es_es.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_es-es.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_es-es.js</td><td>1</td><td/></row>
		<row><td>angular_locale_et.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_et.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_et.js</td><td>1</td><td/></row>
		<row><td>angular_locale_et_ee.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_et-ee.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_et-ee.js</td><td>1</td><td/></row>
		<row><td>angular_locale_eu.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_eu.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_eu.js</td><td>1</td><td/></row>
		<row><td>angular_locale_eu_es.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_eu-es.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_eu-es.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fa.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fa.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fa.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fa_ir.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fa-ir.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fa-ir.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fi.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fi.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fi.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fi_fi.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fi-fi.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fi-fi.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fil.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fil.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fil.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fil_ph.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fil-ph.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fil-ph.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fr.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fr.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fr.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fr_bl.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fr-bl.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fr-bl.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fr_ca.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fr-ca.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fr-ca.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fr_fr.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fr-fr.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fr-fr.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fr_gp.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fr-gp.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fr-gp.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fr_mc.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fr-mc.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fr-mc.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fr_mf.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fr-mf.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fr-mf.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fr_mq.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fr-mq.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fr-mq.js</td><td>1</td><td/></row>
		<row><td>angular_locale_fr_re.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_fr-re.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_fr-re.js</td><td>1</td><td/></row>
		<row><td>angular_locale_gl.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_gl.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_gl.js</td><td>1</td><td/></row>
		<row><td>angular_locale_gl_es.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_gl-es.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_gl-es.js</td><td>1</td><td/></row>
		<row><td>angular_locale_gsw.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_gsw.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_gsw.js</td><td>1</td><td/></row>
		<row><td>angular_locale_gsw_ch.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_gsw-ch.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_gsw-ch.js</td><td>1</td><td/></row>
		<row><td>angular_locale_gu.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_gu.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_gu.js</td><td>1</td><td/></row>
		<row><td>angular_locale_gu_in.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_gu-in.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_gu-in.js</td><td>1</td><td/></row>
		<row><td>angular_locale_he.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_he.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_he.js</td><td>1</td><td/></row>
		<row><td>angular_locale_he_il.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_he-il.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_he-il.js</td><td>1</td><td/></row>
		<row><td>angular_locale_hi.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_hi.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_hi.js</td><td>1</td><td/></row>
		<row><td>angular_locale_hi_in.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_hi-in.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_hi-in.js</td><td>1</td><td/></row>
		<row><td>angular_locale_hr.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_hr.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_hr.js</td><td>1</td><td/></row>
		<row><td>angular_locale_hr_hr.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_hr-hr.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_hr-hr.js</td><td>1</td><td/></row>
		<row><td>angular_locale_hu.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_hu.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_hu.js</td><td>1</td><td/></row>
		<row><td>angular_locale_hu_hu.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_hu-hu.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_hu-hu.js</td><td>1</td><td/></row>
		<row><td>angular_locale_id.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_id.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_id.js</td><td>1</td><td/></row>
		<row><td>angular_locale_id_id.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_id-id.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_id-id.js</td><td>1</td><td/></row>
		<row><td>angular_locale_in.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_in.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_in.js</td><td>1</td><td/></row>
		<row><td>angular_locale_is.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_is.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_is.js</td><td>1</td><td/></row>
		<row><td>angular_locale_is_is.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_is-is.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_is-is.js</td><td>1</td><td/></row>
		<row><td>angular_locale_it.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_it.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_it.js</td><td>1</td><td/></row>
		<row><td>angular_locale_it_it.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_it-it.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_it-it.js</td><td>1</td><td/></row>
		<row><td>angular_locale_iw.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_iw.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_iw.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ja.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ja.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ja.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ja_jp.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ja-jp.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ja-jp.js</td><td>1</td><td/></row>
		<row><td>angular_locale_kn.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_kn.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_kn.js</td><td>1</td><td/></row>
		<row><td>angular_locale_kn_in.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_kn-in.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_kn-in.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ko.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ko.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ko.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ko_kr.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ko-kr.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ko-kr.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ln.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ln.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ln.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ln_cd.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ln-cd.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ln-cd.js</td><td>1</td><td/></row>
		<row><td>angular_locale_lt.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_lt.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_lt.js</td><td>1</td><td/></row>
		<row><td>angular_locale_lt_lt.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_lt-lt.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_lt-lt.js</td><td>1</td><td/></row>
		<row><td>angular_locale_lv.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_lv.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_lv.js</td><td>1</td><td/></row>
		<row><td>angular_locale_lv_lv.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_lv-lv.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_lv-lv.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ml.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ml.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ml.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ml_in.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ml-in.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ml-in.js</td><td>1</td><td/></row>
		<row><td>angular_locale_mo.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_mo.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_mo.js</td><td>1</td><td/></row>
		<row><td>angular_locale_mr.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_mr.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_mr.js</td><td>1</td><td/></row>
		<row><td>angular_locale_mr_in.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_mr-in.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_mr-in.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ms.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ms.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ms.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ms_my.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ms-my.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ms-my.js</td><td>1</td><td/></row>
		<row><td>angular_locale_mt.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_mt.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_mt.js</td><td>1</td><td/></row>
		<row><td>angular_locale_mt_mt.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_mt-mt.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_mt-mt.js</td><td>1</td><td/></row>
		<row><td>angular_locale_nl.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_nl.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_nl.js</td><td>1</td><td/></row>
		<row><td>angular_locale_nl_nl.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_nl-nl.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_nl-nl.js</td><td>1</td><td/></row>
		<row><td>angular_locale_no.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_no.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_no.js</td><td>1</td><td/></row>
		<row><td>angular_locale_or.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_or.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_or.js</td><td>1</td><td/></row>
		<row><td>angular_locale_or_in.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_or-in.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_or-in.js</td><td>1</td><td/></row>
		<row><td>angular_locale_pl.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_pl.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_pl.js</td><td>1</td><td/></row>
		<row><td>angular_locale_pl_pl.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_pl-pl.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_pl-pl.js</td><td>1</td><td/></row>
		<row><td>angular_locale_pt.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_pt.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_pt.js</td><td>1</td><td/></row>
		<row><td>angular_locale_pt_br.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_pt-br.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_pt-br.js</td><td>1</td><td/></row>
		<row><td>angular_locale_pt_pt.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_pt-pt.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_pt-pt.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ro.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ro.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ro.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ro_ro.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ro-ro.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ro-ro.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ru.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ru.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ru.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ru_ru.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ru-ru.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ru-ru.js</td><td>1</td><td/></row>
		<row><td>angular_locale_sk.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_sk.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_sk.js</td><td>1</td><td/></row>
		<row><td>angular_locale_sk_sk.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_sk-sk.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_sk-sk.js</td><td>1</td><td/></row>
		<row><td>angular_locale_sl.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_sl.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_sl.js</td><td>1</td><td/></row>
		<row><td>angular_locale_sl_si.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_sl-si.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_sl-si.js</td><td>1</td><td/></row>
		<row><td>angular_locale_sq.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_sq.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_sq.js</td><td>1</td><td/></row>
		<row><td>angular_locale_sq_al.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_sq-al.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_sq-al.js</td><td>1</td><td/></row>
		<row><td>angular_locale_sr.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_sr.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_sr.js</td><td>1</td><td/></row>
		<row><td>angular_locale_sr_cyrl_rs.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_sr-cyrl-rs.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_sr-cyrl-rs.js</td><td>1</td><td/></row>
		<row><td>angular_locale_sr_latn_rs.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_sr-latn-rs.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_sr-latn-rs.js</td><td>1</td><td/></row>
		<row><td>angular_locale_sr_rs.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_sr-rs.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_sr-rs.js</td><td>1</td><td/></row>
		<row><td>angular_locale_sv.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_sv.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_sv.js</td><td>1</td><td/></row>
		<row><td>angular_locale_sv_se.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_sv-se.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_sv-se.js</td><td>1</td><td/></row>
		<row><td>angular_locale_sw.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_sw.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_sw.js</td><td>1</td><td/></row>
		<row><td>angular_locale_sw_tz.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_sw-tz.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_sw-tz.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ta.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ta.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ta.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ta_in.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ta-in.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ta-in.js</td><td>1</td><td/></row>
		<row><td>angular_locale_te.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_te.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_te.js</td><td>1</td><td/></row>
		<row><td>angular_locale_te_in.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_te-in.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_te-in.js</td><td>1</td><td/></row>
		<row><td>angular_locale_th.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_th.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_th.js</td><td>1</td><td/></row>
		<row><td>angular_locale_th_th.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_th-th.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_th-th.js</td><td>1</td><td/></row>
		<row><td>angular_locale_tl.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_tl.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_tl.js</td><td>1</td><td/></row>
		<row><td>angular_locale_tl_ph.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_tl-ph.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_tl-ph.js</td><td>1</td><td/></row>
		<row><td>angular_locale_tr.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_tr.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_tr.js</td><td>1</td><td/></row>
		<row><td>angular_locale_tr_tr.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_tr-tr.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_tr-tr.js</td><td>1</td><td/></row>
		<row><td>angular_locale_uk.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_uk.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_uk.js</td><td>1</td><td/></row>
		<row><td>angular_locale_uk_ua.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_uk-ua.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_uk-ua.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ur.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ur.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ur.js</td><td>1</td><td/></row>
		<row><td>angular_locale_ur_pk.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_ur-pk.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_ur-pk.js</td><td>1</td><td/></row>
		<row><td>angular_locale_vi.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_vi.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_vi.js</td><td>1</td><td/></row>
		<row><td>angular_locale_vi_vn.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_vi-vn.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_vi-vn.js</td><td>1</td><td/></row>
		<row><td>angular_locale_zh.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_zh.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_zh.js</td><td>1</td><td/></row>
		<row><td>angular_locale_zh_cn.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_zh-cn.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_zh-cn.js</td><td>1</td><td/></row>
		<row><td>angular_locale_zh_hans.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_zh-hans.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_zh-hans.js</td><td>1</td><td/></row>
		<row><td>angular_locale_zh_hans_cn.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_zh-hans-cn.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_zh-hans-cn.js</td><td>1</td><td/></row>
		<row><td>angular_locale_zh_hk.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_zh-hk.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_zh-hk.js</td><td>1</td><td/></row>
		<row><td>angular_locale_zh_tw.js</td><td>ISX_DEFAULTCOMPONENT31</td><td>ANGULA~1.JS|angular-locale_zh-tw.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\i18n\angular-locale_zh-tw.js</td><td>1</td><td/></row>
		<row><td>angular_mocks.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular-mocks.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular-mocks.js</td><td>1</td><td/></row>
		<row><td>angular_resource.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular-resource.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular-resource.js</td><td>1</td><td/></row>
		<row><td>angular_resource.min.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular-resource.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular-resource.min.js</td><td>1</td><td/></row>
		<row><td>angular_sanitize.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular-sanitize.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular-sanitize.js</td><td>1</td><td/></row>
		<row><td>angular_sanitize.min.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular-sanitize.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular-sanitize.min.js</td><td>1</td><td/></row>
		<row><td>angular_scenario.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>ANGULA~1.JS|angular-scenario.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\angular-scenario.js</td><td>1</td><td/></row>
		<row><td>angulartodocontroller.cs</td><td>ISX_DEFAULTCOMPONENT86</td><td>ANGULA~1.CS|AngularToDoController.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Controllers\AngularToDoController.cs</td><td>1</td><td/></row>
		<row><td>antlr3.runtime.dll</td><td>Antlr3.Runtime.dll</td><td>ANTLR3~1.DLL|Antlr3.Runtime.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\Antlr3.Runtime.dll</td><td>1</td><td/></row>
		<row><td>antlr3.runtime.dll1</td><td>Antlr3.Runtime.dll1</td><td>ANTLR3~1.DLL|Antlr3.Runtime.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\WebGrease.1.1.0\lib\Antlr3.Runtime.dll</td><td>1</td><td/></row>
		<row><td>app.js</td><td>ISX_DEFAULTCOMPONENT117</td><td>app.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\Angular\app.js</td><td>1</td><td/></row>
		<row><td>app.profile.js</td><td>ISX_DEFAULTCOMPONENT32</td><td>APPPRO~1.JS|app.profile.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\app.profile.js</td><td>1</td><td/></row>
		<row><td>assemblyinfo.cs</td><td>ISX_DEFAULTCOMPONENT24</td><td>ASSEMB~1.CS|AssemblyInfo.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\Properties\AssemblyInfo.cs</td><td>1</td><td/></row>
		<row><td>assemblyinfo.cs1</td><td>ISX_DEFAULTCOMPONENT112</td><td>ASSEMB~1.CS|AssemblyInfo.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Properties\AssemblyInfo.cs</td><td>1</td><td/></row>
		<row><td>au_mill_en.js</td><td>ISX_DEFAULTCOMPONENT121</td><td>AU_MIL~1.JS|au_mill_en.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\JVectorMap\maps\au_mill_en.js</td><td>1</td><td/></row>
		<row><td>authorizationcontroller.js</td><td>ISX_DEFAULTCOMPONENT33</td><td>AUTHOR~1.JS|AuthorizationController.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\admin\AuthorizationController.js</td><td>1</td><td/></row>
		<row><td>bg.png</td><td>ISX_DEFAULTCOMPONENT35</td><td>bg.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\images\bg.png</td><td>1</td><td/></row>
		<row><td>bg.png1</td><td>ISX_DEFAULTCOMPONENT44</td><td>bg.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\images\bg.png</td><td>1</td><td/></row>
		<row><td>blank.gif</td><td>ISX_DEFAULTCOMPONENT39</td><td>blank.gif</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\blank.gif</td><td>1</td><td/></row>
		<row><td>bootstrap.css</td><td>ISX_DEFAULTCOMPONENT42</td><td>BOOTST~1.CSS|bootstrap.css</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\css\bootstrap.css</td><td>1</td><td/></row>
		<row><td>bootstrap.css1</td><td>ISX_DEFAULTCOMPONENT100</td><td>BOOTST~1.CSS|bootstrap.css</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\css\bootstrap.css</td><td>1</td><td/></row>
		<row><td>bootstrap.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap.js</td><td>1</td><td/></row>
		<row><td>bootstrap.js1</td><td>ISX_DEFAULTCOMPONENT114</td><td>BOOTST~1.JS|bootstrap.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\bootstrap.js</td><td>1</td><td/></row>
		<row><td>bootstrap.min.css</td><td>ISX_DEFAULTCOMPONENT42</td><td>BOOTST~1.CSS|bootstrap.min.css</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\css\bootstrap.min.css</td><td>1</td><td/></row>
		<row><td>bootstrap.min.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap.min.js</td><td>1</td><td/></row>
		<row><td>bootstrap.min.js1</td><td>ISX_DEFAULTCOMPONENT114</td><td>BOOTST~1.JS|bootstrap.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\bootstrap.min.js</td><td>1</td><td/></row>
		<row><td>bootstrap_affix.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap-affix.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap-affix.js</td><td>1</td><td/></row>
		<row><td>bootstrap_alert.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap-alert.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap-alert.js</td><td>1</td><td/></row>
		<row><td>bootstrap_button.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap-button.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap-button.js</td><td>1</td><td/></row>
		<row><td>bootstrap_carousel.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap-carousel.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap-carousel.js</td><td>1</td><td/></row>
		<row><td>bootstrap_collapse.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap-collapse.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap-collapse.js</td><td>1</td><td/></row>
		<row><td>bootstrap_colorselector.css</td><td>ISX_DEFAULTCOMPONENT100</td><td>BOOTST~1.CSS|bootstrap-colorselector.css</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\css\bootstrap-colorselector.css</td><td>1</td><td/></row>
		<row><td>bootstrap_colorselector.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>BOOTST~1.JS|bootstrap-colorselector.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\bootstrap-colorselector.js</td><td>1</td><td/></row>
		<row><td>bootstrap_dropdown.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap-dropdown.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap-dropdown.js</td><td>1</td><td/></row>
		<row><td>bootstrap_modal.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap-modal.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap-modal.js</td><td>1</td><td/></row>
		<row><td>bootstrap_popover.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap-popover.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap-popover.js</td><td>1</td><td/></row>
		<row><td>bootstrap_responsive.css</td><td>ISX_DEFAULTCOMPONENT42</td><td>BOOTST~1.CSS|bootstrap-responsive.css</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\css\bootstrap-responsive.css</td><td>1</td><td/></row>
		<row><td>bootstrap_responsive.min.css</td><td>ISX_DEFAULTCOMPONENT42</td><td>BOOTST~1.CSS|bootstrap-responsive.min.css</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\css\bootstrap-responsive.min.css</td><td>1</td><td/></row>
		<row><td>bootstrap_scrollspy.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap-scrollspy.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap-scrollspy.js</td><td>1</td><td/></row>
		<row><td>bootstrap_switch.css</td><td>ISX_DEFAULTCOMPONENT100</td><td>BOOTST~1.CSS|bootstrap-switch.css</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\css\bootstrap-switch.css</td><td>1</td><td/></row>
		<row><td>bootstrap_switch.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>BOOTST~1.JS|bootstrap-switch.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\bootstrap-switch.js</td><td>1</td><td/></row>
		<row><td>bootstrap_tab.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap-tab.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap-tab.js</td><td>1</td><td/></row>
		<row><td>bootstrap_tooltip.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap-tooltip.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap-tooltip.js</td><td>1</td><td/></row>
		<row><td>bootstrap_transition.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap-transition.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap-transition.js</td><td>1</td><td/></row>
		<row><td>bootstrap_typeahead.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>BOOTST~1.JS|bootstrap-typeahead.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\bootstrap-typeahead.js</td><td>1</td><td/></row>
		<row><td>bundleconfig.cs</td><td>ISX_DEFAULTCOMPONENT83</td><td>BUNDLE~1.CS|BundleConfig.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\App_Start\BundleConfig.cs</td><td>1</td><td/></row>
		<row><td>ca_lcc_en.js</td><td>ISX_DEFAULTCOMPONENT121</td><td>CA_LCC~1.JS|ca_lcc_en.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\JVectorMap\maps\ca_lcc_en.js</td><td>1</td><td/></row>
		<row><td>chart.min.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>CHARTM~1.JS|Chart.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\Chart.min.js</td><td>1</td><td/></row>
		<row><td>chartjscontroller.cs</td><td>ISX_DEFAULTCOMPONENT86</td><td>CHARTJ~1.CS|ChartJSController.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Controllers\ChartJSController.cs</td><td>1</td><td/></row>
		<row><td>chartjsmodel.cs</td><td>ISX_DEFAULTCOMPONENT87</td><td>CHARTJ~1.CS|ChartJSModel.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Models\ChartJSModel.cs</td><td>1</td><td/></row>
		<row><td>cloudy.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>Cloudy.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Cloudy.png</td><td>1</td><td/></row>
		<row><td>cloudy_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>CLOUDY~1.PNG|Cloudy-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Cloudy-128.png</td><td>1</td><td/></row>
		<row><td>cloudy_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>CLOUDY~1.PNG|Cloudy-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Cloudy-16.png</td><td>1</td><td/></row>
		<row><td>cloudy_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>CLOUDY~1.PNG|Cloudy-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Cloudy-24.png</td><td>1</td><td/></row>
		<row><td>cloudy_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>CLOUDY~1.PNG|Cloudy-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Cloudy-32.png</td><td>1</td><td/></row>
		<row><td>cloudy_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>CLOUDY~1.PNG|Cloudy-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Cloudy-48.png</td><td>1</td><td/></row>
		<row><td>cloudy_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>CLOUDY~1.PNG|Cloudy-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Cloudy-64.png</td><td>1</td><td/></row>
		<row><td>configdb.cshtml</td><td>ISX_DEFAULTCOMPONENT126</td><td>CONFIG~1.CSH|ConfigDB.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Views\Dashboard\ConfigDB.cshtml</td><td>1</td><td/></row>
		<row><td>dark_leather.jpg</td><td>ISX_DEFAULTCOMPONENT102</td><td>DARK_L~1.JPG|dark_leather.jpg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\images\dark_leather.jpg</td><td>1</td><td/></row>
		<row><td>dashboardcontroller.cs</td><td>ISX_DEFAULTCOMPONENT106</td><td>DASHBO~1.CS|DashboardController.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Controllers\DashboardController.cs</td><td>1</td><td/></row>
		<row><td>dashboardcreationmodel.cs</td><td>ISX_DEFAULTCOMPONENT108</td><td>DASHBO~1.CS|DashboardCreationModel.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Models\DashboardCreationModel.cs</td><td>1</td><td/></row>
		<row><td>dashboardeditmodule.cshtml</td><td>ISX_DEFAULTCOMPONENT127</td><td>DASHBO~1.CSH|DashboardEditModule.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Views\Shared\DashboardEditModule.cshtml</td><td>1</td><td/></row>
		<row><td>dashboardmodule.js</td><td>ISX_DEFAULTCOMPONENT115</td><td>DASHBO~1.JS|DashboardModule.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\app\DashboardModule.js</td><td>1</td><td/></row>
		<row><td>dashboardsmenu.cshtml</td><td>ISX_DEFAULTCOMPONENT127</td><td>DASHBO~1.CSH|DashboardsMenu.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Views\Shared\DashboardsMenu.cshtml</td><td>1</td><td/></row>
		<row><td>dashboardsmenu.js</td><td>ISX_DEFAULTCOMPONENT115</td><td>DASHBO~1.JS|DashboardsMenu.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\app\DashboardsMenu.js</td><td>1</td><td/></row>
		<row><td>dashletmodulecontroller.js</td><td>ISX_DEFAULTCOMPONENT33</td><td>DASHLE~1.JS|DashletModuleController.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\admin\DashletModuleController.js</td><td>1</td><td/></row>
		<row><td>dashletsarearegistration.cs</td><td>ISX_DEFAULTCOMPONENT12</td><td>DASHLE~1.CS|DashletsAreaRegistration.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\Areas\Dashlets\DashletsAreaRegistration.cs</td><td>1</td><td/></row>
		<row><td>dashletsarearegistration.cs1</td><td>ISX_DEFAULTCOMPONENT85</td><td>DASHLE~1.CS|DashletsAreaRegistration.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\DashletsAreaRegistration.cs</td><td>1</td><td/></row>
		<row><td>de_mill_en.js</td><td>ISX_DEFAULTCOMPONENT121</td><td>DE_MIL~1.JS|de_mill_en.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\JVectorMap\maps\de_mill_en.js</td><td>1</td><td/></row>
		<row><td>designtimeresolveassemblyref</td><td>ISX_DEFAULTCOMPONENT22</td><td>DESIGN~1.CAC|DesignTimeResolveAssemblyReferencesInput.cache</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\obj\Debug\DesignTimeResolveAssemblyReferencesInput.cache</td><td>1</td><td/></row>
		<row><td>designtimeresolveassemblyref1</td><td>ISX_DEFAULTCOMPONENT110</td><td>DESIGN~1.CAC|DesignTimeResolveAssemblyReferencesInput.cache</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\obj\Debug\DesignTimeResolveAssemblyReferencesInput.cache</td><td>1</td><td/></row>
		<row><td>dotnetopenauth.aspnet.dll</td><td>DotNetOpenAuth.AspNet.dll</td><td>DOTNET~1.DLL|DotNetOpenAuth.AspNet.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\DotNetOpenAuth.AspNet.dll</td><td>1</td><td/></row>
		<row><td>dotnetopenauth.core.dll</td><td>DotNetOpenAuth.Core.dll</td><td>DOTNET~1.DLL|DotNetOpenAuth.Core.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\DotNetOpenAuth.Core.dll</td><td>1</td><td/></row>
		<row><td>editor.cshtml</td><td>ISX_DEFAULTCOMPONENT89</td><td>EDITOR~1.CSH|editor.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\AngularTodo\editor.cshtml</td><td>1</td><td/></row>
		<row><td>editor.cshtml1</td><td>ISX_DEFAULTCOMPONENT90</td><td>EDITOR~1.CSH|Editor.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\ChartJS\Editor.cshtml</td><td>1</td><td/></row>
		<row><td>editor.cshtml2</td><td>ISX_DEFAULTCOMPONENT91</td><td>EDITOR~1.CSH|Editor.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\GoogleMap\Editor.cshtml</td><td>1</td><td/></row>
		<row><td>editor.cshtml3</td><td>ISX_DEFAULTCOMPONENT92</td><td>EDITOR~1.CSH|Editor.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\Html\Editor.cshtml</td><td>1</td><td/></row>
		<row><td>editor.cshtml4</td><td>ISX_DEFAULTCOMPONENT93</td><td>EDITOR~1.CSH|Editor.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\JVectorMap\Editor.cshtml</td><td>1</td><td/></row>
		<row><td>editor.cshtml5</td><td>ISX_DEFAULTCOMPONENT94</td><td>EDITOR~1.CSH|Editor.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\Rss\Editor.cshtml</td><td>1</td><td/></row>
		<row><td>editor.cshtml6</td><td>ISX_DEFAULTCOMPONENT96</td><td>EDITOR~1.CSH|Editor.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\SparkLine\Editor.cshtml</td><td>1</td><td/></row>
		<row><td>editor.cshtml7</td><td>ISX_DEFAULTCOMPONENT97</td><td>EDITOR~1.CSH|Editor.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\WeatherBoard\Editor.cshtml</td><td>1</td><td/></row>
		<row><td>editor.js</td><td>ISX_DEFAULTCOMPONENT117</td><td>editor.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\Angular\editor.js</td><td>1</td><td/></row>
		<row><td>editor.js1</td><td>ISX_DEFAULTCOMPONENT118</td><td>editor.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\ChartJS\editor.js</td><td>1</td><td/></row>
		<row><td>editor.js2</td><td>ISX_DEFAULTCOMPONENT119</td><td>editor.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\GoogleMap\editor.js</td><td>1</td><td/></row>
		<row><td>editor.js3</td><td>ISX_DEFAULTCOMPONENT120</td><td>editor.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\JVectorMap\editor.js</td><td>1</td><td/></row>
		<row><td>editor.js4</td><td>ISX_DEFAULTCOMPONENT122</td><td>editor.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\SparkLine\editor.js</td><td>1</td><td/></row>
		<row><td>editor.js5</td><td>ISX_DEFAULTCOMPONENT123</td><td>editor.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\editor.js</td><td>1</td><td/></row>
		<row><td>egg_shell.jpg</td><td>ISX_DEFAULTCOMPONENT102</td><td>EGG_SH~1.JPG|egg_shell.jpg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\images\egg_shell.jpg</td><td>1</td><td/></row>
		<row><td>error.cshtml</td><td>ISX_DEFAULTCOMPONENT47</td><td>ERROR~1.CSH|Error.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Views\Shared\Error.cshtml</td><td>1</td><td/></row>
		<row><td>error.cshtml1</td><td>ISX_DEFAULTCOMPONENT127</td><td>ERROR~1.CSH|Error.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Views\Shared\Error.cshtml</td><td>1</td><td/></row>
		<row><td>europe_mill_en.js</td><td>ISX_DEFAULTCOMPONENT121</td><td>EUROPE~1.JS|europe-mill-en.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\JVectorMap\maps\europe-mill-en.js</td><td>1</td><td/></row>
		<row><td>fancy_close.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_close.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_close.png</td><td>1</td><td/></row>
		<row><td>fancy_loading.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_loading.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_loading.png</td><td>1</td><td/></row>
		<row><td>fancy_nav_left.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_nav_left.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_nav_left.png</td><td>1</td><td/></row>
		<row><td>fancy_nav_right.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_nav_right.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_nav_right.png</td><td>1</td><td/></row>
		<row><td>fancy_shadow_e.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_shadow_e.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_shadow_e.png</td><td>1</td><td/></row>
		<row><td>fancy_shadow_n.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_shadow_n.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_shadow_n.png</td><td>1</td><td/></row>
		<row><td>fancy_shadow_ne.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_shadow_ne.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_shadow_ne.png</td><td>1</td><td/></row>
		<row><td>fancy_shadow_nw.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_shadow_nw.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_shadow_nw.png</td><td>1</td><td/></row>
		<row><td>fancy_shadow_s.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_shadow_s.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_shadow_s.png</td><td>1</td><td/></row>
		<row><td>fancy_shadow_se.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_shadow_se.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_shadow_se.png</td><td>1</td><td/></row>
		<row><td>fancy_shadow_sw.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_shadow_sw.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_shadow_sw.png</td><td>1</td><td/></row>
		<row><td>fancy_shadow_w.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_shadow_w.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_shadow_w.png</td><td>1</td><td/></row>
		<row><td>fancy_title_left.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_title_left.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_title_left.png</td><td>1</td><td/></row>
		<row><td>fancy_title_main.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_title_main.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_title_main.png</td><td>1</td><td/></row>
		<row><td>fancy_title_over.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_title_over.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_title_over.png</td><td>1</td><td/></row>
		<row><td>fancy_title_right.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCY_~1.PNG|fancy_title_right.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancy_title_right.png</td><td>1</td><td/></row>
		<row><td>fancybox.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>fancybox.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancybox.png</td><td>1</td><td/></row>
		<row><td>fancybox_x.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCYB~1.PNG|fancybox-x.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancybox-x.png</td><td>1</td><td/></row>
		<row><td>fancybox_y.png</td><td>ISX_DEFAULTCOMPONENT39</td><td>FANCYB~1.PNG|fancybox-y.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\fancybox-y.png</td><td>1</td><td/></row>
		<row><td>favicon.ico</td><td>ISX_DEFAULTCOMPONENT81</td><td>favicon.ico</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\favicon.ico</td><td>1</td><td/></row>
		<row><td>filterconfig.cs</td><td>ISX_DEFAULTCOMPONENT10</td><td>FILTER~1.CS|FilterConfig.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\App_Start\FilterConfig.cs</td><td>1</td><td/></row>
		<row><td>filterconfig.cs1</td><td>ISX_DEFAULTCOMPONENT83</td><td>FILTER~1.CS|FilterConfig.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\App_Start\FilterConfig.cs</td><td>1</td><td/></row>
		<row><td>fog.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>fog.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\fog.png</td><td>1</td><td/></row>
		<row><td>fog_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>fog-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\fog-128.png</td><td>1</td><td/></row>
		<row><td>fog_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>fog-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\fog-16.png</td><td>1</td><td/></row>
		<row><td>fog_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>fog-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\fog-24.png</td><td>1</td><td/></row>
		<row><td>fog_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>fog-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\fog-32.png</td><td>1</td><td/></row>
		<row><td>fog_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>fog-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\fog-48.png</td><td>1</td><td/></row>
		<row><td>fog_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>fog-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\fog-64.png</td><td>1</td><td/></row>
		<row><td>fontawesome.otf</td><td>ISX_DEFAULTCOMPONENT43</td><td>FONTAW~1.OTF|FontAwesome.otf</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\fonts\FontAwesome.otf</td><td>1</td><td/></row>
		<row><td>fontawesome_webfont.eot</td><td>ISX_DEFAULTCOMPONENT43</td><td>FONTAW~1.EOT|fontawesome-webfont.eot</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\fonts\fontawesome-webfont.eot</td><td>1</td><td/></row>
		<row><td>fontawesome_webfont.svg</td><td>ISX_DEFAULTCOMPONENT43</td><td>FONTAW~1.SVG|fontawesome-webfont.svg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\fonts\fontawesome-webfont.svg</td><td>1</td><td/></row>
		<row><td>fontawesome_webfont.ttf</td><td>ISX_DEFAULTCOMPONENT43</td><td>FONTAW~1.TTF|fontawesome-webfont.ttf</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\fonts\fontawesome-webfont.ttf</td><td>1</td><td/></row>
		<row><td>fontawesome_webfont.woff</td><td>ISX_DEFAULTCOMPONENT43</td><td>FONTAW~1.WOF|fontawesome-webfont.woff</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\fonts\fontawesome-webfont.woff</td><td>1</td><td/></row>
		<row><td>fr_mill_en.js</td><td>ISX_DEFAULTCOMPONENT121</td><td>FR_MIL~1.JS|fr_mill_en.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\JVectorMap\maps\fr_mill_en.js</td><td>1</td><td/></row>
		<row><td>global.asax</td><td>ISX_DEFAULTCOMPONENT8</td><td>GLOBAL~1.ASA|Global.asax</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\Global.asax</td><td>1</td><td/></row>
		<row><td>global.asax.cs</td><td>ISX_DEFAULTCOMPONENT8</td><td>GLOBAL~1.CS|Global.asax.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\Global.asax.cs</td><td>1</td><td/></row>
		<row><td>global.asax.cs1</td><td>ISX_DEFAULTCOMPONENT81</td><td>GLOBAL~1.CS|Global.asax.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Global.asax.cs</td><td>1</td><td/></row>
		<row><td>global.asax1</td><td>ISX_DEFAULTCOMPONENT27</td><td>GLOBAL~1.ASA|Global.asax</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Global.asax</td><td>1</td><td/></row>
		<row><td>global.asax2</td><td>ISX_DEFAULTCOMPONENT81</td><td>GLOBAL~1.ASA|Global.asax</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Global.asax</td><td>1</td><td/></row>
		<row><td>glyphicons_halflings.png</td><td>ISX_DEFAULTCOMPONENT44</td><td>GLYPHI~1.PNG|glyphicons-halflings.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\images\glyphicons-halflings.png</td><td>1</td><td/></row>
		<row><td>glyphicons_halflings_regular</td><td>ISX_DEFAULTCOMPONENT43</td><td>GLYPHI~1.EOT|glyphicons-halflings-regular.eot</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\fonts\glyphicons-halflings-regular.eot</td><td>1</td><td/></row>
		<row><td>glyphicons_halflings_regular1</td><td>ISX_DEFAULTCOMPONENT43</td><td>GLYPHI~1.SVG|glyphicons-halflings-regular.svg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\fonts\glyphicons-halflings-regular.svg</td><td>1</td><td/></row>
		<row><td>glyphicons_halflings_regular2</td><td>ISX_DEFAULTCOMPONENT43</td><td>GLYPHI~1.TTF|glyphicons-halflings-regular.ttf</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\fonts\glyphicons-halflings-regular.ttf</td><td>1</td><td/></row>
		<row><td>glyphicons_halflings_regular3</td><td>ISX_DEFAULTCOMPONENT43</td><td>GLYPHI~1.WOF|glyphicons-halflings-regular.woff</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\fonts\glyphicons-halflings-regular.woff</td><td>1</td><td/></row>
		<row><td>glyphicons_halflings_regular4</td><td>ISX_DEFAULTCOMPONENT101</td><td>GLYPHI~1.EOT|glyphicons-halflings-regular.eot</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\fonts\glyphicons-halflings-regular.eot</td><td>1</td><td/></row>
		<row><td>glyphicons_halflings_regular5</td><td>ISX_DEFAULTCOMPONENT101</td><td>GLYPHI~1.SVG|glyphicons-halflings-regular.svg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\fonts\glyphicons-halflings-regular.svg</td><td>1</td><td/></row>
		<row><td>glyphicons_halflings_regular6</td><td>ISX_DEFAULTCOMPONENT101</td><td>GLYPHI~1.TTF|glyphicons-halflings-regular.ttf</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\fonts\glyphicons-halflings-regular.ttf</td><td>1</td><td/></row>
		<row><td>glyphicons_halflings_regular7</td><td>ISX_DEFAULTCOMPONENT101</td><td>GLYPHI~1.WOF|glyphicons-halflings-regular.woff</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\fonts\glyphicons-halflings-regular.woff</td><td>1</td><td/></row>
		<row><td>glyphicons_halflings_white.p</td><td>ISX_DEFAULTCOMPONENT44</td><td>GLYPHI~1.PNG|glyphicons-halflings-white.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\images\glyphicons-halflings-white.png</td><td>1</td><td/></row>
		<row><td>googlemapcontroller.cs</td><td>ISX_DEFAULTCOMPONENT86</td><td>GOOGLE~1.CS|GoogleMapController.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Controllers\GoogleMapController.cs</td><td>1</td><td/></row>
		<row><td>googlemaploader.js</td><td>ISX_DEFAULTCOMPONENT119</td><td>GOOGLE~1.JS|GoogleMapLoader.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\GoogleMap\GoogleMapLoader.js</td><td>1</td><td/></row>
		<row><td>hail.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>hail.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\hail.png</td><td>1</td><td/></row>
		<row><td>hail_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>hail-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\hail-128.png</td><td>1</td><td/></row>
		<row><td>hail_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>hail-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\hail-16.png</td><td>1</td><td/></row>
		<row><td>hail_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>hail-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\hail-24.png</td><td>1</td><td/></row>
		<row><td>hail_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>hail-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\hail-32.png</td><td>1</td><td/></row>
		<row><td>hail_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>hail-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\hail-48.png</td><td>1</td><td/></row>
		<row><td>hail_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>hail-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\hail-64.png</td><td>1</td><td/></row>
		<row><td>hava.jpg</td><td>ISX_DEFAULTCOMPONENT124</td><td>hava.jpg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\hava.jpg</td><td>1</td><td/></row>
		<row><td>helloworldcontroller.cs</td><td>ISX_DEFAULTCOMPONENT13</td><td>HELLOW~1.CS|HelloWorldController.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\Areas\Dashlets\Controllers\HelloWorldController.cs</td><td>1</td><td/></row>
		<row><td>history.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>history.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\history.js</td><td>1</td><td/></row>
		<row><td>homecontroller.cs</td><td>ISX_DEFAULTCOMPONENT19</td><td>HOMECO~1.CS|HomeController.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\Controllers\HomeController.cs</td><td>1</td><td/></row>
		<row><td>htmlcontroller.cs</td><td>ISX_DEFAULTCOMPONENT86</td><td>HTMLCO~1.CS|HtmlController.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Controllers\HtmlController.cs</td><td>1</td><td/></row>
		<row><td>htmlmodel.cs</td><td>ISX_DEFAULTCOMPONENT87</td><td>HTMLMO~1.CS|HtmlModel.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Models\HtmlModel.cs</td><td>1</td><td/></row>
		<row><td>iconactionlinkhelper.cs</td><td>ISX_DEFAULTCOMPONENT107</td><td>ICONAC~1.CS|IconActionLinkHelper.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Helpers\IconActionLinkHelper.cs</td><td>1</td><td/></row>
		<row><td>icons_18_black_pack.png</td><td>ISX_DEFAULTCOMPONENT105</td><td>ICONS-~1.PNG|icons-18-black-pack.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\Themes\Custom\images\icons-18-black-pack.png</td><td>1</td><td/></row>
		<row><td>icons_18_white_pack.png</td><td>ISX_DEFAULTCOMPONENT105</td><td>ICONS-~1.PNG|icons-18-white-pack.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\Themes\Custom\images\icons-18-white-pack.png</td><td>1</td><td/></row>
		<row><td>icons_36_black_pack.png</td><td>ISX_DEFAULTCOMPONENT105</td><td>ICONS-~1.PNG|icons-36-black-pack.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\Themes\Custom\images\icons-36-black-pack.png</td><td>1</td><td/></row>
		<row><td>icons_36_white_pack.png</td><td>ISX_DEFAULTCOMPONENT105</td><td>ICONS-~1.PNG|icons-36-white-pack.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\Themes\Custom\images\icons-36-white-pack.png</td><td>1</td><td/></row>
		<row><td>index.cshtml</td><td>ISX_DEFAULTCOMPONENT16</td><td>INDEX~1.CSH|Index.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\Areas\Dashlets\Views\HelloWorld\Index.cshtml</td><td>1</td><td/></row>
		<row><td>index.cshtml1</td><td>ISX_DEFAULTCOMPONENT26</td><td>INDEX~1.CSH|Index.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\Views\Home\Index.cshtml</td><td>1</td><td/></row>
		<row><td>index.cshtml10</td><td>ISX_DEFAULTCOMPONENT97</td><td>INDEX~1.CSH|Index.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\WeatherBoard\Index.cshtml</td><td>1</td><td/></row>
		<row><td>index.cshtml11</td><td>ISX_DEFAULTCOMPONENT126</td><td>INDEX~1.CSH|Index.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Views\Dashboard\Index.cshtml</td><td>1</td><td/></row>
		<row><td>index.cshtml2</td><td>ISX_DEFAULTCOMPONENT46</td><td>INDEX~1.CSH|Index.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Views\Home\Index.cshtml</td><td>1</td><td/></row>
		<row><td>index.cshtml3</td><td>ISX_DEFAULTCOMPONENT89</td><td>INDEX~1.CSH|index.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\AngularTodo\index.cshtml</td><td>1</td><td/></row>
		<row><td>index.cshtml4</td><td>ISX_DEFAULTCOMPONENT90</td><td>INDEX~1.CSH|Index.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\ChartJS\Index.cshtml</td><td>1</td><td/></row>
		<row><td>index.cshtml5</td><td>ISX_DEFAULTCOMPONENT91</td><td>INDEX~1.CSH|Index.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\GoogleMap\Index.cshtml</td><td>1</td><td/></row>
		<row><td>index.cshtml6</td><td>ISX_DEFAULTCOMPONENT92</td><td>INDEX~1.CSH|Index.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\Html\Index.cshtml</td><td>1</td><td/></row>
		<row><td>index.cshtml7</td><td>ISX_DEFAULTCOMPONENT93</td><td>INDEX~1.CSH|Index.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\JVectorMap\Index.cshtml</td><td>1</td><td/></row>
		<row><td>index.cshtml8</td><td>ISX_DEFAULTCOMPONENT94</td><td>INDEX~1.CSH|Index.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\Rss\Index.cshtml</td><td>1</td><td/></row>
		<row><td>index.cshtml9</td><td>ISX_DEFAULTCOMPONENT96</td><td>INDEX~1.CSH|Index.cshtml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\SparkLine\Index.cshtml</td><td>1</td><td/></row>
		<row><td>index.js</td><td>ISX_DEFAULTCOMPONENT117</td><td>index.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\Angular\index.js</td><td>1</td><td/></row>
		<row><td>index.js1</td><td>ISX_DEFAULTCOMPONENT118</td><td>index.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\ChartJS\index.js</td><td>1</td><td/></row>
		<row><td>index.js2</td><td>ISX_DEFAULTCOMPONENT119</td><td>index.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\GoogleMap\index.js</td><td>1</td><td/></row>
		<row><td>index.js3</td><td>ISX_DEFAULTCOMPONENT120</td><td>index.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\JVectorMap\index.js</td><td>1</td><td/></row>
		<row><td>index.js4</td><td>ISX_DEFAULTCOMPONENT122</td><td>index.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\SparkLine\index.js</td><td>1</td><td/></row>
		<row><td>index.js5</td><td>ISX_DEFAULTCOMPONENT123</td><td>index.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\index.js</td><td>1</td><td/></row>
		<row><td>ionicons.eot</td><td>ISX_DEFAULTCOMPONENT43</td><td>ionicons.eot</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\fonts\ionicons.eot</td><td>1</td><td/></row>
		<row><td>ionicons.svg</td><td>ISX_DEFAULTCOMPONENT43</td><td>ionicons.svg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\fonts\ionicons.svg</td><td>1</td><td/></row>
		<row><td>ionicons.ttf</td><td>ISX_DEFAULTCOMPONENT43</td><td>ionicons.ttf</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\fonts\ionicons.ttf</td><td>1</td><td/></row>
		<row><td>ionicons.woff</td><td>ISX_DEFAULTCOMPONENT43</td><td>IONICO~1.WOF|ionicons.woff</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\fonts\ionicons.woff</td><td>1</td><td/></row>
		<row><td>jdash.dll</td><td>JDash.dll</td><td>JDash.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.dll</td><td>1</td><td/></row>
		<row><td>jdash.dll1</td><td>JDash.dll1</td><td>JDash.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.dll</td><td>1</td><td/></row>
		<row><td>jdash.dll2</td><td>JDash.dll2</td><td>JDash.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\JDash.Mvc.Reference\JDash.dll</td><td>1</td><td/></row>
		<row><td>jdash.dll4</td><td>JDash.dll4</td><td>JDash.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.dll</td><td>1</td><td/></row>
		<row><td>jdash.mvc.dll</td><td>JDash.Mvc.dll</td><td>JDASHM~1.DLL|JDash.Mvc.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.Mvc.dll</td><td>1</td><td/></row>
		<row><td>jdash.mvc.dll1</td><td>JDash.Mvc.dll1</td><td>JDASHM~1.DLL|JDash.Mvc.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.Mvc.dll</td><td>1</td><td/></row>
		<row><td>jdash.mvc.dll2</td><td>JDash.Mvc.dll2</td><td>JDASHM~1.DLL|JDash.Mvc.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.Mvc.dll</td><td>1</td><td/></row>
		<row><td>jdash.mvc.helloworld.csproj</td><td>ISX_DEFAULTCOMPONENT8</td><td>JDASHM~1.CSP|JDash.Mvc.HelloWorld.csproj</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\JDash.Mvc.HelloWorld.csproj</td><td>1</td><td/></row>
		<row><td>jdash.mvc.helloworld.csproj.</td><td>ISX_DEFAULTCOMPONENT8</td><td>JDASHM~1.USE|JDash.Mvc.HelloWorld.csproj.user</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\JDash.Mvc.HelloWorld.csproj.user</td><td>1</td><td/></row>
		<row><td>jdash.mvc.package.vsix</td><td>ISX_DEFAULTCOMPONENT6</td><td>JDASHM~1.VSI|JDash.Mvc.Package.vsix</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.Mvc.Package.vsix</td><td>1</td><td/></row>
		<row><td>jdash.mvc.packageinstaller.e</td><td>JDash.Mvc.PackageInstaller.exe</td><td>JDASHM~1.EXE|JDash.Mvc.PackageInstaller.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.Mvc.PackageInstaller.exe</td><td>1</td><td/></row>
		<row><td>jdash.mvc.starterapplication</td><td>JDash.Mvc.StarterApplication.exe</td><td>JDASHM~1.EXE|JDash.Mvc.StarterApplication.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.Mvc.StarterApplication.exe</td><td>1</td><td/></row>
		<row><td>jdash.mvcdemo.csproj</td><td>ISX_DEFAULTCOMPONENT81</td><td>JDASHM~1.CSP|JDash.MvcDemo.csproj</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\JDash.MvcDemo.csproj</td><td>1</td><td/></row>
		<row><td>jdash.mvcdemo.csproj.filelis</td><td>ISX_DEFAULTCOMPONENT110</td><td>JDASHM~1.TXT|JDash.MvcDemo.csproj.FileListAbsolute.txt</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\obj\Debug\JDash.MvcDemo.csproj.FileListAbsolute.txt</td><td>1</td><td/></row>
		<row><td>jdash.mvcdemo.csproj.user</td><td>ISX_DEFAULTCOMPONENT81</td><td>JDASHM~1.USE|JDash.MvcDemo.csproj.user</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\JDash.MvcDemo.csproj.user</td><td>1</td><td/></row>
		<row><td>jdash.mvcdemo.csprojresolvea</td><td>ISX_DEFAULTCOMPONENT110</td><td>JDASHM~1.CAC|JDash.MvcDemo.csprojResolveAssemblyReference.cache</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\obj\Debug\JDash.MvcDemo.csprojResolveAssemblyReference.cache</td><td>1</td><td/></row>
		<row><td>jdash.mvcdemo.dll.config</td><td>ISX_DEFAULTCOMPONENT98</td><td>JDASHM~1.CON|JDash.MvcDemo.dll.config</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\JDash.MvcDemo.dll.config</td><td>1</td><td/></row>
		<row><td>jdash.mvcdemo.dll1</td><td>JDash.MvcDemo.dll1</td><td>JDASHM~1.DLL|JDash.MvcDemo.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\obj\Debug\JDash.MvcDemo.dll</td><td>1</td><td/></row>
		<row><td>jdash.mvcdemo.pdb</td><td>ISX_DEFAULTCOMPONENT98</td><td>JDASHM~1.PDB|JDash.MvcDemo.pdb</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\JDash.MvcDemo.pdb</td><td>1</td><td/></row>
		<row><td>jdash.mvcdemo.pdb1</td><td>ISX_DEFAULTCOMPONENT110</td><td>JDASHM~1.PDB|JDash.MvcDemo.pdb</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\obj\Debug\JDash.MvcDemo.pdb</td><td>1</td><td/></row>
		<row><td>jdash.mysqlprovider.dll</td><td>JDash.MySqlProvider.dll</td><td>JDASHM~1.DLL|JDash.MySqlProvider.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.MySqlProvider.dll</td><td>1</td><td/></row>
		<row><td>jdash.mysqlprovider.dll2</td><td>JDash.MySqlProvider.dll2</td><td>JDASHM~1.DLL|JDash.MySqlProvider.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\JDash.Mvc.Reference\JDash.MySqlProvider.dll</td><td>1</td><td/></row>
		<row><td>jdash.mysqlprovider.dll3</td><td>JDash.MySqlProvider.dll3</td><td>JDASHM~1.DLL|JDash.MySqlProvider.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\JDash.MySqlProvider.dll</td><td>1</td><td/></row>
		<row><td>jdash.mysqlprovider.dll4</td><td>JDash.MySqlProvider.dll4</td><td>JDASHM~1.DLL|JDash.MySqlProvider.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.MySqlProvider.dll</td><td>1</td><td/></row>
		<row><td>jdash.net_custom_development</td><td>ISX_DEFAULTCOMPONENT7</td><td>JDASHN~1.URL|JDash.Net Custom Development.url</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Documentation\JDash.Net Custom Development.url</td><td>1</td><td/></row>
		<row><td>jdash.net_official_web_site.</td><td>ISX_DEFAULTCOMPONENT7</td><td>JDASHN~1.URL|JDash.Net Official Web Site.url</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Documentation\JDash.Net Official Web Site.url</td><td>1</td><td/></row>
		<row><td>jdash.net_purchase.url</td><td>ISX_DEFAULTCOMPONENT7</td><td>JDASHN~1.URL|JDash.Net Purchase.url</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Documentation\JDash.Net Purchase.url</td><td>1</td><td/></row>
		<row><td>jdash.net_technical_support.</td><td>ISX_DEFAULTCOMPONENT7</td><td>JDASHN~1.URL|JDash.Net Technical Support.url</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Documentation\JDash.Net Technical Support.url</td><td>1</td><td/></row>
		<row><td>jdash.sessionprovider.dll</td><td>JDash.SessionProvider.dll</td><td>JDASHS~1.DLL|JDash.SessionProvider.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.SessionProvider.dll</td><td>1</td><td/></row>
		<row><td>jdash.sessionprovider.dll1</td><td>JDash.SessionProvider.dll1</td><td>JDASHS~1.DLL|JDash.SessionProvider.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\JDash.Mvc.Reference\JDash.SessionProvider.dll</td><td>1</td><td/></row>
		<row><td>jdash.sessionprovider.dll2</td><td>JDash.SessionProvider.dll2</td><td>JDASHS~1.DLL|JDash.SessionProvider.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\JDash.SessionProvider.dll</td><td>1</td><td/></row>
		<row><td>jdash.sessionprovider.dll3</td><td>JDash.SessionProvider.dll3</td><td>JDASHS~1.DLL|JDash.SessionProvider.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.SessionProvider.dll</td><td>1</td><td/></row>
		<row><td>jdash.sqlprovider.dll</td><td>JDash.SqlProvider.dll</td><td>JDASHS~1.DLL|JDash.SqlProvider.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.SqlProvider.dll</td><td>1</td><td/></row>
		<row><td>jdash.sqlprovider.dll2</td><td>JDash.SqlProvider.dll2</td><td>JDASHS~1.DLL|JDash.SqlProvider.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\JDash.Mvc.Reference\JDash.SqlProvider.dll</td><td>1</td><td/></row>
		<row><td>jdash.sqlprovider.dll3</td><td>JDash.SqlProvider.dll3</td><td>JDASHS~1.DLL|JDash.SqlProvider.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\JDash.SqlProvider.dll</td><td>1</td><td/></row>
		<row><td>jdash.sqlprovider.dll4</td><td>JDash.SqlProvider.dll4</td><td>JDASHS~1.DLL|JDash.SqlProvider.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Bin\JDash.SqlProvider.dll</td><td>1</td><td/></row>
		<row><td>jdashmvc.management.dll</td><td>JDashMvc.Management.dll</td><td>JDASHM~1.DLL|JDashMvc.Management.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\JDashMvc.Management.dll</td><td>1</td><td/></row>
		<row><td>jdashnetmvcdevelopersguide.p</td><td>ISX_DEFAULTCOMPONENT7</td><td>JDASHN~1.PDF|JDashNetMvcDevelopersGuide.pdf</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Documentation\JDashNetMvcDevelopersGuide.pdf</td><td>1</td><td/></row>
		<row><td>jquery.fancybox.css</td><td>ISX_DEFAULTCOMPONENT39</td><td>JQUERY~1.CSS|jquery.fancybox.css</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\resource\jquery.fancybox.css</td><td>1</td><td/></row>
		<row><td>jquery.fancybox.min.js</td><td>ISX_DEFAULTCOMPONENT38</td><td>JQUERY~1.JS|jquery.fancybox.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\jquery.fancybox.min.js</td><td>1</td><td/></row>
		<row><td>jquery.js</td><td>ISX_DEFAULTCOMPONENT40</td><td>jquery.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\bootstrap\jquery.js</td><td>1</td><td/></row>
		<row><td>jquery.js1</td><td>ISX_DEFAULTCOMPONENT29</td><td>jquery.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\jquery.js</td><td>1</td><td/></row>
		<row><td>jquery.sparkline.min.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>JQUERY~1.JS|jquery.sparkline.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\jquery.sparkline.min.js</td><td>1</td><td/></row>
		<row><td>jquery.swatchbook.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>JQUERY~1.JS|jquery.swatchbook.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\jquery.swatchbook.js</td><td>1</td><td/></row>
		<row><td>jquery.unobtrusive_ajax.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>JQUERY~1.JS|jquery.unobtrusive-ajax.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\jquery.unobtrusive-ajax.js</td><td>1</td><td/></row>
		<row><td>jquery.unobtrusive_ajax.min.</td><td>ISX_DEFAULTCOMPONENT114</td><td>JQUERY~1.JS|jquery.unobtrusive-ajax.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\jquery.unobtrusive-ajax.min.js</td><td>1</td><td/></row>
		<row><td>jquery.validate.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>JQUERY~1.JS|jquery.validate.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\jquery.validate.js</td><td>1</td><td/></row>
		<row><td>jquery.validate.min.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>JQUERY~1.JS|jquery.validate.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\jquery.validate.min.js</td><td>1</td><td/></row>
		<row><td>jquery.validate.unobtrusive.</td><td>ISX_DEFAULTCOMPONENT114</td><td>JQUERY~1.JS|jquery.validate.unobtrusive.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\jquery.validate.unobtrusive.js</td><td>1</td><td/></row>
		<row><td>jquery.validate.unobtrusive.1</td><td>ISX_DEFAULTCOMPONENT114</td><td>JQUERY~1.JS|jquery.validate.unobtrusive.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\jquery.validate.unobtrusive.min.js</td><td>1</td><td/></row>
		<row><td>jquery.validate_vsdoc.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>JQUERY~1.JS|jquery.validate-vsdoc.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\jquery.validate-vsdoc.js</td><td>1</td><td/></row>
		<row><td>jquery_1.8.3.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>JQUERY~1.JS|jquery-1.8.3.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\jquery-1.8.3.js</td><td>1</td><td/></row>
		<row><td>jquery_jvectormap_1.2.2.css</td><td>ISX_DEFAULTCOMPONENT100</td><td>JQUERY~1.CSS|jquery-jvectormap-1.2.2.css</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\css\jquery-jvectormap-1.2.2.css</td><td>1</td><td/></row>
		<row><td>jstd_scenario_adapter.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>JSTD-S~1.JS|jstd-scenario-adapter.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\jstd-scenario-adapter.js</td><td>1</td><td/></row>
		<row><td>jstd_scenario_adapter_config</td><td>ISX_DEFAULTCOMPONENT30</td><td>JSTD-S~1.JS|jstd-scenario-adapter-config.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\jstd-scenario-adapter-config.js</td><td>1</td><td/></row>
		<row><td>jvectormap.min.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>JVECTO~1.JS|jvectormap.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\jvectormap.min.js</td><td>1</td><td/></row>
		<row><td>jvectormapcontroller.cs</td><td>ISX_DEFAULTCOMPONENT86</td><td>JVECTO~1.CS|JVectorMapController.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Controllers\JVectorMapController.cs</td><td>1</td><td/></row>
		<row><td>jvectormapmodel.cs</td><td>ISX_DEFAULTCOMPONENT87</td><td>JVECTO~1.CS|JVectorMapModel.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Models\JVectorMapModel.cs</td><td>1</td><td/></row>
		<row><td>kltadmin.js</td><td>ISX_DEFAULTCOMPONENT33</td><td>KltAdmin.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\admin\KltAdmin.js</td><td>1</td><td/></row>
		<row><td>language.js</td><td>ISX_DEFAULTCOMPONENT36</td><td>language.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\nls\language.js</td><td>1</td><td/></row>
		<row><td>language.js1</td><td>ISX_DEFAULTCOMPONENT37</td><td>language.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\nls\tr\language.js</td><td>1</td><td/></row>
		<row><td>light_rain.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|light-rain.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\light-rain.png</td><td>1</td><td/></row>
		<row><td>light_rain_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|light-rain-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\light-rain-128.png</td><td>1</td><td/></row>
		<row><td>light_rain_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|light-rain-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\light-rain-16.png</td><td>1</td><td/></row>
		<row><td>light_rain_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|light-rain-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\light-rain-24.png</td><td>1</td><td/></row>
		<row><td>light_rain_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|light-rain-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\light-rain-32.png</td><td>1</td><td/></row>
		<row><td>light_rain_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|light-rain-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\light-rain-48.png</td><td>1</td><td/></row>
		<row><td>light_rain_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|light-rain-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\light-rain-64.png</td><td>1</td><td/></row>
		<row><td>light_showers.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|Light-Showers.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Light-Showers.png</td><td>1</td><td/></row>
		<row><td>light_showers_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|Light-Showers-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Light-Showers-128.png</td><td>1</td><td/></row>
		<row><td>light_showers_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|Light-Showers-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Light-Showers-16.png</td><td>1</td><td/></row>
		<row><td>light_showers_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|Light-Showers-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Light-Showers-24.png</td><td>1</td><td/></row>
		<row><td>light_showers_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|Light-Showers-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Light-Showers-32.png</td><td>1</td><td/></row>
		<row><td>light_showers_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|Light-Showers-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Light-Showers-48.png</td><td>1</td><td/></row>
		<row><td>light_showers_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|Light-Showers-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Light-Showers-64.png</td><td>1</td><td/></row>
		<row><td>light_snow.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|light-snow.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\light-snow.png</td><td>1</td><td/></row>
		<row><td>light_snow_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|light-snow-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\light-snow-128.png</td><td>1</td><td/></row>
		<row><td>light_snow_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|light-snow-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\light-snow-16.png</td><td>1</td><td/></row>
		<row><td>light_snow_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|light-snow-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\light-snow-24.png</td><td>1</td><td/></row>
		<row><td>light_snow_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|light-snow-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\light-snow-32.png</td><td>1</td><td/></row>
		<row><td>light_snow_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|light-snow-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\light-snow-48.png</td><td>1</td><td/></row>
		<row><td>light_snow_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHT-~1.PNG|light-snow-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\light-snow-64.png</td><td>1</td><td/></row>
		<row><td>lightning.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHTN~1.PNG|lightning.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\lightning.png</td><td>1</td><td/></row>
		<row><td>lightning_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHTN~1.PNG|lightning-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\lightning-128.png</td><td>1</td><td/></row>
		<row><td>lightning_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHTN~1.PNG|lightning-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\lightning-16.png</td><td>1</td><td/></row>
		<row><td>lightning_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHTN~1.PNG|lightning-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\lightning-24.png</td><td>1</td><td/></row>
		<row><td>lightning_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHTN~1.PNG|lightning-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\lightning-32.png</td><td>1</td><td/></row>
		<row><td>lightning_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHTN~1.PNG|lightning-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\lightning-48.png</td><td>1</td><td/></row>
		<row><td>lightning_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>LIGHTN~1.PNG|lightning-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\lightning-64.png</td><td>1</td><td/></row>
		<row><td>line.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>line.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\line.png</td><td>1</td><td/></row>
		<row><td>logo.png</td><td>ISX_DEFAULTCOMPONENT35</td><td>logo.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\images\logo.png</td><td>1</td><td/></row>
		<row><td>logo.png1</td><td>ISX_DEFAULTCOMPONENT44</td><td>logo.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Styles\images\logo.png</td><td>1</td><td/></row>
		<row><td>main.css</td><td>ISX_DEFAULTCOMPONENT104</td><td>main.css</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\Themes\Custom\main.css</td><td>1</td><td/></row>
		<row><td>main.less</td><td>ISX_DEFAULTCOMPONENT104</td><td>MAIN~1.LES|main.less</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\Themes\Custom\main.less</td><td>1</td><td/></row>
		<row><td>microsoft.aspnet.mvc.4.0.207</td><td>ISX_DEFAULTCOMPONENT50</td><td>MICROS~1.NUP|Microsoft.AspNet.Mvc.4.0.20710.0.nupkg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.Mvc.4.0.20710.0\Microsoft.AspNet.Mvc.4.0.20710.0.nupkg</td><td>1</td><td/></row>
		<row><td>microsoft.aspnet.mvc.4.0.2071</td><td>ISX_DEFAULTCOMPONENT50</td><td>MICROS~1.NUS|Microsoft.AspNet.Mvc.4.0.20710.0.nuspec</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.Mvc.4.0.20710.0\Microsoft.AspNet.Mvc.4.0.20710.0.nuspec</td><td>1</td><td/></row>
		<row><td>microsoft.aspnet.razor.2.0.2</td><td>ISX_DEFAULTCOMPONENT53</td><td>MICROS~1.NUP|Microsoft.AspNet.Razor.2.0.20710.0.nupkg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.Razor.2.0.20710.0\Microsoft.AspNet.Razor.2.0.20710.0.nupkg</td><td>1</td><td/></row>
		<row><td>microsoft.aspnet.web.optimiz</td><td>ISX_DEFAULTCOMPONENT56</td><td>MICROS~1.NUP|Microsoft.AspNet.Web.Optimization.1.0.0.nupkg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.Web.Optimization.1.0.0\Microsoft.AspNet.Web.Optimization.1.0.0.nupkg</td><td>1</td><td/></row>
		<row><td>microsoft.aspnet.webapi.4.0.</td><td>ISX_DEFAULTCOMPONENT59</td><td>MICROS~1.NUP|Microsoft.AspNet.WebApi.4.0.20710.0.nupkg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebApi.4.0.20710.0\Microsoft.AspNet.WebApi.4.0.20710.0.nupkg</td><td>1</td><td/></row>
		<row><td>microsoft.aspnet.webapi.4.0.1</td><td>ISX_DEFAULTCOMPONENT59</td><td>MICROS~1.NUS|Microsoft.AspNet.WebApi.4.0.20710.0.nuspec</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebApi.4.0.20710.0\Microsoft.AspNet.WebApi.4.0.20710.0.nuspec</td><td>1</td><td/></row>
		<row><td>microsoft.aspnet.webapi.core</td><td>ISX_DEFAULTCOMPONENT60</td><td>MICROS~1.NUP|Microsoft.AspNet.WebApi.Core.4.0.20710.0.nupkg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebApi.Core.4.0.20710.0\Microsoft.AspNet.WebApi.Core.4.0.20710.0.nupkg</td><td>1</td><td/></row>
		<row><td>microsoft.aspnet.webapi.core1</td><td>ISX_DEFAULTCOMPONENT60</td><td>MICROS~1.NUS|Microsoft.AspNet.WebApi.Core.4.0.20710.0.nuspec</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebApi.Core.4.0.20710.0\Microsoft.AspNet.WebApi.Core.4.0.20710.0.nuspec</td><td>1</td><td/></row>
		<row><td>microsoft.aspnet.webapi.webh</td><td>ISX_DEFAULTCOMPONENT64</td><td>MICROS~1.NUP|Microsoft.AspNet.WebApi.WebHost.4.0.20710.0.nupkg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebApi.WebHost.4.0.20710.0\Microsoft.AspNet.WebApi.WebHost.4.0.20710.0.nupkg</td><td>1</td><td/></row>
		<row><td>microsoft.aspnet.webapi.webh1</td><td>ISX_DEFAULTCOMPONENT64</td><td>MICROS~1.NUS|Microsoft.AspNet.WebApi.WebHost.4.0.20710.0.nuspec</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebApi.WebHost.4.0.20710.0\Microsoft.AspNet.WebApi.WebHost.4.0.20710.0.nuspec</td><td>1</td><td/></row>
		<row><td>microsoft.aspnet.webpages.2.</td><td>ISX_DEFAULTCOMPONENT67</td><td>MICROS~1.NUP|Microsoft.AspNet.WebPages.2.0.20710.0.nupkg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebPages.2.0.20710.0\Microsoft.AspNet.WebPages.2.0.20710.0.nupkg</td><td>1</td><td/></row>
		<row><td>microsoft.aspnet.webpages.2.1</td><td>ISX_DEFAULTCOMPONENT67</td><td>MICROS~1.NUS|Microsoft.AspNet.WebPages.2.0.20710.0.nuspec</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebPages.2.0.20710.0\Microsoft.AspNet.WebPages.2.0.20710.0.nuspec</td><td>1</td><td/></row>
		<row><td>microsoft.net.http.2.0.20710</td><td>ISX_DEFAULTCOMPONENT70</td><td>MICROS~1.NUP|Microsoft.Net.Http.2.0.20710.0.nupkg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.Net.Http.2.0.20710.0\Microsoft.Net.Http.2.0.20710.0.nupkg</td><td>1</td><td/></row>
		<row><td>microsoft.net.http.2.0.207101</td><td>ISX_DEFAULTCOMPONENT70</td><td>MICROS~1.NUS|Microsoft.Net.Http.2.0.20710.0.nuspec</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.Net.Http.2.0.20710.0\Microsoft.Net.Http.2.0.20710.0.nuspec</td><td>1</td><td/></row>
		<row><td>microsoft.web.infrastructure</td><td>Microsoft.Web.Infrastructure.dll</td><td>MICROS~1.DLL|Microsoft.Web.Infrastructure.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\bin\Microsoft.Web.Infrastructure.dll</td><td>1</td><td/></row>
		<row><td>microsoft.web.webpages.oauth</td><td>Microsoft.Web.WebPages.OAuth.dll</td><td>MICROS~1.DLL|Microsoft.Web.WebPages.OAuth.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\Microsoft.Web.WebPages.OAuth.dll</td><td>1</td><td/></row>
		<row><td>modernizr.custom.79639.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>MODERN~1.JS|modernizr.custom.79639.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\modernizr.custom.79639.js</td><td>1</td><td/></row>
		<row><td>mysql.data.dll</td><td>MySql.Data.dll</td><td>MYSQLD~1.DLL|MySql.Data.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\MySql.Data.dll</td><td>1</td><td/></row>
		<row><td>mysql.data.dll1</td><td>MySql.Data.dll1</td><td>MYSQLD~1.DLL|MySql.Data.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\MySql.DataProvider\MySql.Data.dll</td><td>1</td><td/></row>
		<row><td>mysql.data.dll2</td><td>MySql.Data.dll2</td><td>MYSQLD~1.DLL|MySql.Data.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\MySql.Data.dll</td><td>1</td><td/></row>
		<row><td>mysql.data.entity.dll</td><td>MySql.Data.Entity.dll</td><td>MYSQLD~1.DLL|MySql.Data.Entity.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\bin\MySql.Data.Entity.dll</td><td>1</td><td/></row>
		<row><td>mysql.data.entity.dll1</td><td>MySql.Data.Entity.dll1</td><td>MYSQLD~1.DLL|MySql.Data.Entity.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\MySql.Data.Entity.dll</td><td>1</td><td/></row>
		<row><td>mysql.data.entity.dll2</td><td>MySql.Data.Entity.dll2</td><td>MYSQLD~1.DLL|MySql.Data.Entity.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\MySql.DataProvider\MySql.Data.Entity.dll</td><td>1</td><td/></row>
		<row><td>mysql.data.entity.dll3</td><td>MySql.Data.Entity.dll3</td><td>MYSQLD~1.DLL|MySql.Data.Entity.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\MySql.Data.Entity.dll</td><td>1</td><td/></row>
		<row><td>mysql_logo.jpg</td><td>ISX_DEFAULTCOMPONENT102</td><td>MYSQL-~1.JPG|mysql-logo.jpg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\images\mysql-logo.jpg</td><td>1</td><td/></row>
		<row><td>mysqldashboardprovider.sql</td><td>ISX_DEFAULTCOMPONENT82</td><td>MYSQLD~1.SQL|MySQLDashboardProvider.sql</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\App_Data\MySQLDashboardProvider.sql</td><td>1</td><td/></row>
		<row><td>newtonsoft.json.4.5.6.nupkg</td><td>ISX_DEFAULTCOMPONENT75</td><td>NEWTON~1.NUP|Newtonsoft.Json.4.5.6.nupkg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Newtonsoft.Json.4.5.6\Newtonsoft.Json.4.5.6.nupkg</td><td>1</td><td/></row>
		<row><td>newtonsoft.json.dll</td><td>Newtonsoft.Json.dll</td><td>NEWTON~1.DLL|Newtonsoft.Json.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\bin\Newtonsoft.Json.dll</td><td>1</td><td/></row>
		<row><td>newtonsoft.json.dll1</td><td>Newtonsoft.Json.dll1</td><td>NEWTON~1.DLL|Newtonsoft.Json.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\Newtonsoft.Json.dll</td><td>1</td><td/></row>
		<row><td>newtonsoft.json.dll2</td><td>Newtonsoft.Json.dll2</td><td>NEWTON~1.DLL|Newtonsoft.Json.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Newtonsoft.Json.4.5.6\lib\net40\Newtonsoft.Json.dll</td><td>1</td><td/></row>
		<row><td>newtonsoft.json.dll3</td><td>Newtonsoft.Json.dll3</td><td>NEWTON~1.DLL|Newtonsoft.Json.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\Newtonsoft.Json.dll</td><td>1</td><td/></row>
		<row><td>newtonsoft.json.xml</td><td>ISX_DEFAULTCOMPONENT77</td><td>NEWTON~1.XML|Newtonsoft.Json.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Newtonsoft.Json.4.5.6\lib\net40\Newtonsoft.Json.xml</td><td>1</td><td/></row>
		<row><td>newtonsoft.json.xml1</td><td>ISX_DEFAULTCOMPONENT98</td><td>NEWTON~1.XML|Newtonsoft.Json.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\Newtonsoft.Json.xml</td><td>1</td><td/></row>
		<row><td>overcast.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>Overcast.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Overcast.png</td><td>1</td><td/></row>
		<row><td>overcast_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>OVERCA~1.PNG|Overcast-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Overcast-128.png</td><td>1</td><td/></row>
		<row><td>overcast_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>OVERCA~1.PNG|Overcast-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Overcast-16.png</td><td>1</td><td/></row>
		<row><td>overcast_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>OVERCA~1.PNG|Overcast-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Overcast-24.png</td><td>1</td><td/></row>
		<row><td>overcast_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>OVERCA~1.PNG|Overcast-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Overcast-32.png</td><td>1</td><td/></row>
		<row><td>overcast_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>OVERCA~1.PNG|Overcast-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Overcast-48.png</td><td>1</td><td/></row>
		<row><td>overcast_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>OVERCA~1.PNG|Overcast-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Overcast-64.png</td><td>1</td><td/></row>
		<row><td>package.json</td><td>ISX_DEFAULTCOMPONENT32</td><td>PACKAG~1.JSO|package.json</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\package.json</td><td>1</td><td/></row>
		<row><td>packages.config</td><td>ISX_DEFAULTCOMPONENT8</td><td>PACKAG~1.CON|packages.config</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\packages.config</td><td>1</td><td/></row>
		<row><td>packages.config1</td><td>ISX_DEFAULTCOMPONENT27</td><td>PACKAG~1.CON|packages.config</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\packages.config</td><td>1</td><td/></row>
		<row><td>packages.config2</td><td>ISX_DEFAULTCOMPONENT81</td><td>PACKAG~1.CON|packages.config</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\packages.config</td><td>1</td><td/></row>
		<row><td>panecommandcontroller.js</td><td>ISX_DEFAULTCOMPONENT33</td><td>PANECO~1.JS|PaneCommandController.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\admin\PaneCommandController.js</td><td>1</td><td/></row>
		<row><td>prettify.css</td><td>ISX_DEFAULTCOMPONENT38</td><td>prettify.css</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\prettify.css</td><td>1</td><td/></row>
		<row><td>prettify.js</td><td>ISX_DEFAULTCOMPONENT38</td><td>prettify.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\app\resource\ViewSourceDialog\prettify.js</td><td>1</td><td/></row>
		<row><td>rain.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>rain.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\rain.png</td><td>1</td><td/></row>
		<row><td>rain_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>rain-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\rain-128.png</td><td>1</td><td/></row>
		<row><td>rain_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>rain-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\rain-16.png</td><td>1</td><td/></row>
		<row><td>rain_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>rain-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\rain-24.png</td><td>1</td><td/></row>
		<row><td>rain_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>rain-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\rain-32.png</td><td>1</td><td/></row>
		<row><td>rain_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>rain-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\rain-48.png</td><td>1</td><td/></row>
		<row><td>rain_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>rain-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\rain-64.png</td><td>1</td><td/></row>
		<row><td>routeconfig.cs</td><td>ISX_DEFAULTCOMPONENT10</td><td>ROUTEC~1.CS|RouteConfig.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\App_Start\RouteConfig.cs</td><td>1</td><td/></row>
		<row><td>routeconfig.cs1</td><td>ISX_DEFAULTCOMPONENT83</td><td>ROUTEC~1.CS|RouteConfig.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\App_Start\RouteConfig.cs</td><td>1</td><td/></row>
		<row><td>rsscontroller.cs</td><td>ISX_DEFAULTCOMPONENT86</td><td>RSSCON~1.CS|RssController.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Controllers\RssController.cs</td><td>1</td><td/></row>
		<row><td>rssmodels.cs</td><td>ISX_DEFAULTCOMPONENT87</td><td>RSSMOD~1.CS|RssModels.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Models\RssModels.cs</td><td>1</td><td/></row>
		<row><td>setup.config</td><td>ISX_DEFAULTCOMPONENT8</td><td>SETUP~1.CON|setup.config</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\setup.config</td><td>1</td><td/></row>
		<row><td>showers.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>Showers.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Showers.png</td><td>1</td><td/></row>
		<row><td>showers_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SHOWER~1.PNG|Showers-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Showers-128.png</td><td>1</td><td/></row>
		<row><td>showers_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SHOWER~1.PNG|Showers-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Showers-16.png</td><td>1</td><td/></row>
		<row><td>showers_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SHOWER~1.PNG|Showers-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Showers-24.png</td><td>1</td><td/></row>
		<row><td>showers_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SHOWER~1.PNG|Showers-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Showers-32.png</td><td>1</td><td/></row>
		<row><td>showers_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SHOWER~1.PNG|Showers-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Showers-48.png</td><td>1</td><td/></row>
		<row><td>showers_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SHOWER~1.PNG|Showers-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Showers-64.png</td><td>1</td><td/></row>
		<row><td>site.css</td><td>ISX_DEFAULTCOMPONENT100</td><td>Site.css</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\css\Site.css</td><td>1</td><td/></row>
		<row><td>sly.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>sly.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\sly.js</td><td>1</td><td/></row>
		<row><td>snow.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>snow.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\snow.png</td><td>1</td><td/></row>
		<row><td>snow_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>snow-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\snow-128.png</td><td>1</td><td/></row>
		<row><td>snow_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>snow-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\snow-16.png</td><td>1</td><td/></row>
		<row><td>snow_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>snow-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\snow-24.png</td><td>1</td><td/></row>
		<row><td>snow_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>snow-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\snow-32.png</td><td>1</td><td/></row>
		<row><td>snow_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>snow-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\snow-48.png</td><td>1</td><td/></row>
		<row><td>snow_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>snow-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\snow-64.png</td><td>1</td><td/></row>
		<row><td>sparkline.js</td><td>ISX_DEFAULTCOMPONENT114</td><td>SPARKL~1.JS|sparkline.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\sparkline.js</td><td>1</td><td/></row>
		<row><td>sparklinecontroller.cs</td><td>ISX_DEFAULTCOMPONENT86</td><td>SPARKL~1.CS|SparkLineController.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Controllers\SparkLineController.cs</td><td>1</td><td/></row>
		<row><td>sparklinemodel.cs</td><td>ISX_DEFAULTCOMPONENT87</td><td>SPARKL~1.CS|SparkLineModel.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Models\SparkLineModel.cs</td><td>1</td><td/></row>
		<row><td>sql_server_logo.png</td><td>ISX_DEFAULTCOMPONENT102</td><td>SQL-SE~1.PNG|SQL-Server-logo.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\images\SQL-Server-logo.png</td><td>1</td><td/></row>
		<row><td>sqldashboardprovider.sql</td><td>ISX_DEFAULTCOMPONENT82</td><td>SQLDAS~1.SQL|SQLDashboardProvider.sql</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\App_Data\SQLDashboardProvider.sql</td><td>1</td><td/></row>
		<row><td>sunny.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>Sunny.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny.png</td><td>1</td><td/></row>
		<row><td>sunny_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-128.png</td><td>1</td><td/></row>
		<row><td>sunny_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>Sunny-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-16.png</td><td>1</td><td/></row>
		<row><td>sunny_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>Sunny-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-24.png</td><td>1</td><td/></row>
		<row><td>sunny_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>Sunny-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-32.png</td><td>1</td><td/></row>
		<row><td>sunny_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>Sunny-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-48.png</td><td>1</td><td/></row>
		<row><td>sunny_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>Sunny-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-64.png</td><td>1</td><td/></row>
		<row><td>sunny_interval.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-Interval.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-Interval.png</td><td>1</td><td/></row>
		<row><td>sunny_interval_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-Interval-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-Interval-128.png</td><td>1</td><td/></row>
		<row><td>sunny_interval_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-Interval-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-Interval-16.png</td><td>1</td><td/></row>
		<row><td>sunny_interval_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-Interval-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-Interval-24.png</td><td>1</td><td/></row>
		<row><td>sunny_interval_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-Interval-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-Interval-32.png</td><td>1</td><td/></row>
		<row><td>sunny_interval_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-Interval-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-Interval-48.png</td><td>1</td><td/></row>
		<row><td>sunny_interval_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-Interval-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-Interval-64.png</td><td>1</td><td/></row>
		<row><td>sunny_period.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-Period.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-Period.png</td><td>1</td><td/></row>
		<row><td>sunny_period_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-Period-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-Period-128.png</td><td>1</td><td/></row>
		<row><td>sunny_period_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-Period-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-Period-16.png</td><td>1</td><td/></row>
		<row><td>sunny_period_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-Period-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-Period-24.png</td><td>1</td><td/></row>
		<row><td>sunny_period_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-Period-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-Period-32.png</td><td>1</td><td/></row>
		<row><td>sunny_period_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-Period-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-Period-48.png</td><td>1</td><td/></row>
		<row><td>sunny_period_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>SUNNY-~1.PNG|Sunny-Period-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Sunny-Period-64.png</td><td>1</td><td/></row>
		<row><td>system.net.http.dll</td><td>System.Net.Http.dll</td><td>SYSTEM~1.DLL|System.Net.Http.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\bin\System.Net.Http.dll</td><td>1</td><td/></row>
		<row><td>system.net.http.dll1</td><td>System.Net.Http.dll1</td><td>SYSTEM~1.DLL|System.Net.Http.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.Net.Http.2.0.20710.0\lib\net40\System.Net.Http.dll</td><td>1</td><td/></row>
		<row><td>system.net.http.dll2</td><td>System.Net.Http.dll2</td><td>SYSTEM~1.DLL|System.Net.Http.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Net.Http.dll</td><td>1</td><td/></row>
		<row><td>system.net.http.formatting.d</td><td>System.Net.Http.Formatting.dll</td><td>SYSTEM~1.DLL|System.Net.Http.Formatting.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\bin\System.Net.Http.Formatting.dll</td><td>1</td><td/></row>
		<row><td>system.net.http.formatting.d1</td><td>System.Net.Http.Formatting.dll1</td><td>SYSTEM~1.DLL|System.Net.Http.Formatting.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\System.Net.Http.Formatting.dll</td><td>1</td><td/></row>
		<row><td>system.net.http.formatting.d2</td><td>System.Net.Http.Formatting.dll2</td><td>SYSTEM~1.DLL|System.Net.Http.Formatting.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Net.Http.Formatting.dll</td><td>1</td><td/></row>
		<row><td>system.net.http.formatting.x</td><td>ISX_DEFAULTCOMPONENT98</td><td>SYSTEM~1.XML|System.Net.Http.Formatting.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Net.Http.Formatting.xml</td><td>1</td><td/></row>
		<row><td>system.net.http.webrequest.d</td><td>System.Net.Http.WebRequest.dll</td><td>SYSTEM~1.DLL|System.Net.Http.WebRequest.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\bin\System.Net.Http.WebRequest.dll</td><td>1</td><td/></row>
		<row><td>system.net.http.webrequest.d1</td><td>System.Net.Http.WebRequest.dll1</td><td>SYSTEM~1.DLL|System.Net.Http.WebRequest.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.Net.Http.2.0.20710.0\lib\net40\System.Net.Http.WebRequest.dll</td><td>1</td><td/></row>
		<row><td>system.net.http.webrequest.x</td><td>ISX_DEFAULTCOMPONENT72</td><td>SYSTEM~1.XML|System.Net.Http.WebRequest.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.Net.Http.2.0.20710.0\lib\net40\System.Net.Http.WebRequest.xml</td><td>1</td><td/></row>
		<row><td>system.net.http.xml</td><td>ISX_DEFAULTCOMPONENT72</td><td>SYSTEM~1.XML|System.Net.Http.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.Net.Http.2.0.20710.0\lib\net40\System.Net.Http.xml</td><td>1</td><td/></row>
		<row><td>system.net.http.xml1</td><td>ISX_DEFAULTCOMPONENT98</td><td>SYSTEM~1.XML|System.Net.Http.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Net.Http.xml</td><td>1</td><td/></row>
		<row><td>system.web.helpers.dll</td><td>System.Web.Helpers.dll</td><td>SYSTEM~1.DLL|System.Web.Helpers.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\bin\System.Web.Helpers.dll</td><td>1</td><td/></row>
		<row><td>system.web.helpers.dll1</td><td>System.Web.Helpers.dll1</td><td>SYSTEM~1.DLL|System.Web.Helpers.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\System.Web.Helpers.dll</td><td>1</td><td/></row>
		<row><td>system.web.helpers.dll2</td><td>System.Web.Helpers.dll2</td><td>SYSTEM~1.DLL|System.Web.Helpers.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebPages.2.0.20710.0\lib\net40\System.Web.Helpers.dll</td><td>1</td><td/></row>
		<row><td>system.web.helpers.dll3</td><td>System.Web.Helpers.dll3</td><td>SYSTEM~1.DLL|System.Web.Helpers.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.Helpers.dll</td><td>1</td><td/></row>
		<row><td>system.web.helpers.xml</td><td>ISX_DEFAULTCOMPONENT69</td><td>SYSTEM~1.XML|System.Web.Helpers.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebPages.2.0.20710.0\lib\net40\System.Web.Helpers.xml</td><td>1</td><td/></row>
		<row><td>system.web.helpers.xml1</td><td>ISX_DEFAULTCOMPONENT98</td><td>SYSTEM~1.XML|System.Web.Helpers.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.Helpers.xml</td><td>1</td><td/></row>
		<row><td>system.web.http.dll</td><td>System.Web.Http.dll</td><td>SYSTEM~1.DLL|System.Web.Http.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\bin\System.Web.Http.dll</td><td>1</td><td/></row>
		<row><td>system.web.http.dll1</td><td>System.Web.Http.dll1</td><td>SYSTEM~1.DLL|System.Web.Http.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\System.Web.Http.dll</td><td>1</td><td/></row>
		<row><td>system.web.http.dll2</td><td>System.Web.Http.dll2</td><td>SYSTEM~1.DLL|System.Web.Http.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebApi.Core.4.0.20710.0\lib\net40\System.Web.Http.dll</td><td>1</td><td/></row>
		<row><td>system.web.http.dll3</td><td>System.Web.Http.dll3</td><td>SYSTEM~1.DLL|System.Web.Http.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.Http.dll</td><td>1</td><td/></row>
		<row><td>system.web.http.webhost.dll</td><td>System.Web.Http.WebHost.dll</td><td>SYSTEM~1.DLL|System.Web.Http.WebHost.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\bin\System.Web.Http.WebHost.dll</td><td>1</td><td/></row>
		<row><td>system.web.http.webhost.dll1</td><td>System.Web.Http.WebHost.dll1</td><td>SYSTEM~1.DLL|System.Web.Http.WebHost.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\System.Web.Http.WebHost.dll</td><td>1</td><td/></row>
		<row><td>system.web.http.webhost.dll2</td><td>System.Web.Http.WebHost.dll2</td><td>SYSTEM~1.DLL|System.Web.Http.WebHost.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebApi.WebHost.4.0.20710.0\lib\net40\System.Web.Http.WebHost.dll</td><td>1</td><td/></row>
		<row><td>system.web.http.webhost.dll3</td><td>System.Web.Http.WebHost.dll3</td><td>SYSTEM~1.DLL|System.Web.Http.WebHost.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.Http.WebHost.dll</td><td>1</td><td/></row>
		<row><td>system.web.http.webhost.xml</td><td>ISX_DEFAULTCOMPONENT66</td><td>SYSTEM~1.XML|System.Web.Http.WebHost.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebApi.WebHost.4.0.20710.0\lib\net40\System.Web.Http.WebHost.xml</td><td>1</td><td/></row>
		<row><td>system.web.http.webhost.xml1</td><td>ISX_DEFAULTCOMPONENT98</td><td>SYSTEM~1.XML|System.Web.Http.WebHost.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.Http.WebHost.xml</td><td>1</td><td/></row>
		<row><td>system.web.http.xml</td><td>ISX_DEFAULTCOMPONENT63</td><td>SYSTEM~1.XML|System.Web.Http.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebApi.Core.4.0.20710.0\lib\net40\System.Web.Http.xml</td><td>1</td><td/></row>
		<row><td>system.web.http.xml1</td><td>ISX_DEFAULTCOMPONENT98</td><td>SYSTEM~1.XML|System.Web.Http.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.Http.xml</td><td>1</td><td/></row>
		<row><td>system.web.mvc.dll</td><td>System.Web.Mvc.dll</td><td>SYSTEM~1.DLL|System.Web.Mvc.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\bin\System.Web.Mvc.dll</td><td>1</td><td/></row>
		<row><td>system.web.mvc.dll1</td><td>System.Web.Mvc.dll1</td><td>SYSTEM~1.DLL|System.Web.Mvc.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\System.Web.Mvc.dll</td><td>1</td><td/></row>
		<row><td>system.web.mvc.dll2</td><td>System.Web.Mvc.dll2</td><td>SYSTEM~1.DLL|System.Web.Mvc.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.Mvc.4.0.20710.0\lib\net40\System.Web.Mvc.dll</td><td>1</td><td/></row>
		<row><td>system.web.mvc.dll3</td><td>System.Web.Mvc.dll3</td><td>SYSTEM~1.DLL|System.Web.Mvc.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.Mvc.dll</td><td>1</td><td/></row>
		<row><td>system.web.mvc.xml</td><td>ISX_DEFAULTCOMPONENT52</td><td>SYSTEM~1.XML|System.Web.Mvc.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.Mvc.4.0.20710.0\lib\net40\System.Web.Mvc.xml</td><td>1</td><td/></row>
		<row><td>system.web.mvc.xml1</td><td>ISX_DEFAULTCOMPONENT98</td><td>SYSTEM~1.XML|System.Web.Mvc.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.Mvc.xml</td><td>1</td><td/></row>
		<row><td>system.web.optimization.dll</td><td>System.Web.Optimization.dll</td><td>SYSTEM~1.DLL|System.Web.Optimization.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\System.Web.Optimization.dll</td><td>1</td><td/></row>
		<row><td>system.web.optimization.dll1</td><td>System.Web.Optimization.dll1</td><td>SYSTEM~1.DLL|System.Web.Optimization.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.Web.Optimization.1.0.0\lib\net40\System.Web.Optimization.dll</td><td>1</td><td/></row>
		<row><td>system.web.optimization.dll2</td><td>System.Web.Optimization.dll2</td><td>SYSTEM~1.DLL|System.Web.Optimization.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.Optimization.dll</td><td>1</td><td/></row>
		<row><td>system.web.razor.dll</td><td>System.Web.Razor.dll</td><td>SYSTEM~1.DLL|System.Web.Razor.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\bin\System.Web.Razor.dll</td><td>1</td><td/></row>
		<row><td>system.web.razor.dll1</td><td>System.Web.Razor.dll1</td><td>SYSTEM~1.DLL|System.Web.Razor.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\System.Web.Razor.dll</td><td>1</td><td/></row>
		<row><td>system.web.razor.dll2</td><td>System.Web.Razor.dll2</td><td>SYSTEM~1.DLL|System.Web.Razor.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.Razor.2.0.20710.0\lib\net40\System.Web.Razor.dll</td><td>1</td><td/></row>
		<row><td>system.web.razor.dll3</td><td>System.Web.Razor.dll3</td><td>SYSTEM~1.DLL|System.Web.Razor.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.Razor.dll</td><td>1</td><td/></row>
		<row><td>system.web.razor.xml</td><td>ISX_DEFAULTCOMPONENT55</td><td>SYSTEM~1.XML|System.Web.Razor.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.Razor.2.0.20710.0\lib\net40\System.Web.Razor.xml</td><td>1</td><td/></row>
		<row><td>system.web.razor.xml1</td><td>ISX_DEFAULTCOMPONENT98</td><td>SYSTEM~1.XML|System.Web.Razor.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.Razor.xml</td><td>1</td><td/></row>
		<row><td>system.web.webpages.deployme</td><td>System.Web.WebPages.Deployment.dll</td><td>SYSTEM~1.DLL|System.Web.WebPages.Deployment.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\bin\System.Web.WebPages.Deployment.dll</td><td>1</td><td/></row>
		<row><td>system.web.webpages.deployme1</td><td>System.Web.WebPages.Deployment.dll1</td><td>SYSTEM~1.DLL|System.Web.WebPages.Deployment.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\System.Web.WebPages.Deployment.dll</td><td>1</td><td/></row>
		<row><td>system.web.webpages.deployme2</td><td>System.Web.WebPages.Deployment.dll2</td><td>SYSTEM~1.DLL|System.Web.WebPages.Deployment.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebPages.2.0.20710.0\lib\net40\System.Web.WebPages.Deployment.dll</td><td>1</td><td/></row>
		<row><td>system.web.webpages.deployme3</td><td>ISX_DEFAULTCOMPONENT69</td><td>SYSTEM~1.XML|System.Web.WebPages.Deployment.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebPages.2.0.20710.0\lib\net40\System.Web.WebPages.Deployment.xml</td><td>1</td><td/></row>
		<row><td>system.web.webpages.deployme4</td><td>System.Web.WebPages.Deployment.dll3</td><td>SYSTEM~1.DLL|System.Web.WebPages.Deployment.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.WebPages.Deployment.dll</td><td>1</td><td/></row>
		<row><td>system.web.webpages.deployme5</td><td>ISX_DEFAULTCOMPONENT98</td><td>SYSTEM~1.XML|System.Web.WebPages.Deployment.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.WebPages.Deployment.xml</td><td>1</td><td/></row>
		<row><td>system.web.webpages.dll</td><td>System.Web.WebPages.dll</td><td>SYSTEM~1.DLL|System.Web.WebPages.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\bin\System.Web.WebPages.dll</td><td>1</td><td/></row>
		<row><td>system.web.webpages.dll1</td><td>System.Web.WebPages.dll1</td><td>SYSTEM~1.DLL|System.Web.WebPages.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\System.Web.WebPages.dll</td><td>1</td><td/></row>
		<row><td>system.web.webpages.dll2</td><td>System.Web.WebPages.dll2</td><td>SYSTEM~1.DLL|System.Web.WebPages.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebPages.2.0.20710.0\lib\net40\System.Web.WebPages.dll</td><td>1</td><td/></row>
		<row><td>system.web.webpages.dll3</td><td>System.Web.WebPages.dll3</td><td>SYSTEM~1.DLL|System.Web.WebPages.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.WebPages.dll</td><td>1</td><td/></row>
		<row><td>system.web.webpages.razor.dl</td><td>System.Web.WebPages.Razor.dll</td><td>SYSTEM~1.DLL|System.Web.WebPages.Razor.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\bin\System.Web.WebPages.Razor.dll</td><td>1</td><td/></row>
		<row><td>system.web.webpages.razor.dl1</td><td>System.Web.WebPages.Razor.dll1</td><td>SYSTEM~1.DLL|System.Web.WebPages.Razor.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\System.Web.WebPages.Razor.dll</td><td>1</td><td/></row>
		<row><td>system.web.webpages.razor.dl2</td><td>System.Web.WebPages.Razor.dll2</td><td>SYSTEM~1.DLL|System.Web.WebPages.Razor.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebPages.2.0.20710.0\lib\net40\System.Web.WebPages.Razor.dll</td><td>1</td><td/></row>
		<row><td>system.web.webpages.razor.dl3</td><td>System.Web.WebPages.Razor.dll3</td><td>SYSTEM~1.DLL|System.Web.WebPages.Razor.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.WebPages.Razor.dll</td><td>1</td><td/></row>
		<row><td>system.web.webpages.razor.xm</td><td>ISX_DEFAULTCOMPONENT69</td><td>SYSTEM~1.XML|System.Web.WebPages.Razor.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebPages.2.0.20710.0\lib\net40\System.Web.WebPages.Razor.xml</td><td>1</td><td/></row>
		<row><td>system.web.webpages.razor.xm1</td><td>ISX_DEFAULTCOMPONENT98</td><td>SYSTEM~1.XML|System.Web.WebPages.Razor.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.WebPages.Razor.xml</td><td>1</td><td/></row>
		<row><td>system.web.webpages.xml</td><td>ISX_DEFAULTCOMPONENT69</td><td>SYSTEM~1.XML|System.Web.WebPages.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebPages.2.0.20710.0\lib\net40\System.Web.WebPages.xml</td><td>1</td><td/></row>
		<row><td>system.web.webpages.xml1</td><td>ISX_DEFAULTCOMPONENT98</td><td>SYSTEM~1.XML|System.Web.WebPages.xml</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\System.Web.WebPages.xml</td><td>1</td><td/></row>
		<row><td>templates.js</td><td>ISX_DEFAULTCOMPONENT118</td><td>TEMPLA~1.JS|templates.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\ChartJS\templates.js</td><td>1</td><td/></row>
		<row><td>thunder.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>thunder.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\thunder.png</td><td>1</td><td/></row>
		<row><td>thunder_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>THUNDE~1.PNG|thunder-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\thunder-128.png</td><td>1</td><td/></row>
		<row><td>thunder_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>THUNDE~1.PNG|thunder-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\thunder-16.png</td><td>1</td><td/></row>
		<row><td>thunder_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>THUNDE~1.PNG|thunder-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\thunder-24.png</td><td>1</td><td/></row>
		<row><td>thunder_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>THUNDE~1.PNG|thunder-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\thunder-32.png</td><td>1</td><td/></row>
		<row><td>thunder_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>THUNDE~1.PNG|thunder-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\thunder-48.png</td><td>1</td><td/></row>
		<row><td>thunder_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>THUNDE~1.PNG|thunder-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\thunder-64.png</td><td>1</td><td/></row>
		<row><td>thunderstorms.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>THUNDE~1.PNG|Thunderstorms.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Thunderstorms.png</td><td>1</td><td/></row>
		<row><td>thunderstorms_128.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>THUNDE~1.PNG|Thunderstorms-128.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Thunderstorms-128.png</td><td>1</td><td/></row>
		<row><td>thunderstorms_16.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>THUNDE~1.PNG|Thunderstorms-16.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Thunderstorms-16.png</td><td>1</td><td/></row>
		<row><td>thunderstorms_24.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>THUNDE~1.PNG|Thunderstorms-24.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Thunderstorms-24.png</td><td>1</td><td/></row>
		<row><td>thunderstorms_32.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>THUNDE~1.PNG|Thunderstorms-32.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Thunderstorms-32.png</td><td>1</td><td/></row>
		<row><td>thunderstorms_48.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>THUNDE~1.PNG|Thunderstorms-48.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Thunderstorms-48.png</td><td>1</td><td/></row>
		<row><td>thunderstorms_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>THUNDE~1.PNG|Thunderstorms-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\Thunderstorms-64.png</td><td>1</td><td/></row>
		<row><td>todoctrl.js</td><td>ISX_DEFAULTCOMPONENT117</td><td>todoctrl.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\Angular\todoctrl.js</td><td>1</td><td/></row>
		<row><td>tr_mill_en.js</td><td>ISX_DEFAULTCOMPONENT121</td><td>TR_MIL~1.JS|tr_mill_en.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\JVectorMap\maps\tr_mill_en.js</td><td>1</td><td/></row>
		<row><td>ui_bootstrap_0.1.0.min.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>UI-BOO~1.JS|ui-bootstrap-0.1.0.min.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\ui-bootstrap-0.1.0.min.js</td><td>1</td><td/></row>
		<row><td>ui_bootstrap_tpls_0.2.0.js</td><td>ISX_DEFAULTCOMPONENT30</td><td>UI-BOO~1.JS|ui-bootstrap-tpls-0.2.0.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Scripts\angular\ui-bootstrap-tpls-0.2.0.js</td><td>1</td><td/></row>
		<row><td>ui_icon_busy.gif</td><td>ISX_DEFAULTCOMPONENT105</td><td>UI-ICO~1.GIF|ui-icon-busy.gif</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Content\Themes\Custom\images\ui-icon-busy.gif</td><td>1</td><td/></row>
		<row><td>uk_mill_en.js</td><td>ISX_DEFAULTCOMPONENT121</td><td>UK_MIL~1.JS|uk_mill_en.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\JVectorMap\maps\uk_mill_en.js</td><td>1</td><td/></row>
		<row><td>us_aea_en.js</td><td>ISX_DEFAULTCOMPONENT121</td><td>US-AEA~1.JS|us-aea-en.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\JVectorMap\maps\us-aea-en.js</td><td>1</td><td/></row>
		<row><td>weatherboardcontroller.cs</td><td>ISX_DEFAULTCOMPONENT86</td><td>WEATHE~1.CS|WeatherBoardController.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Controllers\WeatherBoardController.cs</td><td>1</td><td/></row>
		<row><td>weatherboardmodel.cs</td><td>ISX_DEFAULTCOMPONENT87</td><td>WEATHE~1.CS|WeatherBoardModel.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Models\WeatherBoardModel.cs</td><td>1</td><td/></row>
		<row><td>web.config</td><td>ISX_DEFAULTCOMPONENT15</td><td>WEB~1.CON|web.config</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\Areas\Dashlets\Views\web.config</td><td>1</td><td/></row>
		<row><td>web.config.transform</td><td>ISX_DEFAULTCOMPONENT61</td><td>WEBCON~1.TRA|web.config.transform</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\Microsoft.AspNet.WebApi.Core.4.0.20710.0\content\web.config.transform</td><td>1</td><td/></row>
		<row><td>web.config1</td><td>ISX_DEFAULTCOMPONENT25</td><td>WEB~1.CON|web.config</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\Views\web.config</td><td>1</td><td/></row>
		<row><td>web.config2</td><td>ISX_DEFAULTCOMPONENT8</td><td>WEB~1.CON|Web.config</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\Web.config</td><td>1</td><td/></row>
		<row><td>web.config3</td><td>ISX_DEFAULTCOMPONENT45</td><td>WEB~1.CON|Web.config</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Views\Web.config</td><td>1</td><td/></row>
		<row><td>web.config4</td><td>ISX_DEFAULTCOMPONENT27</td><td>WEB~1.CON|Web.config</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\Web.config</td><td>1</td><td/></row>
		<row><td>web.config5</td><td>ISX_DEFAULTCOMPONENT88</td><td>WEB~1.CON|web.config</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Areas\Dashlets\Views\web.config</td><td>1</td><td/></row>
		<row><td>web.config6</td><td>ISX_DEFAULTCOMPONENT125</td><td>WEB~1.CON|web.config</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Views\web.config</td><td>1</td><td/></row>
		<row><td>web.config7</td><td>ISX_DEFAULTCOMPONENT81</td><td>WEB~1.CON|Web.config</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Web.config</td><td>1</td><td/></row>
		<row><td>webapiconfig.cs</td><td>ISX_DEFAULTCOMPONENT10</td><td>WEBAPI~1.CS|WebApiConfig.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\JDash.Mvc.HelloWorld\App_Start\WebApiConfig.cs</td><td>1</td><td/></row>
		<row><td>webapiconfig.cs1</td><td>ISX_DEFAULTCOMPONENT83</td><td>WEBAPI~1.CS|WebApiConfig.cs</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\App_Start\WebApiConfig.cs</td><td>1</td><td/></row>
		<row><td>webgrease.1.1.0.nupkg</td><td>ISX_DEFAULTCOMPONENT78</td><td>WEBGRE~1.NUP|WebGrease.1.1.0.nupkg</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\WebGrease.1.1.0\WebGrease.1.1.0.nupkg</td><td>1</td><td/></row>
		<row><td>webgrease.dll</td><td>WebGrease.dll</td><td>WEBGRE~1.DLL|WebGrease.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\WebGrease.dll</td><td>1</td><td/></row>
		<row><td>webgrease.dll1</td><td>WebGrease.dll1</td><td>WEBGRE~1.DLL|WebGrease.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\WebGrease.1.1.0\lib\WebGrease.dll</td><td>1</td><td/></row>
		<row><td>webgrease.dll2</td><td>WebGrease.dll2</td><td>WEBGRE~1.DLL|WebGrease.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\bin\WebGrease.dll</td><td>1</td><td/></row>
		<row><td>webmatrix.data.dll</td><td>WebMatrix.Data.dll</td><td>WEBMAT~1.DLL|WebMatrix.Data.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\WebMatrix.Data.dll</td><td>1</td><td/></row>
		<row><td>webmatrix.webdata.dll</td><td>WebMatrix.WebData.dll</td><td>WEBMAT~1.DLL|WebMatrix.WebData.dll</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Management\bin\WebMatrix.WebData.dll</td><td>1</td><td/></row>
		<row><td>wg.exe</td><td>WG.exe</td><td>WG.exe</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\packages\WebGrease.1.1.0\tools\WG.exe</td><td>1</td><td/></row>
		<row><td>wind.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>wind.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\wind.png</td><td>1</td><td/></row>
		<row><td>wind_64.png</td><td>ISX_DEFAULTCOMPONENT124</td><td>wind-64.png</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\weatherBoard\resources\wind-64.png</td><td>1</td><td/></row>
		<row><td>world_mill_en.js</td><td>ISX_DEFAULTCOMPONENT121</td><td>WORLD-~1.JS|world-mill-en.js</td><td>0</td><td/><td/><td/><td>1</td><td>C:\Projects\Kalitte.JDash\trunk\DeploymentMvc\Sample Application\Scripts\dashlets\JVectorMap\maps\world-mill-en.js</td><td>1</td><td/></row>
	</table>

	<table name="FileSFPCatalog">
		<col key="yes" def="s72">File_</col>
		<col key="yes" def="s255">SFPCatalog_</col>
	</table>

	<table name="Font">
		<col key="yes" def="s72">File_</col>
		<col def="S128">FontTitle</col>
		<row><td>fontawesome.otf</td><td/></row>
		<row><td>fontawesome_webfont.ttf</td><td/></row>
		<row><td>glyphicons_halflings_regular2</td><td/></row>
		<row><td>glyphicons_halflings_regular6</td><td/></row>
		<row><td>ionicons.ttf</td><td/></row>
	</table>

	<table name="ISAssistantTag">
		<col key="yes" def="s72">Tag</col>
		<col def="S255">Data</col>
		<row><td>PROJECT_ASSISTANT_DEFAULT_FEATURE</td><td>AlwaysInstall</td></row>
		<row><td>PROJECT_ASSISTANT_FEATURES</td><td>NonSelectable</td></row>
	</table>

	<table name="ISBillBoard">
		<col key="yes" def="s72">ISBillboard</col>
		<col def="i2">Duration</col>
		<col def="i2">Origin</col>
		<col def="i2">X</col>
		<col def="i2">Y</col>
		<col def="i2">Effect</col>
		<col def="i2">Sequence</col>
		<col def="i2">Target</col>
		<col def="S72">Color</col>
		<col def="S72">Style</col>
		<col def="S72">Font</col>
		<col def="L72">Title</col>
		<col def="S72">DisplayName</col>
	</table>

	<table name="ISChainPackage">
		<col key="yes" def="s72">Package</col>
		<col def="S255">SourcePath</col>
		<col def="S72">ProductCode</col>
		<col def="i2">Order</col>
		<col def="i4">Options</col>
		<col def="S255">InstallCondition</col>
		<col def="S255">RemoveCondition</col>
		<col def="S0">InstallProperties</col>
		<col def="S0">RemoveProperties</col>
		<col def="S255">ISReleaseFlags</col>
		<col def="S72">DisplayName</col>
	</table>

	<table name="ISChainPackageData">
		<col key="yes" def="s72">Package_</col>
		<col key="yes" def="s72">File</col>
		<col def="s50">FilePath</col>
		<col def="I4">Options</col>
		<col def="V0">Data</col>
		<col def="S255">ISBuildSourcePath</col>
	</table>

	<table name="ISClrWrap">
		<col key="yes" def="s72">Action_</col>
		<col key="yes" def="s72">Name</col>
		<col def="S0">Value</col>
	</table>

	<table name="ISComCatalogAttribute">
		<col key="yes" def="s72">ISComCatalogObject_</col>
		<col key="yes" def="s255">ItemName</col>
		<col def="S0">ItemValue</col>
	</table>

	<table name="ISComCatalogCollection">
		<col key="yes" def="s72">ISComCatalogCollection</col>
		<col def="s72">ISComCatalogObject_</col>
		<col def="s255">CollectionName</col>
	</table>

	<table name="ISComCatalogCollectionObjects">
		<col key="yes" def="s72">ISComCatalogCollection_</col>
		<col key="yes" def="s72">ISComCatalogObject_</col>
	</table>

	<table name="ISComCatalogObject">
		<col key="yes" def="s72">ISComCatalogObject</col>
		<col def="s255">DisplayName</col>
	</table>

	<table name="ISComPlusApplication">
		<col key="yes" def="s72">ISComCatalogObject_</col>
		<col def="S255">ComputerName</col>
		<col def="s72">Component_</col>
		<col def="I2">ISAttributes</col>
		<col def="S0">DepFiles</col>
	</table>

	<table name="ISComPlusApplicationDLL">
		<col key="yes" def="s72">ISComPlusApplicationDLL</col>
		<col def="s72">ISComPlusApplication_</col>
		<col def="s72">ISComCatalogObject_</col>
		<col def="s0">CLSID</col>
		<col def="S0">ProgId</col>
		<col def="S0">DLL</col>
		<col def="S0">AlterDLL</col>
	</table>

	<table name="ISComPlusProxy">
		<col key="yes" def="s72">ISComPlusProxy</col>
		<col def="s72">ISComPlusApplication_</col>
		<col def="S72">Component_</col>
		<col def="I2">ISAttributes</col>
		<col def="S0">DepFiles</col>
	</table>

	<table name="ISComPlusProxyDepFile">
		<col key="yes" def="s72">ISComPlusApplication_</col>
		<col key="yes" def="s72">File_</col>
		<col def="S0">ISPath</col>
	</table>

	<table name="ISComPlusProxyFile">
		<col key="yes" def="s72">File_</col>
		<col key="yes" def="s72">ISComPlusApplicationDLL_</col>
	</table>

	<table name="ISComPlusServerDepFile">
		<col key="yes" def="s72">ISComPlusApplication_</col>
		<col key="yes" def="s72">File_</col>
		<col def="S0">ISPath</col>
	</table>

	<table name="ISComPlusServerFile">
		<col key="yes" def="s72">File_</col>
		<col key="yes" def="s72">ISComPlusApplicationDLL_</col>
	</table>

	<table name="ISComponentExtended">
		<col key="yes" def="s72">Component_</col>
		<col def="I4">OS</col>
		<col def="S0">Language</col>
		<col def="s72">FilterProperty</col>
		<col def="I4">Platforms</col>
		<col def="S0">FTPLocation</col>
		<col def="S0">HTTPLocation</col>
		<col def="S0">Miscellaneous</col>
		<row><td>Antlr3.Runtime.dll</td><td/><td/><td>_152C9AC3_9E0B_4018_AED4_A3EAD3110FE8_FILTER</td><td/><td/><td/><td/></row>
		<row><td>Antlr3.Runtime.dll1</td><td/><td/><td>_54A50D43_DCF6_4C89_A8C2_46282C9FA54D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>DotNetOpenAuth.AspNet.dll</td><td/><td/><td>_94A08299_206C_41C1_8BB6_AE4222111E07_FILTER</td><td/><td/><td/><td/></row>
		<row><td>DotNetOpenAuth.Core.dll</td><td/><td/><td>_A5590111_F25E_476D_B9DE_7DDE2CAA783C_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT</td><td/><td/><td>_52EB959A_ED9D_4EF3_9771_93A2A2B7F0B2_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT10</td><td/><td/><td>_D1EB5A27_10A5_42D4_B333_87225557C2B7_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT100</td><td/><td/><td>_09D7A67B_883A_4DA7_B305_4FECB90229B8_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT101</td><td/><td/><td>_D1558A48_7AF0_49BC_9358_73B5B8E898B5_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT102</td><td/><td/><td>_6E597F51_8D6B_4215_96B3_D5F233B1EFBA_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT103</td><td/><td/><td>_67F18A12_F777_4614_8725_4291B15881E1_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT104</td><td/><td/><td>_E9B6D9C4_A19E_4339_A3EF_7B0ABF378425_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT105</td><td/><td/><td>_4AD6CFA9_919C_4757_B443_BDEB28500ADE_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT106</td><td/><td/><td>_C2F8BA7A_F151_4DDE_80D5_D8C401AE8E62_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT107</td><td/><td/><td>_0FFF4D62_54B7_447A_9D39_444B25432131_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT108</td><td/><td/><td>_1E96FC1B_B2F4_43BE_8349_DDC2DFE7ED07_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT109</td><td/><td/><td>_29333C45_20EB_4921_A656_56DB9E4FD0C8_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT11</td><td/><td/><td>_F63875CE_18A6_4EE6_8CAB_493E786C576F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT110</td><td/><td/><td>_BB5E5E08_2198_4783_9547_D4BC6D71F57A_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT111</td><td/><td/><td>_2E0FCE7E_ECF6_4A6F_B37F_5ACBBEF77AC1_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT112</td><td/><td/><td>_E076642B_270C_4472_B52B_E62C634CE606_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT113</td><td/><td/><td>_EDFD62F2_3F11_4971_A5CB_0B0C370E6AC7_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT114</td><td/><td/><td>_6A1D31CF_25FF_4B4E_BF63_49E81DB82649_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT115</td><td/><td/><td>_E51BA03C_881D_41DC_BE67_4538B14AD8B7_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT116</td><td/><td/><td>_B3B86E02_8340_4354_8FFC_3CFB37D00412_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT117</td><td/><td/><td>_5F6C902D_FB10_447D_93A1_9FCA88FF7D22_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT118</td><td/><td/><td>_98C57D19_E540_4D75_B31D_99A98275EB61_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT119</td><td/><td/><td>_77E32E0D_7A8A_43E9_BEEE_E393C7D53256_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT12</td><td/><td/><td>_31DFC38D_3B9D_477D_BD4C_BFE7380CD692_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT120</td><td/><td/><td>_C2BE0246_2172_4C05_9D58_E3DB667614D7_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT121</td><td/><td/><td>_F4199AB6_7E43_452C_8588_3E292CE478DE_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT122</td><td/><td/><td>_65D87121_DEC4_46CB_9C48_A3BB8AEEA8EE_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT123</td><td/><td/><td>_902E41E5_CFA8_45E9_96E3_06041A04D248_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT124</td><td/><td/><td>_5EB11DE9_6EAE_45B3_9B51_70D9FBEA3291_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT125</td><td/><td/><td>_7556A2ED_BA75_447B_8632_69A75EC1594B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT126</td><td/><td/><td>_341406E2_ADFF_4A35_9E45_38935B89EFAF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT127</td><td/><td/><td>_F4550EBD_F5DD_4B69_A6C3_9B6388983262_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT128</td><td/><td/><td>_458619E2_CAD5_48A3_ACB9_044238B34202_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT13</td><td/><td/><td>_14087AEF_A641_422E_B784_998B5E05CB6D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT14</td><td/><td/><td>_B655BB6D_DE37_4A1C_B61D_44E9CC9B4410_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT15</td><td/><td/><td>_819F7E1E_9CA5_4D0B_B54F_5571522CAC51_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT16</td><td/><td/><td>_BCBBEB84_B5B6_40CC_A429_F66B59CE146B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT17</td><td/><td/><td>_4D565FD8_EC18_4CA6_B0F5_A76DC0BC9AC3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT18</td><td/><td/><td>_DB914F6F_59C0_4904_9B03_BCF6CE289455_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT19</td><td/><td/><td>_CB7737DE_74D1_4203_B658_71D1F6A5A316_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT20</td><td/><td/><td>_AFB0C165_A634_4483_91AF_EF484890835F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT21</td><td/><td/><td>_D072982A_408B_4E18_B4A2_838AFC0A1330_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT22</td><td/><td/><td>_386C4894_6DE4_4121_9C35_11BC9F792FBB_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT23</td><td/><td/><td>_37379793_A2EA_422B_9F76_FC7C2926DBC1_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT24</td><td/><td/><td>_BC213F89_56AC_41BB_8531_A7823876A0F4_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT25</td><td/><td/><td>_74D71D07_83A6_4243_9088_C2908C5DF8BD_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT26</td><td/><td/><td>_6E881ADD_EF8E_4CAA_8443_D8747E8F3E34_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT27</td><td/><td/><td>_88B3F2C7_03FD_4FFB_A5B5_912C364A04F6_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT28</td><td/><td/><td>_FB54FCA3_582D_4868_9F1E_A17074BA7000_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT29</td><td/><td/><td>_51CE2997_1982_4F86_9BAD_4AAD6B0A6793_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT30</td><td/><td/><td>_E8A71F40_42BA_4FCC_9FA9_D68762002787_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT31</td><td/><td/><td>_241AAA70_F196_4C46_B8B3_13192CB25B2C_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT32</td><td/><td/><td>_6DCB418E_C760_46BA_89DB_DB5FABAAE76F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT33</td><td/><td/><td>_946A7F2A_C5D7_4125_A8BD_10FE0398C54F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT34</td><td/><td/><td>_A2CE11B7_B729_4828_8656_E0BF28BE13D8_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT35</td><td/><td/><td>_5751C230_E94B_46E8_B477_2E28A024F1AF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT36</td><td/><td/><td>_88B8F256_0F23_47AD_8EF1_FF5A9B65B7A2_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT37</td><td/><td/><td>_F3B7ABF9_ED9A_4281_A311_63DAE10F45BF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT38</td><td/><td/><td>_CAE58B4B_B3B7_45AF_8F38_3E0CD86342A5_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT39</td><td/><td/><td>_7A377DC4_9438_44B3_9167_CEC6A39F0F28_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT40</td><td/><td/><td>_D2F72972_1419_4E22_AA70_72276D86D80B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT41</td><td/><td/><td>_D98CE901_4B91_4E9E_9FE8_ECA43E47A772_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT42</td><td/><td/><td>_8D7ABA73_C8A6_4F1F_8E30_1AA92A1600B1_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT43</td><td/><td/><td>_617A2BAE_20B0_4099_BD75_A415D6144EB5_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT44</td><td/><td/><td>_0FB91967_B30B_406B_94B5_A024F26BCD08_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT45</td><td/><td/><td>_BA2083C4_E74F_4A9F_A54C_C1C0632BAB58_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT46</td><td/><td/><td>_D38966EB_CB83_4040_AB01_38DDB7BB369C_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT47</td><td/><td/><td>_1F48E45C_25D4_41D3_AE0D_A04C8191DC9D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT48</td><td/><td/><td>_EB8E683D_7695_49F8_B001_1E0B49154BFE_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT49</td><td/><td/><td>_F180AA8A_E337_47E6_AB85_1D7A12C1D9FF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT50</td><td/><td/><td>_2BFC4959_8542_43C7_97CC_DEC783DF7354_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT51</td><td/><td/><td>_B1B54D53_CEB4_45FC_8586_8E93F18CC375_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT52</td><td/><td/><td>_928099CA_6967_4BBC_992B_E8BA47774D0F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT53</td><td/><td/><td>_C6D8FF68_11BB_4CB3_A01F_978A37EC0D08_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT54</td><td/><td/><td>_FE70BB67_0198_44ED_B679_F0CA1374382D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT55</td><td/><td/><td>_F1B80636_8D14_4C45_A35C_646F4972BEE8_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT56</td><td/><td/><td>_B4999FB7_92C2_45B8_867C_D79A119F7D7C_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT57</td><td/><td/><td>_3CD496DA_BA58_4E51_A1A4_268807AE55B3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT58</td><td/><td/><td>_5C8DC36D_CC68_4A41_83A5_A3568DA54DEF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT59</td><td/><td/><td>_BCE2CD28_048E_47E6_9E68_12CA0085451E_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT6</td><td/><td/><td>_DA2A5EEB_E5EB_4E76_8ADD_C437176B8257_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT60</td><td/><td/><td>_A308356A_1F8D_4778_A0F0_ECF250E9F98D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT61</td><td/><td/><td>_4C6F01BB_D1A3_481A_B1F7_1F22F02B850A_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT62</td><td/><td/><td>_4B8689ED_A0FE_4B23_9D61_F8C11E0F0424_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT63</td><td/><td/><td>_F4E4DDBB_1985_4CC4_BB4F_2D2DE5C80C25_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT64</td><td/><td/><td>_B3DAA6EF_C3BA_4411_8E41_34F21CA17474_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT65</td><td/><td/><td>_C6682627_823F_4CB5_950A_00F8E0C3A405_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT66</td><td/><td/><td>_E16B258D_D02E_42AD_AAD9_B58535E2CC33_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT67</td><td/><td/><td>_2EE44161_8170_470F_B502_823DF0353CF8_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT68</td><td/><td/><td>_A1BBC765_F23C_47AF_AA71_4025D10ECB09_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT69</td><td/><td/><td>_8F51B2CA_6EAB_4E1A_A92A_90350167767B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT7</td><td/><td/><td>_8DD4522E_16EA_4E54_A3D4_D92763191DAB_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT70</td><td/><td/><td>_06A1CFD4_D790_44CB_9A39_6022CD87689F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT71</td><td/><td/><td>_DC8249D2_AD9A_4FDB_B69D_D7150E426852_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT72</td><td/><td/><td>_70EA9A4B_6780_46E9_834C_0AFFCAB3F66B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT73</td><td/><td/><td>_CA7DA9F0_077A_4D8D_B06D_DA8F89DD09FC_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT74</td><td/><td/><td>_3AB8749B_5513_45FA_A021_41E5242136C0_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT75</td><td/><td/><td>_5554C2A1_E6B2_4C88_9025_C69A41611B07_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT76</td><td/><td/><td>_B7316128_7375_4E4A_9231_AE2F997B08C1_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT77</td><td/><td/><td>_9666FA00_ECDF_4287_8D16_F33CE2278502_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT78</td><td/><td/><td>_685877D8_BBA9_41A1_9841_86E4C32304A0_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT79</td><td/><td/><td>_2A7B1B87_5E11_421E_A15D_CB129F9215F7_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT8</td><td/><td/><td>_33434605_0B6C_4BF5_8D43_D138544DFEB3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT80</td><td/><td/><td>_0C11E50E_C5D8_4DC7_AF6E_404986FB072B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT81</td><td/><td/><td>_E5A00231_C83B_4966_B9A0_48F43A4BBAC4_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT82</td><td/><td/><td>_DA967C80_213D_42CF_8420_C7E343890C16_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT83</td><td/><td/><td>_02A6A357_C78C_4838_95F4_AB0C23B60B06_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT84</td><td/><td/><td>_66332F5B_D30E_44F9_BED1_99A39F601D0C_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT85</td><td/><td/><td>_1FCCF49E_24BA_494A_A039_5826CF2FA9D9_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT86</td><td/><td/><td>_AC959593_FF99_469D_8F7C_28B33E139954_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT87</td><td/><td/><td>_5C6CE0E9_06C9_4A41_9A77_22ED82FB24F6_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT88</td><td/><td/><td>_FA28BEF5_5106_4F22_A94D_DBFA628F55C1_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT89</td><td/><td/><td>_DC6BA272_114A_4C3D_A7F8_7E0940E45E19_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT9</td><td/><td/><td>_DCAD0412_DF74_4286_BD7C_80186F2A9700_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT90</td><td/><td/><td>_67ECE12D_F6EB_4547_B3F3_A9AC857908DE_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT91</td><td/><td/><td>_F9C1A04B_4076_4261_B512_77326338E777_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT92</td><td/><td/><td>_55C1B16D_5F29_4A0B_B590_086DDE3E2B3E_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT93</td><td/><td/><td>_BBA07AE1_76D3_444C_9603_D8DB28AFA1FD_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT94</td><td/><td/><td>_3B2687CD_5568_4A21_B461_CD89F72DDF67_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT95</td><td/><td/><td>_149F330D_31C9_4E21_9B7C_BB8FDFB7D317_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT96</td><td/><td/><td>_425363A6_A413_4AA2_8440_738159BD2234_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT97</td><td/><td/><td>_83258B77_8C5C_48AF_9857_9BCFE70EB880_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT98</td><td/><td/><td>_583E4EE5_C881_411F_A99D_EEC097565CFF_FILTER</td><td/><td/><td/><td/></row>
		<row><td>ISX_DEFAULTCOMPONENT99</td><td/><td/><td>_7F9605FE_1963_4306_8963_C7F4CB70BDD1_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.Mvc.PackageInstaller.exe</td><td/><td/><td>_078C0FFC_4297_4D38_813E_EF777ABA1D71_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.Mvc.StarterApplication.exe</td><td/><td/><td>_0C5285DB_314A_4F7B_93EE_DD58A0A82E3E_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.Mvc.dll</td><td/><td/><td>_B11D1C78_8C23_48A9_A319_21AF191AA4D3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.Mvc.dll1</td><td/><td/><td>_EAB10096_EE42_4FA8_A6D1_6ADFD9055C99_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.Mvc.dll2</td><td/><td/><td>_D9DA2966_13E9_4177_A5B3_B696C5664850_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.MvcDemo.dll1</td><td/><td/><td>_D7743545_E156_4A5E_B19E_3EFC8D410857_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.MySqlProvider.dll</td><td/><td/><td>_3CA1AE05_18EF_4EC8_B112_5C0B8DC54F6A_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.MySqlProvider.dll2</td><td/><td/><td>_C4ADC254_8F00_43BC_AF59_A825D565ACD8_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.MySqlProvider.dll3</td><td/><td/><td>_6768F5BA_9096_4988_A611_4F98B1FB1A6F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.MySqlProvider.dll4</td><td/><td/><td>_353824CD_DB89_4FB5_8930_967AF279289C_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.SessionProvider.dll</td><td/><td/><td>_A73E3099_4CB8_4F6F_9283_BFFDD13AA2B0_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.SessionProvider.dll1</td><td/><td/><td>_A17615DD_E456_4F12_8746_A9D9E3585A28_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.SessionProvider.dll2</td><td/><td/><td>_02C269E1_7400_47E3_9239_F0DE2DE94307_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.SessionProvider.dll3</td><td/><td/><td>_6138B903_78C0_44E4_89DD_AFBDA85906AA_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.SqlProvider.dll</td><td/><td/><td>_F9F1FFE1_2957_45CD_9AB1_6DD77EBF9E75_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.SqlProvider.dll2</td><td/><td/><td>_AA7BA779_3D27_4E98_B00D_024F7AA38D08_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.SqlProvider.dll3</td><td/><td/><td>_48BD3AE9_89D0_48CF_8DFC_FD138469F9ED_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.SqlProvider.dll4</td><td/><td/><td>_93A2F7EC_5BF8_4D8B_BB80_7C64B81DD174_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.dll</td><td/><td/><td>_BA05D604_F8DE_404B_8C57_D7FFD811B4B5_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.dll1</td><td/><td/><td>_0F9D5488_3604_4D76_A38C_A382F4E868DC_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.dll2</td><td/><td/><td>_5209A210_0538_4A93_83C9_7E17D34326DE_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDash.dll4</td><td/><td/><td>_902ED173_5289_419A_8A97_1C9A0485E1C3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>JDashMvc.Management.dll</td><td/><td/><td>_CA15466E_E80B_4881_9697_C2EF069773C3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>Microsoft.Web.Infrastructure.dll</td><td/><td/><td>_916D08A3_C6A6_47E0_AF9C_ADF12B1846BE_FILTER</td><td/><td/><td/><td/></row>
		<row><td>Microsoft.Web.WebPages.OAuth.dll</td><td/><td/><td>_CA384C3C_64C1_4A51_90F8_E967826742F3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>MySql.Data.Entity.dll</td><td/><td/><td>_528D8D59_C3FF_4F47_ADA1_F2E6A834F3A2_FILTER</td><td/><td/><td/><td/></row>
		<row><td>MySql.Data.Entity.dll1</td><td/><td/><td>_4ADAC109_2B4F_48E2_AE59_F6756092E3C2_FILTER</td><td/><td/><td/><td/></row>
		<row><td>MySql.Data.Entity.dll2</td><td/><td/><td>_8E5FB385_7145_4911_BB29_14DC61E3A0CA_FILTER</td><td/><td/><td/><td/></row>
		<row><td>MySql.Data.Entity.dll3</td><td/><td/><td>_25DF9D24_CC1D_49CD_BDA6_A6A712D61953_FILTER</td><td/><td/><td/><td/></row>
		<row><td>MySql.Data.dll</td><td/><td/><td>_2FDDD372_23FC_477A_A1A2_A68F38194BA3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>MySql.Data.dll1</td><td/><td/><td>_1356FB1F_27D7_45BB_B429_F6DD9D188E53_FILTER</td><td/><td/><td/><td/></row>
		<row><td>MySql.Data.dll2</td><td/><td/><td>_50B6C163_A9CA_42A1_AE19_4DCFD7C19105_FILTER</td><td/><td/><td/><td/></row>
		<row><td>Newtonsoft.Json.dll</td><td/><td/><td>_F12787C2_711D_47FF_BBDA_E27DEA6D3AE6_FILTER</td><td/><td/><td/><td/></row>
		<row><td>Newtonsoft.Json.dll1</td><td/><td/><td>_92852753_0AE9_48DA_8A1B_22CC9B26797E_FILTER</td><td/><td/><td/><td/></row>
		<row><td>Newtonsoft.Json.dll2</td><td/><td/><td>_1A4D041B_B99B_46AA_84A1_ADE30FFCF94F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>Newtonsoft.Json.dll3</td><td/><td/><td>_2A9C989A_395C_431C_A02B_4B078999003A_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Net.Http.Formatting.dll</td><td/><td/><td>_5FFA8F42_9CBA_4E17_83DB_929EAFABA883_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Net.Http.Formatting.dll1</td><td/><td/><td>_D8A7079D_A3A7_448C_9E81_90DB9313E413_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Net.Http.Formatting.dll2</td><td/><td/><td>_60788B55_EA33_4591_993E_4D7E7826FA63_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Net.Http.WebRequest.dll</td><td/><td/><td>_CA81B19B_2C1E_487C_B634_99A0F2B4D852_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Net.Http.WebRequest.dll1</td><td/><td/><td>_7442293E_308E_43DF_9EDF_BCF1D49C70C0_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Net.Http.dll</td><td/><td/><td>_860F5824_02FA_401D_8ACA_36B9343830E4_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Net.Http.dll1</td><td/><td/><td>_20E3723B_2405_4092_BDA4_BC5219424FF1_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Net.Http.dll2</td><td/><td/><td>_023CA187_881F_4796_8947_F3A6301B2A9F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Helpers.dll</td><td/><td/><td>_77C89D52_259E_4BB9_897F_056A268FF6B2_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Helpers.dll1</td><td/><td/><td>_6014C33D_A091_4581_9C81_5007FAA990D0_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Helpers.dll2</td><td/><td/><td>_A4F5491B_16CF_4514_B179_EB5892E33138_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Helpers.dll3</td><td/><td/><td>_636DE767_3F5D_4070_B5F6_E64F1669C757_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Http.WebHost.dll</td><td/><td/><td>_F8B3AADF_9A8D_4F86_92DE_07D88F559A25_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Http.WebHost.dll1</td><td/><td/><td>_F2F11B0C_6DE7_4C42_804E_7089B1428216_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Http.WebHost.dll2</td><td/><td/><td>_151CA9B1_67CD_4818_9842_85AF576C8A3C_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Http.WebHost.dll3</td><td/><td/><td>_91EF1A94_A7D3_479F_8551_15362BB470D6_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Http.dll</td><td/><td/><td>_371A4F52_A9A1_4A01_8FAC_5F22DFA2C165_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Http.dll1</td><td/><td/><td>_299CE285_6486_4B68_B339_AD20385AEC8B_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Http.dll2</td><td/><td/><td>_E77D47F4_89B2_4B45_A2D4_38188526B2F3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Http.dll3</td><td/><td/><td>_6CF99DBD_62DB_45C4_A6C9_DA91DAE563B7_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Mvc.dll</td><td/><td/><td>_B2051413_70A1_4ACB_9CE8_FAED0078AEB5_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Mvc.dll1</td><td/><td/><td>_158E06AE_428B_41F0_8594_10531B2D0BC5_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Mvc.dll2</td><td/><td/><td>_9D05E8E9_61E7_4452_9799_DA4831A49782_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Mvc.dll3</td><td/><td/><td>_59ACEFF1_97D6_4A28_9F01_E653957489C9_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Optimization.dll</td><td/><td/><td>_A0FDD829_4355_4806_8D4A_AD8969F972C5_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Optimization.dll1</td><td/><td/><td>_A3D84832_EC20_4568_A5E8_717C48C5EB89_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Optimization.dll2</td><td/><td/><td>_AF3C8CDC_9927_46E2_920C_20D4A5E71A3A_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Razor.dll</td><td/><td/><td>_25D1EAED_F4BF_4200_9192_26BCC769A923_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Razor.dll1</td><td/><td/><td>_9688199C_D406_48F3_8B09_077290821422_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Razor.dll2</td><td/><td/><td>_3B964CD4_ECEA_4CAD_931B_8F33B569AEB3_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.Razor.dll3</td><td/><td/><td>_5E01BCCA_6B65_4CE5_BFE9_D57B6D950E7D_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.WebPages.Deployment.dll</td><td/><td/><td>_23228870_5BF3_45E0_A3E1_DFFB5C3C4990_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.WebPages.Deployment.dll1</td><td/><td/><td>_ED0B171F_2C6A_44A8_AAE2_D3791528FB79_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.WebPages.Deployment.dll2</td><td/><td/><td>_C9816FC8_7023_4C4A_8D3F_F52A4B834BAB_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.WebPages.Deployment.dll3</td><td/><td/><td>_B6A634FF_279E_4644_A7D0_B2C9E09EC99E_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.WebPages.Razor.dll</td><td/><td/><td>_D644FA44_AF32_4C9C_9E4B_5D8C1C1D5125_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.WebPages.Razor.dll1</td><td/><td/><td>_9566AE26_91F3_4002_ADFC_7270E978C668_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.WebPages.Razor.dll2</td><td/><td/><td>_E16D0F4A_3B0B_4FB7_B875_4B36A8E35F6E_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.WebPages.Razor.dll3</td><td/><td/><td>_C52CD1BF_2023_45B8_97A2_4E7C08C73A05_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.WebPages.dll</td><td/><td/><td>_6F90C2B6_71D1_41B7_9666_919530456445_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.WebPages.dll1</td><td/><td/><td>_76FE8CDD_6448_484A_9A2C_8ED14750DE2F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.WebPages.dll2</td><td/><td/><td>_0E1E89BF_3977_4FCC_9CD8_5B0A02773E27_FILTER</td><td/><td/><td/><td/></row>
		<row><td>System.Web.WebPages.dll3</td><td/><td/><td>_C326F6C5_E57E_4A52_AD2C_F0FE920CC4F2_FILTER</td><td/><td/><td/><td/></row>
		<row><td>WG.exe</td><td/><td/><td>_115FAD69_FBF9_4AAB_8639_771FF96A2EC7_FILTER</td><td/><td/><td/><td/></row>
		<row><td>WebGrease.dll</td><td/><td/><td>_3D1DFDAE_3CF2_4475_9514_8CAB060E47F1_FILTER</td><td/><td/><td/><td/></row>
		<row><td>WebGrease.dll1</td><td/><td/><td>_B734AD93_D835_4017_8510_ABD6B8AB74E8_FILTER</td><td/><td/><td/><td/></row>
		<row><td>WebGrease.dll2</td><td/><td/><td>_B0C25289_682C_4762_AB42_60EF01FDAF7F_FILTER</td><td/><td/><td/><td/></row>
		<row><td>WebMatrix.Data.dll</td><td/><td/><td>_4CEDE486_64F7_4558_9E93_1A2BB8E82536_FILTER</td><td/><td/><td/><td/></row>
		<row><td>WebMatrix.WebData.dll</td><td/><td/><td>_0C7AA205_2DCE_462B_AEC7_BC24D34CEC56_FILTER</td><td/><td/><td/><td/></row>
	</table>

	<table name="ISCustomActionReference">
		<col key="yes" def="s72">Action_</col>
		<col def="S0">Description</col>
		<col def="S255">FileType</col>
		<col def="S255">ISCAReferenceFilePath</col>
	</table>

	<table name="ISDIMDependency">
		<col key="yes" def="s72">ISDIMReference_</col>
		<col def="s255">RequiredUUID</col>
		<col def="S255">RequiredMajorVersion</col>
		<col def="S255">RequiredMinorVersion</col>
		<col def="S255">RequiredBuildVersion</col>
		<col def="S255">RequiredRevisionVersion</col>
	</table>

	<table name="ISDIMReference">
		<col key="yes" def="s72">ISDIMReference</col>
		<col def="S0">ISBuildSourcePath</col>
	</table>

	<table name="ISDIMReferenceDependencies">
		<col key="yes" def="s72">ISDIMReference_Parent</col>
		<col key="yes" def="s72">ISDIMDependency_</col>
	</table>

	<table name="ISDIMVariable">
		<col key="yes" def="s72">ISDIMVariable</col>
		<col def="s72">ISDIMReference_</col>
		<col def="s0">Name</col>
		<col def="S0">NewValue</col>
		<col def="I4">Type</col>
	</table>

	<table name="ISDLLWrapper">
		<col key="yes" def="s72">EntryPoint</col>
		<col def="I4">Type</col>
		<col def="s0">Source</col>
		<col def="s255">Target</col>
	</table>

	<table name="ISDRMFile">
		<col key="yes" def="s72">ISDRMFile</col>
		<col def="S72">File_</col>
		<col def="S72">ISDRMLicense_</col>
		<col def="s255">Shell</col>
	</table>

	<table name="ISDRMFileAttribute">
		<col key="yes" def="s72">ISDRMFile_</col>
		<col key="yes" def="s72">Property</col>
		<col def="S0">Value</col>
	</table>

	<table name="ISDRMLicense">
		<col key="yes" def="s72">ISDRMLicense</col>
		<col def="S255">Description</col>
		<col def="S50">ProjectVersion</col>
		<col def="I4">Attributes</col>
		<col def="S255">LicenseNumber</col>
		<col def="S255">RequestCode</col>
		<col def="S255">ResponseCode</col>
	</table>

	<table name="ISDependency">
		<col key="yes" def="S50">ISDependency</col>
		<col def="I2">Exclude</col>
	</table>

	<table name="ISDisk1File">
		<col key="yes" def="s72">ISDisk1File</col>
		<col def="s255">ISBuildSourcePath</col>
		<col def="I4">Disk</col>
	</table>

	<table name="ISDynamicFile">
		<col key="yes" def="s72">Component_</col>
		<col key="yes" def="s255">SourceFolder</col>
		<col def="I2">IncludeFlags</col>
		<col def="S0">IncludeFiles</col>
		<col def="S0">ExcludeFiles</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="ISFeatureDIMReferences">
		<col key="yes" def="s38">Feature_</col>
		<col key="yes" def="s72">ISDIMReference_</col>
	</table>

	<table name="ISFeatureMergeModuleExcludes">
		<col key="yes" def="s38">Feature_</col>
		<col key="yes" def="s255">ModuleID</col>
		<col key="yes" def="i2">Language</col>
	</table>

	<table name="ISFeatureMergeModules">
		<col key="yes" def="s38">Feature_</col>
		<col key="yes" def="s255">ISMergeModule_</col>
		<col key="yes" def="i2">Language_</col>
	</table>

	<table name="ISFeatureSetupPrerequisites">
		<col key="yes" def="s38">Feature_</col>
		<col key="yes" def="s72">ISSetupPrerequisites_</col>
	</table>

	<table name="ISFileManifests">
		<col key="yes" def="s72">File_</col>
		<col key="yes" def="s72">Manifest_</col>
	</table>

	<table name="ISIISItem">
		<col key="yes" def="s72">ISIISItem</col>
		<col def="S72">ISIISItem_Parent</col>
		<col def="L255">DisplayName</col>
		<col def="i4">Type</col>
		<col def="S72">Component_</col>
	</table>

	<table name="ISIISProperty">
		<col key="yes" def="s72">ISIISProperty</col>
		<col key="yes" def="s72">ISIISItem_</col>
		<col def="S0">Schema</col>
		<col def="S255">FriendlyName</col>
		<col def="I4">MetaDataProp</col>
		<col def="I4">MetaDataType</col>
		<col def="I4">MetaDataUserType</col>
		<col def="I4">MetaDataAttributes</col>
		<col def="L0">MetaDataValue</col>
		<col def="I4">Order</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="ISInstallScriptAction">
		<col key="yes" def="s72">EntryPoint</col>
		<col def="I4">Type</col>
		<col def="s72">Source</col>
		<col def="S255">Target</col>
	</table>

	<table name="ISLanguage">
		<col key="yes" def="s50">ISLanguage</col>
		<col def="I2">Included</col>
		<row><td>1033</td><td>1</td></row>
	</table>

	<table name="ISLinkerLibrary">
		<col key="yes" def="s72">ISLinkerLibrary</col>
		<col def="s255">Library</col>
		<col def="i4">Order</col>
		<row><td>isrt.obl</td><td>isrt.obl</td><td>2</td></row>
		<row><td>iswi.obl</td><td>iswi.obl</td><td>1</td></row>
	</table>

	<table name="ISLocalControl">
		<col key="yes" def="s72">Dialog_</col>
		<col key="yes" def="s50">Control_</col>
		<col key="yes" def="s50">ISLanguage_</col>
		<col def="I4">Attributes</col>
		<col def="I2">X</col>
		<col def="I2">Y</col>
		<col def="I2">Width</col>
		<col def="I2">Height</col>
		<col def="S72">Binary_</col>
		<col def="S255">ISBuildSourcePath</col>
	</table>

	<table name="ISLocalDialog">
		<col key="yes" def="S50">Dialog_</col>
		<col key="yes" def="S50">ISLanguage_</col>
		<col def="I4">Attributes</col>
		<col def="S72">TextStyle_</col>
		<col def="i2">Width</col>
		<col def="i2">Height</col>
	</table>

	<table name="ISLocalRadioButton">
		<col key="yes" def="s72">Property</col>
		<col key="yes" def="i2">Order</col>
		<col key="yes" def="s50">ISLanguage_</col>
		<col def="i2">X</col>
		<col def="i2">Y</col>
		<col def="i2">Width</col>
		<col def="i2">Height</col>
	</table>

	<table name="ISLockPermissions">
		<col key="yes" def="s72">LockObject</col>
		<col key="yes" def="s32">Table</col>
		<col key="yes" def="S255">Domain</col>
		<col key="yes" def="s255">User</col>
		<col def="I4">Permission</col>
		<col def="I4">Attributes</col>
	</table>

	<table name="ISLogicalDisk">
		<col key="yes" def="i2">DiskId</col>
		<col key="yes" def="s255">ISProductConfiguration_</col>
		<col key="yes" def="s255">ISRelease_</col>
		<col def="i2">LastSequence</col>
		<col def="L64">DiskPrompt</col>
		<col def="S255">Cabinet</col>
		<col def="S32">VolumeLabel</col>
		<col def="S32">Source</col>
	</table>

	<table name="ISLogicalDiskFeatures">
		<col key="yes" def="i2">ISLogicalDisk_</col>
		<col key="yes" def="s255">ISProductConfiguration_</col>
		<col key="yes" def="s255">ISRelease_</col>
		<col key="yes" def="S38">Feature_</col>
		<col def="i2">Sequence</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="ISMergeModule">
		<col key="yes" def="s255">ISMergeModule</col>
		<col key="yes" def="i2">Language</col>
		<col def="s255">Name</col>
		<col def="S255">Destination</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="ISMergeModuleCfgValues">
		<col key="yes" def="s255">ISMergeModule_</col>
		<col key="yes" def="i2">Language_</col>
		<col key="yes" def="s72">ModuleConfiguration_</col>
		<col def="L0">Value</col>
		<col def="i2">Format</col>
		<col def="L255">Type</col>
		<col def="L255">ContextData</col>
		<col def="L255">DefaultValue</col>
		<col def="I2">Attributes</col>
		<col def="L255">DisplayName</col>
		<col def="L255">Description</col>
		<col def="L255">HelpLocation</col>
		<col def="L255">HelpKeyword</col>
	</table>

	<table name="ISObject">
		<col key="yes" def="s50">ObjectName</col>
		<col def="s15">Language</col>
	</table>

	<table name="ISObjectProperty">
		<col key="yes" def="S50">ObjectName</col>
		<col key="yes" def="S50">Property</col>
		<col def="S0">Value</col>
		<col def="I2">IncludeInBuild</col>
	</table>

	<table name="ISPatchConfigImage">
		<col key="yes" def="S72">PatchConfiguration_</col>
		<col key="yes" def="s72">UpgradedImage_</col>
	</table>

	<table name="ISPatchConfiguration">
		<col key="yes" def="s72">Name</col>
		<col def="i2">CanPCDiffer</col>
		<col def="i2">CanPVDiffer</col>
		<col def="i2">IncludeWholeFiles</col>
		<col def="i2">LeaveDecompressed</col>
		<col def="i2">OptimizeForSize</col>
		<col def="i2">EnablePatchCache</col>
		<col def="S0">PatchCacheDir</col>
		<col def="i4">Flags</col>
		<col def="S0">PatchGuidsToReplace</col>
		<col def="s0">TargetProductCodes</col>
		<col def="s50">PatchGuid</col>
		<col def="s0">OutputPath</col>
		<col def="i2">MinMsiVersion</col>
		<col def="I4">Attributes</col>
	</table>

	<table name="ISPatchConfigurationProperty">
		<col key="yes" def="S72">ISPatchConfiguration_</col>
		<col key="yes" def="S50">Property</col>
		<col def="S50">Value</col>
	</table>

	<table name="ISPatchExternalFile">
		<col key="yes" def="s50">Name</col>
		<col key="yes" def="s13">ISUpgradedImage_</col>
		<col def="s72">FileKey</col>
		<col def="s255">FilePath</col>
	</table>

	<table name="ISPatchWholeFile">
		<col key="yes" def="s50">UpgradedImage</col>
		<col key="yes" def="s72">FileKey</col>
		<col def="S72">Component</col>
	</table>

	<table name="ISPathVariable">
		<col key="yes" def="s72">ISPathVariable</col>
		<col def="S255">Value</col>
		<col def="S255">TestValue</col>
		<col def="i4">Type</col>
		<row><td>CommonFilesFolder</td><td/><td/><td>1</td></row>
		<row><td>ISPROJECTDIR</td><td/><td/><td>1</td></row>
		<row><td>ISProductFolder</td><td/><td/><td>1</td></row>
		<row><td>ISProjectDataFolder</td><td/><td/><td>1</td></row>
		<row><td>ISProjectFolder</td><td/><td/><td>1</td></row>
		<row><td>ProgramFilesFolder</td><td/><td/><td>1</td></row>
		<row><td>SystemFolder</td><td/><td/><td>1</td></row>
		<row><td>WindowsFolder</td><td/><td/><td>1</td></row>
	</table>

	<table name="ISPowerShellWrap">
		<col key="yes" def="s72">Action_</col>
		<col key="yes" def="s72">Name</col>
		<col def="S0">Value</col>
	</table>

	<table name="ISProductConfiguration">
		<col key="yes" def="s72">ISProductConfiguration</col>
		<col def="S255">ProductConfigurationFlags</col>
		<col def="I4">GeneratePackageCode</col>
		<row><td>Express</td><td/><td>1</td></row>
	</table>

	<table name="ISProductConfigurationInstance">
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col key="yes" def="i2">InstanceId</col>
		<col key="yes" def="s72">Property</col>
		<col def="s255">Value</col>
	</table>

	<table name="ISProductConfigurationProperty">
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col key="yes" def="s72">Property</col>
		<col def="L255">Value</col>
		<row><td>Express</td><td>MSIPackageFileName</td><td>JDash.Net Mvc</td></row>
		<row><td>Express</td><td>SetupFileName</td><td>JDash.Net Mvc</td></row>
	</table>

	<table name="ISRelease">
		<col key="yes" def="s72">ISRelease</col>
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col def="s255">BuildLocation</col>
		<col def="s255">PackageName</col>
		<col def="i4">Type</col>
		<col def="s0">SupportedLanguagesUI</col>
		<col def="i4">MsiSourceType</col>
		<col def="i4">ReleaseType</col>
		<col def="s72">Platforms</col>
		<col def="S0">SupportedLanguagesData</col>
		<col def="s6">DefaultLanguage</col>
		<col def="i4">SupportedOSs</col>
		<col def="s50">DiskSize</col>
		<col def="i4">DiskSizeUnit</col>
		<col def="i4">DiskClusterSize</col>
		<col def="S0">ReleaseFlags</col>
		<col def="i4">DiskSpanning</col>
		<col def="S255">SynchMsi</col>
		<col def="s255">MediaLocation</col>
		<col def="S255">URLLocation</col>
		<col def="S255">DigitalURL</col>
		<col def="S255">DigitalPVK</col>
		<col def="S255">DigitalSPC</col>
		<col def="S255">Password</col>
		<col def="S255">VersionCopyright</col>
		<col def="i4">Attributes</col>
		<col def="S255">CDBrowser</col>
		<col def="S255">DotNetBuildConfiguration</col>
		<col def="S255">MsiCommandLine</col>
		<col def="I4">ISSetupPrerequisiteLocation</col>
		<row><td>CD_ROM</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>Default</td><td>0</td><td>1033</td><td>0</td><td>2</td><td>Intel</td><td/><td>1033</td><td>0</td><td>650</td><td>0</td><td>2048</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>75805</td><td/><td/><td/><td>3</td></row>
		<row><td>Custom</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>Default</td><td>2</td><td>1033</td><td>0</td><td>2</td><td>Intel</td><td/><td>1033</td><td>0</td><td>100</td><td>0</td><td>1024</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>75805</td><td/><td/><td/><td>3</td></row>
		<row><td>DVD-10</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>Default</td><td>3</td><td>1033</td><td>0</td><td>2</td><td>Intel</td><td/><td>1033</td><td>0</td><td>8.75</td><td>1</td><td>2048</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>75805</td><td/><td/><td/><td>3</td></row>
		<row><td>DVD-18</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>Default</td><td>3</td><td>1033</td><td>0</td><td>2</td><td>Intel</td><td/><td>1033</td><td>0</td><td>15.83</td><td>1</td><td>2048</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>75805</td><td/><td/><td/><td>3</td></row>
		<row><td>DVD-5</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>Default</td><td>3</td><td>1033</td><td>0</td><td>2</td><td>Intel</td><td/><td>1033</td><td>0</td><td>4.38</td><td>1</td><td>2048</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>75805</td><td/><td/><td/><td>3</td></row>
		<row><td>DVD-9</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>Default</td><td>3</td><td>1033</td><td>0</td><td>2</td><td>Intel</td><td/><td>1033</td><td>0</td><td>7.95</td><td>1</td><td>2048</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>75805</td><td/><td/><td/><td>3</td></row>
		<row><td>SingleImage</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>PackageName</td><td>1</td><td>1033</td><td>0</td><td>1</td><td>Intel</td><td/><td>1033</td><td>0</td><td>0</td><td>0</td><td>0</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>108573</td><td/><td/><td/><td>3</td></row>
		<row><td>WebDeployment</td><td>Express</td><td>&lt;ISProjectDataFolder&gt;</td><td>PackageName</td><td>4</td><td>1033</td><td>2</td><td>1</td><td>Intel</td><td/><td>1033</td><td>0</td><td>0</td><td>0</td><td>0</td><td/><td>0</td><td/><td>MediaLocation</td><td/><td>http://</td><td/><td/><td/><td/><td>124941</td><td/><td/><td/><td>3</td></row>
	</table>

	<table name="ISReleaseASPublishInfo">
		<col key="yes" def="s72">ISRelease_</col>
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col key="yes" def="S0">Property</col>
		<col def="S0">Value</col>
	</table>

	<table name="ISReleaseExtended">
		<col key="yes" def="s72">ISRelease_</col>
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col def="I4">WebType</col>
		<col def="S255">WebURL</col>
		<col def="I4">WebCabSize</col>
		<col def="S255">OneClickCabName</col>
		<col def="S255">OneClickHtmlName</col>
		<col def="S255">WebLocalCachePath</col>
		<col def="I4">EngineLocation</col>
		<col def="S255">Win9xMsiUrl</col>
		<col def="S255">WinNTMsiUrl</col>
		<col def="I4">ISEngineLocation</col>
		<col def="S255">ISEngineURL</col>
		<col def="I4">OneClickTargetBrowser</col>
		<col def="S255">DigitalCertificateIdNS</col>
		<col def="S255">DigitalCertificateDBaseNS</col>
		<col def="S255">DigitalCertificatePasswordNS</col>
		<col def="I4">DotNetRedistLocation</col>
		<col def="S255">DotNetRedistURL</col>
		<col def="I4">DotNetVersion</col>
		<col def="S255">DotNetBaseLanguage</col>
		<col def="S0">DotNetLangaugePacks</col>
		<col def="S255">DotNetFxCmdLine</col>
		<col def="S255">DotNetLangPackCmdLine</col>
		<col def="S50">JSharpCmdLine</col>
		<col def="I4">Attributes</col>
		<col def="I4">JSharpRedistLocation</col>
		<col def="I4">MsiEngineVersion</col>
		<col def="S255">WinMsi30Url</col>
		<col def="S255">CertPassword</col>
		<row><td>CD_ROM</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>install</td><td>install</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>0</td><td>http://www.installengine.com/Msiengine20</td><td>http://www.installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
		<row><td>Custom</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>install</td><td>install</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>0</td><td>http://www.installengine.com/Msiengine20</td><td>http://www.installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
		<row><td>DVD-10</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>install</td><td>install</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>0</td><td>http://www.installengine.com/Msiengine20</td><td>http://www.installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
		<row><td>DVD-18</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>install</td><td>install</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>0</td><td>http://www.installengine.com/Msiengine20</td><td>http://www.installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
		<row><td>DVD-5</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>install</td><td>install</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>0</td><td>http://www.installengine.com/Msiengine20</td><td>http://www.installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
		<row><td>DVD-9</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>install</td><td>install</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>0</td><td>http://www.installengine.com/Msiengine20</td><td>http://www.installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
		<row><td>SingleImage</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>install</td><td>install</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>1</td><td>http://www.installengine.com/Msiengine20</td><td>http://www.installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
		<row><td>WebDeployment</td><td>Express</td><td>0</td><td>http://</td><td>0</td><td>setup</td><td>Default</td><td>[LocalAppDataFolder]Downloaded Installations</td><td>2</td><td>http://www.Installengine.com/Msiengine20</td><td>http://www.Installengine.com/Msiengine20</td><td>0</td><td>http://www.installengine.com/cert05/isengine</td><td>0</td><td/><td/><td/><td>3</td><td>http://www.installengine.com/cert05/dotnetfx</td><td>0</td><td>1033</td><td/><td/><td/><td/><td/><td>3</td><td/><td>http://www.installengine.com/Msiengine30</td><td/></row>
	</table>

	<table name="ISReleaseProperty">
		<col key="yes" def="s72">ISRelease_</col>
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col key="yes" def="s72">Name</col>
		<col def="s0">Value</col>
		<row><td>SingleImage</td><td>Express</td><td>KeepUnusedDirectories</td><td>1</td></row>
	</table>

	<table name="ISReleasePublishInfo">
		<col key="yes" def="s72">ISRelease_</col>
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col def="S255">Repository</col>
		<col def="S255">DisplayName</col>
		<col def="S255">Publisher</col>
		<col def="S255">Description</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="ISSQLConnection">
		<col key="yes" def="s72">ISSQLConnection</col>
		<col def="s255">Server</col>
		<col def="s255">Database</col>
		<col def="s255">UserName</col>
		<col def="s255">Password</col>
		<col def="s255">Authentication</col>
		<col def="i2">Attributes</col>
		<col def="i2">Order</col>
		<col def="S0">Comments</col>
		<col def="I4">CmdTimeout</col>
		<col def="S0">BatchSeparator</col>
		<col def="S0">ScriptVersion_Table</col>
		<col def="S0">ScriptVersion_Column</col>
	</table>

	<table name="ISSQLConnectionDBServer">
		<col key="yes" def="s72">ISSQLConnectionDBServer</col>
		<col key="yes" def="s72">ISSQLConnection_</col>
		<col key="yes" def="s72">ISSQLDBMetaData_</col>
		<col def="i2">Order</col>
	</table>

	<table name="ISSQLConnectionScript">
		<col key="yes" def="s72">ISSQLConnection_</col>
		<col key="yes" def="s72">ISSQLScriptFile_</col>
		<col def="i2">Order</col>
	</table>

	<table name="ISSQLDBMetaData">
		<col key="yes" def="s72">ISSQLDBMetaData</col>
		<col def="S0">DisplayName</col>
		<col def="S0">AdoDriverName</col>
		<col def="S0">AdoCxnDriver</col>
		<col def="S0">AdoCxnServer</col>
		<col def="S0">AdoCxnDatabase</col>
		<col def="S0">AdoCxnUserID</col>
		<col def="S0">AdoCxnPassword</col>
		<col def="S0">AdoCxnWindowsSecurity</col>
		<col def="S0">AdoCxnNetLibrary</col>
		<col def="S0">TestDatabaseCmd</col>
		<col def="S0">TestTableCmd</col>
		<col def="S0">VersionInfoCmd</col>
		<col def="S0">VersionBeginToken</col>
		<col def="S0">VersionEndToken</col>
		<col def="S0">LocalInstanceNames</col>
		<col def="S0">CreateDbCmd</col>
		<col def="S0">SwitchDbCmd</col>
		<col def="I4">ISAttributes</col>
		<col def="S0">TestTableCmd2</col>
		<col def="S0">WinAuthentUserId</col>
		<col def="S0">DsnODBCName</col>
		<col def="S0">AdoCxnPort</col>
		<col def="S0">AdoCxnAdditional</col>
		<col def="S0">QueryDatabasesCmd</col>
		<col def="S0">CreateTableCmd</col>
		<col def="S0">InsertRecordCmd</col>
		<col def="S0">SelectTableCmd</col>
		<col def="S0">ScriptVersion_Table</col>
		<col def="S0">ScriptVersion_Column</col>
		<col def="S0">ScriptVersion_ColumnType</col>
	</table>

	<table name="ISSQLRequirement">
		<col key="yes" def="s72">ISSQLRequirement</col>
		<col key="yes" def="s72">ISSQLConnection_</col>
		<col def="S15">MajorVersion</col>
		<col def="S25">ServicePackLevel</col>
		<col def="i4">Attributes</col>
		<col def="S72">ISSQLConnectionDBServer_</col>
	</table>

	<table name="ISSQLScriptError">
		<col key="yes" def="i4">ErrNumber</col>
		<col key="yes" def="S72">ISSQLScriptFile_</col>
		<col def="i2">ErrHandling</col>
		<col def="L255">Message</col>
		<col def="i2">Attributes</col>
	</table>

	<table name="ISSQLScriptFile">
		<col key="yes" def="s72">ISSQLScriptFile</col>
		<col def="s72">Component_</col>
		<col def="i2">Scheduling</col>
		<col def="L255">InstallText</col>
		<col def="L255">UninstallText</col>
		<col def="S0">ISBuildSourcePath</col>
		<col def="S0">Comments</col>
		<col def="i2">ErrorHandling</col>
		<col def="i2">Attributes</col>
		<col def="S255">Version</col>
		<col def="S255">Condition</col>
		<col def="S0">DisplayName</col>
	</table>

	<table name="ISSQLScriptImport">
		<col key="yes" def="s72">ISSQLScriptFile_</col>
		<col def="S255">Server</col>
		<col def="S255">Database</col>
		<col def="S255">UserName</col>
		<col def="S255">Password</col>
		<col def="i4">Authentication</col>
		<col def="S0">IncludeTables</col>
		<col def="S0">ExcludeTables</col>
		<col def="i4">Attributes</col>
	</table>

	<table name="ISSQLScriptReplace">
		<col key="yes" def="s72">ISSQLScriptReplace</col>
		<col key="yes" def="s72">ISSQLScriptFile_</col>
		<col def="S0">Search</col>
		<col def="S0">Replace</col>
		<col def="i4">Attributes</col>
	</table>

	<table name="ISScriptFile">
		<col key="yes" def="s255">ISScriptFile</col>
	</table>

	<table name="ISSelfReg">
		<col key="yes" def="s72">FileKey</col>
		<col def="I2">Cost</col>
		<col def="I2">Order</col>
		<col def="S50">CmdLine</col>
	</table>

	<table name="ISSetupFile">
		<col key="yes" def="s72">ISSetupFile</col>
		<col def="S255">FileName</col>
		<col def="V0">Stream</col>
		<col def="S50">Language</col>
		<col def="I2">Splash</col>
		<col def="S0">Path</col>
	</table>

	<table name="ISSetupPrerequisites">
		<col key="yes" def="s72">ISSetupPrerequisites</col>
		<col def="S255">ISBuildSourcePath</col>
		<col def="I2">Order</col>
		<col def="I2">ISSetupLocation</col>
		<col def="S255">ISReleaseFlags</col>
	</table>

	<table name="ISSetupType">
		<col key="yes" def="s38">ISSetupType</col>
		<col def="L255">Description</col>
		<col def="L255">Display_Name</col>
		<col def="i2">Display</col>
		<col def="S255">Comments</col>
		<row><td>Custom</td><td>##IDS__IsSetupTypeMinDlg_ChooseFeatures##</td><td>##IDS__IsSetupTypeMinDlg_Custom##</td><td>3</td><td/></row>
		<row><td>Minimal</td><td>##IDS__IsSetupTypeMinDlg_MinimumFeatures##</td><td>##IDS__IsSetupTypeMinDlg_Minimal##</td><td>2</td><td/></row>
		<row><td>Typical</td><td>##IDS__IsSetupTypeMinDlg_AllFeatures##</td><td>##IDS__IsSetupTypeMinDlg_Typical##</td><td>1</td><td/></row>
	</table>

	<table name="ISSetupTypeFeatures">
		<col key="yes" def="s38">ISSetupType_</col>
		<col key="yes" def="s38">Feature_</col>
		<row><td>Custom</td><td>AlwaysInstall</td></row>
		<row><td>Minimal</td><td>AlwaysInstall</td></row>
		<row><td>Typical</td><td>AlwaysInstall</td></row>
	</table>

	<table name="ISStorages">
		<col key="yes" def="s72">Name</col>
		<col def="S0">ISBuildSourcePath</col>
	</table>

	<table name="ISString">
		<col key="yes" def="s255">ISString</col>
		<col key="yes" def="s50">ISLanguage_</col>
		<col def="S0">Value</col>
		<col def="I2">Encoded</col>
		<col def="S0">Comment</col>
		<col def="I4">TimeStamp</col>
		<row><td>COMPANY_NAME</td><td>1033</td><td>Kalitte Inc.</td><td>0</td><td/><td>-928829264</td></row>
		<row><td>DN_AlwaysInstall</td><td>1033</td><td>Always Install</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDPROP_EXPRESS_LAUNCH_CONDITION_COLOR</td><td>1033</td><td>The color settings of your system are not adequate for running [ProductName].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDPROP_EXPRESS_LAUNCH_CONDITION_OS</td><td>1033</td><td>The operating system is not adequate for running [ProductName].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDPROP_EXPRESS_LAUNCH_CONDITION_PROCESSOR</td><td>1033</td><td>The processor is not adequate for running [ProductName].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDPROP_EXPRESS_LAUNCH_CONDITION_RAM</td><td>1033</td><td>The amount of RAM is not adequate for running [ProductName].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDPROP_EXPRESS_LAUNCH_CONDITION_SCREEN</td><td>1033</td><td>The screen resolution is not adequate for running [ProductName].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDPROP_SETUPTYPE_COMPACT</td><td>1033</td><td>Compact</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDPROP_SETUPTYPE_COMPACT_DESC</td><td>1033</td><td>Compact Description</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDPROP_SETUPTYPE_COMPLETE</td><td>1033</td><td>Complete</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDPROP_SETUPTYPE_COMPLETE_DESC</td><td>1033</td><td>Complete</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDPROP_SETUPTYPE_CUSTOM</td><td>1033</td><td>Custom</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDPROP_SETUPTYPE_CUSTOM_DESC</td><td>1033</td><td>Custom Description</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDPROP_SETUPTYPE_CUSTOM_DESC_PRO</td><td>1033</td><td>Custom</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDPROP_SETUPTYPE_TYPICAL</td><td>1033</td><td>Typical</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDPROP_SETUPTYPE_TYPICAL_DESC</td><td>1033</td><td>Typical Description</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_1</td><td>1033</td><td>[1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_1b</td><td>1033</td><td>[1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_1c</td><td>1033</td><td>[1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_1d</td><td>1033</td><td>[1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Advertising</td><td>1033</td><td>Advertising application</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_AllocatingRegistry</td><td>1033</td><td>Allocating registry space</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_AppCommandLine</td><td>1033</td><td>Application: [1], Command line: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_AppId</td><td>1033</td><td>AppId: [1]{{, AppType: [2]}}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_AppIdAppTypeRSN</td><td>1033</td><td>AppId: [1]{{, AppType: [2], Users: [3], RSN: [4]}}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Application</td><td>1033</td><td>Application: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_BindingExes</td><td>1033</td><td>Binding executables</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_ClassId</td><td>1033</td><td>Class ID: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_ClsID</td><td>1033</td><td>Class ID: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_ComponentIDQualifier</td><td>1033</td><td>Component ID: [1], Qualifier: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_ComponentIdQualifier2</td><td>1033</td><td>Component ID: [1], Qualifier: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_ComputingSpace</td><td>1033</td><td>Computing space requirements</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_ComputingSpace2</td><td>1033</td><td>Computing space requirements</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_ComputingSpace3</td><td>1033</td><td>Computing space requirements</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_ContentTypeExtension</td><td>1033</td><td>MIME Content Type: [1], Extension: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_ContentTypeExtension2</td><td>1033</td><td>MIME Content Type: [1], Extension: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_CopyingNetworkFiles</td><td>1033</td><td>Copying files to the network</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_CopyingNewFiles</td><td>1033</td><td>Copying new files</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_CreatingDuplicate</td><td>1033</td><td>Creating duplicate files</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_CreatingFolders</td><td>1033</td><td>Creating folders</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_CreatingIISRoots</td><td>1033</td><td>Creating IIS Virtual Roots...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_CreatingShortcuts</td><td>1033</td><td>Creating shortcuts</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_DeletingServices</td><td>1033</td><td>Deleting services</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_EnvironmentStrings</td><td>1033</td><td>Updating environment strings</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_EvaluateLaunchConditions</td><td>1033</td><td>Evaluating launch conditions</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Extension</td><td>1033</td><td>Extension: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Extension2</td><td>1033</td><td>Extension: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Feature</td><td>1033</td><td>Feature: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FeatureColon</td><td>1033</td><td>Feature: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_File</td><td>1033</td><td>File: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_File2</td><td>1033</td><td>File: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FileDependencies</td><td>1033</td><td>File: [1],  Dependencies: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FileDir</td><td>1033</td><td>File: [1], Directory: [9]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FileDir2</td><td>1033</td><td>File: [1], Directory: [9]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FileDir3</td><td>1033</td><td>File: [1], Directory: [9]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FileDirSize</td><td>1033</td><td>File: [1], Directory: [9], Size: [6]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FileDirSize2</td><td>1033</td><td>File: [1],  Directory: [9],  Size: [6]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FileDirSize3</td><td>1033</td><td>File: [1],  Directory: [9],  Size: [6]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FileDirSize4</td><td>1033</td><td>File: [1],  Directory: [2],  Size: [3]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FileDirectorySize</td><td>1033</td><td>File: [1],  Directory: [9],  Size: [6]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FileFolder</td><td>1033</td><td>File: [1], Folder: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FileFolder2</td><td>1033</td><td>File: [1], Folder: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FileSectionKeyValue</td><td>1033</td><td>File: [1],  Section: [2],  Key: [3], Value: [4]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FileSectionKeyValue2</td><td>1033</td><td>File: [1],  Section: [2],  Key: [3], Value: [4]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Folder</td><td>1033</td><td>Folder: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Folder1</td><td>1033</td><td>Folder: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Font</td><td>1033</td><td>Font: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Font2</td><td>1033</td><td>Font: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FoundApp</td><td>1033</td><td>Found application: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_FreeSpace</td><td>1033</td><td>Free space: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_GeneratingScript</td><td>1033</td><td>Generating script operations for action:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_ISLockPermissionsCost</td><td>1033</td><td>Gathering permissions information for objects...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_ISLockPermissionsInstall</td><td>1033</td><td>Applying permissions information for objects...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_InitializeODBCDirs</td><td>1033</td><td>Initializing ODBC directories</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_InstallODBC</td><td>1033</td><td>Installing ODBC components</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_InstallServices</td><td>1033</td><td>Installing new services</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_InstallingSystemCatalog</td><td>1033</td><td>Installing system catalog</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_KeyName</td><td>1033</td><td>Key: [1], Name: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_KeyNameValue</td><td>1033</td><td>Key: [1], Name: [2], Value: [3]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_LibId</td><td>1033</td><td>LibID: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Libid2</td><td>1033</td><td>LibID: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_MigratingFeatureStates</td><td>1033</td><td>Migrating feature states from related applications</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_MovingFiles</td><td>1033</td><td>Moving files</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_NameValueAction</td><td>1033</td><td>Name: [1], Value: [2], Action [3]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_NameValueAction2</td><td>1033</td><td>Name: [1], Value: [2], Action [3]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_PatchingFiles</td><td>1033</td><td>Patching files</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_ProgID</td><td>1033</td><td>ProgID: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_ProgID2</td><td>1033</td><td>ProgID: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_PropertySignature</td><td>1033</td><td>Property: [1], Signature: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_PublishProductFeatures</td><td>1033</td><td>Publishing product features</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_PublishProductInfo</td><td>1033</td><td>Publishing product information</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_PublishingQualifiedComponents</td><td>1033</td><td>Publishing qualified components</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RegUser</td><td>1033</td><td>Registering user</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RegisterClassServer</td><td>1033</td><td>Registering class servers</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RegisterExtensionServers</td><td>1033</td><td>Registering extension servers</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RegisterFonts</td><td>1033</td><td>Registering fonts</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RegisterMimeInfo</td><td>1033</td><td>Registering MIME info</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RegisterTypeLibs</td><td>1033</td><td>Registering type libraries</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RegisteringComPlus</td><td>1033</td><td>Registering COM+ Applications and Components</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RegisteringModules</td><td>1033</td><td>Registering modules</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RegisteringProduct</td><td>1033</td><td>Registering product</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RegisteringProgIdentifiers</td><td>1033</td><td>Registering program identifiers</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RemoveApps</td><td>1033</td><td>Removing applications</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingBackup</td><td>1033</td><td>Removing backup files</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingDuplicates</td><td>1033</td><td>Removing duplicated files</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingFiles</td><td>1033</td><td>Removing files</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingFolders</td><td>1033</td><td>Removing folders</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingIISRoots</td><td>1033</td><td>Removing IIS Virtual Roots...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingIni</td><td>1033</td><td>Removing INI file entries</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingMoved</td><td>1033</td><td>Removing moved files</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingODBC</td><td>1033</td><td>Removing ODBC components</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingRegistry</td><td>1033</td><td>Removing system registry values</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RemovingShortcuts</td><td>1033</td><td>Removing shortcuts</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_RollingBack</td><td>1033</td><td>Rolling back action:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_SearchForRelated</td><td>1033</td><td>Searching for related applications</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_SearchInstalled</td><td>1033</td><td>Searching for installed applications</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_SearchingQualifyingProducts</td><td>1033</td><td>Searching for qualifying products</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_SearchingQualifyingProducts2</td><td>1033</td><td>Searching for qualifying products</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Service</td><td>1033</td><td>Service: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Service2</td><td>1033</td><td>Service: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Service3</td><td>1033</td><td>Service: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Service4</td><td>1033</td><td>Service: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Shortcut</td><td>1033</td><td>Shortcut: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Shortcut1</td><td>1033</td><td>Shortcut: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_StartingServices</td><td>1033</td><td>Starting services</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_StoppingServices</td><td>1033</td><td>Stopping services</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_UnpublishProductFeatures</td><td>1033</td><td>Unpublishing product features</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_UnpublishQualified</td><td>1033</td><td>Unpublishing Qualified Components</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_UnpublishingProductInfo</td><td>1033</td><td>Unpublishing product information</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_UnregTypeLibs</td><td>1033</td><td>Unregistering type libraries</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_UnregisterClassServers</td><td>1033</td><td>Unregister class servers</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_UnregisterExtensionServers</td><td>1033</td><td>Unregistering extension servers</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_UnregisterModules</td><td>1033</td><td>Unregistering modules</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_UnregisteringComPlus</td><td>1033</td><td>Unregistering COM+ Applications and Components</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_UnregisteringFonts</td><td>1033</td><td>Unregistering fonts</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_UnregisteringMimeInfo</td><td>1033</td><td>Unregistering MIME info</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_UnregisteringProgramIds</td><td>1033</td><td>Unregistering program identifiers</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_UpdateComponentRegistration</td><td>1033</td><td>Updating component registration</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_UpdateEnvironmentStrings</td><td>1033</td><td>Updating environment strings</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_Validating</td><td>1033</td><td>Validating install</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_WritingINI</td><td>1033</td><td>Writing INI file values</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ACTIONTEXT_WritingRegistry</td><td>1033</td><td>Writing system registry values</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_BACK</td><td>1033</td><td>&lt; &amp;Back</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_CANCEL</td><td>1033</td><td>Cancel</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_CANCEL2</td><td>1033</td><td>&amp;Cancel</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_CHANGE</td><td>1033</td><td>&amp;Change...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_COMPLUS_PROGRESSTEXT_COST</td><td>1033</td><td>Costing COM+ application: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_COMPLUS_PROGRESSTEXT_INSTALL</td><td>1033</td><td>Installing COM+ application: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_COMPLUS_PROGRESSTEXT_UNINSTALL</td><td>1033</td><td>Uninstalling COM+ application: [1]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_DIALOG_TEXT2_DESCRIPTION</td><td>1033</td><td>Dialog Normal Description</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_DIALOG_TEXT_DESCRIPTION_EXTERIOR</td><td>1033</td><td>{&amp;TahomaBold10}Dialog Bold Title</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_DIALOG_TEXT_DESCRIPTION_INTERIOR</td><td>1033</td><td>{&amp;MSSansBold8}Dialog Bold Title</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_DIFX_AMD64</td><td>1033</td><td>[ProductName] requires an X64 processor. Click OK to exit the wizard.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_DIFX_IA64</td><td>1033</td><td>[ProductName] requires an IA64 processor. Click OK to exit the wizard.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_DIFX_X86</td><td>1033</td><td>[ProductName] requires an X86 processor. Click OK to exit the wizard.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_DatabaseFolder_InstallDatabaseTo</td><td>1033</td><td>Install [ProductName] database to:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_0</td><td>1033</td><td>{{Fatal error: }}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1</td><td>1033</td><td>Error [1]. </td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_10</td><td>1033</td><td>=== Logging started: [Date]  [Time] ===</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_100</td><td>1033</td><td>Could not remove shortcut [2]. Verify that the shortcut file exists and that you can access it.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_101</td><td>1033</td><td>Could not register type library for file [2].  Contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_102</td><td>1033</td><td>Could not unregister type library for file [2].  Contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_103</td><td>1033</td><td>Could not update the INI file [2][3].  Verify that the file exists and that you can access it.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_104</td><td>1033</td><td>Could not schedule file [2] to replace file [3] on reboot.  Verify that you have write permissions to file [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_105</td><td>1033</td><td>Error removing ODBC driver manager, ODBC error [2]: [3]. Contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_106</td><td>1033</td><td>Error installing ODBC driver manager, ODBC error [2]: [3]. Contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_107</td><td>1033</td><td>Error removing ODBC driver [4], ODBC error [2]: [3]. Verify that you have sufficient privileges to remove ODBC drivers.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_108</td><td>1033</td><td>Error installing ODBC driver [4], ODBC error [2]: [3]. Verify that the file [4] exists and that you can access it.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_109</td><td>1033</td><td>Error configuring ODBC data source [4], ODBC error [2]: [3]. Verify that the file [4] exists and that you can access it.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_11</td><td>1033</td><td>=== Logging stopped: [Date]  [Time] ===</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_110</td><td>1033</td><td>Service [2] ([3]) failed to start.  Verify that you have sufficient privileges to start system services.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_111</td><td>1033</td><td>Service [2] ([3]) could not be stopped.  Verify that you have sufficient privileges to stop system services.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_112</td><td>1033</td><td>Service [2] ([3]) could not be deleted.  Verify that you have sufficient privileges to remove system services.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_113</td><td>1033</td><td>Service [2] ([3]) could not be installed.  Verify that you have sufficient privileges to install system services.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_114</td><td>1033</td><td>Could not update environment variable [2].  Verify that you have sufficient privileges to modify environment variables.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_115</td><td>1033</td><td>You do not have sufficient privileges to complete this installation for all users of the machine.  Log on as an administrator and then retry this installation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_116</td><td>1033</td><td>Could not set file security for file [3]. Error: [2].  Verify that you have sufficient privileges to modify the security permissions for this file.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_117</td><td>1033</td><td>Component Services (COM+ 1.0) are not installed on this computer.  This installation requires Component Services in order to complete successfully.  Component Services are available on Windows 2000.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_118</td><td>1033</td><td>Error registering COM+ application.  Contact your support personnel for more information.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_119</td><td>1033</td><td>Error unregistering COM+ application.  Contact your support personnel for more information.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_12</td><td>1033</td><td>Action start [Time]: [1].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_120</td><td>1033</td><td>Removing older versions of this application</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_121</td><td>1033</td><td>Preparing to remove older versions of this application</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_122</td><td>1033</td><td>Error applying patch to file [2].  It has probably been updated by other means, and can no longer be modified by this patch.  For more information contact your patch vendor.  {{System Error: [3]}}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_123</td><td>1033</td><td>[2] cannot install one of its required products. Contact your technical support group.  {{System Error: [3].}}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_124</td><td>1033</td><td>The older version of [2] cannot be removed.  Contact your technical support group.  {{System Error [3].}}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_125</td><td>1033</td><td>The description for service '[2]' ([3]) could not be changed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_126</td><td>1033</td><td>The Windows Installer service cannot update the system file [2] because the file is protected by Windows.  You may need to update your operating system for this program to work correctly. {{Package version: [3], OS Protected version: [4]}}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_127</td><td>1033</td><td>The Windows Installer service cannot update the protected Windows file [2]. {{Package version: [3], OS Protected version: [4], SFP Error: [5]}}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_128</td><td>1033</td><td>The Windows Installer service cannot update one or more protected Windows files. SFP Error: [2]. List of protected files: [3]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_129</td><td>1033</td><td>User installations are disabled via policy on the machine.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_13</td><td>1033</td><td>Action ended [Time]: [1]. Return value [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_130</td><td>1033</td><td>This setup requires Internet Information Server 4.0 or higher for configuring IIS Virtual Roots. Please make sure that you have IIS 4.0 or higher.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_131</td><td>1033</td><td>This setup requires Administrator privileges for configuring IIS Virtual Roots.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1329</td><td>1033</td><td>A file that is required cannot be installed because the cabinet file [2] is not digitally signed. This may indicate that the cabinet file is corrupt.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1330</td><td>1033</td><td>A file that is required cannot be installed because the cabinet file [2] has an invalid digital signature. This may indicate that the cabinet file is corrupt.{ Error [3] was returned by WinVerifyTrust.}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1331</td><td>1033</td><td>Failed to correctly copy [2] file: CRC error.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1332</td><td>1033</td><td>Failed to correctly patch [2] file: CRC error.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1333</td><td>1033</td><td>Failed to correctly patch [2] file: CRC error.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1334</td><td>1033</td><td>The file '[2]' cannot be installed because the file cannot be found in cabinet file '[3]'. This could indicate a network error, an error reading from the CD-ROM, or a problem with this package.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1335</td><td>1033</td><td>The cabinet file '[2]' required for this installation is corrupt and cannot be used. This could indicate a network error, an error reading from the CD-ROM, or a problem with this package.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1336</td><td>1033</td><td>There was an error creating a temporary file that is needed to complete this installation. Folder: [3]. System error code: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_14</td><td>1033</td><td>Time remaining: {[1] minutes }{[2] seconds}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_15</td><td>1033</td><td>Out of memory. Shut down other applications before retrying.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_16</td><td>1033</td><td>Installer is no longer responding.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1609</td><td>1033</td><td>An error occurred while applying security settings. [2] is not a valid user or group. This could be a problem with the package, or a problem connecting to a domain controller on the network. Check your network connection and click Retry, or Cancel to end the install. Unable to locate the user's SID, system error [3]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1651</td><td>1033</td><td>Admin user failed to apply patch for a per-user managed or a per-machine application which is in advertise state.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_17</td><td>1033</td><td>Installer terminated prematurely.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1715</td><td>1033</td><td>Installed [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1716</td><td>1033</td><td>Configured [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1717</td><td>1033</td><td>Removed [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1718</td><td>1033</td><td>File [2] was rejected by digital signature policy.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1719</td><td>1033</td><td>Windows Installer service could not be accessed. Contact your support personnel to verify that it is properly registered and enabled.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1720</td><td>1033</td><td>There is a problem with this Windows Installer package. A script required for this install to complete could not be run. Contact your support personnel or package vendor. Custom action [2] script error [3], [4]: [5] Line [6], Column [7], [8]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1721</td><td>1033</td><td>There is a problem with this Windows Installer package. A program required for this install to complete could not be run. Contact your support personnel or package vendor. Action: [2], location: [3], command: [4]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1722</td><td>1033</td><td>There is a problem with this Windows Installer package. A program run as part of the setup did not finish as expected. Contact your support personnel or package vendor. Action [2], location: [3], command: [4]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1723</td><td>1033</td><td>There is a problem with this Windows Installer package. A DLL required for this install to complete could not be run. Contact your support personnel or package vendor. Action [2], entry: [3], library: [4]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1724</td><td>1033</td><td>Removal completed successfully.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1725</td><td>1033</td><td>Removal failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1726</td><td>1033</td><td>Advertisement completed successfully.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1727</td><td>1033</td><td>Advertisement failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1728</td><td>1033</td><td>Configuration completed successfully.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1729</td><td>1033</td><td>Configuration failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1730</td><td>1033</td><td>You must be an Administrator to remove this application. To remove this application, you can log on as an administrator, or contact your technical support group for assistance.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1731</td><td>1033</td><td>The source installation package for the product [2] is out of sync with the client package. Try the installation again using a valid copy of the installation package '[3]'.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1732</td><td>1033</td><td>In order to complete the installation of [2], you must restart the computer. Other users are currently logged on to this computer, and restarting may cause them to lose their work. Do you want to restart now?</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_18</td><td>1033</td><td>Please wait while Windows configures [ProductName]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_19</td><td>1033</td><td>Gathering required information...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1935</td><td>1033</td><td>An error occurred during the installation of assembly component [2]. HRESULT: [3]. {{assembly interface: [4], function: [5], assembly name: [6]}}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1936</td><td>1033</td><td>An error occurred during the installation of assembly '[6]'. The assembly is not strongly named or is not signed with the minimal key length. HRESULT: [3]. {{assembly interface: [4], function: [5], component: [2]}}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1937</td><td>1033</td><td>An error occurred during the installation of assembly '[6]'. The signature or catalog could not be verified or is not valid. HRESULT: [3]. {{assembly interface: [4], function: [5], component: [2]}}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_1938</td><td>1033</td><td>An error occurred during the installation of assembly '[6]'. One or more modules of the assembly could not be found. HRESULT: [3]. {{assembly interface: [4], function: [5], component: [2]}}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2</td><td>1033</td><td>Warning [1]. </td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_20</td><td>1033</td><td>{[ProductName] }Setup completed successfully.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_21</td><td>1033</td><td>{[ProductName] }Setup failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2101</td><td>1033</td><td>Shortcuts not supported by the operating system.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2102</td><td>1033</td><td>Invalid .ini action: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2103</td><td>1033</td><td>Could not resolve path for shell folder [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2104</td><td>1033</td><td>Writing .ini file: [3]: System error: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2105</td><td>1033</td><td>Shortcut Creation [3] Failed. System error: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2106</td><td>1033</td><td>Shortcut Deletion [3] Failed. System error: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2107</td><td>1033</td><td>Error [3] registering type library [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2108</td><td>1033</td><td>Error [3] unregistering type library [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2109</td><td>1033</td><td>Section missing for .ini action.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2110</td><td>1033</td><td>Key missing for .ini action.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2111</td><td>1033</td><td>Detection of running applications failed, could not get performance data. Registered operation returned : [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2112</td><td>1033</td><td>Detection of running applications failed, could not get performance index. Registered operation returned : [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2113</td><td>1033</td><td>Detection of running applications failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_22</td><td>1033</td><td>Error reading from file: [2]. {{ System error [3].}}  Verify that the file exists and that you can access it.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2200</td><td>1033</td><td>Database: [2]. Database object creation failed, mode = [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2201</td><td>1033</td><td>Database: [2]. Initialization failed, out of memory.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2202</td><td>1033</td><td>Database: [2]. Data access failed, out of memory.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2203</td><td>1033</td><td>Database: [2]. Cannot open database file. System error [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2204</td><td>1033</td><td>Database: [2]. Table already exists: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2205</td><td>1033</td><td>Database: [2]. Table does not exist: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2206</td><td>1033</td><td>Database: [2]. Table could not be dropped: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2207</td><td>1033</td><td>Database: [2]. Intent violation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2208</td><td>1033</td><td>Database: [2]. Insufficient parameters for Execute.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2209</td><td>1033</td><td>Database: [2]. Cursor in invalid state.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2210</td><td>1033</td><td>Database: [2]. Invalid update data type in column [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2211</td><td>1033</td><td>Database: [2]. Could not create database table [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2212</td><td>1033</td><td>Database: [2]. Database not in writable state.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2213</td><td>1033</td><td>Database: [2]. Error saving database tables.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2214</td><td>1033</td><td>Database: [2]. Error writing export file: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2215</td><td>1033</td><td>Database: [2]. Cannot open import file: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2216</td><td>1033</td><td>Database: [2]. Import file format error: [3], Line [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2217</td><td>1033</td><td>Database: [2]. Wrong state to CreateOutputDatabase [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2218</td><td>1033</td><td>Database: [2]. Table name not supplied.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2219</td><td>1033</td><td>Database: [2]. Invalid Installer database format.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2220</td><td>1033</td><td>Database: [2]. Invalid row/field data.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2221</td><td>1033</td><td>Database: [2]. Code page conflict in import file: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2222</td><td>1033</td><td>Database: [2]. Transform or merge code page [3] differs from database code page [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2223</td><td>1033</td><td>Database: [2]. Databases are the same. No transform generated.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2224</td><td>1033</td><td>Database: [2]. GenerateTransform: Database corrupt. Table: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2225</td><td>1033</td><td>Database: [2]. Transform: Cannot transform a temporary table. Table: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2226</td><td>1033</td><td>Database: [2]. Transform failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2227</td><td>1033</td><td>Database: [2]. Invalid identifier '[3]' in SQL query: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2228</td><td>1033</td><td>Database: [2]. Unknown table '[3]' in SQL query: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2229</td><td>1033</td><td>Database: [2]. Could not load table '[3]' in SQL query: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2230</td><td>1033</td><td>Database: [2]. Repeated table '[3]' in SQL query: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2231</td><td>1033</td><td>Database: [2]. Missing ')' in SQL query: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2232</td><td>1033</td><td>Database: [2]. Unexpected token '[3]' in SQL query: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2233</td><td>1033</td><td>Database: [2]. No columns in SELECT clause in SQL query: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2234</td><td>1033</td><td>Database: [2]. No columns in ORDER BY clause in SQL query: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2235</td><td>1033</td><td>Database: [2]. Column '[3]' not present or ambiguous in SQL query: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2236</td><td>1033</td><td>Database: [2]. Invalid operator '[3]' in SQL query: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2237</td><td>1033</td><td>Database: [2]. Invalid or missing query string: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2238</td><td>1033</td><td>Database: [2]. Missing FROM clause in SQL query: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2239</td><td>1033</td><td>Database: [2]. Insufficient values in INSERT SQL statement.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2240</td><td>1033</td><td>Database: [2]. Missing update columns in UPDATE SQL statement.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2241</td><td>1033</td><td>Database: [2]. Missing insert columns in INSERT SQL statement.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2242</td><td>1033</td><td>Database: [2]. Column '[3]' repeated.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2243</td><td>1033</td><td>Database: [2]. No primary columns defined for table creation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2244</td><td>1033</td><td>Database: [2]. Invalid type specifier '[3]' in SQL query [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2245</td><td>1033</td><td>IStorage::Stat failed with error [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2246</td><td>1033</td><td>Database: [2]. Invalid Installer transform format.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2247</td><td>1033</td><td>Database: [2] Transform stream read/write failure.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2248</td><td>1033</td><td>Database: [2] GenerateTransform/Merge: Column type in base table does not match reference table. Table: [3] Col #: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2249</td><td>1033</td><td>Database: [2] GenerateTransform: More columns in base table than in reference table. Table: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2250</td><td>1033</td><td>Database: [2] Transform: Cannot add existing row. Table: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2251</td><td>1033</td><td>Database: [2] Transform: Cannot delete row that does not exist. Table: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2252</td><td>1033</td><td>Database: [2] Transform: Cannot add existing table. Table: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2253</td><td>1033</td><td>Database: [2] Transform: Cannot delete table that does not exist. Table: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2254</td><td>1033</td><td>Database: [2] Transform: Cannot update row that does not exist. Table: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2255</td><td>1033</td><td>Database: [2] Transform: Column with this name already exists. Table: [3] Col: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2256</td><td>1033</td><td>Database: [2] GenerateTransform/Merge: Number of primary keys in base table does not match reference table. Table: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2257</td><td>1033</td><td>Database: [2]. Intent to modify read only table: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2258</td><td>1033</td><td>Database: [2]. Type mismatch in parameter: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2259</td><td>1033</td><td>Database: [2] Table(s) Update failed</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2260</td><td>1033</td><td>Storage CopyTo failed. System error: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2261</td><td>1033</td><td>Could not remove stream [2]. System error: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2262</td><td>1033</td><td>Stream does not exist: [2]. System error: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2263</td><td>1033</td><td>Could not open stream [2]. System error: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2264</td><td>1033</td><td>Could not remove stream [2]. System error: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2265</td><td>1033</td><td>Could not commit storage. System error: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2266</td><td>1033</td><td>Could not rollback storage. System error: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2267</td><td>1033</td><td>Could not delete storage [2]. System error: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2268</td><td>1033</td><td>Database: [2]. Merge: There were merge conflicts reported in [3] tables.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2269</td><td>1033</td><td>Database: [2]. Merge: The column count differed in the '[3]' table of the two databases.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2270</td><td>1033</td><td>Database: [2]. GenerateTransform/Merge: Column name in base table does not match reference table. Table: [3] Col #: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2271</td><td>1033</td><td>SummaryInformation write for transform failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2272</td><td>1033</td><td>Database: [2]. MergeDatabase will not write any changes because the database is open read-only.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2273</td><td>1033</td><td>Database: [2]. MergeDatabase: A reference to the base database was passed as the reference database.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2274</td><td>1033</td><td>Database: [2]. MergeDatabase: Unable to write errors to Error table. Could be due to a non-nullable column in a predefined Error table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2275</td><td>1033</td><td>Database: [2]. Specified Modify [3] operation invalid for table joins.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2276</td><td>1033</td><td>Database: [2]. Code page [3] not supported by the system.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2277</td><td>1033</td><td>Database: [2]. Failed to save table [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2278</td><td>1033</td><td>Database: [2]. Exceeded number of expressions limit of 32 in WHERE clause of SQL query: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2279</td><td>1033</td><td>Database: [2] Transform: Too many columns in base table [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2280</td><td>1033</td><td>Database: [2]. Could not create column [3] for table [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2281</td><td>1033</td><td>Could not rename stream [2]. System error: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2282</td><td>1033</td><td>Stream name invalid [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_23</td><td>1033</td><td>Cannot create the file [3].  A directory with this name already exists.  Cancel the installation and try installing to a different location.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2302</td><td>1033</td><td>Patch notify: [2] bytes patched to far.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2303</td><td>1033</td><td>Error getting volume info. GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2304</td><td>1033</td><td>Error getting disk free space. GetLastError: [2]. Volume: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2305</td><td>1033</td><td>Error waiting for patch thread. GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2306</td><td>1033</td><td>Could not create thread for patch application. GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2307</td><td>1033</td><td>Source file key name is null.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2308</td><td>1033</td><td>Destination file name is null.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2309</td><td>1033</td><td>Attempting to patch file [2] when patch already in progress.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2310</td><td>1033</td><td>Attempting to continue patch when no patch is in progress.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2315</td><td>1033</td><td>Missing path separator: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2318</td><td>1033</td><td>File does not exist: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2319</td><td>1033</td><td>Error setting file attribute: [3] GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2320</td><td>1033</td><td>File not writable: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2321</td><td>1033</td><td>Error creating file: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2322</td><td>1033</td><td>User canceled.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2323</td><td>1033</td><td>Invalid file attribute.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2324</td><td>1033</td><td>Could not open file: [3] GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2325</td><td>1033</td><td>Could not get file time for file: [3] GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2326</td><td>1033</td><td>Error in FileToDosDateTime.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2327</td><td>1033</td><td>Could not remove directory: [3] GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2328</td><td>1033</td><td>Error getting file version info for file: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2329</td><td>1033</td><td>Error deleting file: [3]. GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2330</td><td>1033</td><td>Error getting file attributes: [3]. GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2331</td><td>1033</td><td>Error loading library [2] or finding entry point [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2332</td><td>1033</td><td>Error getting file attributes. GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2333</td><td>1033</td><td>Error setting file attributes. GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2334</td><td>1033</td><td>Error converting file time to local time for file: [3]. GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2335</td><td>1033</td><td>Path: [2] is not a parent of [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2336</td><td>1033</td><td>Error creating temp file on path: [3]. GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2337</td><td>1033</td><td>Could not close file: [3] GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2338</td><td>1033</td><td>Could not update resource for file: [3] GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2339</td><td>1033</td><td>Could not set file time for file: [3] GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2340</td><td>1033</td><td>Could not update resource for file: [3], Missing resource.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2341</td><td>1033</td><td>Could not update resource for file: [3], Resource too large.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2342</td><td>1033</td><td>Could not update resource for file: [3] GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2343</td><td>1033</td><td>Specified path is empty.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2344</td><td>1033</td><td>Could not find required file IMAGEHLP.DLL to validate file:[2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2345</td><td>1033</td><td>[2]: File does not contain a valid checksum value.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2347</td><td>1033</td><td>User ignore.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2348</td><td>1033</td><td>Error attempting to read from cabinet stream.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2349</td><td>1033</td><td>Copy resumed with different info.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2350</td><td>1033</td><td>FDI server error</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2351</td><td>1033</td><td>File key '[2]' not found in cabinet '[3]'. The installation cannot continue.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2352</td><td>1033</td><td>Could not initialize cabinet file server. The required file 'CABINET.DLL' may be missing.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2353</td><td>1033</td><td>Not a cabinet.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2354</td><td>1033</td><td>Cannot handle cabinet.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2355</td><td>1033</td><td>Corrupt cabinet.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2356</td><td>1033</td><td>Could not locate cabinet in stream: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2357</td><td>1033</td><td>Cannot set attributes.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2358</td><td>1033</td><td>Error determining whether file is in-use: [3]. GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2359</td><td>1033</td><td>Unable to create the target file - file may be in use.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2360</td><td>1033</td><td>Progress tick.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2361</td><td>1033</td><td>Need next cabinet.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2362</td><td>1033</td><td>Folder not found: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2363</td><td>1033</td><td>Could not enumerate subfolders for folder: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2364</td><td>1033</td><td>Bad enumeration constant in CreateCopier call.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2365</td><td>1033</td><td>Could not BindImage exe file [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2366</td><td>1033</td><td>User failure.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2367</td><td>1033</td><td>User abort.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2368</td><td>1033</td><td>Failed to get network resource information. Error [2], network path [3]. Extended error: network provider [5], error code [4], error description [6].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2370</td><td>1033</td><td>Invalid CRC checksum value for [2] file.{ Its header says [3] for checksum, its computed value is [4].}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2371</td><td>1033</td><td>Could not apply patch to file [2]. GetLastError: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2372</td><td>1033</td><td>Patch file [2] is corrupt or of an invalid format. Attempting to patch file [3]. GetLastError: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2373</td><td>1033</td><td>File [2] is not a valid patch file.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2374</td><td>1033</td><td>File [2] is not a valid destination file for patch file [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2375</td><td>1033</td><td>Unknown patching error: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2376</td><td>1033</td><td>Cabinet not found.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2379</td><td>1033</td><td>Error opening file for read: [3] GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2380</td><td>1033</td><td>Error opening file for write: [3]. GetLastError: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2381</td><td>1033</td><td>Directory does not exist: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2382</td><td>1033</td><td>Drive not ready: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_24</td><td>1033</td><td>Please insert the disk: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2401</td><td>1033</td><td>64-bit registry operation attempted on 32-bit operating system for key [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2402</td><td>1033</td><td>Out of memory.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_25</td><td>1033</td><td>The installer has insufficient privileges to access this directory: [2].  The installation cannot continue.  Log on as an administrator or contact your system administrator.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2501</td><td>1033</td><td>Could not create rollback script enumerator.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2502</td><td>1033</td><td>Called InstallFinalize when no install in progress.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2503</td><td>1033</td><td>Called RunScript when not marked in progress.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_26</td><td>1033</td><td>Error writing to file [2].  Verify that you have access to that directory.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2601</td><td>1033</td><td>Invalid value for property [2]: '[3]'</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2602</td><td>1033</td><td>The [2] table entry '[3]' has no associated entry in the Media table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2603</td><td>1033</td><td>Duplicate table name [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2604</td><td>1033</td><td>[2] Property undefined.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2605</td><td>1033</td><td>Could not find server [2] in [3] or [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2606</td><td>1033</td><td>Value of property [2] is not a valid full path: '[3]'.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2607</td><td>1033</td><td>Media table not found or empty (required for installation of files).</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2608</td><td>1033</td><td>Could not create security descriptor for object. Error: '[2]'.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2609</td><td>1033</td><td>Attempt to migrate product settings before initialization.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2611</td><td>1033</td><td>The file [2] is marked as compressed, but the associated media entry does not specify a cabinet.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2612</td><td>1033</td><td>Stream not found in '[2]' column. Primary key: '[3]'.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2613</td><td>1033</td><td>RemoveExistingProducts action sequenced incorrectly.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2614</td><td>1033</td><td>Could not access IStorage object from installation package.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2615</td><td>1033</td><td>Skipped unregistration of Module [2] due to source resolution failure.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2616</td><td>1033</td><td>Companion file [2] parent missing.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2617</td><td>1033</td><td>Shared component [2] not found in Component table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2618</td><td>1033</td><td>Isolated application component [2] not found in Component table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2619</td><td>1033</td><td>Isolated components [2], [3] not part of same feature.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2620</td><td>1033</td><td>Key file of isolated application component [2] not in File table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2621</td><td>1033</td><td>Resource DLL or Resource ID information for shortcut [2] set incorrectly.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27</td><td>1033</td><td>Error reading from file [2].  Verify that the file exists and that you can access it.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2701</td><td>1033</td><td>The depth of a feature exceeds the acceptable tree depth of [2] levels.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2702</td><td>1033</td><td>A Feature table record ([2]) references a non-existent parent in the Attributes field.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2703</td><td>1033</td><td>Property name for root source path not defined: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2704</td><td>1033</td><td>Root directory property undefined: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2705</td><td>1033</td><td>Invalid table: [2]; Could not be linked as tree.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2706</td><td>1033</td><td>Source paths not created. No path exists for entry [2] in Directory table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2707</td><td>1033</td><td>Target paths not created. No path exists for entry [2] in Directory table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2708</td><td>1033</td><td>No entries found in the file table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2709</td><td>1033</td><td>The specified Component name ('[2]') not found in Component table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2710</td><td>1033</td><td>The requested 'Select' state is illegal for this Component.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2711</td><td>1033</td><td>The specified Feature name ('[2]') not found in Feature table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2712</td><td>1033</td><td>Invalid return from modeless dialog: [3], in action [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2713</td><td>1033</td><td>Null value in a non-nullable column ('[2]' in '[3]' column of the '[4]' table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2714</td><td>1033</td><td>Invalid value for default folder name: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2715</td><td>1033</td><td>The specified File key ('[2]') not found in the File table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2716</td><td>1033</td><td>Could not create a random subcomponent name for component '[2]'.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2717</td><td>1033</td><td>Bad action condition or error calling custom action '[2]'.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2718</td><td>1033</td><td>Missing package name for product code '[2]'.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2719</td><td>1033</td><td>Neither UNC nor drive letter path found in source '[2]'.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2720</td><td>1033</td><td>Error opening source list key. Error: '[2]'</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2721</td><td>1033</td><td>Custom action [2] not found in Binary table stream.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2722</td><td>1033</td><td>Custom action [2] not found in File table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2723</td><td>1033</td><td>Custom action [2] specifies unsupported type.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2724</td><td>1033</td><td>The volume label '[2]' on the media you're running from does not match the label '[3]' given in the Media table. This is allowed only if you have only 1 entry in your Media table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2725</td><td>1033</td><td>Invalid database tables</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2726</td><td>1033</td><td>Action not found: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2727</td><td>1033</td><td>The directory entry '[2]' does not exist in the Directory table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2728</td><td>1033</td><td>Table definition error: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2729</td><td>1033</td><td>Install engine not initialized.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2730</td><td>1033</td><td>Bad value in database. Table: '[2]'; Primary key: '[3]'; Column: '[4]'</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2731</td><td>1033</td><td>Selection Manager not initialized.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2732</td><td>1033</td><td>Directory Manager not initialized.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2733</td><td>1033</td><td>Bad foreign key ('[2]') in '[3]' column of the '[4]' table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2734</td><td>1033</td><td>Invalid reinstall mode character.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2735</td><td>1033</td><td>Custom action '[2]' has caused an unhandled exception and has been stopped. This may be the result of an internal error in the custom action, such as an access violation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2736</td><td>1033</td><td>Generation of custom action temp file failed: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2737</td><td>1033</td><td>Could not access custom action [2], entry [3], library [4]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2738</td><td>1033</td><td>Could not access VBScript run time for custom action [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2739</td><td>1033</td><td>Could not access JavaScript run time for custom action [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2740</td><td>1033</td><td>Custom action [2] script error [3], [4]: [5] Line [6], Column [7], [8].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2741</td><td>1033</td><td>Configuration information for product [2] is corrupt. Invalid info: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2742</td><td>1033</td><td>Marshaling to Server failed: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2743</td><td>1033</td><td>Could not execute custom action [2], location: [3], command: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2744</td><td>1033</td><td>EXE failed called by custom action [2], location: [3], command: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2745</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected language [4], found language [5].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2746</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected product [4], found product [5].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2747</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected product version &lt; [4], found product version [5].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2748</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected product version &lt;= [4], found product version [5].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2749</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected product version == [4], found product version [5].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2750</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected product version &gt;= [4], found product version [5].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27502</td><td>1033</td><td>Could not connect to [2] '[3]'. [4]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27503</td><td>1033</td><td>Error retrieving version string from [2] '[3]'. [4]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27504</td><td>1033</td><td>SQL version requirements not met: [3]. This installation requires [2] [4] or later.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27505</td><td>1033</td><td>Could not open SQL script file [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27506</td><td>1033</td><td>Error executing SQL script [2]. Line [3]. [4]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27507</td><td>1033</td><td>Connection or browsing for database servers requires that MDAC be installed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27508</td><td>1033</td><td>Error installing COM+ application [2]. [3]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27509</td><td>1033</td><td>Error uninstalling COM+ application [2]. [3]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2751</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected product version &gt; [4], found product version [5].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27510</td><td>1033</td><td>Error installing COM+ application [2].  Could not load Microsoft(R) .NET class libraries. Registering .NET serviced components requires that Microsoft(R) .NET Framework be installed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27511</td><td>1033</td><td>Could not execute SQL script file [2]. Connection not open: [3]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27512</td><td>1033</td><td>Error beginning transactions for [2] '[3]'. Database [4]. [5]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27513</td><td>1033</td><td>Error committing transactions for [2] '[3]'. Database [4]. [5]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27514</td><td>1033</td><td>This installation requires a Microsoft SQL Server. The specified server '[3]' is a Microsoft SQL Server Desktop Engine or SQL Server Express.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27515</td><td>1033</td><td>Error retrieving schema version from [2] '[3]'. Database: '[4]'. [5]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27516</td><td>1033</td><td>Error writing schema version to [2] '[3]'. Database: '[4]'. [5]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27517</td><td>1033</td><td>This installation requires Administrator privileges for installing COM+ applications. Log on as an administrator and then retry this installation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27518</td><td>1033</td><td>The COM+ application "[2]" is configured to run as an NT service; this requires COM+ 1.5 or later on the system. Since your system has COM+ 1.0, this application will not be installed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27519</td><td>1033</td><td>Error updating XML file [2]. [3]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2752</td><td>1033</td><td>Could not open transform [2] stored as child storage of package [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27520</td><td>1033</td><td>Error opening XML file [2]. [3]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27521</td><td>1033</td><td>This setup requires MSXML 3.0 or higher for configuring XML files. Please make sure that you have version 3.0 or higher.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27522</td><td>1033</td><td>Error creating XML file [2]. [3]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27523</td><td>1033</td><td>Error loading servers.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27524</td><td>1033</td><td>Error loading NetApi32.DLL. The ISNetApi.dll needs to have NetApi32.DLL properly loaded and requires an NT based operating system.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27525</td><td>1033</td><td>Server not found. Verify that the specified server exists. The server name can not be empty.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27526</td><td>1033</td><td>Unspecified error from ISNetApi.dll.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27527</td><td>1033</td><td>The buffer is too small.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27528</td><td>1033</td><td>Access denied. Check administrative rights.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27529</td><td>1033</td><td>Invalid computer.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2753</td><td>1033</td><td>The File '[2]' is not marked for installation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27530</td><td>1033</td><td>Unknown error returned from NetAPI. System error: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27531</td><td>1033</td><td>Unhandled exception.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27532</td><td>1033</td><td>Invalid user name for this server or domain.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27533</td><td>1033</td><td>The case-sensitive passwords do not match.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27534</td><td>1033</td><td>The list is empty.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27535</td><td>1033</td><td>Access violation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27536</td><td>1033</td><td>Error getting group.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27537</td><td>1033</td><td>Error adding user to group. Verify that the group exists for this domain or server.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27538</td><td>1033</td><td>Error creating user.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27539</td><td>1033</td><td>ERROR_NETAPI_ERROR_NOT_PRIMARY returned from NetAPI.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2754</td><td>1033</td><td>The File '[2]' is not a valid patch file.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27540</td><td>1033</td><td>The specified user already exists.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27541</td><td>1033</td><td>The specified group already exists.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27542</td><td>1033</td><td>Invalid password. Verify that the password is in accordance with your network password policy.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27543</td><td>1033</td><td>Invalid name.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27544</td><td>1033</td><td>Invalid group.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27545</td><td>1033</td><td>The user name can not be empty and must be in the format DOMAIN\Username.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27546</td><td>1033</td><td>Error loading or creating INI file in the user TEMP directory.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27547</td><td>1033</td><td>ISNetAPI.dll is not loaded or there was an error loading the dll. This dll needs to be loaded for this operation. Verify that the dll is in the SUPPORTDIR directory.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27548</td><td>1033</td><td>Error deleting INI file containing new user information from the user's TEMP directory.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27549</td><td>1033</td><td>Error getting the primary domain controller (PDC).</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2755</td><td>1033</td><td>Server returned unexpected error [2] attempting to install package [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27550</td><td>1033</td><td>Every field must have a value in order to create a user.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27551</td><td>1033</td><td>ODBC driver for [2] not found. This is required to connect to [2] database servers.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27552</td><td>1033</td><td>Error creating database [4]. Server: [2] [3]. [5]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27553</td><td>1033</td><td>Error connecting to database [4]. Server: [2] [3]. [5]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27554</td><td>1033</td><td>Error attempting to open connection [2]. No valid database metadata associated with this connection.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_27555</td><td>1033</td><td>Error attempting to apply permissions to object '[2]'. System error: [3] ([4])</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2756</td><td>1033</td><td>The property '[2]' was used as a directory property in one or more tables, but no value was ever assigned.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2757</td><td>1033</td><td>Could not create summary info for transform [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2758</td><td>1033</td><td>Transform [2] does not contain an MSI version.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2759</td><td>1033</td><td>Transform [2] version [3] incompatible with engine; Min: [4], Max: [5].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2760</td><td>1033</td><td>Transform [2] invalid for package [3]. Expected upgrade code [4], found [5].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2761</td><td>1033</td><td>Cannot begin transaction. Global mutex not properly initialized.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2762</td><td>1033</td><td>Cannot write script record. Transaction not started.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2763</td><td>1033</td><td>Cannot run script. Transaction not started.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2765</td><td>1033</td><td>Assembly name missing from AssemblyName table : Component: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2766</td><td>1033</td><td>The file [2] is an invalid MSI storage file.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2767</td><td>1033</td><td>No more data{ while enumerating [2]}.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2768</td><td>1033</td><td>Transform in patch package is invalid.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2769</td><td>1033</td><td>Custom Action [2] did not close [3] MSIHANDLEs.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2770</td><td>1033</td><td>Cached folder [2] not defined in internal cache folder table.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2771</td><td>1033</td><td>Upgrade of feature [2] has a missing component.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2772</td><td>1033</td><td>New upgrade feature [2] must be a leaf feature.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_28</td><td>1033</td><td>Another application has exclusive access to the file [2].  Please shut down all other applications, then click Retry.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2801</td><td>1033</td><td>Unknown Message -- Type [2]. No action is taken.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2802</td><td>1033</td><td>No publisher is found for the event [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2803</td><td>1033</td><td>Dialog View did not find a record for the dialog [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2804</td><td>1033</td><td>On activation of the control [3] on dialog [2] CMsiDialog failed to evaluate the condition [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2806</td><td>1033</td><td>The dialog [2] failed to evaluate the condition [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2807</td><td>1033</td><td>The action [2] is not recognized.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2808</td><td>1033</td><td>Default button is ill-defined on dialog [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2809</td><td>1033</td><td>On the dialog [2] the next control pointers do not form a cycle. There is a pointer from [3] to [4], but there is no further pointer.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2810</td><td>1033</td><td>On the dialog [2] the next control pointers do not form a cycle. There is a pointer from both [3] and [5] to [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2811</td><td>1033</td><td>On dialog [2] control [3] has to take focus, but it is unable to do so.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2812</td><td>1033</td><td>The event [2] is not recognized.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2813</td><td>1033</td><td>The EndDialog event was called with the argument [2], but the dialog has a parent.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2814</td><td>1033</td><td>On the dialog [2] the control [3] names a nonexistent control [4] as the next control.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2815</td><td>1033</td><td>ControlCondition table has a row without condition for the dialog [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2816</td><td>1033</td><td>The EventMapping table refers to an invalid control [4] on dialog [2] for the event [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2817</td><td>1033</td><td>The event [2] failed to set the attribute for the control [4] on dialog [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2818</td><td>1033</td><td>In the ControlEvent table EndDialog has an unrecognized argument [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2819</td><td>1033</td><td>Control [3] on dialog [2] needs a property linked to it.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2820</td><td>1033</td><td>Attempted to initialize an already initialized handler.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2821</td><td>1033</td><td>Attempted to initialize an already initialized dialog: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2822</td><td>1033</td><td>No other method can be called on dialog [2] until all the controls are added.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2823</td><td>1033</td><td>Attempted to initialize an already initialized control: [3] on dialog [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2824</td><td>1033</td><td>The dialog attribute [3] needs a record of at least [2] field(s).</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2825</td><td>1033</td><td>The control attribute [3] needs a record of at least [2] field(s).</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2826</td><td>1033</td><td>Control [3] on dialog [2] extends beyond the boundaries of the dialog [4] by [5] pixels.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2827</td><td>1033</td><td>The button [4] on the radio button group [3] on dialog [2] extends beyond the boundaries of the group [5] by [6] pixels.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2828</td><td>1033</td><td>Tried to remove control [3] from dialog [2], but the control is not part of the dialog.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2829</td><td>1033</td><td>Attempt to use an uninitialized dialog.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2830</td><td>1033</td><td>Attempt to use an uninitialized control on dialog [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2831</td><td>1033</td><td>The control [3] on dialog [2] does not support [5] the attribute [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2832</td><td>1033</td><td>The dialog [2] does not support the attribute [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2833</td><td>1033</td><td>Control [4] on dialog [3] ignored the message [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2834</td><td>1033</td><td>The next pointers on the dialog [2] do not form a single loop.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2835</td><td>1033</td><td>The control [2] was not found on dialog [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2836</td><td>1033</td><td>The control [3] on the dialog [2] cannot take focus.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2837</td><td>1033</td><td>The control [3] on dialog [2] wants the winproc to return [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2838</td><td>1033</td><td>The item [2] in the selection table has itself as a parent.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2839</td><td>1033</td><td>Setting the property [2] failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2840</td><td>1033</td><td>Error dialog name mismatch.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2841</td><td>1033</td><td>No OK button was found on the error dialog.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2842</td><td>1033</td><td>No text field was found on the error dialog.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2843</td><td>1033</td><td>The ErrorString attribute is not supported for standard dialogs.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2844</td><td>1033</td><td>Cannot execute an error dialog if the Errorstring is not set.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2845</td><td>1033</td><td>The total width of the buttons exceeds the size of the error dialog.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2846</td><td>1033</td><td>SetFocus did not find the required control on the error dialog.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2847</td><td>1033</td><td>The control [3] on dialog [2] has both the icon and the bitmap style set.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2848</td><td>1033</td><td>Tried to set control [3] as the default button on dialog [2], but the control does not exist.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2849</td><td>1033</td><td>The control [3] on dialog [2] is of a type, that cannot be integer valued.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2850</td><td>1033</td><td>Unrecognized volume type.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2851</td><td>1033</td><td>The data for the icon [2] is not valid.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2852</td><td>1033</td><td>At least one control has to be added to dialog [2] before it is used.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2853</td><td>1033</td><td>Dialog [2] is a modeless dialog. The execute method should not be called on it.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2854</td><td>1033</td><td>On the dialog [2] the control [3] is designated as first active control, but there is no such control.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2855</td><td>1033</td><td>The radio button group [3] on dialog [2] has fewer than 2 buttons.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2856</td><td>1033</td><td>Creating a second copy of the dialog [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2857</td><td>1033</td><td>The directory [2] is mentioned in the selection table but not found.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2858</td><td>1033</td><td>The data for the bitmap [2] is not valid.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2859</td><td>1033</td><td>Test error message.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2860</td><td>1033</td><td>Cancel button is ill-defined on dialog [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2861</td><td>1033</td><td>The next pointers for the radio buttons on dialog [2] control [3] do not form a cycle.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2862</td><td>1033</td><td>The attributes for the control [3] on dialog [2] do not define a valid icon size. Setting the size to 16.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2863</td><td>1033</td><td>The control [3] on dialog [2] needs the icon [4] in size [5]x[5], but that size is not available. Loading the first available size.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2864</td><td>1033</td><td>The control [3] on dialog [2] received a browse event, but there is no configurable directory for the present selection. Likely cause: browse button is not authored correctly.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2865</td><td>1033</td><td>Control [3] on billboard [2] extends beyond the boundaries of the billboard [4] by [5] pixels.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2866</td><td>1033</td><td>The dialog [2] is not allowed to return the argument [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2867</td><td>1033</td><td>The error dialog property is not set.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2868</td><td>1033</td><td>The error dialog [2] does not have the error style bit set.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2869</td><td>1033</td><td>The dialog [2] has the error style bit set, but is not an error dialog.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2870</td><td>1033</td><td>The help string [4] for control [3] on dialog [2] does not contain the separator character.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2871</td><td>1033</td><td>The [2] table is out of date: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2872</td><td>1033</td><td>The argument of the CheckPath control event on dialog [2] is invalid.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2873</td><td>1033</td><td>On the dialog [2] the control [3] has an invalid string length limit: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2874</td><td>1033</td><td>Changing the text font to [2] failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2875</td><td>1033</td><td>Changing the text color to [2] failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2876</td><td>1033</td><td>The control [3] on dialog [2] had to truncate the string: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2877</td><td>1033</td><td>The binary data [2] was not found</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2878</td><td>1033</td><td>On the dialog [2] the control [3] has a possible value: [4]. This is an invalid or duplicate value.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2879</td><td>1033</td><td>The control [3] on dialog [2] cannot parse the mask string: [4].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2880</td><td>1033</td><td>Do not perform the remaining control events.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2881</td><td>1033</td><td>CMsiHandler initialization failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2882</td><td>1033</td><td>Dialog window class registration failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2883</td><td>1033</td><td>CreateNewDialog failed for the dialog [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2884</td><td>1033</td><td>Failed to create a window for the dialog [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2885</td><td>1033</td><td>Failed to create the control [3] on the dialog [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2886</td><td>1033</td><td>Creating the [2] table failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2887</td><td>1033</td><td>Creating a cursor to the [2] table failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2888</td><td>1033</td><td>Executing the [2] view failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2889</td><td>1033</td><td>Creating the window for the control [3] on dialog [2] failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2890</td><td>1033</td><td>The handler failed in creating an initialized dialog.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2891</td><td>1033</td><td>Failed to destroy window for dialog [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2892</td><td>1033</td><td>[2] is an integer only control, [3] is not a valid integer value.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2893</td><td>1033</td><td>The control [3] on dialog [2] can accept property values that are at most [5] characters long. The value [4] exceeds this limit, and has been truncated.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2894</td><td>1033</td><td>Loading RICHED20.DLL failed. GetLastError() returned: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2895</td><td>1033</td><td>Freeing RICHED20.DLL failed. GetLastError() returned: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2896</td><td>1033</td><td>Executing action [2] failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2897</td><td>1033</td><td>Failed to create any [2] font on this system.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2898</td><td>1033</td><td>For [2] textstyle, the system created a '[3]' font, in [4] character set.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2899</td><td>1033</td><td>Failed to create [2] textstyle. GetLastError() returned: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_29</td><td>1033</td><td>There is not enough disk space to install the file [2].  Free some disk space and click Retry, or click Cancel to exit.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2901</td><td>1033</td><td>Invalid parameter to operation [2]: Parameter [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2902</td><td>1033</td><td>Operation [2] called out of sequence.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2903</td><td>1033</td><td>The file [2] is missing.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2904</td><td>1033</td><td>Could not BindImage file [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2905</td><td>1033</td><td>Could not read record from script file [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2906</td><td>1033</td><td>Missing header in script file [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2907</td><td>1033</td><td>Could not create secure security descriptor. Error: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2908</td><td>1033</td><td>Could not register component [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2909</td><td>1033</td><td>Could not unregister component [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2910</td><td>1033</td><td>Could not determine user's security ID.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2911</td><td>1033</td><td>Could not remove the folder [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2912</td><td>1033</td><td>Could not schedule file [2] for removal on restart.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2919</td><td>1033</td><td>No cabinet specified for compressed file: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2920</td><td>1033</td><td>Source directory not specified for file [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2924</td><td>1033</td><td>Script [2] version unsupported. Script version: [3], minimum version: [4], maximum version: [5].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2927</td><td>1033</td><td>ShellFolder id [2] is invalid.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2928</td><td>1033</td><td>Exceeded maximum number of sources. Skipping source '[2]'.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2929</td><td>1033</td><td>Could not determine publishing root. Error: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2932</td><td>1033</td><td>Could not create file [2] from script data. Error: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2933</td><td>1033</td><td>Could not initialize rollback script [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2934</td><td>1033</td><td>Could not secure transform [2]. Error [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2935</td><td>1033</td><td>Could not unsecure transform [2]. Error [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2936</td><td>1033</td><td>Could not find transform [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2937</td><td>1033</td><td>Windows Installer cannot install a system file protection catalog. Catalog: [2], Error: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2938</td><td>1033</td><td>Windows Installer cannot retrieve a system file protection catalog from the cache. Catalog: [2], Error: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2939</td><td>1033</td><td>Windows Installer cannot delete a system file protection catalog from the cache. Catalog: [2], Error: [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2940</td><td>1033</td><td>Directory Manager not supplied for source resolution.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2941</td><td>1033</td><td>Unable to compute the CRC for file [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2942</td><td>1033</td><td>BindImage action has not been executed on [2] file.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2943</td><td>1033</td><td>This version of Windows does not support deploying 64-bit packages. The script [2] is for a 64-bit package.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2944</td><td>1033</td><td>GetProductAssignmentType failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_2945</td><td>1033</td><td>Installation of ComPlus App [2] failed with error [3].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_3</td><td>1033</td><td>Info [1]. </td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_30</td><td>1033</td><td>Source file not found: [2].  Verify that the file exists and that you can access it.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_3001</td><td>1033</td><td>The patches in this list contain incorrect sequencing information: [2][3][4][5][6][7][8][9][10][11][12][13][14][15][16].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_3002</td><td>1033</td><td>Patch [2] contains invalid sequencing information. </td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_31</td><td>1033</td><td>Error reading from file: [3]. {{ System error [2].}}  Verify that the file exists and that you can access it.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_32</td><td>1033</td><td>Error writing to file: [3]. {{ System error [2].}}  Verify that you have access to that directory.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_33</td><td>1033</td><td>Source file not found{{(cabinet)}}: [2].  Verify that the file exists and that you can access it.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_34</td><td>1033</td><td>Cannot create the directory [2].  A file with this name already exists.  Please rename or remove the file and click Retry, or click Cancel to exit.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_35</td><td>1033</td><td>The volume [2] is currently unavailable.  Please select another.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_36</td><td>1033</td><td>The specified path [2] is unavailable.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_37</td><td>1033</td><td>Unable to write to the specified folder [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_38</td><td>1033</td><td>A network error occurred while attempting to read from the file [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_39</td><td>1033</td><td>An error occurred while attempting to create the directory [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_4</td><td>1033</td><td>Internal Error [1]. [2]{, [3]}{, [4]}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_40</td><td>1033</td><td>A network error occurred while attempting to create the directory [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_41</td><td>1033</td><td>A network error occurred while attempting to open the source file cabinet [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_42</td><td>1033</td><td>The specified path is too long [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_43</td><td>1033</td><td>The Installer has insufficient privileges to modify the file [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_44</td><td>1033</td><td>A portion of the path [2] exceeds the length allowed by the system.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_45</td><td>1033</td><td>The path [2] contains words that are not valid in folders.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_46</td><td>1033</td><td>The path [2] contains an invalid character.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_47</td><td>1033</td><td>[2] is not a valid short file name.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_48</td><td>1033</td><td>Error getting file security: [3] GetLastError: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_49</td><td>1033</td><td>Invalid Drive: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_5</td><td>1033</td><td>{{Disk full: }}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_50</td><td>1033</td><td>Could not create key [2]. {{ System error [3].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_51</td><td>1033</td><td>Could not open key: [2]. {{ System error [3].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_52</td><td>1033</td><td>Could not delete value [2] from key [3]. {{ System error [4].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_53</td><td>1033</td><td>Could not delete key [2]. {{ System error [3].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_54</td><td>1033</td><td>Could not read value [2] from key [3]. {{ System error [4].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_55</td><td>1033</td><td>Could not write value [2] to key [3]. {{ System error [4].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_56</td><td>1033</td><td>Could not get value names for key [2]. {{ System error [3].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_57</td><td>1033</td><td>Could not get sub key names for key [2]. {{ System error [3].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_58</td><td>1033</td><td>Could not read security information for key [2]. {{ System error [3].}}  Verify that you have sufficient access to that key, or contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_59</td><td>1033</td><td>Could not increase the available registry space. [2] KB of free registry space is required for the installation of this application.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_6</td><td>1033</td><td>Action [Time]: [1]. [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_60</td><td>1033</td><td>Another installation is in progress. You must complete that installation before continuing this one.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_61</td><td>1033</td><td>Error accessing secured data. Please make sure the Windows Installer is configured properly and try the installation again.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_62</td><td>1033</td><td>User [2] has previously initiated an installation for product [3].  That user will need to run that installation again before using that product.  Your current installation will now continue.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_63</td><td>1033</td><td>User [2] has previously initiated an installation for product [3].  That user will need to run that installation again before using that product.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_64</td><td>1033</td><td>Out of disk space -- Volume: '[2]'; required space: [3] KB; available space: [4] KB.  Free some disk space and retry.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_65</td><td>1033</td><td>Are you sure you want to cancel?</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_66</td><td>1033</td><td>The file [2][3] is being held in use{ by the following process: Name: [4], ID: [5], Window Title: [6]}.  Close that application and retry.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_67</td><td>1033</td><td>The product [2] is already installed, preventing the installation of this product.  The two products are incompatible.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_68</td><td>1033</td><td>Out of disk space -- Volume: [2]; required space: [3] KB; available space: [4] KB.  If rollback is disabled, enough space is available. Click Cancel to quit, Retry to check available disk space again, or Ignore to continue without rollback.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_69</td><td>1033</td><td>Could not access network location [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_7</td><td>1033</td><td>[ProductName]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_70</td><td>1033</td><td>The following applications should be closed before continuing the installation:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_71</td><td>1033</td><td>Could not find any previously installed compliant products on the machine for installing this product.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_72</td><td>1033</td><td>The key [2] is not valid.  Verify that you entered the correct key.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_73</td><td>1033</td><td>The installer must restart your system before configuration of [2] can continue.  Click Yes to restart now or No if you plan to restart later.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_74</td><td>1033</td><td>You must restart your system for the configuration changes made to [2] to take effect. Click Yes to restart now or No if you plan to restart later.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_75</td><td>1033</td><td>An installation for [2] is currently suspended.  You must undo the changes made by that installation to continue.  Do you want to undo those changes?</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_76</td><td>1033</td><td>A previous installation for this product is in progress.  You must undo the changes made by that installation to continue.  Do you want to undo those changes?</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_77</td><td>1033</td><td>No valid source could be found for product [2].  The Windows Installer cannot continue.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_78</td><td>1033</td><td>Installation operation completed successfully.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_79</td><td>1033</td><td>Installation operation failed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_8</td><td>1033</td><td>{[2]}{, [3]}{, [4]}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_80</td><td>1033</td><td>Product: [2] -- [3]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_81</td><td>1033</td><td>You may either restore your computer to its previous state or continue the installation later. Would you like to restore?</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_82</td><td>1033</td><td>An error occurred while writing installation information to disk.  Check to make sure enough disk space is available, and click Retry, or Cancel to end the installation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_83</td><td>1033</td><td>One or more of the files required to restore your computer to its previous state could not be found.  Restoration will not be possible.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_84</td><td>1033</td><td>The path [2] is not valid.  Please specify a valid path.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_85</td><td>1033</td><td>Out of memory. Shut down other applications before retrying.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_86</td><td>1033</td><td>There is no disk in drive [2]. Please insert one and click Retry, or click Cancel to go back to the previously selected volume.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_87</td><td>1033</td><td>There is no disk in drive [2]. Please insert one and click Retry, or click Cancel to return to the browse dialog and select a different volume.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_88</td><td>1033</td><td>The folder [2] does not exist.  Please enter a path to an existing folder.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_89</td><td>1033</td><td>You have insufficient privileges to read this folder.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_9</td><td>1033</td><td>Message type: [1], Argument: [2]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_90</td><td>1033</td><td>A valid destination folder for the installation could not be determined.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_91</td><td>1033</td><td>Error attempting to read from the source installation database: [2].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_92</td><td>1033</td><td>Scheduling reboot operation: Renaming file [2] to [3]. Must reboot to complete operation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_93</td><td>1033</td><td>Scheduling reboot operation: Deleting file [2]. Must reboot to complete operation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_94</td><td>1033</td><td>Module [2] failed to register.  HRESULT [3].  Contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_95</td><td>1033</td><td>Module [2] failed to unregister.  HRESULT [3].  Contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_96</td><td>1033</td><td>Failed to cache package [2]. Error: [3]. Contact your support personnel.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_97</td><td>1033</td><td>Could not register font [2].  Verify that you have sufficient permissions to install fonts, and that the system supports this font.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_98</td><td>1033</td><td>Could not unregister font [2]. Verify that you have sufficient permissions to remove fonts.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ERROR_99</td><td>1033</td><td>Could not create shortcut [2]. Verify that the destination folder exists and that you can access it.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_INSTALLDIR</td><td>1033</td><td>[INSTALLDIR]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_INSTALLSHIELD</td><td>1033</td><td>InstallShield</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_INSTALLSHIELD_FORMATTED</td><td>1033</td><td>{&amp;MSSWhiteSerif8}InstallShield</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ISSCRIPT_VERSION_MISSING</td><td>1033</td><td>The InstallScript engine is missing from this machine.  If available, please run ISScript.msi, or contact your support personnel for further assistance.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_ISSCRIPT_VERSION_OLD</td><td>1033</td><td>The InstallScript engine on this machine is older than the version required to run this setup.  If available, please install the latest version of ISScript.msi, or contact your support personnel for further assistance.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_NEXT</td><td>1033</td><td>&amp;Next &gt;</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_OK</td><td>1033</td><td>OK</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PREREQUISITE_SETUP_BROWSE</td><td>1033</td><td>Open [ProductName]'s original [SETUPEXENAME]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PREREQUISITE_SETUP_INVALID</td><td>1033</td><td>This executable file does not appear to be the original executable file for [ProductName]. Without using the original [SETUPEXENAME] to install additional dependencies, [ProductName] may not work correctly. Would you like to find the original [SETUPEXENAME]?</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PREREQUISITE_SETUP_SEARCH</td><td>1033</td><td>This installation may require additional dependencies. Without its dependencies, [ProductName] may not work correctly. Would you like to find the original [SETUPEXENAME]?</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PREVENT_DOWNGRADE_EXIT</td><td>1033</td><td>A newer version of this application is already installed on this computer. If you wish to install this version, please uninstall the newer version first. Click OK to exit the wizard.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PRINT_BUTTON</td><td>1033</td><td>&amp;Print</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PRODUCTNAME_INSTALLSHIELD</td><td>1033</td><td>[ProductName] - InstallShield Wizard</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEAPPPOOL</td><td>1033</td><td>Creating application pool %s</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEAPPPOOLS</td><td>1033</td><td>Creating application Pools...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEVROOT</td><td>1033</td><td>Creating IIS virtual directory %s</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEVROOTS</td><td>1033</td><td>Creating IIS virtual directories...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEWEBSERVICEEXTENSION</td><td>1033</td><td>Creating web service extension</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEWEBSERVICEEXTENSIONS</td><td>1033</td><td>Creating web service extensions...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEWEBSITE</td><td>1033</td><td>Creating IIS website %s</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_CREATEWEBSITES</td><td>1033</td><td>Creating IIS websites...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_EXTRACT</td><td>1033</td><td>Extracting information for IIS virtual directories...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_EXTRACTDONE</td><td>1033</td><td>Extracted information for IIS virtual directories...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVEAPPPOOL</td><td>1033</td><td>Removing application pool</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVEAPPPOOLS</td><td>1033</td><td>Removing application pools...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVESITE</td><td>1033</td><td>Removing web site at port %d</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVEVROOT</td><td>1033</td><td>Removing IIS virtual directory %s</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVEVROOTS</td><td>1033</td><td>Removing IIS virtual directories...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVEWEBSERVICEEXTENSION</td><td>1033</td><td>Removing web service extension</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVEWEBSERVICEEXTENSIONS</td><td>1033</td><td>Removing web service extensions...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_REMOVEWEBSITES</td><td>1033</td><td>Removing IIS websites...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_ROLLBACKAPPPOOLS</td><td>1033</td><td>Rolling back application pools...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_ROLLBACKVROOTS</td><td>1033</td><td>Rolling back virtual directory and web site changes...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_IIS_ROLLBACKWEBSERVICEEXTENSIONS</td><td>1033</td><td>Rolling back web service extensions...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_TEXTFILECHANGS_REPLACE</td><td>1033</td><td>Replacing %s with %s in %s...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_XML_COSTING</td><td>1033</td><td>Costing XML files...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_XML_CREATE_FILE</td><td>1033</td><td>Creating XML file %s...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_XML_FILES</td><td>1033</td><td>Performing XML file changes...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_XML_REMOVE_FILE</td><td>1033</td><td>Removing XML file %s...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_XML_ROLLBACK_FILES</td><td>1033</td><td>Rolling back XML file changes...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_PROGMSG_XML_UPDATE_FILE</td><td>1033</td><td>Updating XML file %s...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SETUPEXE_EXPIRE_MSG</td><td>1033</td><td>This setup works until %s. The setup will now exit.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SETUPEXE_LAUNCH_COND_E</td><td>1033</td><td>This setup was built with an evaluation version of InstallShield and can only be launched from setup.exe.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLBROWSE_INTRO</td><td>1033</td><td>From the list of servers below, select the database server you would like to target.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLBROWSE_INTRO_DB</td><td>1033</td><td>From the list of catalog names below, select the database catalog you would like to target.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLBROWSE_INTRO_TEMPLATE</td><td>1033</td><td>[IS_SQLBROWSE_INTRO]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLLOGIN_BROWSE</td><td>1033</td><td>B&amp;rowse...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLLOGIN_BROWSE_DB</td><td>1033</td><td>Br&amp;owse...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLLOGIN_CATALOG</td><td>1033</td><td>&amp;Name of database catalog:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLLOGIN_CONNECT</td><td>1033</td><td>Connect using:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLLOGIN_DESC</td><td>1033</td><td>Select database server and authentication method</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLLOGIN_ID</td><td>1033</td><td>&amp;Login ID:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLLOGIN_INTRO</td><td>1033</td><td>Select the database server to install to from the list below or click Browse to see a list of all database servers. You can also specify the way to authenticate your login using your current credentials or a SQL Login ID and Password.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLLOGIN_PSWD</td><td>1033</td><td>&amp;Password:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLLOGIN_SERVER</td><td>1033</td><td>&amp;Database Server:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLLOGIN_SERVER2</td><td>1033</td><td>&amp;Database server that you are installing to:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLLOGIN_SQL</td><td>1033</td><td>S&amp;erver authentication using the Login ID and password below</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLLOGIN_TITLE</td><td>1033</td><td>{&amp;MSSansBold8}Database Server</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLLOGIN_WIN</td><td>1033</td><td>&amp;Windows authentication credentials of current user</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLSCRIPT_INSTALLING</td><td>1033</td><td>Executing SQL Install Script...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SQLSCRIPT_UNINSTALLING</td><td>1033</td><td>Executing SQL Uninstall Script...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_STANDARD_USE_SETUPEXE</td><td>1033</td><td>This installation cannot be run by directly launching the MSI package. You must run setup.exe.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SetupTips_Advertise</td><td>1033</td><td>Will be installed on first use. (Available only if the feature supports this option.)</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SetupTips_AllInstalledLocal</td><td>1033</td><td>Will be completely installed to the local hard drive.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SetupTips_CustomSetup</td><td>1033</td><td>{&amp;MSSansBold8}Custom Setup Tips</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SetupTips_CustomSetupDescription</td><td>1033</td><td>Custom Setup allows you to selectively install program features.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SetupTips_IconInstallState</td><td>1033</td><td>The icon next to the feature name indicates the install state of the feature. Click the icon to drop down the install state menu for each feature.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SetupTips_InstallState</td><td>1033</td><td>This install state means the feature...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SetupTips_Network</td><td>1033</td><td>Will be installed to run from the network. (Available only if the feature supports this option.)</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SetupTips_OK</td><td>1033</td><td>OK</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SetupTips_SubFeaturesInstalledLocal</td><td>1033</td><td>Will have some subfeatures installed to the local hard drive. (Available only if the feature has subfeatures.)</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_SetupTips_WillNotBeInstalled</td><td>1033</td><td>Will not be installed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_Available</td><td>1033</td><td>Available</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_Bytes</td><td>1033</td><td>bytes</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_CompilingFeaturesCost</td><td>1033</td><td>Compiling cost for this feature...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_Differences</td><td>1033</td><td>Differences</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_DiskSize</td><td>1033</td><td>Disk Size</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureCompletelyRemoved</td><td>1033</td><td>This feature will be completely removed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureContinueNetwork</td><td>1033</td><td>This feature will continue to be run from the network</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureFreeSpace</td><td>1033</td><td>This feature frees up [1] on your hard drive.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledCD</td><td>1033</td><td>This feature, and all subfeatures, will be installed to run from the CD.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledCD2</td><td>1033</td><td>This feature will be installed to run from CD.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledLocal</td><td>1033</td><td>This feature, and all subfeatures, will be installed on local hard drive.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledLocal2</td><td>1033</td><td>This feature will be installed on local hard drive.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledNetwork</td><td>1033</td><td>This feature, and all subfeatures, will be installed to run from the network.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledNetwork2</td><td>1033</td><td>This feature will be installed to run from network.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledRequired</td><td>1033</td><td>Will be installed when required.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledWhenRequired</td><td>1033</td><td>This feature will be set to be installed when required.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureInstalledWhenRequired2</td><td>1033</td><td>This feature will be installed when required.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureLocal</td><td>1033</td><td>This feature will be installed on the local hard drive.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureLocal2</td><td>1033</td><td>This feature will be installed on your local hard drive.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureNetwork</td><td>1033</td><td>This feature will be installed to run from the network.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureNetwork2</td><td>1033</td><td>This feature will be available to run from the network.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureNotAvailable</td><td>1033</td><td>This feature will not be available.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureOnCD</td><td>1033</td><td>This feature will be installed to run from CD.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureOnCD2</td><td>1033</td><td>This feature will be available to run from CD.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureRemainLocal</td><td>1033</td><td>This feature will remain on your local hard drive.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureRemoveNetwork</td><td>1033</td><td>This feature will be removed from your local hard drive, but will be still available to run from the network.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureRemovedCD</td><td>1033</td><td>This feature will be removed from your local hard drive but will still be available to run from CD.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureRemovedUnlessRequired</td><td>1033</td><td>This feature will be removed from your local hard drive but will be set to be installed when required.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureRequiredSpace</td><td>1033</td><td>This feature requires [1] on your hard drive.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureRunFromCD</td><td>1033</td><td>This feature will continue to be run from the CD</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureSpaceFree</td><td>1033</td><td>This feature frees up [1] on your hard drive. It has [2] of [3] subfeatures selected. The subfeatures free up [4] on your hard drive.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureSpaceFree2</td><td>1033</td><td>This feature frees up [1] on your hard drive. It has [2] of [3] subfeatures selected. The subfeatures require [4] on your hard drive.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureSpaceFree3</td><td>1033</td><td>This feature requires [1] on your hard drive. It has [2] of [3] subfeatures selected. The subfeatures free up [4] on your hard drive.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureSpaceFree4</td><td>1033</td><td>This feature requires [1] on your hard drive. It has [2] of [3] subfeatures selected. The subfeatures require [4] on your hard drive.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureUnavailable</td><td>1033</td><td>This feature will become unavailable.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureUninstallNoNetwork</td><td>1033</td><td>This feature will be uninstalled completely, and you won't be able to run it from the network.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureWasCD</td><td>1033</td><td>This feature was run from the CD but will be set to be installed when required.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureWasCDLocal</td><td>1033</td><td>This feature was run from the CD but will be installed on the local hard drive.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureWasOnNetworkInstalled</td><td>1033</td><td>This feature was run from the network but will be installed when required.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureWasOnNetworkLocal</td><td>1033</td><td>This feature was run from the network but will be installed on the local hard drive.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_FeatureWillBeUninstalled</td><td>1033</td><td>This feature will be uninstalled completely, and you won't be able to run it from CD.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_Folder</td><td>1033</td><td>Fldr|New Folder</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_GB</td><td>1033</td><td>GB</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_KB</td><td>1033</td><td>KB</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_MB</td><td>1033</td><td>MB</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_Required</td><td>1033</td><td>Required</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_TimeRemaining</td><td>1033</td><td>Time remaining: {[1] min }{[2] sec}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS_UITEXT_Volume</td><td>1033</td><td>Volume</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__AgreeToLicense_0</td><td>1033</td><td>I &amp;do not accept the terms in the license agreement</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__AgreeToLicense_1</td><td>1033</td><td>I &amp;accept the terms in the license agreement</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__DatabaseFolder_ChangeFolder</td><td>1033</td><td>Click Next to install to this folder, or click Change to install to a different folder.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__DatabaseFolder_DatabaseDir</td><td>1033</td><td>[DATABASEDIR]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__DatabaseFolder_DatabaseFolder</td><td>1033</td><td>{&amp;MSSansBold8}Database Folder</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__DestinationFolder_Change</td><td>1033</td><td>&amp;Change...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__DestinationFolder_ChangeFolder</td><td>1033</td><td>Click Next to install to this folder, or click Change to install to a different folder.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__DestinationFolder_DestinationFolder</td><td>1033</td><td>{&amp;MSSansBold8}Destination Folder</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__DestinationFolder_InstallTo</td><td>1033</td><td>Install [ProductName] to:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__DisplayName_Custom</td><td>1033</td><td>Custom</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__DisplayName_Minimal</td><td>1033</td><td>Minimal</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__DisplayName_Typical</td><td>1033</td><td>Typical</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallBrowse_11</td><td>1033</td><td/><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallBrowse_4</td><td>1033</td><td/><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallBrowse_8</td><td>1033</td><td/><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallBrowse_BrowseDestination</td><td>1033</td><td>Browse to the destination folder.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallBrowse_ChangeDestination</td><td>1033</td><td>{&amp;MSSansBold8}Change Current Destination Folder</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallBrowse_CreateFolder</td><td>1033</td><td>Create new folder|</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallBrowse_FolderName</td><td>1033</td><td>&amp;Folder name:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallBrowse_LookIn</td><td>1033</td><td>&amp;Look in:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallBrowse_UpOneLevel</td><td>1033</td><td>Up one level|</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallPointWelcome_ServerImage</td><td>1033</td><td>The InstallShield(R) Wizard will create a server image of [ProductName] at a specified network location. To continue, click Next.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallPointWelcome_Wizard</td><td>1033</td><td>{&amp;TahomaBold10}Welcome to the InstallShield Wizard for [ProductName]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallPoint_Change</td><td>1033</td><td>&amp;Change...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallPoint_EnterNetworkLocation</td><td>1033</td><td>Enter the network location or click Change to browse to a location.  Click Install to create a server image of [ProductName] at the specified network location or click Cancel to exit the wizard.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallPoint_Install</td><td>1033</td><td>&amp;Install</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallPoint_NetworkLocation</td><td>1033</td><td>&amp;Network location:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallPoint_NetworkLocationFormatted</td><td>1033</td><td>{&amp;MSSansBold8}Network Location</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsAdminInstallPoint_SpecifyNetworkLocation</td><td>1033</td><td>Specify a network location for the server image of the product.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsBrowseButton</td><td>1033</td><td>&amp;Browse...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsBrowseFolderDlg_11</td><td>1033</td><td/><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsBrowseFolderDlg_4</td><td>1033</td><td/><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsBrowseFolderDlg_8</td><td>1033</td><td/><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsBrowseFolderDlg_BrowseDestFolder</td><td>1033</td><td>Browse to the destination folder.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsBrowseFolderDlg_ChangeCurrentFolder</td><td>1033</td><td>{&amp;MSSansBold8}Change Current Destination Folder</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsBrowseFolderDlg_CreateFolder</td><td>1033</td><td>Create New Folder|</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsBrowseFolderDlg_FolderName</td><td>1033</td><td>&amp;Folder name:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsBrowseFolderDlg_LookIn</td><td>1033</td><td>&amp;Look in:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsBrowseFolderDlg_OK</td><td>1033</td><td>OK</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsBrowseFolderDlg_UpOneLevel</td><td>1033</td><td>Up One Level|</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsBrowseForAccount</td><td>1033</td><td>Browse for a User Account</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsBrowseGroup</td><td>1033</td><td>Select a Group</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsBrowseUsernameTitle</td><td>1033</td><td>Select a User Name</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCancelDlg_ConfirmCancel</td><td>1033</td><td>Are you sure you want to cancel [ProductName] installation?</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCancelDlg_No</td><td>1033</td><td>&amp;No</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCancelDlg_Yes</td><td>1033</td><td>&amp;Yes</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsConfirmPassword</td><td>1033</td><td>Con&amp;firm password:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCreateNewUserTitle</td><td>1033</td><td>New User Information</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCreateUserBrowse</td><td>1033</td><td>N&amp;ew User Information...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCustomSelectionDlg_Change</td><td>1033</td><td>&amp;Change...</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCustomSelectionDlg_ClickFeatureIcon</td><td>1033</td><td>Click on an icon in the list below to change how a feature is installed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCustomSelectionDlg_CustomSetup</td><td>1033</td><td>{&amp;MSSansBold8}Custom Setup</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCustomSelectionDlg_FeatureDescription</td><td>1033</td><td>Feature Description</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCustomSelectionDlg_FeaturePath</td><td>1033</td><td>&lt;selected feature path&gt;</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCustomSelectionDlg_FeatureSize</td><td>1033</td><td>Feature size</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCustomSelectionDlg_Help</td><td>1033</td><td>&amp;Help</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCustomSelectionDlg_InstallTo</td><td>1033</td><td>Install to:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCustomSelectionDlg_MultilineDescription</td><td>1033</td><td>Multiline description of the currently selected item</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCustomSelectionDlg_SelectFeatures</td><td>1033</td><td>Select the program features you want installed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsCustomSelectionDlg_Space</td><td>1033</td><td>&amp;Space</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsDiskSpaceDlg_DiskSpace</td><td>1033</td><td>Disk space required for the installation exceeds available disk space.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsDiskSpaceDlg_HighlightedVolumes</td><td>1033</td><td>The highlighted volumes do not have enough disk space available for the currently selected features. You can remove files from the highlighted volumes, choose to install fewer features onto local drives, or select different destination drives.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsDiskSpaceDlg_Numbers</td><td>1033</td><td>{120}{70}{70}{70}{70}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsDiskSpaceDlg_OK</td><td>1033</td><td>OK</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsDiskSpaceDlg_OutOfDiskSpace</td><td>1033</td><td>{&amp;MSSansBold8}Out of Disk Space</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsDomainOrServer</td><td>1033</td><td>&amp;Domain or server:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsErrorDlg_Abort</td><td>1033</td><td>&amp;Abort</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsErrorDlg_ErrorText</td><td>1033</td><td>&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;&lt;error text goes here&gt;</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsErrorDlg_Ignore</td><td>1033</td><td>&amp;Ignore</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsErrorDlg_InstallerInfo</td><td>1033</td><td>[ProductName] Installer Information</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsErrorDlg_NO</td><td>1033</td><td>&amp;No</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsErrorDlg_OK</td><td>1033</td><td>&amp;OK</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsErrorDlg_Retry</td><td>1033</td><td>&amp;Retry</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsErrorDlg_Yes</td><td>1033</td><td>&amp;Yes</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsExitDialog_Finish</td><td>1033</td><td>&amp;Finish</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsExitDialog_InstallSuccess</td><td>1033</td><td>The InstallShield Wizard has successfully installed [ProductName]. Click Finish to exit the wizard.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsExitDialog_LaunchProgram</td><td>1033</td><td>Launch the program</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsExitDialog_ShowReadMe</td><td>1033</td><td>Show the readme file</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsExitDialog_UninstallSuccess</td><td>1033</td><td>The InstallShield Wizard has successfully uninstalled [ProductName]. Click Finish to exit the wizard.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsExitDialog_Update_InternetConnection</td><td>1033</td><td>Your Internet connection can be used to make sure that you have the latest updates.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsExitDialog_Update_PossibleUpdates</td><td>1033</td><td>Some program files might have been updated since you purchased your copy of [ProductName].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsExitDialog_Update_SetupFinished</td><td>1033</td><td>Setup has finished installing [ProductName].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsExitDialog_Update_YesCheckForUpdates</td><td>1033</td><td>&amp;Yes, check for program updates (Recommended) after the setup completes.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsExitDialog_WizardCompleted</td><td>1033</td><td>{&amp;TahomaBold10}InstallShield Wizard Completed</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFatalError_ClickFinish</td><td>1033</td><td>Click Finish to exit the wizard.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFatalError_Finish</td><td>1033</td><td>&amp;Finish</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFatalError_KeepOrRestore</td><td>1033</td><td>You can either keep any existing installed elements on your system to continue this installation at a later time or you can restore your system to its original state prior to the installation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFatalError_NotModified</td><td>1033</td><td>Your system has not been modified. To complete installation at another time, please run setup again.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFatalError_RestoreOrContinueLater</td><td>1033</td><td>Click Restore or Continue Later to exit the wizard.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFatalError_WizardCompleted</td><td>1033</td><td>{&amp;TahomaBold10}InstallShield Wizard Completed</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFatalError_WizardInterrupted</td><td>1033</td><td>The wizard was interrupted before [ProductName] could be completely installed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFeatureDetailsDlg_DiskSpaceRequirements</td><td>1033</td><td>{&amp;MSSansBold8}Disk Space Requirements</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFeatureDetailsDlg_Numbers</td><td>1033</td><td>{120}{70}{70}{70}{70}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFeatureDetailsDlg_OK</td><td>1033</td><td>OK</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFeatureDetailsDlg_SpaceRequired</td><td>1033</td><td>The disk space required for the installation of the selected features.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFeatureDetailsDlg_VolumesTooSmall</td><td>1033</td><td>The highlighted volumes do not have enough disk space available for the currently selected features. You can remove files from the highlighted volumes, choose to install fewer features onto local drives, or select different destination drives.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFilesInUse_ApplicationsUsingFiles</td><td>1033</td><td>The following applications are using files that need to be updated by this setup. Close these applications and click Retry to continue.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFilesInUse_Exit</td><td>1033</td><td>&amp;Exit</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFilesInUse_FilesInUse</td><td>1033</td><td>{&amp;MSSansBold8}Files in Use</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFilesInUse_FilesInUseMessage</td><td>1033</td><td>Some files that need to be updated are currently in use.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFilesInUse_Ignore</td><td>1033</td><td>&amp;Ignore</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsFilesInUse_Retry</td><td>1033</td><td>&amp;Retry</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsGroup</td><td>1033</td><td>&amp;Group:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsGroupLabel</td><td>1033</td><td>Gr&amp;oup:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsInitDlg_1</td><td>1033</td><td/><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsInitDlg_2</td><td>1033</td><td/><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsInitDlg_PreparingWizard</td><td>1033</td><td>[ProductName] Setup is preparing the InstallShield Wizard which will guide you through the program setup process.  Please wait.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsInitDlg_WelcomeWizard</td><td>1033</td><td>{&amp;TahomaBold10}Welcome to the InstallShield Wizard for [ProductName]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsLicenseDlg_LicenseAgreement</td><td>1033</td><td>{&amp;MSSansBold8}License Agreement</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsLicenseDlg_ReadLicenseAgreement</td><td>1033</td><td>Please read the following license agreement carefully.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsLogonInfoDescription</td><td>1033</td><td>Specify the user name and password of the user account that will logon to use this application. The user account must be in the form DOMAIN\Username.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsLogonInfoTitle</td><td>1033</td><td>{&amp;MSSansBold8}Logon Information</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsLogonInfoTitleDescription</td><td>1033</td><td>Specify a user name and password</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsLogonNewUserDescription</td><td>1033</td><td>Select the button below to specify information about a new user that will be created during the installation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsMaintenanceDlg_ChangeFeatures</td><td>1033</td><td>Change which program features are installed. This option displays the Custom Selection dialog in which you can change the way features are installed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsMaintenanceDlg_MaitenanceOptions</td><td>1033</td><td>Modify, repair, or remove the program.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsMaintenanceDlg_Modify</td><td>1033</td><td>{&amp;MSSansBold8}&amp;Modify</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsMaintenanceDlg_ProgramMaintenance</td><td>1033</td><td>{&amp;MSSansBold8}Program Maintenance</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsMaintenanceDlg_Remove</td><td>1033</td><td>{&amp;MSSansBold8}&amp;Remove</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsMaintenanceDlg_RemoveProductName</td><td>1033</td><td>Remove [ProductName] from your computer.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsMaintenanceDlg_Repair</td><td>1033</td><td>{&amp;MSSansBold8}Re&amp;pair</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsMaintenanceDlg_RepairMessage</td><td>1033</td><td>Repair installation errors in the program. This option fixes missing or corrupt files, shortcuts, and registry entries.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsMaintenanceWelcome_MaintenanceOptionsDescription</td><td>1033</td><td>The InstallShield(R) Wizard will allow you to modify, repair, or remove [ProductName]. To continue, click Next.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsMaintenanceWelcome_WizardWelcome</td><td>1033</td><td>{&amp;TahomaBold10}Welcome to the InstallShield Wizard for [ProductName]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsMsiRMFilesInUse_ApplicationsUsingFiles</td><td>1033</td><td>The following applications are using files that need to be updated by this setup.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsMsiRMFilesInUse_CloseRestart</td><td>1033</td><td>Automatically close and attempt to restart applications.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsMsiRMFilesInUse_RebootAfter</td><td>1033</td><td>Do not close applications. (A reboot will be required.)</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsPatchDlg_PatchClickUpdate</td><td>1033</td><td>The InstallShield(R) Wizard will install the Patch for [ProductName] on your computer.  To continue, click Update.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsPatchDlg_PatchWizard</td><td>1033</td><td>[ProductName] Patch - InstallShield Wizard</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsPatchDlg_Update</td><td>1033</td><td>&amp;Update &gt;</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsPatchDlg_WelcomePatchWizard</td><td>1033</td><td>{&amp;TahomaBold10}Welcome to the Patch for [ProductName]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsProgressDlg_2</td><td>1033</td><td/><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsProgressDlg_Hidden</td><td>1033</td><td>(Hidden for now)</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsProgressDlg_HiddenTimeRemaining</td><td>1033</td><td>)Hidden for now)Estimated time remaining:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsProgressDlg_InstallingProductName</td><td>1033</td><td>{&amp;MSSansBold8}Installing [ProductName]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsProgressDlg_ProgressDone</td><td>1033</td><td>Progress done</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsProgressDlg_SecHidden</td><td>1033</td><td>(Hidden for now)Sec.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsProgressDlg_Status</td><td>1033</td><td>Status:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsProgressDlg_Uninstalling</td><td>1033</td><td>{&amp;MSSansBold8}Uninstalling [ProductName]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsProgressDlg_UninstallingFeatures</td><td>1033</td><td>The program features you selected are being uninstalled.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsProgressDlg_UninstallingFeatures2</td><td>1033</td><td>The program features you selected are being installed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsProgressDlg_WaitUninstall</td><td>1033</td><td>Please wait while the InstallShield Wizard uninstalls [ProductName]. This may take several minutes.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsProgressDlg_WaitUninstall2</td><td>1033</td><td>Please wait while the InstallShield Wizard installs [ProductName]. This may take several minutes.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsReadmeDlg_Cancel</td><td>1033</td><td>&amp;Cancel</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsReadmeDlg_PleaseReadInfo</td><td>1033</td><td>Please read the following readme information carefully.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsReadmeDlg_ReadMeInfo</td><td>1033</td><td>{&amp;MSSansBold8}Readme Information</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsRegisterUserDlg_16</td><td>1033</td><td/><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsRegisterUserDlg_Anyone</td><td>1033</td><td>&amp;Anyone who uses this computer (all users)</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsRegisterUserDlg_CustomerInformation</td><td>1033</td><td>{&amp;MSSansBold8}Customer Information</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsRegisterUserDlg_InstallFor</td><td>1033</td><td>Install this application for:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsRegisterUserDlg_OnlyMe</td><td>1033</td><td>Only for &amp;me ([USERNAME])</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsRegisterUserDlg_Organization</td><td>1033</td><td>&amp;Organization:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsRegisterUserDlg_PleaseEnterInfo</td><td>1033</td><td>Please enter your information.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsRegisterUserDlg_SerialNumber</td><td>1033</td><td>&amp;Serial Number:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsRegisterUserDlg_Tahoma50</td><td>1033</td><td>{\Tahoma8}{50}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsRegisterUserDlg_Tahoma80</td><td>1033</td><td>{\Tahoma8}{80}</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsRegisterUserDlg_UserName</td><td>1033</td><td>&amp;User Name:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsResumeDlg_ResumeSuspended</td><td>1033</td><td>The InstallShield(R) Wizard will complete the suspended installation of [ProductName] on your computer. To continue, click Next.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsResumeDlg_Resuming</td><td>1033</td><td>{&amp;TahomaBold10}Resuming the InstallShield Wizard for [ProductName]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsResumeDlg_WizardResume</td><td>1033</td><td>The InstallShield(R) Wizard will complete the installation of [ProductName] on your computer. To continue, click Next.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsSelectDomainOrServer</td><td>1033</td><td>Select a Domain or Server</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsSelectDomainUserInstructions</td><td>1033</td><td>Use the browse buttons to select a domain\server and a user name.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsSetupComplete_ShowMsiLog</td><td>1033</td><td>Show the Windows Installer log</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_13</td><td>1033</td><td/><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_AllFeatures</td><td>1033</td><td>All program features will be installed. (Requires the most disk space.)</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_ChooseFeatures</td><td>1033</td><td>Choose which program features you want installed and where they will be installed. Recommended for advanced users.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_ChooseSetupType</td><td>1033</td><td>Choose the setup type that best suits your needs.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_Complete</td><td>1033</td><td>{&amp;MSSansBold8}&amp;Complete</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_Custom</td><td>1033</td><td>{&amp;MSSansBold8}Cu&amp;stom</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_Minimal</td><td>1033</td><td>{&amp;MSSansBold8}&amp;Minimal</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_MinimumFeatures</td><td>1033</td><td>Minimum required features will be installed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_SelectSetupType</td><td>1033</td><td>Please select a setup type.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_SetupType</td><td>1033</td><td>{&amp;MSSansBold8}Setup Type</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsSetupTypeMinDlg_Typical</td><td>1033</td><td>{&amp;MSSansBold8}&amp;Typical</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsUserExit_ClickFinish</td><td>1033</td><td>Click Finish to exit the wizard.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsUserExit_Finish</td><td>1033</td><td>&amp;Finish</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsUserExit_KeepOrRestore</td><td>1033</td><td>You can either keep any existing installed elements on your system to continue this installation at a later time or you can restore your system to its original state prior to the installation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsUserExit_NotModified</td><td>1033</td><td>Your system has not been modified. To install this program at a later time, please run the installation again.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsUserExit_RestoreOrContinue</td><td>1033</td><td>Click Restore or Continue Later to exit the wizard.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsUserExit_WizardCompleted</td><td>1033</td><td>{&amp;TahomaBold10}InstallShield Wizard Completed</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsUserExit_WizardInterrupted</td><td>1033</td><td>The wizard was interrupted before [ProductName] could be completely installed.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsUserNameLabel</td><td>1033</td><td>&amp;User name:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_BackOrCancel</td><td>1033</td><td>If you want to review or change any of your installation settings, click Back. Click Cancel to exit the wizard.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_ClickInstall</td><td>1033</td><td>Click Install to begin the installation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_Company</td><td>1033</td><td>Company: [COMPANYNAME]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_CurrentSettings</td><td>1033</td><td>Current Settings:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_DestFolder</td><td>1033</td><td>Destination Folder:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_Install</td><td>1033</td><td>&amp;Install</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_Installdir</td><td>1033</td><td>[INSTALLDIR]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_ModifyReady</td><td>1033</td><td>{&amp;MSSansBold8}Ready to Modify the Program</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_ReadyInstall</td><td>1033</td><td>{&amp;MSSansBold8}Ready to Install the Program</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_ReadyRepair</td><td>1033</td><td>{&amp;MSSansBold8}Ready to Repair the Program</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_SelectedSetupType</td><td>1033</td><td>[SelectedSetupType]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_Serial</td><td>1033</td><td>Serial: [ISX_SERIALNUM]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_SetupType</td><td>1033</td><td>Setup Type:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_UserInfo</td><td>1033</td><td>User Information:</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_UserName</td><td>1033</td><td>Name: [USERNAME]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyReadyDlg_WizardReady</td><td>1033</td><td>The wizard is ready to begin installation.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyRemoveAllDlg_ChoseRemoveProgram</td><td>1033</td><td>You have chosen to remove the program from your system.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyRemoveAllDlg_ClickBack</td><td>1033</td><td>If you want to review or change any settings, click Back.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyRemoveAllDlg_ClickRemove</td><td>1033</td><td>Click Remove to remove [ProductName] from your computer. After removal, this program will no longer be available for use.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyRemoveAllDlg_Remove</td><td>1033</td><td>&amp;Remove</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsVerifyRemoveAllDlg_RemoveProgram</td><td>1033</td><td>{&amp;MSSansBold8}Remove the Program</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsWelcomeDlg_InstallProductName</td><td>1033</td><td>The InstallShield(R) Wizard will install [ProductName] on your computer. To continue, click Next.</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__IsWelcomeDlg_WarningCopyright</td><td>1033</td><td/><td>0</td><td/><td>-794579855</td></row>
		<row><td>IDS__IsWelcomeDlg_WelcomeProductName</td><td>1033</td><td>{&amp;TahomaBold10}Welcome to the InstallShield Wizard for [ProductName]</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__TargetReq_DESC_COLOR</td><td>1033</td><td>The color settings of your system are not adequate for running [ProductName].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__TargetReq_DESC_OS</td><td>1033</td><td>The operating system is not adequate for running [ProductName].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__TargetReq_DESC_PROCESSOR</td><td>1033</td><td>The processor is not adequate for running [ProductName].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__TargetReq_DESC_RAM</td><td>1033</td><td>The amount of RAM is not adequate for running [ProductName].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>IDS__TargetReq_DESC_RESOLUTION</td><td>1033</td><td>The screen resolution is not adequate for running [ProductName].</td><td>0</td><td/><td>-928784722</td></row>
		<row><td>ID_STRING1</td><td>1033</td><td>http://www.jdash.net</td><td>0</td><td/><td>-928839440</td></row>
		<row><td>ID_STRING10</td><td>1033</td><td>support@jdash.net</td><td>0</td><td/><td>-928831248</td></row>
		<row><td>ID_STRING11</td><td>1033</td><td>JDASHM~1|JDash MVC</td><td>0</td><td/><td>-928835216</td></row>
		<row><td>ID_STRING2</td><td>1033</td><td>Kalitte Inc.</td><td>0</td><td/><td>-928829264</td></row>
		<row><td>ID_STRING3</td><td>1033</td><td>Contact: support@jdash.net</td><td>0</td><td/><td>-928790674</td></row>
		<row><td>ID_STRING4</td><td>1033</td><td>JDASH~1.NET|JDash.Net Technical Support</td><td>0</td><td/><td>-928804753</td></row>
		<row><td>ID_STRING5</td><td>1033</td><td>JDASH~1.NET|JDash.Net Official Web Site</td><td>0</td><td/><td>-928839537</td></row>
		<row><td>ID_STRING6</td><td>1033</td><td>JDASHD~1|JDash Developers Guide</td><td>0</td><td/><td>-928794481</td></row>
		<row><td>ID_STRING7</td><td>1033</td><td>Uninstall</td><td>0</td><td/><td>-928804689</td></row>
		<row><td>ID_STRING8</td><td>1033</td><td>JDASH~1.NET|JDash.Net Purchase</td><td>0</td><td/><td>-928841521</td></row>
		<row><td>ID_STRING9</td><td>1033</td><td>Kalitte Inc.</td><td>0</td><td/><td>-928836721</td></row>
		<row><td>IIDS_UITEXT_FeatureUninstalled</td><td>1033</td><td>This feature will remain uninstalled.</td><td>0</td><td/><td>-928784722</td></row>
	</table>

	<table name="ISSwidtagProperty">
		<col key="yes" def="s72">Name</col>
		<col def="s0">Value</col>
		<row><td>UniqueId</td><td>DE002101-756C-4F69-87A5-EB670D23707B</td></row>
	</table>

	<table name="ISTargetImage">
		<col key="yes" def="s13">UpgradedImage_</col>
		<col key="yes" def="s13">Name</col>
		<col def="s0">MsiPath</col>
		<col def="i2">Order</col>
		<col def="I4">Flags</col>
		<col def="i2">IgnoreMissingFiles</col>
	</table>

	<table name="ISUpgradeMsiItem">
		<col key="yes" def="s72">UpgradeItem</col>
		<col def="s0">ObjectSetupPath</col>
		<col def="S255">ISReleaseFlags</col>
		<col def="i2">ISAttributes</col>
	</table>

	<table name="ISUpgradedImage">
		<col key="yes" def="s13">Name</col>
		<col def="s0">MsiPath</col>
		<col def="s8">Family</col>
	</table>

	<table name="ISVirtualDirectory">
		<col key="yes" def="s72">Directory_</col>
		<col key="yes" def="s72">Name</col>
		<col def="s255">Value</col>
	</table>

	<table name="ISVirtualFile">
		<col key="yes" def="s72">File_</col>
		<col key="yes" def="s72">Name</col>
		<col def="s255">Value</col>
	</table>

	<table name="ISVirtualPackage">
		<col key="yes" def="s72">Name</col>
		<col def="s255">Value</col>
	</table>

	<table name="ISVirtualRegistry">
		<col key="yes" def="s72">Registry_</col>
		<col key="yes" def="s72">Name</col>
		<col def="s255">Value</col>
	</table>

	<table name="ISVirtualRelease">
		<col key="yes" def="s72">ISRelease_</col>
		<col key="yes" def="s72">ISProductConfiguration_</col>
		<col key="yes" def="s255">Name</col>
		<col def="s255">Value</col>
	</table>

	<table name="ISVirtualShortcut">
		<col key="yes" def="s72">Shortcut_</col>
		<col key="yes" def="s72">Name</col>
		<col def="s255">Value</col>
	</table>

	<table name="ISXmlElement">
		<col key="yes" def="s72">ISXmlElement</col>
		<col def="s72">ISXmlFile_</col>
		<col def="S72">ISXmlElement_Parent</col>
		<col def="L0">XPath</col>
		<col def="L0">Content</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="ISXmlElementAttrib">
		<col key="yes" def="s72">ISXmlElementAttrib</col>
		<col key="yes" def="s72">ISXmlElement_</col>
		<col def="L255">Name</col>
		<col def="L0">Value</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="ISXmlFile">
		<col key="yes" def="s72">ISXmlFile</col>
		<col def="l255">FileName</col>
		<col def="s72">Component_</col>
		<col def="s72">Directory</col>
		<col def="I4">ISAttributes</col>
		<col def="S0">SelectionNamespaces</col>
		<col def="S255">Encoding</col>
	</table>

	<table name="ISXmlLocator">
		<col key="yes" def="s72">Signature_</col>
		<col key="yes" def="S72">Parent</col>
		<col def="S255">Element</col>
		<col def="S255">Attribute</col>
		<col def="I2">ISAttributes</col>
	</table>

	<table name="Icon">
		<col key="yes" def="s72">Name</col>
		<col def="V0">Data</col>
		<col def="S255">ISBuildSourcePath</col>
		<col def="I2">ISIconIndex</col>
		<row><td>ARPPRODUCTICON.exe</td><td/><td>&lt;ISProductFolder&gt;\redist\Language Independent\OS Independent\setupicon.ico</td><td>0</td></row>
		<row><td>NewShortcut4_59973F1D35DB4E44B43D629E61B65220.exe</td><td/><td>C:\Program Files (x86)\InstallShield\2013LE\Redist\Language Independent\OS Independent\uninstall.ico</td><td>0</td></row>
	</table>

	<table name="IniFile">
		<col key="yes" def="s72">IniFile</col>
		<col def="l255">FileName</col>
		<col def="S72">DirProperty</col>
		<col def="l255">Section</col>
		<col def="l128">Key</col>
		<col def="s255">Value</col>
		<col def="i2">Action</col>
		<col def="s72">Component_</col>
	</table>

	<table name="IniLocator">
		<col key="yes" def="s72">Signature_</col>
		<col def="s255">FileName</col>
		<col def="s96">Section</col>
		<col def="s128">Key</col>
		<col def="I2">Field</col>
		<col def="I2">Type</col>
	</table>

	<table name="InstallExecuteSequence">
		<col key="yes" def="s72">Action</col>
		<col def="S255">Condition</col>
		<col def="I2">Sequence</col>
		<col def="S255">ISComments</col>
		<col def="I4">ISAttributes</col>
		<row><td>AllocateRegistrySpace</td><td>NOT Installed</td><td>1550</td><td>AllocateRegistrySpace</td><td/></row>
		<row><td>AppSearch</td><td/><td>400</td><td>AppSearch</td><td/></row>
		<row><td>BindImage</td><td/><td>4300</td><td>BindImage</td><td/></row>
		<row><td>CCPSearch</td><td>CCP_TEST</td><td>500</td><td>CCPSearch</td><td/></row>
		<row><td>CostFinalize</td><td/><td>1000</td><td>CostFinalize</td><td/></row>
		<row><td>CostInitialize</td><td/><td>800</td><td>CostInitialize</td><td/></row>
		<row><td>CreateFolders</td><td/><td>3700</td><td>CreateFolders</td><td/></row>
		<row><td>CreateShortcuts</td><td/><td>4500</td><td>CreateShortcuts</td><td/></row>
		<row><td>DeleteServices</td><td>VersionNT</td><td>2000</td><td>DeleteServices</td><td/></row>
		<row><td>DuplicateFiles</td><td/><td>4210</td><td>DuplicateFiles</td><td/></row>
		<row><td>FileCost</td><td/><td>900</td><td>FileCost</td><td/></row>
		<row><td>FindRelatedProducts</td><td>NOT ISSETUPDRIVEN</td><td>420</td><td>FindRelatedProducts</td><td/></row>
		<row><td>ISPreventDowngrade</td><td>ISFOUNDNEWERPRODUCTVERSION</td><td>450</td><td>ISPreventDowngrade</td><td/></row>
		<row><td>ISRunSetupTypeAddLocalEvent</td><td>Not Installed And Not ISRUNSETUPTYPEADDLOCALEVENT</td><td>1050</td><td>ISRunSetupTypeAddLocalEvent</td><td/></row>
		<row><td>ISSelfRegisterCosting</td><td/><td>2201</td><td/><td/></row>
		<row><td>ISSelfRegisterFiles</td><td/><td>5601</td><td/><td/></row>
		<row><td>ISSelfRegisterFinalize</td><td/><td>6601</td><td/><td/></row>
		<row><td>ISUnSelfRegisterFiles</td><td/><td>2202</td><td/><td/></row>
		<row><td>InstallFiles</td><td/><td>4000</td><td>InstallFiles</td><td/></row>
		<row><td>InstallFinalize</td><td/><td>6600</td><td>InstallFinalize</td><td/></row>
		<row><td>InstallInitialize</td><td/><td>1501</td><td>InstallInitialize</td><td/></row>
		<row><td>InstallODBC</td><td/><td>5400</td><td>InstallODBC</td><td/></row>
		<row><td>InstallServices</td><td>VersionNT</td><td>5800</td><td>InstallServices</td><td/></row>
		<row><td>InstallValidate</td><td/><td>1400</td><td>InstallValidate</td><td/></row>
		<row><td>IsolateComponents</td><td/><td>950</td><td>IsolateComponents</td><td/></row>
		<row><td>LaunchConditions</td><td>Not Installed</td><td>410</td><td>LaunchConditions</td><td/></row>
		<row><td>MigrateFeatureStates</td><td/><td>1010</td><td>MigrateFeatureStates</td><td/></row>
		<row><td>MoveFiles</td><td/><td>3800</td><td>MoveFiles</td><td/></row>
		<row><td>MsiConfigureServices</td><td>VersionMsi &gt;= "5.00"</td><td>5850</td><td>MSI5 MsiConfigureServices</td><td/></row>
		<row><td>MsiPublishAssemblies</td><td/><td>6250</td><td>MsiPublishAssemblies</td><td/></row>
		<row><td>MsiUnpublishAssemblies</td><td/><td>1750</td><td>MsiUnpublishAssemblies</td><td/></row>
		<row><td>PatchFiles</td><td/><td>4090</td><td>PatchFiles</td><td/></row>
		<row><td>ProcessComponents</td><td/><td>1600</td><td>ProcessComponents</td><td/></row>
		<row><td>PublishComponents</td><td/><td>6200</td><td>PublishComponents</td><td/></row>
		<row><td>PublishFeatures</td><td/><td>6300</td><td>PublishFeatures</td><td/></row>
		<row><td>PublishProduct</td><td/><td>6400</td><td>PublishProduct</td><td/></row>
		<row><td>RMCCPSearch</td><td>Not CCP_SUCCESS And CCP_TEST</td><td>600</td><td>RMCCPSearch</td><td/></row>
		<row><td>RegisterClassInfo</td><td/><td>4600</td><td>RegisterClassInfo</td><td/></row>
		<row><td>RegisterComPlus</td><td/><td>5700</td><td>RegisterComPlus</td><td/></row>
		<row><td>RegisterExtensionInfo</td><td/><td>4700</td><td>RegisterExtensionInfo</td><td/></row>
		<row><td>RegisterFonts</td><td/><td>5300</td><td>RegisterFonts</td><td/></row>
		<row><td>RegisterMIMEInfo</td><td/><td>4900</td><td>RegisterMIMEInfo</td><td/></row>
		<row><td>RegisterProduct</td><td/><td>6100</td><td>RegisterProduct</td><td/></row>
		<row><td>RegisterProgIdInfo</td><td/><td>4800</td><td>RegisterProgIdInfo</td><td/></row>
		<row><td>RegisterTypeLibraries</td><td/><td>5500</td><td>RegisterTypeLibraries</td><td/></row>
		<row><td>RegisterUser</td><td/><td>6000</td><td>RegisterUser</td><td/></row>
		<row><td>RemoveDuplicateFiles</td><td/><td>3400</td><td>RemoveDuplicateFiles</td><td/></row>
		<row><td>RemoveEnvironmentStrings</td><td/><td>3300</td><td>RemoveEnvironmentStrings</td><td/></row>
		<row><td>RemoveExistingProducts</td><td/><td>1410</td><td>RemoveExistingProducts</td><td/></row>
		<row><td>RemoveFiles</td><td/><td>3500</td><td>RemoveFiles</td><td/></row>
		<row><td>RemoveFolders</td><td/><td>3600</td><td>RemoveFolders</td><td/></row>
		<row><td>RemoveIniValues</td><td/><td>3100</td><td>RemoveIniValues</td><td/></row>
		<row><td>RemoveODBC</td><td/><td>2400</td><td>RemoveODBC</td><td/></row>
		<row><td>RemoveRegistryValues</td><td/><td>2600</td><td>RemoveRegistryValues</td><td/></row>
		<row><td>RemoveShortcuts</td><td/><td>3200</td><td>RemoveShortcuts</td><td/></row>
		<row><td>ResolveSource</td><td>Not Installed</td><td>850</td><td>ResolveSource</td><td/></row>
		<row><td>ScheduleReboot</td><td>ISSCHEDULEREBOOT</td><td>6410</td><td>ScheduleReboot</td><td/></row>
		<row><td>SelfRegModules</td><td/><td>5600</td><td>SelfRegModules</td><td/></row>
		<row><td>SelfUnregModules</td><td/><td>2200</td><td>SelfUnregModules</td><td/></row>
		<row><td>SetARPINSTALLLOCATION</td><td/><td>1100</td><td>SetARPINSTALLLOCATION</td><td/></row>
		<row><td>SetAllUsersProfileNT</td><td>VersionNT = 400</td><td>970</td><td/><td/></row>
		<row><td>SetODBCFolders</td><td/><td>1200</td><td>SetODBCFolders</td><td/></row>
		<row><td>StartServices</td><td>VersionNT</td><td>5900</td><td>StartServices</td><td/></row>
		<row><td>StopServices</td><td>VersionNT</td><td>1900</td><td>StopServices</td><td/></row>
		<row><td>UnpublishComponents</td><td/><td>1700</td><td>UnpublishComponents</td><td/></row>
		<row><td>UnpublishFeatures</td><td/><td>1800</td><td>UnpublishFeatures</td><td/></row>
		<row><td>UnregisterClassInfo</td><td/><td>2700</td><td>UnregisterClassInfo</td><td/></row>
		<row><td>UnregisterComPlus</td><td/><td>2100</td><td>UnregisterComPlus</td><td/></row>
		<row><td>UnregisterExtensionInfo</td><td/><td>2800</td><td>UnregisterExtensionInfo</td><td/></row>
		<row><td>UnregisterFonts</td><td/><td>2500</td><td>UnregisterFonts</td><td/></row>
		<row><td>UnregisterMIMEInfo</td><td/><td>3000</td><td>UnregisterMIMEInfo</td><td/></row>
		<row><td>UnregisterProgIdInfo</td><td/><td>2900</td><td>UnregisterProgIdInfo</td><td/></row>
		<row><td>UnregisterTypeLibraries</td><td/><td>2300</td><td>UnregisterTypeLibraries</td><td/></row>
		<row><td>ValidateProductID</td><td/><td>700</td><td>ValidateProductID</td><td/></row>
		<row><td>WriteEnvironmentStrings</td><td/><td>5200</td><td>WriteEnvironmentStrings</td><td/></row>
		<row><td>WriteIniValues</td><td/><td>5100</td><td>WriteIniValues</td><td/></row>
		<row><td>WriteRegistryValues</td><td/><td>5000</td><td>WriteRegistryValues</td><td/></row>
		<row><td>setAllUsersProfile2K</td><td>VersionNT &gt;= 500</td><td>980</td><td/><td/></row>
		<row><td>setUserProfileNT</td><td>VersionNT</td><td>960</td><td/><td/></row>
	</table>

	<table name="InstallShield">
		<col key="yes" def="s72">Property</col>
		<col def="S0">Value</col>
		<row><td>ActiveLanguage</td><td>1033</td></row>
		<row><td>Comments</td><td/></row>
		<row><td>CurrentMedia</td><td dt:dt="bin.base64" md5="de9f554a3bc05c12be9c31b998217995">
UwBpAG4AZwBsAGUASQBtAGEAZwBlAAEARQB4AHAAcgBlAHMAcwA=
			</td></row>
		<row><td>DefaultProductConfiguration</td><td>Express</td></row>
		<row><td>EnableSwidtag</td><td>1</td></row>
		<row><td>ISCompilerOption_CompileBeforeBuild</td><td>1</td></row>
		<row><td>ISCompilerOption_Debug</td><td>0</td></row>
		<row><td>ISCompilerOption_IncludePath</td><td/></row>
		<row><td>ISCompilerOption_LibraryPath</td><td/></row>
		<row><td>ISCompilerOption_MaxErrors</td><td>50</td></row>
		<row><td>ISCompilerOption_MaxWarnings</td><td>50</td></row>
		<row><td>ISCompilerOption_OutputPath</td><td>&lt;ISProjectDataFolder&gt;\Script Files</td></row>
		<row><td>ISCompilerOption_PreProcessor</td><td>_ISSCRIPT_NEW_STYLE_DLG_DEFS</td></row>
		<row><td>ISCompilerOption_WarningLevel</td><td>3</td></row>
		<row><td>ISCompilerOption_WarningsAsErrors</td><td>1</td></row>
		<row><td>ISTheme</td><td>InstallShield Blue.theme</td></row>
		<row><td>ISUSLock</td><td>{53E50EC8-30CB-44C5-B896-8EB404F27480}</td></row>
		<row><td>ISUSSignature</td><td>{BF9EFC6E-B53B-4087-99F0-3C9B873456B0}</td></row>
		<row><td>ISVisitedViews</td><td>viewAssistant,viewProject,viewRealSetupDesign,viewUpgradePaths,viewUpdateService,viewAppFiles,viewShortcuts,viewRegistry,viewUI,viewTextMessages,viewCustomActions,viewRelease,viewDesignPatches,viewSystemSearch,viewSupportFiles</td></row>
		<row><td>Limited</td><td>1</td></row>
		<row><td>LockPermissionMode</td><td>1</td></row>
		<row><td>MsiExecCmdLineOptions</td><td/></row>
		<row><td>MsiLogFile</td><td/></row>
		<row><td>OnUpgrade</td><td>0</td></row>
		<row><td>Owner</td><td/></row>
		<row><td>PatchFamily</td><td>MyPatchFamily1</td></row>
		<row><td>PatchSequence</td><td>1.0.0</td></row>
		<row><td>SaveAsSchema</td><td/></row>
		<row><td>SccEnabled</td><td>0</td></row>
		<row><td>SccPath</td><td/></row>
		<row><td>SchemaVersion</td><td>774</td></row>
		<row><td>Type</td><td>MSIE</td></row>
	</table>

	<table name="InstallUISequence">
		<col key="yes" def="s72">Action</col>
		<col def="S255">Condition</col>
		<col def="I2">Sequence</col>
		<col def="S255">ISComments</col>
		<col def="I4">ISAttributes</col>
		<row><td>AppSearch</td><td/><td>400</td><td>AppSearch</td><td/></row>
		<row><td>CCPSearch</td><td>CCP_TEST</td><td>500</td><td>CCPSearch</td><td/></row>
		<row><td>CostFinalize</td><td/><td>1000</td><td>CostFinalize</td><td/></row>
		<row><td>CostInitialize</td><td/><td>800</td><td>CostInitialize</td><td/></row>
		<row><td>ExecuteAction</td><td/><td>1300</td><td>ExecuteAction</td><td/></row>
		<row><td>FileCost</td><td/><td>900</td><td>FileCost</td><td/></row>
		<row><td>FindRelatedProducts</td><td/><td>430</td><td>FindRelatedProducts</td><td/></row>
		<row><td>ISPreventDowngrade</td><td>ISFOUNDNEWERPRODUCTVERSION</td><td>450</td><td>ISPreventDowngrade</td><td/></row>
		<row><td>InstallWelcome</td><td>Not Installed</td><td>1210</td><td>InstallWelcome</td><td/></row>
		<row><td>IsolateComponents</td><td/><td>950</td><td>IsolateComponents</td><td/></row>
		<row><td>LaunchConditions</td><td>Not Installed</td><td>410</td><td>LaunchConditions</td><td/></row>
		<row><td>MaintenanceWelcome</td><td>Installed And Not RESUME And Not Preselected And Not PATCH</td><td>1230</td><td>MaintenanceWelcome</td><td/></row>
		<row><td>MigrateFeatureStates</td><td/><td>1200</td><td>MigrateFeatureStates</td><td/></row>
		<row><td>PatchWelcome</td><td>Installed And PATCH And Not IS_MAJOR_UPGRADE</td><td>1205</td><td>Patch Panel</td><td/></row>
		<row><td>RMCCPSearch</td><td>Not CCP_SUCCESS And CCP_TEST</td><td>600</td><td>RMCCPSearch</td><td/></row>
		<row><td>ResolveSource</td><td>Not Installed</td><td>990</td><td>ResolveSource</td><td/></row>
		<row><td>SetAllUsersProfileNT</td><td>VersionNT = 400</td><td>970</td><td/><td/></row>
		<row><td>SetupCompleteError</td><td/><td>-3</td><td>SetupCompleteError</td><td/></row>
		<row><td>SetupCompleteSuccess</td><td/><td>-1</td><td>SetupCompleteSuccess</td><td/></row>
		<row><td>SetupInitialization</td><td/><td>420</td><td>SetupInitialization</td><td/></row>
		<row><td>SetupInterrupted</td><td/><td>-2</td><td>SetupInterrupted</td><td/></row>
		<row><td>SetupProgress</td><td/><td>1240</td><td>SetupProgress</td><td/></row>
		<row><td>SetupResume</td><td>Installed And (RESUME Or Preselected) And Not PATCH</td><td>1220</td><td>SetupResume</td><td/></row>
		<row><td>ValidateProductID</td><td/><td>700</td><td>ValidateProductID</td><td/></row>
		<row><td>setAllUsersProfile2K</td><td>VersionNT &gt;= 500</td><td>980</td><td/><td/></row>
		<row><td>setUserProfileNT</td><td>VersionNT</td><td>960</td><td/><td/></row>
	</table>

	<table name="IsolatedComponent">
		<col key="yes" def="s72">Component_Shared</col>
		<col key="yes" def="s72">Component_Application</col>
	</table>

	<table name="LaunchCondition">
		<col key="yes" def="s255">Condition</col>
		<col def="l255">Description</col>
	</table>

	<table name="ListBox">
		<col key="yes" def="s72">Property</col>
		<col key="yes" def="i2">Order</col>
		<col def="s64">Value</col>
		<col def="L64">Text</col>
	</table>

	<table name="ListView">
		<col key="yes" def="s72">Property</col>
		<col key="yes" def="i2">Order</col>
		<col def="s64">Value</col>
		<col def="L64">Text</col>
		<col def="S72">Binary_</col>
	</table>

	<table name="LockPermissions">
		<col key="yes" def="s72">LockObject</col>
		<col key="yes" def="s32">Table</col>
		<col key="yes" def="S255">Domain</col>
		<col key="yes" def="s255">User</col>
		<col def="I4">Permission</col>
	</table>

	<table name="MIME">
		<col key="yes" def="s64">ContentType</col>
		<col def="s255">Extension_</col>
		<col def="S38">CLSID</col>
	</table>

	<table name="Media">
		<col key="yes" def="i2">DiskId</col>
		<col def="i2">LastSequence</col>
		<col def="L64">DiskPrompt</col>
		<col def="S255">Cabinet</col>
		<col def="S32">VolumeLabel</col>
		<col def="S32">Source</col>
	</table>

	<table name="MoveFile">
		<col key="yes" def="s72">FileKey</col>
		<col def="s72">Component_</col>
		<col def="L255">SourceName</col>
		<col def="L255">DestName</col>
		<col def="S72">SourceFolder</col>
		<col def="s72">DestFolder</col>
		<col def="i2">Options</col>
	</table>

	<table name="MsiAssembly">
		<col key="yes" def="s72">Component_</col>
		<col def="s38">Feature_</col>
		<col def="S72">File_Manifest</col>
		<col def="S72">File_Application</col>
		<col def="I2">Attributes</col>
	</table>

	<table name="MsiAssemblyName">
		<col key="yes" def="s72">Component_</col>
		<col key="yes" def="s255">Name</col>
		<col def="s255">Value</col>
	</table>

	<table name="MsiDigitalCertificate">
		<col key="yes" def="s72">DigitalCertificate</col>
		<col def="v0">CertData</col>
	</table>

	<table name="MsiDigitalSignature">
		<col key="yes" def="s32">Table</col>
		<col key="yes" def="s72">SignObject</col>
		<col def="s72">DigitalCertificate_</col>
		<col def="V0">Hash</col>
	</table>

	<table name="MsiDriverPackages">
		<col key="yes" def="s72">Component</col>
		<col def="i4">Flags</col>
		<col def="I4">Sequence</col>
		<col def="S0">ReferenceComponents</col>
	</table>

	<table name="MsiEmbeddedChainer">
		<col key="yes" def="s72">MsiEmbeddedChainer</col>
		<col def="S255">Condition</col>
		<col def="S255">CommandLine</col>
		<col def="s72">Source</col>
		<col def="I4">Type</col>
	</table>

	<table name="MsiEmbeddedUI">
		<col key="yes" def="s72">MsiEmbeddedUI</col>
		<col def="s255">FileName</col>
		<col def="i2">Attributes</col>
		<col def="I4">MessageFilter</col>
		<col def="V0">Data</col>
		<col def="S255">ISBuildSourcePath</col>
	</table>

	<table name="MsiFileHash">
		<col key="yes" def="s72">File_</col>
		<col def="i2">Options</col>
		<col def="i4">HashPart1</col>
		<col def="i4">HashPart2</col>
		<col def="i4">HashPart3</col>
		<col def="i4">HashPart4</col>
	</table>

	<table name="MsiLockPermissionsEx">
		<col key="yes" def="s72">MsiLockPermissionsEx</col>
		<col def="s72">LockObject</col>
		<col def="s32">Table</col>
		<col def="s0">SDDLText</col>
		<col def="S255">Condition</col>
	</table>

	<table name="MsiPackageCertificate">
		<col key="yes" def="s72">PackageCertificate</col>
		<col def="s72">DigitalCertificate_</col>
	</table>

	<table name="MsiPatchCertificate">
		<col key="yes" def="s72">PatchCertificate</col>
		<col def="s72">DigitalCertificate_</col>
	</table>

	<table name="MsiPatchMetadata">
		<col key="yes" def="s72">PatchConfiguration_</col>
		<col key="yes" def="S72">Company</col>
		<col key="yes" def="s72">Property</col>
		<col def="S0">Value</col>
	</table>

	<table name="MsiPatchOldAssemblyFile">
		<col key="yes" def="s72">File_</col>
		<col key="yes" def="S72">Assembly_</col>
	</table>

	<table name="MsiPatchOldAssemblyName">
		<col key="yes" def="s72">Assembly</col>
		<col key="yes" def="s255">Name</col>
		<col def="S255">Value</col>
	</table>

	<table name="MsiPatchSequence">
		<col key="yes" def="s72">PatchConfiguration_</col>
		<col key="yes" def="s0">PatchFamily</col>
		<col key="yes" def="S0">Target</col>
		<col def="s0">Sequence</col>
		<col def="i2">Supersede</col>
	</table>

	<table name="MsiServiceConfig">
		<col key="yes" def="s72">MsiServiceConfig</col>
		<col def="s255">Name</col>
		<col def="i2">Event</col>
		<col def="i4">ConfigType</col>
		<col def="S0">Argument</col>
		<col def="s72">Component_</col>
	</table>

	<table name="MsiServiceConfigFailureActions">
		<col key="yes" def="s72">MsiServiceConfigFailureActions</col>
		<col def="s255">Name</col>
		<col def="i2">Event</col>
		<col def="I4">ResetPeriod</col>
		<col def="L255">RebootMessage</col>
		<col def="L255">Command</col>
		<col def="S0">Actions</col>
		<col def="S0">DelayActions</col>
		<col def="s72">Component_</col>
	</table>

	<table name="MsiShortcutProperty">
		<col key="yes" def="s72">MsiShortcutProperty</col>
		<col def="s72">Shortcut_</col>
		<col def="s0">PropertyKey</col>
		<col def="s0">PropVariantValue</col>
	</table>

	<table name="ODBCAttribute">
		<col key="yes" def="s72">Driver_</col>
		<col key="yes" def="s40">Attribute</col>
		<col def="S255">Value</col>
	</table>

	<table name="ODBCDataSource">
		<col key="yes" def="s72">DataSource</col>
		<col def="s72">Component_</col>
		<col def="s255">Description</col>
		<col def="s255">DriverDescription</col>
		<col def="i2">Registration</col>
	</table>

	<table name="ODBCDriver">
		<col key="yes" def="s72">Driver</col>
		<col def="s72">Component_</col>
		<col def="s255">Description</col>
		<col def="s72">File_</col>
		<col def="S72">File_Setup</col>
	</table>

	<table name="ODBCSourceAttribute">
		<col key="yes" def="s72">DataSource_</col>
		<col key="yes" def="s32">Attribute</col>
		<col def="S255">Value</col>
	</table>

	<table name="ODBCTranslator">
		<col key="yes" def="s72">Translator</col>
		<col def="s72">Component_</col>
		<col def="s255">Description</col>
		<col def="s72">File_</col>
		<col def="S72">File_Setup</col>
	</table>

	<table name="Patch">
		<col key="yes" def="s72">File_</col>
		<col key="yes" def="i2">Sequence</col>
		<col def="i4">PatchSize</col>
		<col def="i2">Attributes</col>
		<col def="V0">Header</col>
		<col def="S38">StreamRef_</col>
		<col def="S255">ISBuildSourcePath</col>
	</table>

	<table name="PatchPackage">
		<col key="yes" def="s38">PatchId</col>
		<col def="i2">Media_</col>
	</table>

	<table name="ProgId">
		<col key="yes" def="s255">ProgId</col>
		<col def="S255">ProgId_Parent</col>
		<col def="S38">Class_</col>
		<col def="L255">Description</col>
		<col def="S72">Icon_</col>
		<col def="I2">IconIndex</col>
		<col def="I4">ISAttributes</col>
	</table>

	<table name="Property">
		<col key="yes" def="s72">Property</col>
		<col def="L0">Value</col>
		<col def="S255">ISComments</col>
		<row><td>ALLUSERS</td><td>1</td><td/></row>
		<row><td>ARPCONTACT</td><td>##ID_STRING9##</td><td/></row>
		<row><td>ARPHELPLINK</td><td>##ID_STRING10##</td><td/></row>
		<row><td>ARPINSTALLLOCATION</td><td/><td/></row>
		<row><td>ARPPRODUCTICON</td><td>ARPPRODUCTICON.exe</td><td/></row>
		<row><td>ARPSIZE</td><td/><td/></row>
		<row><td>ARPURLINFOABOUT</td><td>##ID_STRING1##</td><td/></row>
		<row><td>AgreeToLicense</td><td>No</td><td/></row>
		<row><td>ApplicationUsers</td><td>AllUsers</td><td/></row>
		<row><td>DWUSINTERVAL</td><td>30</td><td/></row>
		<row><td>DWUSLINK</td><td>CEDBC048C9CBF7D819AC80DFC9AC978F8E1BB78F79BC60EFCE1CF738A92CA7D8AE8CB728CEAC</td><td/></row>
		<row><td>DefaultUIFont</td><td>ExpressDefault</td><td/></row>
		<row><td>DialogCaption</td><td>InstallShield for Windows Installer</td><td/></row>
		<row><td>DiskPrompt</td><td>[1]</td><td/></row>
		<row><td>DiskSerial</td><td>1234-5678</td><td/></row>
		<row><td>DisplayNameCustom</td><td>##IDS__DisplayName_Custom##</td><td/></row>
		<row><td>DisplayNameMinimal</td><td>##IDS__DisplayName_Minimal##</td><td/></row>
		<row><td>DisplayNameTypical</td><td>##IDS__DisplayName_Typical##</td><td/></row>
		<row><td>Display_IsBitmapDlg</td><td>1</td><td/></row>
		<row><td>ErrorDialog</td><td>SetupError</td><td/></row>
		<row><td>INSTALLLEVEL</td><td>200</td><td/></row>
		<row><td>ISCHECKFORPRODUCTUPDATES</td><td>1</td><td/></row>
		<row><td>ISENABLEDWUSFINISHDIALOG</td><td/><td/></row>
		<row><td>ISSHOWMSILOG</td><td/><td/></row>
		<row><td>ISVROOT_PORT_NO</td><td>0</td><td/></row>
		<row><td>IS_COMPLUS_PROGRESSTEXT_COST</td><td>##IDS_COMPLUS_PROGRESSTEXT_COST##</td><td/></row>
		<row><td>IS_COMPLUS_PROGRESSTEXT_INSTALL</td><td>##IDS_COMPLUS_PROGRESSTEXT_INSTALL##</td><td/></row>
		<row><td>IS_COMPLUS_PROGRESSTEXT_UNINSTALL</td><td>##IDS_COMPLUS_PROGRESSTEXT_UNINSTALL##</td><td/></row>
		<row><td>IS_PREVENT_DOWNGRADE_EXIT</td><td>##IDS_PREVENT_DOWNGRADE_EXIT##</td><td/></row>
		<row><td>IS_PROGMSG_TEXTFILECHANGS_REPLACE</td><td>##IDS_PROGMSG_TEXTFILECHANGS_REPLACE##</td><td/></row>
		<row><td>IS_PROGMSG_XML_COSTING</td><td>##IDS_PROGMSG_XML_COSTING##</td><td/></row>
		<row><td>IS_PROGMSG_XML_CREATE_FILE</td><td>##IDS_PROGMSG_XML_CREATE_FILE##</td><td/></row>
		<row><td>IS_PROGMSG_XML_FILES</td><td>##IDS_PROGMSG_XML_FILES##</td><td/></row>
		<row><td>IS_PROGMSG_XML_REMOVE_FILE</td><td>##IDS_PROGMSG_XML_REMOVE_FILE##</td><td/></row>
		<row><td>IS_PROGMSG_XML_ROLLBACK_FILES</td><td>##IDS_PROGMSG_XML_ROLLBACK_FILES##</td><td/></row>
		<row><td>IS_PROGMSG_XML_UPDATE_FILE</td><td>##IDS_PROGMSG_XML_UPDATE_FILE##</td><td/></row>
		<row><td>IS_SQLSERVER_AUTHENTICATION</td><td>0</td><td/></row>
		<row><td>IS_SQLSERVER_DATABASE</td><td/><td/></row>
		<row><td>IS_SQLSERVER_PASSWORD</td><td/><td/></row>
		<row><td>IS_SQLSERVER_SERVER</td><td/><td/></row>
		<row><td>IS_SQLSERVER_USERNAME</td><td>sa</td><td/></row>
		<row><td>InstallChoice</td><td>AR</td><td/></row>
		<row><td>LAUNCHPROGRAM</td><td>1</td><td/></row>
		<row><td>LAUNCHREADME</td><td>1</td><td/></row>
		<row><td>MSIFASTINSTALL</td><td>1</td><td/></row>
		<row><td>Manufacturer</td><td>##COMPANY_NAME##</td><td/></row>
		<row><td>PIDKEY</td><td/><td/></row>
		<row><td>PIDTemplate</td><td>12345&lt;###-%%%%%%%&gt;@@@@@</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEAPPPOOL</td><td>##IDS_PROGMSG_IIS_CREATEAPPPOOL##</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEAPPPOOLS</td><td>##IDS_PROGMSG_IIS_CREATEAPPPOOLS##</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEVROOT</td><td>##IDS_PROGMSG_IIS_CREATEVROOT##</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEVROOTS</td><td>##IDS_PROGMSG_IIS_CREATEVROOTS##</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEWEBSERVICEEXTENSION</td><td>##IDS_PROGMSG_IIS_CREATEWEBSERVICEEXTENSION##</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEWEBSERVICEEXTENSIONS</td><td>##IDS_PROGMSG_IIS_CREATEWEBSERVICEEXTENSIONS##</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEWEBSITE</td><td>##IDS_PROGMSG_IIS_CREATEWEBSITE##</td><td/></row>
		<row><td>PROGMSG_IIS_CREATEWEBSITES</td><td>##IDS_PROGMSG_IIS_CREATEWEBSITES##</td><td/></row>
		<row><td>PROGMSG_IIS_EXTRACT</td><td>##IDS_PROGMSG_IIS_EXTRACT##</td><td/></row>
		<row><td>PROGMSG_IIS_EXTRACTDONE</td><td>##IDS_PROGMSG_IIS_EXTRACTDONE##</td><td/></row>
		<row><td>PROGMSG_IIS_EXTRACTDONEz</td><td>##IDS_PROGMSG_IIS_EXTRACTDONE##</td><td/></row>
		<row><td>PROGMSG_IIS_EXTRACTzDONE</td><td>##IDS_PROGMSG_IIS_EXTRACTDONE##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVEAPPPOOL</td><td>##IDS_PROGMSG_IIS_REMOVEAPPPOOL##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVEAPPPOOLS</td><td>##IDS_PROGMSG_IIS_REMOVEAPPPOOLS##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVESITE</td><td>##IDS_PROGMSG_IIS_REMOVESITE##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVEVROOT</td><td>##IDS_PROGMSG_IIS_REMOVEVROOT##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVEVROOTS</td><td>##IDS_PROGMSG_IIS_REMOVEVROOTS##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVEWEBSERVICEEXTENSION</td><td>##IDS_PROGMSG_IIS_REMOVEWEBSERVICEEXTENSION##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVEWEBSERVICEEXTENSIONS</td><td>##IDS_PROGMSG_IIS_REMOVEWEBSERVICEEXTENSIONS##</td><td/></row>
		<row><td>PROGMSG_IIS_REMOVEWEBSITES</td><td>##IDS_PROGMSG_IIS_REMOVEWEBSITES##</td><td/></row>
		<row><td>PROGMSG_IIS_ROLLBACKAPPPOOLS</td><td>##IDS_PROGMSG_IIS_ROLLBACKAPPPOOLS##</td><td/></row>
		<row><td>PROGMSG_IIS_ROLLBACKVROOTS</td><td>##IDS_PROGMSG_IIS_ROLLBACKVROOTS##</td><td/></row>
		<row><td>PROGMSG_IIS_ROLLBACKWEBSERVICEEXTENSIONS</td><td>##IDS_PROGMSG_IIS_ROLLBACKWEBSERVICEEXTENSIONS##</td><td/></row>
		<row><td>ProductCode</td><td>{8569EBA3-99BA-407A-BC39-0219B9AB6852}</td><td/></row>
		<row><td>ProductName</td><td>Jdash Asp.Net Mvc</td><td/></row>
		<row><td>ProductVersion</td><td>1.1.00</td><td/></row>
		<row><td>ProgressType0</td><td>install</td><td/></row>
		<row><td>ProgressType1</td><td>Installing</td><td/></row>
		<row><td>ProgressType2</td><td>installed</td><td/></row>
		<row><td>ProgressType3</td><td>installs</td><td/></row>
		<row><td>RebootYesNo</td><td>Yes</td><td/></row>
		<row><td>ReinstallFileVersion</td><td>o</td><td/></row>
		<row><td>ReinstallModeText</td><td>omus</td><td/></row>
		<row><td>ReinstallRepair</td><td>r</td><td/></row>
		<row><td>RestartManagerOption</td><td>CloseRestart</td><td/></row>
		<row><td>SERIALNUMBER</td><td/><td/></row>
		<row><td>SERIALNUMVALSUCCESSRETVAL</td><td>1</td><td/></row>
		<row><td>SecureCustomProperties</td><td>ISFOUNDNEWERPRODUCTVERSION;USERNAME;COMPANYNAME;ISX_SERIALNUM;SUPPORTDIR</td><td/></row>
		<row><td>SelectedSetupType</td><td>##IDS__DisplayName_Typical##</td><td/></row>
		<row><td>SetupType</td><td>Typical</td><td/></row>
		<row><td>UpgradeCode</td><td>{8F12769E-6B51-4418-B737-526CAE216088}</td><td/></row>
		<row><td>_IsMaintenance</td><td>Change</td><td/></row>
		<row><td>_IsSetupTypeMin</td><td>Typical</td><td/></row>
	</table>

	<table name="PublishComponent">
		<col key="yes" def="s38">ComponentId</col>
		<col key="yes" def="s255">Qualifier</col>
		<col key="yes" def="s72">Component_</col>
		<col def="L0">AppData</col>
		<col def="s38">Feature_</col>
	</table>

	<table name="RadioButton">
		<col key="yes" def="s72">Property</col>
		<col key="yes" def="i2">Order</col>
		<col def="s64">Value</col>
		<col def="i2">X</col>
		<col def="i2">Y</col>
		<col def="i2">Width</col>
		<col def="i2">Height</col>
		<col def="L64">Text</col>
		<col def="L50">Help</col>
		<col def="I4">ISControlId</col>
		<row><td>AgreeToLicense</td><td>1</td><td>No</td><td>0</td><td>15</td><td>291</td><td>15</td><td>##IDS__AgreeToLicense_0##</td><td/><td/></row>
		<row><td>AgreeToLicense</td><td>2</td><td>Yes</td><td>0</td><td>0</td><td>291</td><td>15</td><td>##IDS__AgreeToLicense_1##</td><td/><td/></row>
		<row><td>ApplicationUsers</td><td>1</td><td>AllUsers</td><td>1</td><td>7</td><td>290</td><td>14</td><td>##IDS__IsRegisterUserDlg_Anyone##</td><td/><td/></row>
		<row><td>ApplicationUsers</td><td>2</td><td>OnlyCurrentUser</td><td>1</td><td>23</td><td>290</td><td>14</td><td>##IDS__IsRegisterUserDlg_OnlyMe##</td><td/><td/></row>
		<row><td>RestartManagerOption</td><td>1</td><td>CloseRestart</td><td>6</td><td>9</td><td>331</td><td>14</td><td>##IDS__IsMsiRMFilesInUse_CloseRestart##</td><td/><td/></row>
		<row><td>RestartManagerOption</td><td>2</td><td>Reboot</td><td>6</td><td>21</td><td>331</td><td>14</td><td>##IDS__IsMsiRMFilesInUse_RebootAfter##</td><td/><td/></row>
		<row><td>_IsMaintenance</td><td>1</td><td>Change</td><td>0</td><td>0</td><td>290</td><td>14</td><td>##IDS__IsMaintenanceDlg_Modify##</td><td/><td/></row>
		<row><td>_IsMaintenance</td><td>2</td><td>Reinstall</td><td>0</td><td>60</td><td>290</td><td>14</td><td>##IDS__IsMaintenanceDlg_Repair##</td><td/><td/></row>
		<row><td>_IsMaintenance</td><td>3</td><td>Remove</td><td>0</td><td>120</td><td>290</td><td>14</td><td>##IDS__IsMaintenanceDlg_Remove##</td><td/><td/></row>
		<row><td>_IsSetupTypeMin</td><td>1</td><td>Typical</td><td>1</td><td>6</td><td>264</td><td>14</td><td>##IDS__IsSetupTypeMinDlg_Typical##</td><td/><td/></row>
	</table>

	<table name="RegLocator">
		<col key="yes" def="s72">Signature_</col>
		<col def="i2">Root</col>
		<col def="s255">Key</col>
		<col def="S255">Name</col>
		<col def="I2">Type</col>
	</table>

	<table name="Registry">
		<col key="yes" def="s72">Registry</col>
		<col def="i2">Root</col>
		<col def="s255">Key</col>
		<col def="S255">Name</col>
		<col def="S0">Value</col>
		<col def="s72">Component_</col>
		<col def="I4">ISAttributes</col>
		<row><td>Registry1</td><td>1</td><td>Software\Kalitte\JDash</td><td>InstallPath</td><td>[INSTALLDIR]</td><td>ISX_DEFAULTCOMPONENT128</td><td>0</td></row>
	</table>

	<table name="RemoveFile">
		<col key="yes" def="s72">FileKey</col>
		<col def="s72">Component_</col>
		<col def="L255">FileName</col>
		<col def="s72">DirProperty</col>
		<col def="i2">InstallMode</col>
		<row><td>NewShortcut1</td><td>ISX_DEFAULTCOMPONENT7</td><td/><td>newfolder1</td><td>2</td></row>
		<row><td>NewShortcut2</td><td>ISX_DEFAULTCOMPONENT7</td><td/><td>newfolder1</td><td>2</td></row>
		<row><td>NewShortcut3</td><td>ISX_DEFAULTCOMPONENT7</td><td/><td>newfolder1</td><td>2</td></row>
		<row><td>NewShortcut4</td><td>ISX_DEFAULTCOMPONENT128</td><td/><td>newfolder1</td><td>2</td></row>
		<row><td>NewShortcut5</td><td>ISX_DEFAULTCOMPONENT7</td><td/><td>newfolder1</td><td>2</td></row>
	</table>

	<table name="RemoveIniFile">
		<col key="yes" def="s72">RemoveIniFile</col>
		<col def="l255">FileName</col>
		<col def="S72">DirProperty</col>
		<col def="l96">Section</col>
		<col def="l128">Key</col>
		<col def="L255">Value</col>
		<col def="i2">Action</col>
		<col def="s72">Component_</col>
	</table>

	<table name="RemoveRegistry">
		<col key="yes" def="s72">RemoveRegistry</col>
		<col def="i2">Root</col>
		<col def="l255">Key</col>
		<col def="L255">Name</col>
		<col def="s72">Component_</col>
	</table>

	<table name="ReserveCost">
		<col key="yes" def="s72">ReserveKey</col>
		<col def="s72">Component_</col>
		<col def="S72">ReserveFolder</col>
		<col def="i4">ReserveLocal</col>
		<col def="i4">ReserveSource</col>
	</table>

	<table name="SFPCatalog">
		<col key="yes" def="s255">SFPCatalog</col>
		<col def="V0">Catalog</col>
		<col def="S0">Dependency</col>
	</table>

	<table name="SelfReg">
		<col key="yes" def="s72">File_</col>
		<col def="I2">Cost</col>
	</table>

	<table name="ServiceControl">
		<col key="yes" def="s72">ServiceControl</col>
		<col def="s255">Name</col>
		<col def="i2">Event</col>
		<col def="S255">Arguments</col>
		<col def="I2">Wait</col>
		<col def="s72">Component_</col>
	</table>

	<table name="ServiceInstall">
		<col key="yes" def="s72">ServiceInstall</col>
		<col def="s255">Name</col>
		<col def="L255">DisplayName</col>
		<col def="i4">ServiceType</col>
		<col def="i4">StartType</col>
		<col def="i4">ErrorControl</col>
		<col def="S255">LoadOrderGroup</col>
		<col def="S255">Dependencies</col>
		<col def="S255">StartName</col>
		<col def="S255">Password</col>
		<col def="S255">Arguments</col>
		<col def="s72">Component_</col>
		<col def="L255">Description</col>
	</table>

	<table name="Shortcut">
		<col key="yes" def="s72">Shortcut</col>
		<col def="s72">Directory_</col>
		<col def="l128">Name</col>
		<col def="s72">Component_</col>
		<col def="s255">Target</col>
		<col def="S255">Arguments</col>
		<col def="L255">Description</col>
		<col def="I2">Hotkey</col>
		<col def="S72">Icon_</col>
		<col def="I2">IconIndex</col>
		<col def="I2">ShowCmd</col>
		<col def="S72">WkDir</col>
		<col def="S255">DisplayResourceDLL</col>
		<col def="I2">DisplayResourceId</col>
		<col def="S255">DescriptionResourceDLL</col>
		<col def="I2">DescriptionResourceId</col>
		<col def="S255">ISComments</col>
		<col def="S255">ISShortcutName</col>
		<col def="I4">ISAttributes</col>
		<row><td>NewShortcut1</td><td>newfolder1</td><td>##ID_STRING4##</td><td>ISX_DEFAULTCOMPONENT7</td><td>[INSTALLDIR]Documentation\JDash.Net Technical Support.url</td><td/><td/><td/><td/><td/><td>1</td><td/><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>NewShortcut2</td><td>newfolder1</td><td>##ID_STRING5##</td><td>ISX_DEFAULTCOMPONENT7</td><td>[INSTALLDIR]Documentation\JDash.Net Official Web Site.url</td><td/><td/><td/><td/><td/><td>1</td><td/><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>NewShortcut3</td><td>newfolder1</td><td>##ID_STRING6##</td><td>ISX_DEFAULTCOMPONENT7</td><td>[INSTALLDIR]Documentation\JDashNetMvcDevelopersGuide.pdf</td><td/><td/><td/><td/><td/><td>1</td><td/><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>NewShortcut4</td><td>newfolder1</td><td>##ID_STRING7##</td><td>ISX_DEFAULTCOMPONENT128</td><td>[SystemFolder]MsiExec.exe</td><td>/x [ProductCode]</td><td/><td/><td>NewShortcut4_59973F1D35DB4E44B43D629E61B65220.exe</td><td>0</td><td>1</td><td/><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>NewShortcut5</td><td>newfolder1</td><td>##ID_STRING8##</td><td>ISX_DEFAULTCOMPONENT7</td><td>[INSTALLDIR]Documentation\JDash.Net Purchase.url</td><td/><td/><td/><td/><td/><td>1</td><td/><td/><td/><td/><td/><td/><td/><td/></row>
	</table>

	<table name="Signature">
		<col key="yes" def="s72">Signature</col>
		<col def="s255">FileName</col>
		<col def="S20">MinVersion</col>
		<col def="S20">MaxVersion</col>
		<col def="I4">MinSize</col>
		<col def="I4">MaxSize</col>
		<col def="I4">MinDate</col>
		<col def="I4">MaxDate</col>
		<col def="S255">Languages</col>
	</table>

	<table name="TextStyle">
		<col key="yes" def="s72">TextStyle</col>
		<col def="s32">FaceName</col>
		<col def="i2">Size</col>
		<col def="I4">Color</col>
		<col def="I2">StyleBits</col>
		<row><td>Arial8</td><td>Arial</td><td>8</td><td/><td/></row>
		<row><td>Arial9</td><td>Arial</td><td>9</td><td/><td/></row>
		<row><td>ArialBlue10</td><td>Arial</td><td>10</td><td>16711680</td><td/></row>
		<row><td>ArialBlueStrike10</td><td>Arial</td><td>10</td><td>16711680</td><td>8</td></row>
		<row><td>CourierNew8</td><td>Courier New</td><td>8</td><td/><td/></row>
		<row><td>CourierNew9</td><td>Courier New</td><td>9</td><td/><td/></row>
		<row><td>ExpressDefault</td><td>Tahoma</td><td>8</td><td/><td/></row>
		<row><td>MSGothic9</td><td>MS Gothic</td><td>9</td><td/><td/></row>
		<row><td>MSSGreySerif8</td><td>MS Sans Serif</td><td>8</td><td>8421504</td><td/></row>
		<row><td>MSSWhiteSerif8</td><td>Tahoma</td><td>8</td><td>16777215</td><td/></row>
		<row><td>MSSansBold8</td><td>Tahoma</td><td>8</td><td/><td>1</td></row>
		<row><td>MSSansSerif8</td><td>MS Sans Serif</td><td>8</td><td/><td/></row>
		<row><td>MSSansSerif9</td><td>MS Sans Serif</td><td>9</td><td/><td/></row>
		<row><td>Tahoma10</td><td>Tahoma</td><td>10</td><td/><td/></row>
		<row><td>Tahoma8</td><td>Tahoma</td><td>8</td><td/><td/></row>
		<row><td>Tahoma9</td><td>Tahoma</td><td>9</td><td/><td/></row>
		<row><td>TahomaBold10</td><td>Tahoma</td><td>10</td><td/><td>1</td></row>
		<row><td>TahomaBold8</td><td>Tahoma</td><td>8</td><td/><td>1</td></row>
		<row><td>Times8</td><td>Times New Roman</td><td>8</td><td/><td/></row>
		<row><td>Times9</td><td>Times New Roman</td><td>9</td><td/><td/></row>
		<row><td>TimesItalic12</td><td>Times New Roman</td><td>12</td><td/><td>2</td></row>
		<row><td>TimesItalicBlue10</td><td>Times New Roman</td><td>10</td><td>16711680</td><td>2</td></row>
		<row><td>TimesRed16</td><td>Times New Roman</td><td>16</td><td>255</td><td/></row>
		<row><td>VerdanaBold14</td><td>Verdana</td><td>13</td><td/><td>1</td></row>
	</table>

	<table name="TypeLib">
		<col key="yes" def="s38">LibID</col>
		<col key="yes" def="i2">Language</col>
		<col key="yes" def="s72">Component_</col>
		<col def="I4">Version</col>
		<col def="L128">Description</col>
		<col def="S72">Directory_</col>
		<col def="s38">Feature_</col>
		<col def="I4">Cost</col>
	</table>

	<table name="UIText">
		<col key="yes" def="s72">Key</col>
		<col def="L255">Text</col>
		<row><td>AbsentPath</td><td/></row>
		<row><td>GB</td><td>##IDS_UITEXT_GB##</td></row>
		<row><td>KB</td><td>##IDS_UITEXT_KB##</td></row>
		<row><td>MB</td><td>##IDS_UITEXT_MB##</td></row>
		<row><td>MenuAbsent</td><td>##IDS_UITEXT_FeatureNotAvailable##</td></row>
		<row><td>MenuAdvertise</td><td>##IDS_UITEXT_FeatureInstalledWhenRequired2##</td></row>
		<row><td>MenuAllCD</td><td>##IDS_UITEXT_FeatureInstalledCD##</td></row>
		<row><td>MenuAllLocal</td><td>##IDS_UITEXT_FeatureInstalledLocal##</td></row>
		<row><td>MenuAllNetwork</td><td>##IDS_UITEXT_FeatureInstalledNetwork##</td></row>
		<row><td>MenuCD</td><td>##IDS_UITEXT_FeatureInstalledCD2##</td></row>
		<row><td>MenuLocal</td><td>##IDS_UITEXT_FeatureInstalledLocal2##</td></row>
		<row><td>MenuNetwork</td><td>##IDS_UITEXT_FeatureInstalledNetwork2##</td></row>
		<row><td>NewFolder</td><td>##IDS_UITEXT_Folder##</td></row>
		<row><td>SelAbsentAbsent</td><td>##IDS_UITEXT_GB##</td></row>
		<row><td>SelAbsentAdvertise</td><td>##IDS_UITEXT_FeatureInstalledWhenRequired##</td></row>
		<row><td>SelAbsentCD</td><td>##IDS_UITEXT_FeatureOnCD##</td></row>
		<row><td>SelAbsentLocal</td><td>##IDS_UITEXT_FeatureLocal##</td></row>
		<row><td>SelAbsentNetwork</td><td>##IDS_UITEXT_FeatureNetwork##</td></row>
		<row><td>SelAdvertiseAbsent</td><td>##IDS_UITEXT_FeatureUnavailable##</td></row>
		<row><td>SelAdvertiseAdvertise</td><td>##IDS_UITEXT_FeatureInstalledRequired##</td></row>
		<row><td>SelAdvertiseCD</td><td>##IDS_UITEXT_FeatureOnCD2##</td></row>
		<row><td>SelAdvertiseLocal</td><td>##IDS_UITEXT_FeatureLocal2##</td></row>
		<row><td>SelAdvertiseNetwork</td><td>##IDS_UITEXT_FeatureNetwork2##</td></row>
		<row><td>SelCDAbsent</td><td>##IDS_UITEXT_FeatureWillBeUninstalled##</td></row>
		<row><td>SelCDAdvertise</td><td>##IDS_UITEXT_FeatureWasCD##</td></row>
		<row><td>SelCDCD</td><td>##IDS_UITEXT_FeatureRunFromCD##</td></row>
		<row><td>SelCDLocal</td><td>##IDS_UITEXT_FeatureWasCDLocal##</td></row>
		<row><td>SelChildCostNeg</td><td>##IDS_UITEXT_FeatureFreeSpace##</td></row>
		<row><td>SelChildCostPos</td><td>##IDS_UITEXT_FeatureRequiredSpace##</td></row>
		<row><td>SelCostPending</td><td>##IDS_UITEXT_CompilingFeaturesCost##</td></row>
		<row><td>SelLocalAbsent</td><td>##IDS_UITEXT_FeatureCompletelyRemoved##</td></row>
		<row><td>SelLocalAdvertise</td><td>##IDS_UITEXT_FeatureRemovedUnlessRequired##</td></row>
		<row><td>SelLocalCD</td><td>##IDS_UITEXT_FeatureRemovedCD##</td></row>
		<row><td>SelLocalLocal</td><td>##IDS_UITEXT_FeatureRemainLocal##</td></row>
		<row><td>SelLocalNetwork</td><td>##IDS_UITEXT_FeatureRemoveNetwork##</td></row>
		<row><td>SelNetworkAbsent</td><td>##IDS_UITEXT_FeatureUninstallNoNetwork##</td></row>
		<row><td>SelNetworkAdvertise</td><td>##IDS_UITEXT_FeatureWasOnNetworkInstalled##</td></row>
		<row><td>SelNetworkLocal</td><td>##IDS_UITEXT_FeatureWasOnNetworkLocal##</td></row>
		<row><td>SelNetworkNetwork</td><td>##IDS_UITEXT_FeatureContinueNetwork##</td></row>
		<row><td>SelParentCostNegNeg</td><td>##IDS_UITEXT_FeatureSpaceFree##</td></row>
		<row><td>SelParentCostNegPos</td><td>##IDS_UITEXT_FeatureSpaceFree2##</td></row>
		<row><td>SelParentCostPosNeg</td><td>##IDS_UITEXT_FeatureSpaceFree3##</td></row>
		<row><td>SelParentCostPosPos</td><td>##IDS_UITEXT_FeatureSpaceFree4##</td></row>
		<row><td>TimeRemaining</td><td>##IDS_UITEXT_TimeRemaining##</td></row>
		<row><td>VolumeCostAvailable</td><td>##IDS_UITEXT_Available##</td></row>
		<row><td>VolumeCostDifference</td><td>##IDS_UITEXT_Differences##</td></row>
		<row><td>VolumeCostRequired</td><td>##IDS_UITEXT_Required##</td></row>
		<row><td>VolumeCostSize</td><td>##IDS_UITEXT_DiskSize##</td></row>
		<row><td>VolumeCostVolume</td><td>##IDS_UITEXT_Volume##</td></row>
		<row><td>bytes</td><td>##IDS_UITEXT_Bytes##</td></row>
	</table>

	<table name="Upgrade">
		<col key="yes" def="s38">UpgradeCode</col>
		<col key="yes" def="S20">VersionMin</col>
		<col key="yes" def="S20">VersionMax</col>
		<col key="yes" def="S255">Language</col>
		<col key="yes" def="i4">Attributes</col>
		<col def="S255">Remove</col>
		<col def="s72">ActionProperty</col>
		<col def="S72">ISDisplayName</col>
		<row><td>{00000000-0000-0000-0000-000000000000}</td><td>***ALL_VERSIONS***</td><td></td><td></td><td>2</td><td/><td>ISFOUNDNEWERPRODUCTVERSION</td><td>ISPreventDowngrade</td></row>
	</table>

	<table name="Verb">
		<col key="yes" def="s255">Extension_</col>
		<col key="yes" def="s32">Verb</col>
		<col def="I2">Sequence</col>
		<col def="L255">Command</col>
		<col def="L255">Argument</col>
	</table>

	<table name="_Validation">
		<col key="yes" def="s32">Table</col>
		<col key="yes" def="s32">Column</col>
		<col def="s4">Nullable</col>
		<col def="I4">MinValue</col>
		<col def="I4">MaxValue</col>
		<col def="S255">KeyTable</col>
		<col def="I2">KeyColumn</col>
		<col def="S32">Category</col>
		<col def="S255">Set</col>
		<col def="S255">Description</col>
		<row><td>ActionText</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of action to be described.</td></row>
		<row><td>ActionText</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Localized description displayed in progress dialog and log when action is executing.</td></row>
		<row><td>ActionText</td><td>Template</td><td>Y</td><td/><td/><td/><td/><td>Template</td><td/><td>Optional localized format template used to format action data records for display during action execution.</td></row>
		<row><td>AdminExecuteSequence</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of action to invoke, either in the engine or the handler DLL.</td></row>
		<row><td>AdminExecuteSequence</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>Optional expression which skips the action if evaluates to expFalse.If the expression syntax is invalid, the engine will terminate, returning iesBadActionData.</td></row>
		<row><td>AdminExecuteSequence</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store MM Custom Action Types</td></row>
		<row><td>AdminExecuteSequence</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments on this Sequence.</td></row>
		<row><td>AdminExecuteSequence</td><td>Sequence</td><td>Y</td><td>-4</td><td>32767</td><td/><td/><td/><td/><td>Number that determines the sort order in which the actions are to be executed.  Leave blank to suppress action.</td></row>
		<row><td>AdminUISequence</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of action to invoke, either in the engine or the handler DLL.</td></row>
		<row><td>AdminUISequence</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>Optional expression which skips the action if evaluates to expFalse.If the expression syntax is invalid, the engine will terminate, returning iesBadActionData.</td></row>
		<row><td>AdminUISequence</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store MM Custom Action Types</td></row>
		<row><td>AdminUISequence</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments on this Sequence.</td></row>
		<row><td>AdminUISequence</td><td>Sequence</td><td>Y</td><td>-4</td><td>32767</td><td/><td/><td/><td/><td>Number that determines the sort order in which the actions are to be executed.  Leave blank to suppress action.</td></row>
		<row><td>AdvtExecuteSequence</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of action to invoke, either in the engine or the handler DLL.</td></row>
		<row><td>AdvtExecuteSequence</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>Optional expression which skips the action if evaluates to expFalse.If the expression syntax is invalid, the engine will terminate, returning iesBadActionData.</td></row>
		<row><td>AdvtExecuteSequence</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store MM Custom Action Types</td></row>
		<row><td>AdvtExecuteSequence</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments on this Sequence.</td></row>
		<row><td>AdvtExecuteSequence</td><td>Sequence</td><td>Y</td><td>-4</td><td>32767</td><td/><td/><td/><td/><td>Number that determines the sort order in which the actions are to be executed.  Leave blank to suppress action.</td></row>
		<row><td>AdvtUISequence</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of action to invoke, either in the engine or the handler DLL.</td></row>
		<row><td>AdvtUISequence</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>Optional expression which skips the action if evaluates to expFalse.If the expression syntax is invalid, the engine will terminate, returning iesBadActionData.</td></row>
		<row><td>AdvtUISequence</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store MM Custom Action Types</td></row>
		<row><td>AdvtUISequence</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments on this Sequence.</td></row>
		<row><td>AdvtUISequence</td><td>Sequence</td><td>Y</td><td>-4</td><td>32767</td><td/><td/><td/><td/><td>Number that determines the sort order in which the actions are to be executed.  Leave blank to suppress action.</td></row>
		<row><td>AppId</td><td>ActivateAtStorage</td><td>Y</td><td>0</td><td>1</td><td/><td/><td/><td/><td/></row>
		<row><td>AppId</td><td>AppId</td><td>N</td><td/><td/><td/><td/><td>Guid</td><td/><td/></row>
		<row><td>AppId</td><td>DllSurrogate</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>AppId</td><td>LocalService</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>AppId</td><td>RemoteServerName</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td/></row>
		<row><td>AppId</td><td>RunAsInteractiveUser</td><td>Y</td><td>0</td><td>1</td><td/><td/><td/><td/><td/></row>
		<row><td>AppId</td><td>ServiceParameters</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>AppSearch</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The property associated with a Signature</td></row>
		<row><td>AppSearch</td><td>Signature_</td><td>N</td><td/><td/><td>ISXmlLocator;Signature</td><td>1</td><td>Identifier</td><td/><td>The Signature_ represents a unique file signature and is also the foreign key in the Signature,  RegLocator, IniLocator, CompLocator and the DrLocator tables.</td></row>
		<row><td>BBControl</td><td>Attributes</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>A 32-bit word that specifies the attribute flags to be applied to this control.</td></row>
		<row><td>BBControl</td><td>BBControl</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of the control. This name must be unique within a billboard, but can repeat on different billboard.</td></row>
		<row><td>BBControl</td><td>Billboard_</td><td>N</td><td/><td/><td>Billboard</td><td>1</td><td>Identifier</td><td/><td>External key to the Billboard table, name of the billboard.</td></row>
		<row><td>BBControl</td><td>Height</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Height of the bounding rectangle of the control.</td></row>
		<row><td>BBControl</td><td>Text</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>A string used to set the initial text contained within a control (if appropriate).</td></row>
		<row><td>BBControl</td><td>Type</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The type of the control.</td></row>
		<row><td>BBControl</td><td>Width</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Width of the bounding rectangle of the control.</td></row>
		<row><td>BBControl</td><td>X</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Horizontal coordinate of the upper left corner of the bounding rectangle of the control.</td></row>
		<row><td>BBControl</td><td>Y</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Vertical coordinate of the upper left corner of the bounding rectangle of the control.</td></row>
		<row><td>Billboard</td><td>Action</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The name of an action. The billboard is displayed during the progress messages received from this action.</td></row>
		<row><td>Billboard</td><td>Billboard</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of the billboard.</td></row>
		<row><td>Billboard</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>An external key to the Feature Table. The billboard is shown only if this feature is being installed.</td></row>
		<row><td>Billboard</td><td>Ordering</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>A positive integer. If there is more than one billboard corresponding to an action they will be shown in the order defined by this column.</td></row>
		<row><td>Binary</td><td>Data</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>Binary stream. The binary icon data in PE (.DLL or .EXE) or icon (.ICO) format.</td></row>
		<row><td>Binary</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path to the ICO or EXE file.</td></row>
		<row><td>Binary</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Unique key identifying the binary data.</td></row>
		<row><td>BindImage</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>The index into the File table. This must be an executable file.</td></row>
		<row><td>BindImage</td><td>Path</td><td>Y</td><td/><td/><td/><td/><td>Paths</td><td/><td>A list of ;  delimited paths that represent the paths to be searched for the import DLLS. The list is usually a list of properties each enclosed within square brackets [] .</td></row>
		<row><td>CCPSearch</td><td>Signature_</td><td>N</td><td/><td/><td>Signature</td><td>1</td><td>Identifier</td><td/><td>The Signature_ represents a unique file signature and is also the foreign key in the Signature,  RegLocator, IniLocator, CompLocator and the DrLocator tables.</td></row>
		<row><td>CheckBox</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A named property to be tied to the item.</td></row>
		<row><td>CheckBox</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The value string associated with the item.</td></row>
		<row><td>Class</td><td>AppId_</td><td>Y</td><td/><td/><td>AppId</td><td>1</td><td>Guid</td><td/><td>Optional AppID containing DCOM information for associated application (string GUID).</td></row>
		<row><td>Class</td><td>Argument</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>optional argument for LocalServers.</td></row>
		<row><td>Class</td><td>Attributes</td><td>Y</td><td/><td>32767</td><td/><td/><td/><td/><td>Class registration attributes.</td></row>
		<row><td>Class</td><td>CLSID</td><td>N</td><td/><td/><td/><td/><td>Guid</td><td/><td>The CLSID of an OLE factory.</td></row>
		<row><td>Class</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Component Table, specifying the component for which to return a path when called through LocateComponent.</td></row>
		<row><td>Class</td><td>Context</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The numeric server context for this server. CLSCTX_xxxx</td></row>
		<row><td>Class</td><td>DefInprocHandler</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td>1;2;3</td><td>Optional default inproc handler.  Only optionally provided if Context=CLSCTX_LOCAL_SERVER.  Typically "ole32.dll" or "mapi32.dll"</td></row>
		<row><td>Class</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Localized description for the Class.</td></row>
		<row><td>Class</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Feature Table, specifying the feature to validate or install in order for the CLSID factory to be operational.</td></row>
		<row><td>Class</td><td>FileTypeMask</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Optional string containing information for the HKCRthis CLSID) key. If multiple patterns exist, they must be delimited by a semicolon, and numeric subkeys will be generated: 0,1,2...</td></row>
		<row><td>Class</td><td>IconIndex</td><td>Y</td><td>-32767</td><td>32767</td><td/><td/><td/><td/><td>Optional icon index.</td></row>
		<row><td>Class</td><td>Icon_</td><td>Y</td><td/><td/><td>Icon</td><td>1</td><td>Identifier</td><td/><td>Optional foreign key into the Icon Table, specifying the icon file associated with this CLSID. Will be written under the DefaultIcon key.</td></row>
		<row><td>Class</td><td>ProgId_Default</td><td>Y</td><td/><td/><td>ProgId</td><td>1</td><td>Text</td><td/><td>Optional ProgId associated with this CLSID.</td></row>
		<row><td>ComboBox</td><td>Order</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>A positive integer used to determine the ordering of the items within one list.	The integers do not have to be consecutive.</td></row>
		<row><td>ComboBox</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A named property to be tied to this item. All the items tied to the same property become part of the same combobox.</td></row>
		<row><td>ComboBox</td><td>Text</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The visible text to be assigned to the item. Optional. If this entry or the entire column is missing, the text is the same as the value.</td></row>
		<row><td>ComboBox</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The value string associated with this item. Selecting the line will set the associated property to this value.</td></row>
		<row><td>CompLocator</td><td>ComponentId</td><td>N</td><td/><td/><td/><td/><td>Guid</td><td/><td>A string GUID unique to this component, version, and language.</td></row>
		<row><td>CompLocator</td><td>Signature_</td><td>N</td><td/><td/><td>Signature</td><td>1</td><td>Identifier</td><td/><td>The table key. The Signature_ represents a unique file signature and is also the foreign key in the Signature table.</td></row>
		<row><td>CompLocator</td><td>Type</td><td>Y</td><td>0</td><td>1</td><td/><td/><td/><td/><td>A boolean value that determines if the registry value is a filename or a directory location.</td></row>
		<row><td>Complus</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing Component that controls the ComPlus component.</td></row>
		<row><td>Complus</td><td>ExpType</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>ComPlus component attributes.</td></row>
		<row><td>Component</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Remote execution option, one of irsEnum</td></row>
		<row><td>Component</td><td>Component</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular component record.</td></row>
		<row><td>Component</td><td>ComponentId</td><td>Y</td><td/><td/><td/><td/><td>Guid</td><td/><td>A string GUID unique to this component, version, and language.</td></row>
		<row><td>Component</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>A conditional statement that will disable this component if the specified condition evaluates to the 'True' state. If a component is disabled, it will not be installed, regardless of the 'Action' state associated with the component.</td></row>
		<row><td>Component</td><td>Directory_</td><td>N</td><td/><td/><td>Directory</td><td>1</td><td>Identifier</td><td/><td>Required key of a Directory table record. This is actually a property name whose value contains the actual path, set either by the AppSearch action or with the default setting obtained from the Directory table.</td></row>
		<row><td>Component</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store Installshield custom properties of a component.</td></row>
		<row><td>Component</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>User Comments.</td></row>
		<row><td>Component</td><td>ISDotNetInstallerArgsCommit</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Arguments passed to the key file of the component if if implements the .NET Installer class</td></row>
		<row><td>Component</td><td>ISDotNetInstallerArgsInstall</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Arguments passed to the key file of the component if if implements the .NET Installer class</td></row>
		<row><td>Component</td><td>ISDotNetInstallerArgsRollback</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Arguments passed to the key file of the component if if implements the .NET Installer class</td></row>
		<row><td>Component</td><td>ISDotNetInstallerArgsUninstall</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Arguments passed to the key file of the component if if implements the .NET Installer class</td></row>
		<row><td>Component</td><td>ISRegFileToMergeAtBuild</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Path and File name of a .REG file to merge into the component at build time.</td></row>
		<row><td>Component</td><td>ISScanAtBuildFile</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>File used by the Dot Net scanner to populate dependant assemblies' File_Application field.</td></row>
		<row><td>Component</td><td>KeyPath</td><td>Y</td><td/><td/><td>File;ODBCDataSource;Registry</td><td>1</td><td>Identifier</td><td/><td>Either the primary key into the File table, Registry table, or ODBCDataSource table. This extract path is stored when the component is installed, and is used to detect the presence of the component and to return the path to it.</td></row>
		<row><td>Condition</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>Expression evaluated to determine if Level in the Feature table is to change.</td></row>
		<row><td>Condition</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Reference to a Feature entry in Feature table.</td></row>
		<row><td>Condition</td><td>Level</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>New selection Level to set in Feature table if Condition evaluates to TRUE.</td></row>
		<row><td>Control</td><td>Attributes</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>A 32-bit word that specifies the attribute flags to be applied to this control.</td></row>
		<row><td>Control</td><td>Binary_</td><td>Y</td><td/><td/><td>Binary</td><td>1</td><td>Identifier</td><td/><td>External key to the Binary table.</td></row>
		<row><td>Control</td><td>Control</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of the control. This name must be unique within a dialog, but can repeat on different dialogs.</td></row>
		<row><td>Control</td><td>Control_Next</td><td>Y</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>The name of an other control on the same dialog. This link defines the tab order of the controls. The links have to form one or more cycles!</td></row>
		<row><td>Control</td><td>Dialog_</td><td>N</td><td/><td/><td>Dialog</td><td>1</td><td>Identifier</td><td/><td>External key to the Dialog table, name of the dialog.</td></row>
		<row><td>Control</td><td>Height</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Height of the bounding rectangle of the control.</td></row>
		<row><td>Control</td><td>Help</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The help strings used with the button. The text is optional.</td></row>
		<row><td>Control</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path to .rtf file for scrollable text control</td></row>
		<row><td>Control</td><td>ISControlId</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>A number used to represent the control ID of the Control, Used in Dialog export</td></row>
		<row><td>Control</td><td>ISWindowStyle</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>A 32-bit word that specifies non-MSI window styles to be applied to this control.</td></row>
		<row><td>Control</td><td>Property</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The name of a defined property to be linked to this control.</td></row>
		<row><td>Control</td><td>Text</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>A string used to set the initial text contained within a control (if appropriate).</td></row>
		<row><td>Control</td><td>Type</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The type of the control.</td></row>
		<row><td>Control</td><td>Width</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Width of the bounding rectangle of the control.</td></row>
		<row><td>Control</td><td>X</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Horizontal coordinate of the upper left corner of the bounding rectangle of the control.</td></row>
		<row><td>Control</td><td>Y</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Vertical coordinate of the upper left corner of the bounding rectangle of the control.</td></row>
		<row><td>ControlCondition</td><td>Action</td><td>N</td><td/><td/><td/><td/><td/><td>Default;Disable;Enable;Hide;Show</td><td>The desired action to be taken on the specified control.</td></row>
		<row><td>ControlCondition</td><td>Condition</td><td>N</td><td/><td/><td/><td/><td>Condition</td><td/><td>A standard conditional statement that specifies under which conditions the action should be triggered.</td></row>
		<row><td>ControlCondition</td><td>Control_</td><td>N</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>A foreign key to the Control table, name of the control.</td></row>
		<row><td>ControlCondition</td><td>Dialog_</td><td>N</td><td/><td/><td>Dialog</td><td>1</td><td>Identifier</td><td/><td>A foreign key to the Dialog table, name of the dialog.</td></row>
		<row><td>ControlEvent</td><td>Argument</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>A value to be used as a modifier when triggering a particular event.</td></row>
		<row><td>ControlEvent</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>A standard conditional statement that specifies under which conditions an event should be triggered.</td></row>
		<row><td>ControlEvent</td><td>Control_</td><td>N</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>A foreign key to the Control table, name of the control</td></row>
		<row><td>ControlEvent</td><td>Dialog_</td><td>N</td><td/><td/><td>Dialog</td><td>1</td><td>Identifier</td><td/><td>A foreign key to the Dialog table, name of the dialog.</td></row>
		<row><td>ControlEvent</td><td>Event</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>An identifier that specifies the type of the event that should take place when the user interacts with control specified by the first two entries.</td></row>
		<row><td>ControlEvent</td><td>Ordering</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>An integer used to order several events tied to the same control. Can be left blank.</td></row>
		<row><td>CreateFolder</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table.</td></row>
		<row><td>CreateFolder</td><td>Directory_</td><td>N</td><td/><td/><td>Directory</td><td>1</td><td>Identifier</td><td/><td>Primary key, could be foreign key into the Directory table.</td></row>
		<row><td>CustomAction</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, name of action, normally appears in sequence table unless private use.</td></row>
		<row><td>CustomAction</td><td>ExtendedType</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The numeric custom action type info flags.</td></row>
		<row><td>CustomAction</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments for this custom action.</td></row>
		<row><td>CustomAction</td><td>Source</td><td>Y</td><td/><td/><td/><td/><td>CustomSource</td><td/><td>The table reference of the source of the code.</td></row>
		<row><td>CustomAction</td><td>Target</td><td>Y</td><td/><td/><td>ISDLLWrapper;ISInstallScriptAction</td><td>1</td><td>Formatted</td><td/><td>Excecution parameter, depends on the type of custom action</td></row>
		<row><td>CustomAction</td><td>Type</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>The numeric custom action type, consisting of source location, code type, entry, option flags.</td></row>
		<row><td>Dialog</td><td>Attributes</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>A 32-bit word that specifies the attribute flags to be applied to this dialog.</td></row>
		<row><td>Dialog</td><td>Control_Cancel</td><td>Y</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>Defines the cancel control. Hitting escape or clicking on the close icon on the dialog is equivalent to pushing this button.</td></row>
		<row><td>Dialog</td><td>Control_Default</td><td>Y</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>Defines the default control. Hitting return is equivalent to pushing this button.</td></row>
		<row><td>Dialog</td><td>Control_First</td><td>N</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>Defines the control that has the focus when the dialog is created.</td></row>
		<row><td>Dialog</td><td>Dialog</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of the dialog.</td></row>
		<row><td>Dialog</td><td>HCentering</td><td>N</td><td>0</td><td>100</td><td/><td/><td/><td/><td>Horizontal position of the dialog on a 0-100 scale. 0 means left end, 100 means right end of the screen, 50 center.</td></row>
		<row><td>Dialog</td><td>Height</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Height of the bounding rectangle of the dialog.</td></row>
		<row><td>Dialog</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments for this dialog.</td></row>
		<row><td>Dialog</td><td>ISResourceId</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>A Number the Specifies the Dialog ID to be used in Dialog Export</td></row>
		<row><td>Dialog</td><td>ISWindowStyle</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>A 32-bit word that specifies non-MSI window styles to be applied to this control. This is only used in Script Based Setups.</td></row>
		<row><td>Dialog</td><td>TextStyle_</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign Key into TextStyle table, only used in Script Based Projects.</td></row>
		<row><td>Dialog</td><td>Title</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>A text string specifying the title to be displayed in the title bar of the dialog's window.</td></row>
		<row><td>Dialog</td><td>VCentering</td><td>N</td><td>0</td><td>100</td><td/><td/><td/><td/><td>Vertical position of the dialog on a 0-100 scale. 0 means top end, 100 means bottom end of the screen, 50 center.</td></row>
		<row><td>Dialog</td><td>Width</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Width of the bounding rectangle of the dialog.</td></row>
		<row><td>Directory</td><td>DefaultDir</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The default sub-path under parent's path.</td></row>
		<row><td>Directory</td><td>Directory</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Unique identifier for directory entry, primary key. If a property by this name is defined, it contains the full path to the directory.</td></row>
		<row><td>Directory</td><td>Directory_Parent</td><td>Y</td><td/><td/><td>Directory</td><td>1</td><td>Identifier</td><td/><td>Reference to the entry in this table specifying the default parent directory. A record parented to itself or with a Null parent represents a root of the install tree.</td></row>
		<row><td>Directory</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td>0;1;2;3;4;5;6;7</td><td>This is used to store Installshield custom properties of a directory.  Currently the only one is Shortcut.</td></row>
		<row><td>Directory</td><td>ISDescription</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Description of folder</td></row>
		<row><td>Directory</td><td>ISFolderName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>This is used in Pro projects because the pro identifier used in the tree wasn't necessarily unique.</td></row>
		<row><td>DrLocator</td><td>Depth</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The depth below the path to which the Signature_ is recursively searched. If absent, the depth is assumed to be 0.</td></row>
		<row><td>DrLocator</td><td>Parent</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The parent file signature. It is also a foreign key in the Signature table. If null and the Path column does not expand to a full path, then all the fixed drives of the user system are searched using the Path.</td></row>
		<row><td>DrLocator</td><td>Path</td><td>Y</td><td/><td/><td/><td/><td>AnyPath</td><td/><td>The path on the user system. This is a either a subpath below the value of the Parent or a full path. The path may contain properties enclosed within [ ] that will be expanded.</td></row>
		<row><td>DrLocator</td><td>Signature_</td><td>N</td><td/><td/><td>Signature</td><td>1</td><td>Identifier</td><td/><td>The Signature_ represents a unique file signature and is also the foreign key in the Signature table.</td></row>
		<row><td>DuplicateFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing Component that controls the duplicate file.</td></row>
		<row><td>DuplicateFile</td><td>DestFolder</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of a property whose value is assumed to resolve to the full pathname to a destination folder.</td></row>
		<row><td>DuplicateFile</td><td>DestName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Filename to be given to the duplicate file.</td></row>
		<row><td>DuplicateFile</td><td>FileKey</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular file entry</td></row>
		<row><td>DuplicateFile</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing the source file to be duplicated.</td></row>
		<row><td>Environment</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table referencing component that controls the installing of the environmental value.</td></row>
		<row><td>Environment</td><td>Environment</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Unique identifier for the environmental variable setting</td></row>
		<row><td>Environment</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the environmental value.</td></row>
		<row><td>Environment</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The value to set in the environmental settings.</td></row>
		<row><td>Error</td><td>Error</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Integer error number, obtained from header file IError(...) macros.</td></row>
		<row><td>Error</td><td>Message</td><td>Y</td><td/><td/><td/><td/><td>Template</td><td/><td>Error formatting template, obtained from user ed. or localizers.</td></row>
		<row><td>EventMapping</td><td>Attribute</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The name of the control attribute, that is set when this event is received.</td></row>
		<row><td>EventMapping</td><td>Control_</td><td>N</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>A foreign key to the Control table, name of the control.</td></row>
		<row><td>EventMapping</td><td>Dialog_</td><td>N</td><td/><td/><td>Dialog</td><td>1</td><td>Identifier</td><td/><td>A foreign key to the Dialog table, name of the Dialog.</td></row>
		<row><td>EventMapping</td><td>Event</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>An identifier that specifies the type of the event that the control subscribes to.</td></row>
		<row><td>Extension</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Component Table, specifying the component for which to return a path when called through LocateComponent.</td></row>
		<row><td>Extension</td><td>Extension</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The extension associated with the table row.</td></row>
		<row><td>Extension</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Feature Table, specifying the feature to validate or install in order for the CLSID factory to be operational.</td></row>
		<row><td>Extension</td><td>MIME_</td><td>Y</td><td/><td/><td>MIME</td><td>1</td><td>Text</td><td/><td>Optional Context identifier, typically "type/format" associated with the extension</td></row>
		<row><td>Extension</td><td>ProgId_</td><td>Y</td><td/><td/><td>ProgId</td><td>1</td><td>Text</td><td/><td>Optional ProgId associated with this extension.</td></row>
		<row><td>Feature</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td>0;1;2;4;5;6;8;9;10;16;17;18;20;21;22;24;25;26;32;33;34;36;37;38;48;49;50;52;53;54</td><td>Feature attributes</td></row>
		<row><td>Feature</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Longer descriptive text describing a visible feature item.</td></row>
		<row><td>Feature</td><td>Directory_</td><td>Y</td><td/><td/><td>Directory</td><td>1</td><td>UpperCase</td><td/><td>The name of the Directory that can be configured by the UI. A non-null value will enable the browse button.</td></row>
		<row><td>Feature</td><td>Display</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Numeric sort order, used to force a specific display ordering.</td></row>
		<row><td>Feature</td><td>Feature</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular feature record.</td></row>
		<row><td>Feature</td><td>Feature_Parent</td><td>Y</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Optional key of a parent record in the same table. If the parent is not selected, then the record will not be installed. Null indicates a root item.</td></row>
		<row><td>Feature</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Comments</td></row>
		<row><td>Feature</td><td>ISFeatureCabName</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Name of CAB used when compressing CABs by Feature. Used to override build generated name for CAB file.</td></row>
		<row><td>Feature</td><td>ISProFeatureName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the feature used by pro projects.  This doesn't have to be unique.</td></row>
		<row><td>Feature</td><td>ISReleaseFlags</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Release Flags that specify whether this  feature will be built in a particular release.</td></row>
		<row><td>Feature</td><td>Level</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The install level at which record will be initially selected. An install level of 0 will disable an item and prevent its display.</td></row>
		<row><td>Feature</td><td>Title</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Short text identifying a visible feature item.</td></row>
		<row><td>FeatureComponents</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Component table.</td></row>
		<row><td>FeatureComponents</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Feature table.</td></row>
		<row><td>File</td><td>Attributes</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Integer containing bit flags representing file attributes (with the decimal value of each bit position in parentheses)</td></row>
		<row><td>File</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing Component that controls the file.</td></row>
		<row><td>File</td><td>File</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token, must match identifier in cabinet.  For uncompressed files, this field is ignored.</td></row>
		<row><td>File</td><td>FileName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>File name used for installation.  This may contain a "short name|long name" pair.  It may be just a long name, hence it cannot be of the Filename data type.</td></row>
		<row><td>File</td><td>FileSize</td><td>N</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>Size of file in bytes (long integer).</td></row>
		<row><td>File</td><td>ISAttributes</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>This field contains the following attributes: UseSystemSettings(0x1)</td></row>
		<row><td>File</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path, the category is of Text instead of Path because of potential use of path variables.</td></row>
		<row><td>File</td><td>ISComponentSubFolder_</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key referencing component subfolder containing this file.  Only for Pro.</td></row>
		<row><td>File</td><td>Language</td><td>Y</td><td/><td/><td/><td/><td>Language</td><td/><td>List of decimal language Ids, comma-separated if more than one.</td></row>
		<row><td>File</td><td>Sequence</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>Sequence with respect to the media images; order must track cabinet order.</td></row>
		<row><td>File</td><td>Version</td><td>Y</td><td/><td/><td>File</td><td>1</td><td>Version</td><td/><td>Version string for versioned files;  Blank for unversioned files.</td></row>
		<row><td>FileSFPCatalog</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>File associated with the catalog</td></row>
		<row><td>FileSFPCatalog</td><td>SFPCatalog_</td><td>N</td><td/><td/><td>SFPCatalog</td><td>1</td><td>Text</td><td/><td>Catalog associated with the file</td></row>
		<row><td>Font</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Primary key, foreign key into File table referencing font file.</td></row>
		<row><td>Font</td><td>FontTitle</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Font name.</td></row>
		<row><td>ISAssistantTag</td><td>Data</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISAssistantTag</td><td>Tag</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Color</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Duration</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Effect</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Font</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>ISBillboard</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Origin</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Sequence</td><td>N</td><td>-32767</td><td>32767</td><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Style</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Target</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Title</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>X</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td/></row>
		<row><td>ISBillBoard</td><td>Y</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td/></row>
		<row><td>ISChainPackage</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Display name for the chained package. Used only in the IDE.</td></row>
		<row><td>ISChainPackage</td><td>ISReleaseFlags</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISChainPackage</td><td>InstallCondition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td/></row>
		<row><td>ISChainPackage</td><td>InstallProperties</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td/></row>
		<row><td>ISChainPackage</td><td>Options</td><td>N</td><td/><td/><td/><td/><td>Integer</td><td/><td/></row>
		<row><td>ISChainPackage</td><td>Order</td><td>N</td><td/><td/><td/><td/><td>Integer</td><td/><td/></row>
		<row><td>ISChainPackage</td><td>Package</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td/></row>
		<row><td>ISChainPackage</td><td>ProductCode</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISChainPackage</td><td>RemoveCondition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td/></row>
		<row><td>ISChainPackage</td><td>RemoveProperties</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td/></row>
		<row><td>ISChainPackage</td><td>SourcePath</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISChainPackageData</td><td>Data</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>Binary stream. The binary icon data in PE (.DLL or .EXE) or icon (.ICO) format.</td></row>
		<row><td>ISChainPackageData</td><td>File</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td/></row>
		<row><td>ISChainPackageData</td><td>FilePath</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td/></row>
		<row><td>ISChainPackageData</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path to the ICO or EXE file.</td></row>
		<row><td>ISChainPackageData</td><td>Options</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISChainPackageData</td><td>Package_</td><td>N</td><td/><td/><td>ISChainPackage</td><td>1</td><td>Identifier</td><td/><td/></row>
		<row><td>ISClrWrap</td><td>Action_</td><td>N</td><td/><td/><td>CustomAction</td><td>1</td><td>Identifier</td><td/><td>Foreign key into CustomAction table</td></row>
		<row><td>ISClrWrap</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Property associated with this Action</td></row>
		<row><td>ISClrWrap</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Value associated with this Property</td></row>
		<row><td>ISComCatalogAttribute</td><td>ISComCatalogObject_</td><td>N</td><td/><td/><td>ISComCatalogObject</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComCatalogObject table.</td></row>
		<row><td>ISComCatalogAttribute</td><td>ItemName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The named attribute for a catalog object.</td></row>
		<row><td>ISComCatalogAttribute</td><td>ItemValue</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>A value associated with the attribute defined in the ItemName column.</td></row>
		<row><td>ISComCatalogCollection</td><td>CollectionName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>A catalog collection name.</td></row>
		<row><td>ISComCatalogCollection</td><td>ISComCatalogCollection</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A unique key for the ISComCatalogCollection table.</td></row>
		<row><td>ISComCatalogCollection</td><td>ISComCatalogObject_</td><td>N</td><td/><td/><td>ISComCatalogObject</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComCatalogObject table.</td></row>
		<row><td>ISComCatalogCollectionObjects</td><td>ISComCatalogCollection_</td><td>N</td><td/><td/><td>ISComCatalogCollection</td><td>1</td><td>Identifier</td><td/><td>A unique key for the ISComCatalogCollection table.</td></row>
		<row><td>ISComCatalogCollectionObjects</td><td>ISComCatalogObject_</td><td>N</td><td/><td/><td>ISComCatalogObject</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComCatalogObject table.</td></row>
		<row><td>ISComCatalogObject</td><td>DisplayName</td><td>N</td><td/><td/><td/><td/><td/><td/><td>The display name of a catalog object.</td></row>
		<row><td>ISComCatalogObject</td><td>ISComCatalogObject</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A unique key for the ISComCatalogObject table.</td></row>
		<row><td>ISComPlusApplication</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table that a COM+ application belongs to.</td></row>
		<row><td>ISComPlusApplication</td><td>ComputerName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Computer name that a COM+ application belongs to.</td></row>
		<row><td>ISComPlusApplication</td><td>DepFiles</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>List of the dependent files.</td></row>
		<row><td>ISComPlusApplication</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>InstallShield custom attributes associated with a COM+ application.</td></row>
		<row><td>ISComPlusApplication</td><td>ISComCatalogObject_</td><td>N</td><td/><td/><td>ISComCatalogObject</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComCatalogObject table.</td></row>
		<row><td>ISComPlusApplicationDLL</td><td>AlterDLL</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Alternate filename of the COM+ application component. Will be used for a .NET serviced component.</td></row>
		<row><td>ISComPlusApplicationDLL</td><td>CLSID</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>CLSID of the COM+ application component.</td></row>
		<row><td>ISComPlusApplicationDLL</td><td>DLL</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Filename of the COM+ application component.</td></row>
		<row><td>ISComPlusApplicationDLL</td><td>ISComCatalogObject_</td><td>N</td><td/><td/><td>ISComCatalogObject</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComCatalogObject table.</td></row>
		<row><td>ISComPlusApplicationDLL</td><td>ISComPlusApplicationDLL</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A unique key for the ISComPlusApplicationDLL table.</td></row>
		<row><td>ISComPlusApplicationDLL</td><td>ISComPlusApplication_</td><td>N</td><td/><td/><td>ISComPlusApplication</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComPlusApplication table.</td></row>
		<row><td>ISComPlusApplicationDLL</td><td>ProgId</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>ProgId of the COM+ application component.</td></row>
		<row><td>ISComPlusProxy</td><td>Component_</td><td>Y</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table that a COM+ application proxy belongs to.</td></row>
		<row><td>ISComPlusProxy</td><td>DepFiles</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>List of the dependent files.</td></row>
		<row><td>ISComPlusProxy</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>InstallShield custom attributes associated with a COM+ application proxy.</td></row>
		<row><td>ISComPlusProxy</td><td>ISComPlusApplication_</td><td>N</td><td/><td/><td>ISComPlusApplication</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComPlusApplication table that a COM+ application proxy belongs to.</td></row>
		<row><td>ISComPlusProxy</td><td>ISComPlusProxy</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A unique key for the ISComPlusProxy table.</td></row>
		<row><td>ISComPlusProxyDepFile</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the File table.</td></row>
		<row><td>ISComPlusProxyDepFile</td><td>ISComPlusApplication_</td><td>N</td><td/><td/><td>ISComPlusApplication</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComPlusApplication table.</td></row>
		<row><td>ISComPlusProxyDepFile</td><td>ISPath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path of the dependent file.</td></row>
		<row><td>ISComPlusProxyFile</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the File table.</td></row>
		<row><td>ISComPlusProxyFile</td><td>ISComPlusApplicationDLL_</td><td>N</td><td/><td/><td>ISComPlusApplicationDLL</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComPlusApplicationDLL table.</td></row>
		<row><td>ISComPlusServerDepFile</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the File table.</td></row>
		<row><td>ISComPlusServerDepFile</td><td>ISComPlusApplication_</td><td>N</td><td/><td/><td>ISComPlusApplication</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComPlusApplication table.</td></row>
		<row><td>ISComPlusServerDepFile</td><td>ISPath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path of the dependent file.</td></row>
		<row><td>ISComPlusServerFile</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the File table.</td></row>
		<row><td>ISComPlusServerFile</td><td>ISComPlusApplicationDLL_</td><td>N</td><td/><td/><td>ISComPlusApplicationDLL</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISComPlusApplicationDLL table.</td></row>
		<row><td>ISComponentExtended</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Primary key used to identify a particular component record.</td></row>
		<row><td>ISComponentExtended</td><td>FTPLocation</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>FTP Location</td></row>
		<row><td>ISComponentExtended</td><td>FilterProperty</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Property to set if you want to filter a component</td></row>
		<row><td>ISComponentExtended</td><td>HTTPLocation</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>HTTP Location</td></row>
		<row><td>ISComponentExtended</td><td>Language</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Language</td></row>
		<row><td>ISComponentExtended</td><td>Miscellaneous</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Miscellaneous</td></row>
		<row><td>ISComponentExtended</td><td>OS</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>bitwise addition of OSs</td></row>
		<row><td>ISComponentExtended</td><td>Platforms</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>bitwise addition of Platforms.</td></row>
		<row><td>ISCustomActionReference</td><td>Action_</td><td>N</td><td/><td/><td>CustomAction</td><td>1</td><td>Identifier</td><td/><td>Foreign key into theICustomAction table.</td></row>
		<row><td>ISCustomActionReference</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Contents of the file speciifed in ISCAReferenceFilePath. This column is only used by MSI.</td></row>
		<row><td>ISCustomActionReference</td><td>FileType</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>file type of the file specified  ISCAReferenceFilePath. This column is only used by MSI.</td></row>
		<row><td>ISCustomActionReference</td><td>ISCAReferenceFilePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path, the category is of Text instead of Path because of potential use of path variables.  This column only exists in ISM.</td></row>
		<row><td>ISDIMDependency</td><td>ISDIMReference_</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>This is the primary key to the ISDIMDependency table</td></row>
		<row><td>ISDIMDependency</td><td>RequiredBuildVersion</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>the build version identifying the required DIM</td></row>
		<row><td>ISDIMDependency</td><td>RequiredMajorVersion</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>the major version identifying the required DIM</td></row>
		<row><td>ISDIMDependency</td><td>RequiredMinorVersion</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>the minor version identifying the required DIM</td></row>
		<row><td>ISDIMDependency</td><td>RequiredRevisionVersion</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>the revision version identifying the required DIM</td></row>
		<row><td>ISDIMDependency</td><td>RequiredUUID</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>the UUID identifying the required DIM</td></row>
		<row><td>ISDIMReference</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path, the category is of Text instead of Path because of potential use of path variables.</td></row>
		<row><td>ISDIMReference</td><td>ISDIMReference</td><td>N</td><td/><td/><td>ISDIMDependency</td><td>1</td><td>Identifier</td><td/><td>This is the primary key to the ISDIMReference table</td></row>
		<row><td>ISDIMReferenceDependencies</td><td>ISDIMDependency_</td><td>N</td><td/><td/><td>ISDIMDependency</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISDIMDependency table.</td></row>
		<row><td>ISDIMReferenceDependencies</td><td>ISDIMReference_Parent</td><td>N</td><td/><td/><td>ISDIMReference</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISDIMReference table.</td></row>
		<row><td>ISDIMVariable</td><td>ISDIMReference_</td><td>N</td><td/><td/><td>ISDIMReference</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISDIMReference table.</td></row>
		<row><td>ISDIMVariable</td><td>ISDIMVariable</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>This is the primary key to the ISDIMVariable table</td></row>
		<row><td>ISDIMVariable</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of a variable defined in the .dim file</td></row>
		<row><td>ISDIMVariable</td><td>NewValue</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>New value that you want to override with</td></row>
		<row><td>ISDIMVariable</td><td>Type</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Type of the variable. 0: Build Variable, 1: Runtime Variable</td></row>
		<row><td>ISDLLWrapper</td><td>EntryPoint</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>This is a foreign key to the target column in the CustomAction table</td></row>
		<row><td>ISDLLWrapper</td><td>Source</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>This is column points to the source file for the DLLWrapper Custom Action</td></row>
		<row><td>ISDLLWrapper</td><td>Target</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The function signature</td></row>
		<row><td>ISDLLWrapper</td><td>Type</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Type</td></row>
		<row><td>ISDRMFile</td><td>File_</td><td>Y</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into File table.  A null value will cause a build warning.</td></row>
		<row><td>ISDRMFile</td><td>ISDRMFile</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Unique identifier for this item.</td></row>
		<row><td>ISDRMFile</td><td>ISDRMLicense_</td><td>Y</td><td/><td/><td>ISDRMLicense</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing License that packages this file.</td></row>
		<row><td>ISDRMFile</td><td>Shell</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Text indicating the activation shell used at runtime.</td></row>
		<row><td>ISDRMFileAttribute</td><td>ISDRMFile_</td><td>N</td><td/><td/><td>ISDRMFile</td><td>1</td><td>Identifier</td><td/><td>Primary foreign key into ISDRMFile table.</td></row>
		<row><td>ISDRMFileAttribute</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the attribute</td></row>
		<row><td>ISDRMFileAttribute</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The value of the attribute</td></row>
		<row><td>ISDRMLicense</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td>Number</td><td/><td>Bitwise field used to specify binary attributes of this license.</td></row>
		<row><td>ISDRMLicense</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>An internal description of this license.</td></row>
		<row><td>ISDRMLicense</td><td>ISDRMLicense</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Unique key identifying the license record.</td></row>
		<row><td>ISDRMLicense</td><td>LicenseNumber</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The license number.</td></row>
		<row><td>ISDRMLicense</td><td>ProjectVersion</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The version of the project that this license is tied to.</td></row>
		<row><td>ISDRMLicense</td><td>RequestCode</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The request code.</td></row>
		<row><td>ISDRMLicense</td><td>ResponseCode</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The response code.</td></row>
		<row><td>ISDependency</td><td>Exclude</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISDependency</td><td>ISDependency</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISDisk1File</td><td>Disk</td><td>Y</td><td/><td/><td/><td/><td/><td>-1;0;1</td><td>Used to differentiate between disk1(1), last disk(-1), and other(0).</td></row>
		<row><td>ISDisk1File</td><td>ISBuildSourcePath</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path of file to be copied to Disk1 folder</td></row>
		<row><td>ISDisk1File</td><td>ISDisk1File</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key for ISDisk1File table</td></row>
		<row><td>ISDynamicFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing Component that controls the file.</td></row>
		<row><td>ISDynamicFile</td><td>ExcludeFiles</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Wildcards for excluded files.</td></row>
		<row><td>ISDynamicFile</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td>0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15</td><td>This is used to store Installshield custom properties of a dynamic filet.  Currently the only one is SelfRegister.</td></row>
		<row><td>ISDynamicFile</td><td>IncludeFiles</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Wildcards for included files.</td></row>
		<row><td>ISDynamicFile</td><td>IncludeFlags</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Include flags.</td></row>
		<row><td>ISDynamicFile</td><td>SourceFolder</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path, the category is of Text instead of Path because of potential use of path variables.</td></row>
		<row><td>ISFeatureDIMReferences</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Feature table.</td></row>
		<row><td>ISFeatureDIMReferences</td><td>ISDIMReference_</td><td>N</td><td/><td/><td>ISDIMReference</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISDIMReference table.</td></row>
		<row><td>ISFeatureMergeModuleExcludes</td><td>Feature_</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into Feature table.</td></row>
		<row><td>ISFeatureMergeModuleExcludes</td><td>Language</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Foreign key into ISMergeModule table.</td></row>
		<row><td>ISFeatureMergeModuleExcludes</td><td>ModuleID</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into ISMergeModule table.</td></row>
		<row><td>ISFeatureMergeModules</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Feature table.</td></row>
		<row><td>ISFeatureMergeModules</td><td>ISMergeModule_</td><td>N</td><td/><td/><td>ISMergeModule</td><td>1</td><td>Text</td><td/><td>Foreign key into ISMergeModule table.</td></row>
		<row><td>ISFeatureMergeModules</td><td>Language_</td><td>N</td><td/><td/><td>ISMergeModule</td><td>2</td><td/><td/><td>Foreign key into ISMergeModule table.</td></row>
		<row><td>ISFeatureSetupPrerequisites</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Feature table.</td></row>
		<row><td>ISFeatureSetupPrerequisites</td><td>ISSetupPrerequisites_</td><td>N</td><td/><td/><td>ISSetupPrerequisites</td><td>1</td><td/><td/><td/></row>
		<row><td>ISFileManifests</td><td>File_</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into File table.</td></row>
		<row><td>ISFileManifests</td><td>Manifest_</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into File table.</td></row>
		<row><td>ISIISItem</td><td>Component_</td><td>Y</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key to Component table.</td></row>
		<row><td>ISIISItem</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Localizable Item Name.</td></row>
		<row><td>ISIISItem</td><td>ISIISItem</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key for each item.</td></row>
		<row><td>ISIISItem</td><td>ISIISItem_Parent</td><td>Y</td><td/><td/><td>ISIISItem</td><td>1</td><td>Identifier</td><td/><td>This record's parent record.</td></row>
		<row><td>ISIISItem</td><td>Type</td><td>N</td><td/><td/><td/><td/><td/><td/><td>IIS resource type.</td></row>
		<row><td>ISIISProperty</td><td>FriendlyName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>IIS property name.</td></row>
		<row><td>ISIISProperty</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Flags.</td></row>
		<row><td>ISIISProperty</td><td>ISIISItem_</td><td>N</td><td/><td/><td>ISIISItem</td><td>1</td><td>Identifier</td><td/><td>Primary key for table, foreign key into ISIISItem.</td></row>
		<row><td>ISIISProperty</td><td>ISIISProperty</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key for table.</td></row>
		<row><td>ISIISProperty</td><td>MetaDataAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>IIS property attributes.</td></row>
		<row><td>ISIISProperty</td><td>MetaDataProp</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>IIS property ID.</td></row>
		<row><td>ISIISProperty</td><td>MetaDataType</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>IIS property data type.</td></row>
		<row><td>ISIISProperty</td><td>MetaDataUserType</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>IIS property user data type.</td></row>
		<row><td>ISIISProperty</td><td>MetaDataValue</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>IIS property value.</td></row>
		<row><td>ISIISProperty</td><td>Order</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Order sequencing.</td></row>
		<row><td>ISIISProperty</td><td>Schema</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>IIS7 schema information.</td></row>
		<row><td>ISInstallScriptAction</td><td>EntryPoint</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>This is a foreign key to the target column in the CustomAction table</td></row>
		<row><td>ISInstallScriptAction</td><td>Source</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>This is column points to the source file for the DLLWrapper Custom Action</td></row>
		<row><td>ISInstallScriptAction</td><td>Target</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The function signature</td></row>
		<row><td>ISInstallScriptAction</td><td>Type</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Type</td></row>
		<row><td>ISLanguage</td><td>ISLanguage</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>This is the language ID.</td></row>
		<row><td>ISLanguage</td><td>Included</td><td>Y</td><td/><td/><td/><td/><td/><td>0;1</td><td>Specify whether this language should be included.</td></row>
		<row><td>ISLinkerLibrary</td><td>ISLinkerLibrary</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Unique identifier for the link library.</td></row>
		<row><td>ISLinkerLibrary</td><td>Library</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path of the object library (.obl file).</td></row>
		<row><td>ISLinkerLibrary</td><td>Order</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Order of the Library</td></row>
		<row><td>ISLocalControl</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>A 32-bit word that specifies the attribute flags to be applied to this control.</td></row>
		<row><td>ISLocalControl</td><td>Binary_</td><td>Y</td><td/><td/><td>Binary</td><td>1</td><td>Identifier</td><td/><td>External key to the Binary table.</td></row>
		<row><td>ISLocalControl</td><td>Control_</td><td>N</td><td/><td/><td>Control</td><td>2</td><td>Identifier</td><td/><td>Name of the control. This name must be unique within a dialog, but can repeat on different dialogs.</td></row>
		<row><td>ISLocalControl</td><td>Dialog_</td><td>N</td><td/><td/><td>Dialog</td><td>1</td><td>Identifier</td><td/><td>External key to the Dialog table, name of the dialog.</td></row>
		<row><td>ISLocalControl</td><td>Height</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Height of the bounding rectangle of the control.</td></row>
		<row><td>ISLocalControl</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path to .rtf file for scrollable text control</td></row>
		<row><td>ISLocalControl</td><td>ISLanguage_</td><td>N</td><td/><td/><td>ISLanguage</td><td>1</td><td>Text</td><td/><td>This is a foreign key to the ISLanguage table.</td></row>
		<row><td>ISLocalControl</td><td>Width</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Width of the bounding rectangle of the control.</td></row>
		<row><td>ISLocalControl</td><td>X</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Horizontal coordinate of the upper left corner of the bounding rectangle of the control.</td></row>
		<row><td>ISLocalControl</td><td>Y</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Vertical coordinate of the upper left corner of the bounding rectangle of the control.</td></row>
		<row><td>ISLocalDialog</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>A 32-bit word that specifies the attribute flags to be applied to this dialog.</td></row>
		<row><td>ISLocalDialog</td><td>Dialog_</td><td>Y</td><td/><td/><td>Dialog</td><td>1</td><td>Identifier</td><td/><td>Name of the dialog.</td></row>
		<row><td>ISLocalDialog</td><td>Height</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Height of the bounding rectangle of the dialog.</td></row>
		<row><td>ISLocalDialog</td><td>ISLanguage_</td><td>Y</td><td/><td/><td>ISLanguage</td><td>1</td><td>Text</td><td/><td>This is a foreign key to the ISLanguage table.</td></row>
		<row><td>ISLocalDialog</td><td>TextStyle_</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign Key into TextStyle table, only used in Script Based Projects.</td></row>
		<row><td>ISLocalDialog</td><td>Width</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Width of the bounding rectangle of the dialog.</td></row>
		<row><td>ISLocalRadioButton</td><td>Height</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The height of the button.</td></row>
		<row><td>ISLocalRadioButton</td><td>ISLanguage_</td><td>N</td><td/><td/><td>ISLanguage</td><td>1</td><td>Text</td><td/><td>This is a foreign key to the ISLanguage table.</td></row>
		<row><td>ISLocalRadioButton</td><td>Order</td><td>N</td><td>1</td><td>32767</td><td>RadioButton</td><td>2</td><td/><td/><td>A positive integer used to determine the ordering of the items within one list..The integers do not have to be consecutive.</td></row>
		<row><td>ISLocalRadioButton</td><td>Property</td><td>N</td><td/><td/><td>RadioButton</td><td>1</td><td>Identifier</td><td/><td>A named property to be tied to this radio button. All the buttons tied to the same property become part of the same group.</td></row>
		<row><td>ISLocalRadioButton</td><td>Width</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The width of the button.</td></row>
		<row><td>ISLocalRadioButton</td><td>X</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The horizontal coordinate of the upper left corner of the bounding rectangle of the radio button.</td></row>
		<row><td>ISLocalRadioButton</td><td>Y</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The vertical coordinate of the upper left corner of the bounding rectangle of the radio button.</td></row>
		<row><td>ISLockPermissions</td><td>Attributes</td><td>Y</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Permissions attributes mask, 1==Deny access; 2==No inherit, 4==Ignore apply failures, 8==Target object is 64-bit</td></row>
		<row><td>ISLockPermissions</td><td>Domain</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Domain name for user whose permissions are being set.</td></row>
		<row><td>ISLockPermissions</td><td>LockObject</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into CreateFolder, Registry, or File table</td></row>
		<row><td>ISLockPermissions</td><td>Permission</td><td>Y</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Permission Access mask.</td></row>
		<row><td>ISLockPermissions</td><td>Table</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td>CreateFolder;File;Registry</td><td>Reference to another table name</td></row>
		<row><td>ISLockPermissions</td><td>User</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>User for permissions to be set. This can be a property, hardcoded named, or SID string</td></row>
		<row><td>ISLogicalDisk</td><td>Cabinet</td><td>Y</td><td/><td/><td/><td/><td>Cabinet</td><td/><td>If some or all of the files stored on the media are compressed in a cabinet, the name of that cabinet.</td></row>
		<row><td>ISLogicalDisk</td><td>DiskId</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>Primary key, integer to determine sort order for table.</td></row>
		<row><td>ISLogicalDisk</td><td>DiskPrompt</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Disk name: the visible text actually printed on the disk.  This will be used to prompt the user when this disk needs to be inserted.</td></row>
		<row><td>ISLogicalDisk</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td>ISProductConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISLogicalDisk</td><td>ISRelease_</td><td>N</td><td/><td/><td>ISRelease</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISRelease table.</td></row>
		<row><td>ISLogicalDisk</td><td>LastSequence</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>File sequence number for the last file for this media.</td></row>
		<row><td>ISLogicalDisk</td><td>Source</td><td>Y</td><td/><td/><td/><td/><td>Property</td><td/><td>The property defining the location of the cabinet file.</td></row>
		<row><td>ISLogicalDisk</td><td>VolumeLabel</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The label attributed to the volume.</td></row>
		<row><td>ISLogicalDiskFeatures</td><td>Feature_</td><td>Y</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Feature Table,</td></row>
		<row><td>ISLogicalDiskFeatures</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store Installshield custom properties, like Compressed, etc.</td></row>
		<row><td>ISLogicalDiskFeatures</td><td>ISLogicalDisk_</td><td>N</td><td>1</td><td>32767</td><td>ISLogicalDisk</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the ISLogicalDisk table.</td></row>
		<row><td>ISLogicalDiskFeatures</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td>ISProductConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISLogicalDiskFeatures</td><td>ISRelease_</td><td>N</td><td/><td/><td>ISRelease</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISRelease table.</td></row>
		<row><td>ISLogicalDiskFeatures</td><td>Sequence</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>File sequence number for the file for this media.</td></row>
		<row><td>ISMergeModule</td><td>Destination</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Destination.</td></row>
		<row><td>ISMergeModule</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store Installshield custom properties of a merge module.</td></row>
		<row><td>ISMergeModule</td><td>ISMergeModule</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The GUID identifying the merge module.</td></row>
		<row><td>ISMergeModule</td><td>Language</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Default decimal language of module.</td></row>
		<row><td>ISMergeModule</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the merge module.</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Attributes (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>ContextData</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>ContextData  (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>DefaultValue</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>DefaultValue  (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Description (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>DisplayName (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>Format</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Format (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>HelpKeyword</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>HelpKeyword (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>HelpLocation</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>HelpLocation (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>ISMergeModule_</td><td>N</td><td/><td/><td>ISMergeModule</td><td>1</td><td>Text</td><td/><td>The module signature, a foreign key into the ISMergeModule table</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>Language_</td><td>N</td><td/><td/><td>ISMergeModule</td><td>2</td><td/><td/><td>Default decimal language of module.</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>ModuleConfiguration_</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Identifier, foreign key into ModuleConfiguration table (ModuleConfiguration.Name)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>Type</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Type (from configurable merge module)</td></row>
		<row><td>ISMergeModuleCfgValues</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Value for this item.</td></row>
		<row><td>ISObject</td><td>Language</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>ISObject</td><td>ObjectName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>ISObjectProperty</td><td>IncludeInBuild</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Boolean, 0 for false non 0 for true</td></row>
		<row><td>ISObjectProperty</td><td>ObjectName</td><td>Y</td><td/><td/><td>ISObject</td><td>1</td><td>Text</td><td/><td/></row>
		<row><td>ISObjectProperty</td><td>Property</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>ISObjectProperty</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>ISPatchConfigImage</td><td>PatchConfiguration_</td><td>Y</td><td/><td/><td>ISPatchConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key to the ISPatchConfigurationTable</td></row>
		<row><td>ISPatchConfigImage</td><td>UpgradedImage_</td><td>N</td><td/><td/><td>ISUpgradedImage</td><td>1</td><td>Text</td><td/><td>Foreign key to the ISUpgradedImageTable</td></row>
		<row><td>ISPatchConfiguration</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>PatchConfiguration attributes</td></row>
		<row><td>ISPatchConfiguration</td><td>CanPCDiffer</td><td>N</td><td/><td/><td/><td/><td/><td/><td>This is determine whether Product Codes may differ</td></row>
		<row><td>ISPatchConfiguration</td><td>CanPVDiffer</td><td>N</td><td/><td/><td/><td/><td/><td/><td>This is determine whether the Major Product Version may differ</td></row>
		<row><td>ISPatchConfiguration</td><td>EnablePatchCache</td><td>N</td><td/><td/><td/><td/><td/><td/><td>This is determine whether to Enable Patch cacheing</td></row>
		<row><td>ISPatchConfiguration</td><td>Flags</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Patching API Flags</td></row>
		<row><td>ISPatchConfiguration</td><td>IncludeWholeFiles</td><td>N</td><td/><td/><td/><td/><td/><td/><td>This is determine whether to build a binary level patch</td></row>
		<row><td>ISPatchConfiguration</td><td>LeaveDecompressed</td><td>N</td><td/><td/><td/><td/><td/><td/><td>This is determine whether to leave intermediate files devcompressed when finished</td></row>
		<row><td>ISPatchConfiguration</td><td>MinMsiVersion</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Minimum Required MSI Version</td></row>
		<row><td>ISPatchConfiguration</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the Patch Configuration</td></row>
		<row><td>ISPatchConfiguration</td><td>OptimizeForSize</td><td>N</td><td/><td/><td/><td/><td/><td/><td>This is determine whether to Optimize for large files</td></row>
		<row><td>ISPatchConfiguration</td><td>OutputPath</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Build Location</td></row>
		<row><td>ISPatchConfiguration</td><td>PatchCacheDir</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Directory to recieve the Patch Cache information</td></row>
		<row><td>ISPatchConfiguration</td><td>PatchGuid</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Unique Patch Identifier</td></row>
		<row><td>ISPatchConfiguration</td><td>PatchGuidsToReplace</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>List Of Patch Guids to unregister</td></row>
		<row><td>ISPatchConfiguration</td><td>TargetProductCodes</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>List Of target Product Codes</td></row>
		<row><td>ISPatchConfigurationProperty</td><td>ISPatchConfiguration_</td><td>Y</td><td/><td/><td>ISPatchConfiguration</td><td>1</td><td>Text</td><td/><td>Name of the Patch Configuration</td></row>
		<row><td>ISPatchConfigurationProperty</td><td>Property</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the Patch Configuration Property value</td></row>
		<row><td>ISPatchConfigurationProperty</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Value of the Patch Configuration Property</td></row>
		<row><td>ISPatchExternalFile</td><td>FileKey</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Filekey</td></row>
		<row><td>ISPatchExternalFile</td><td>FilePath</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Filepath</td></row>
		<row><td>ISPatchExternalFile</td><td>ISUpgradedImage_</td><td>N</td><td/><td/><td>ISUpgradedImage</td><td>1</td><td>Text</td><td/><td>Foreign key to the isupgraded image table</td></row>
		<row><td>ISPatchExternalFile</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Uniqu name to identify this record.</td></row>
		<row><td>ISPatchWholeFile</td><td>Component</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Component containing file key</td></row>
		<row><td>ISPatchWholeFile</td><td>FileKey</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Key of file to be included as whole</td></row>
		<row><td>ISPatchWholeFile</td><td>UpgradedImage</td><td>N</td><td/><td/><td>ISUpgradedImage</td><td>1</td><td>Text</td><td/><td>Foreign key to ISUpgradedImage Table</td></row>
		<row><td>ISPathVariable</td><td>ISPathVariable</td><td>N</td><td/><td/><td/><td/><td/><td/><td>The name of the path variable.</td></row>
		<row><td>ISPathVariable</td><td>TestValue</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The test value of the path variable.</td></row>
		<row><td>ISPathVariable</td><td>Type</td><td>N</td><td/><td/><td/><td/><td/><td>1;2;4;8</td><td>The type of the path variable.</td></row>
		<row><td>ISPathVariable</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The value of the path variable.</td></row>
		<row><td>ISPowerShellWrap</td><td>Action_</td><td>N</td><td/><td/><td>CustomAction</td><td>1</td><td>Identifier</td><td/><td>Foreign key into CustomAction table</td></row>
		<row><td>ISPowerShellWrap</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Property associated with this Action</td></row>
		<row><td>ISPowerShellWrap</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Value associated with this Property</td></row>
		<row><td>ISProductConfiguration</td><td>GeneratePackageCode</td><td>Y</td><td/><td/><td/><td/><td>Number</td><td>0;1</td><td>Indicates whether or not to generate a package code.</td></row>
		<row><td>ISProductConfiguration</td><td>ISProductConfiguration</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the product configuration.</td></row>
		<row><td>ISProductConfiguration</td><td>ProductConfigurationFlags</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Product configuration (release) flags.</td></row>
		<row><td>ISProductConfigurationInstance</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td>ISProductConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISProductConfigurationInstance</td><td>InstanceId</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Identifies the instance number of this instance. This value is stored in the Property InstanceId.</td></row>
		<row><td>ISProductConfigurationInstance</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Product Congiuration property name</td></row>
		<row><td>ISProductConfigurationInstance</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>String value for property.</td></row>
		<row><td>ISProductConfigurationProperty</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td>ISProductConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISProductConfigurationProperty</td><td>Property</td><td>N</td><td/><td/><td>Property</td><td>1</td><td>Text</td><td/><td>Product Congiuration property name</td></row>
		<row><td>ISProductConfigurationProperty</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>String value for property. Never null or empty.</td></row>
		<row><td>ISRelease</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Bitfield holding boolean values for various release attributes.</td></row>
		<row><td>ISRelease</td><td>BuildLocation</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Build location.</td></row>
		<row><td>ISRelease</td><td>CDBrowser</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Demoshield browser location.</td></row>
		<row><td>ISRelease</td><td>DefaultLanguage</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Default language for setup.</td></row>
		<row><td>ISRelease</td><td>DigitalPVK</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Digital signing private key (.pvk) file.</td></row>
		<row><td>ISRelease</td><td>DigitalSPC</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Digital signing Software Publisher Certificate (.spc) file.</td></row>
		<row><td>ISRelease</td><td>DigitalURL</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Digital signing URL.</td></row>
		<row><td>ISRelease</td><td>DiskClusterSize</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Disk cluster size.</td></row>
		<row><td>ISRelease</td><td>DiskSize</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Disk size.</td></row>
		<row><td>ISRelease</td><td>DiskSizeUnit</td><td>N</td><td/><td/><td/><td/><td/><td>0;1;2</td><td>Disk size units (KB or MB).</td></row>
		<row><td>ISRelease</td><td>DiskSpanning</td><td>N</td><td/><td/><td/><td/><td/><td>0;1;2</td><td>Disk spanning (automatic, enforce size, etc.).</td></row>
		<row><td>ISRelease</td><td>DotNetBuildConfiguration</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Build Configuration for .NET solutions.</td></row>
		<row><td>ISRelease</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td>ISProductConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISRelease</td><td>ISRelease</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the release.</td></row>
		<row><td>ISRelease</td><td>ISSetupPrerequisiteLocation</td><td>Y</td><td/><td/><td/><td/><td/><td>0;1;2;3</td><td>Location the Setup Prerequisites will be placed in</td></row>
		<row><td>ISRelease</td><td>MediaLocation</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Media location on disk.</td></row>
		<row><td>ISRelease</td><td>MsiCommandLine</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Command line passed to the msi package from setup.exe</td></row>
		<row><td>ISRelease</td><td>MsiSourceType</td><td>N</td><td>-1</td><td>4</td><td/><td/><td/><td/><td>MSI media source type.</td></row>
		<row><td>ISRelease</td><td>PackageName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Package name.</td></row>
		<row><td>ISRelease</td><td>Password</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Password.</td></row>
		<row><td>ISRelease</td><td>Platforms</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Platforms supported (Intel, Alpha, etc.).</td></row>
		<row><td>ISRelease</td><td>ReleaseFlags</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Release flags.</td></row>
		<row><td>ISRelease</td><td>ReleaseType</td><td>N</td><td/><td/><td/><td/><td/><td>1;2;4</td><td>Release type (single, uncompressed, etc.).</td></row>
		<row><td>ISRelease</td><td>SupportedLanguagesData</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Languages supported (for component filtering).</td></row>
		<row><td>ISRelease</td><td>SupportedLanguagesUI</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>UI languages supported.</td></row>
		<row><td>ISRelease</td><td>SupportedOSs</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Indicate which operating systmes are supported.</td></row>
		<row><td>ISRelease</td><td>SynchMsi</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>MSI file to synchronize file keys and other data with (patch-like functionality).</td></row>
		<row><td>ISRelease</td><td>Type</td><td>N</td><td>0</td><td>6</td><td/><td/><td/><td/><td>Release type (CDROM, Network, etc.).</td></row>
		<row><td>ISRelease</td><td>URLLocation</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Media location via URL.</td></row>
		<row><td>ISRelease</td><td>VersionCopyright</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Version stamp information.</td></row>
		<row><td>ISReleaseASPublishInfo</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td>ISProductConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISReleaseASPublishInfo</td><td>ISRelease_</td><td>N</td><td/><td/><td>ISRelease</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISRelease table.</td></row>
		<row><td>ISReleaseASPublishInfo</td><td>Property</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>AS Repository property name</td></row>
		<row><td>ISReleaseASPublishInfo</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>AS Repository property value</td></row>
		<row><td>ISReleaseExtended</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Bitfield holding boolean values for various release attributes.</td></row>
		<row><td>ISReleaseExtended</td><td>CertPassword</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Digital certificate password</td></row>
		<row><td>ISReleaseExtended</td><td>DigitalCertificateDBaseNS</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Path to cerificate database for Netscape digital  signature</td></row>
		<row><td>ISReleaseExtended</td><td>DigitalCertificateIdNS</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Path to cerificate ID for Netscape digital  signature</td></row>
		<row><td>ISReleaseExtended</td><td>DigitalCertificatePasswordNS</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Password for Netscape digital  signature</td></row>
		<row><td>ISReleaseExtended</td><td>DotNetBaseLanguage</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Base Languge of .NET Redist</td></row>
		<row><td>ISReleaseExtended</td><td>DotNetFxCmdLine</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Command Line to pass to DotNetFx.exe</td></row>
		<row><td>ISReleaseExtended</td><td>DotNetLangPackCmdLine</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Command Line to pass to LangPack.exe</td></row>
		<row><td>ISReleaseExtended</td><td>DotNetLangaugePacks</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>.NET Redist language packs to include</td></row>
		<row><td>ISReleaseExtended</td><td>DotNetRedistLocation</td><td>Y</td><td>0</td><td>3</td><td/><td/><td/><td/><td>Location of .NET framework Redist (Web, SetupExe, Source, None)</td></row>
		<row><td>ISReleaseExtended</td><td>DotNetRedistURL</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>URL to .NET framework Redist</td></row>
		<row><td>ISReleaseExtended</td><td>DotNetVersion</td><td>Y</td><td>0</td><td>2</td><td/><td/><td/><td/><td>Version of .NET framework Redist (1.0, 1.1)</td></row>
		<row><td>ISReleaseExtended</td><td>EngineLocation</td><td>Y</td><td>0</td><td>2</td><td/><td/><td/><td/><td>Location of msi engine (Web, SetupExe...)</td></row>
		<row><td>ISReleaseExtended</td><td>ISEngineLocation</td><td>Y</td><td>0</td><td>2</td><td/><td/><td/><td/><td>Location of ISScript  engine (Web, SetupExe...)</td></row>
		<row><td>ISReleaseExtended</td><td>ISEngineURL</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>URL to InstallShield scripting engine</td></row>
		<row><td>ISReleaseExtended</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISReleaseExtended</td><td>ISRelease_</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the release.</td></row>
		<row><td>ISReleaseExtended</td><td>JSharpCmdLine</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Command Line to pass to vjredist.exe</td></row>
		<row><td>ISReleaseExtended</td><td>JSharpRedistLocation</td><td>Y</td><td>0</td><td>3</td><td/><td/><td/><td/><td>Location of J# framework Redist (Web, SetupExe, Source, None)</td></row>
		<row><td>ISReleaseExtended</td><td>MsiEngineVersion</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Bitfield holding selected MSI engine versions included in this release</td></row>
		<row><td>ISReleaseExtended</td><td>OneClickCabName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>File name of generated cabfile</td></row>
		<row><td>ISReleaseExtended</td><td>OneClickHtmlName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>File name of generated html page</td></row>
		<row><td>ISReleaseExtended</td><td>OneClickTargetBrowser</td><td>Y</td><td>0</td><td>2</td><td/><td/><td/><td/><td>Target browser (IE, Netscape, both...)</td></row>
		<row><td>ISReleaseExtended</td><td>WebCabSize</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>Size of the cabfile</td></row>
		<row><td>ISReleaseExtended</td><td>WebLocalCachePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Directory to cache downloaded package</td></row>
		<row><td>ISReleaseExtended</td><td>WebType</td><td>Y</td><td>0</td><td>2</td><td/><td/><td/><td/><td>Type of web install (One Executable, Downloader...)</td></row>
		<row><td>ISReleaseExtended</td><td>WebURL</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>URL to .msi package</td></row>
		<row><td>ISReleaseExtended</td><td>Win9xMsiUrl</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>URL to Ansi MSI engine</td></row>
		<row><td>ISReleaseExtended</td><td>WinMsi30Url</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>URL to MSI 3.0 engine</td></row>
		<row><td>ISReleaseExtended</td><td>WinNTMsiUrl</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>URL to Unicode MSI engine</td></row>
		<row><td>ISReleaseProperty</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Foreign key into ISProductConfiguration table.</td></row>
		<row><td>ISReleaseProperty</td><td>ISRelease_</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Foreign key into ISRelease table.</td></row>
		<row><td>ISReleaseProperty</td><td>Name</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property name</td></row>
		<row><td>ISReleaseProperty</td><td>Value</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property value</td></row>
		<row><td>ISReleasePublishInfo</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Repository item description</td></row>
		<row><td>ISReleasePublishInfo</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Repository item display name</td></row>
		<row><td>ISReleasePublishInfo</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Bitfield holding various attributes</td></row>
		<row><td>ISReleasePublishInfo</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td>ISProductConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key into the ISProductConfiguration table.</td></row>
		<row><td>ISReleasePublishInfo</td><td>ISRelease_</td><td>N</td><td/><td/><td>ISRelease</td><td>1</td><td>Text</td><td/><td>The name of the release.</td></row>
		<row><td>ISReleasePublishInfo</td><td>Publisher</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Repository item publisher</td></row>
		<row><td>ISReleasePublishInfo</td><td>Repository</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Repository which to  publish the built merge module</td></row>
		<row><td>ISSQLConnection</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>Authentication</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>BatchSeparator</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>CmdTimeout</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>Comments</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>Database</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>ISSQLConnection</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular ISSQLConnection record.</td></row>
		<row><td>ISSQLConnection</td><td>Order</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>Password</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>ScriptVersion_Column</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>ScriptVersion_Table</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>Server</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnection</td><td>UserName</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnectionDBServer</td><td>ISSQLConnectionDBServer</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular ISSQLConnectionDBServer record.</td></row>
		<row><td>ISSQLConnectionDBServer</td><td>ISSQLConnection_</td><td>N</td><td/><td/><td>ISSQLConnection</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLConnection table.</td></row>
		<row><td>ISSQLConnectionDBServer</td><td>ISSQLDBMetaData_</td><td>N</td><td/><td/><td>ISSQLDBMetaData</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLDBMetaData table.</td></row>
		<row><td>ISSQLConnectionDBServer</td><td>Order</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLConnectionScript</td><td>ISSQLConnection_</td><td>N</td><td/><td/><td>ISSQLConnection</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLConnection table.</td></row>
		<row><td>ISSQLConnectionScript</td><td>ISSQLScriptFile_</td><td>N</td><td/><td/><td>ISSQLScriptFile</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLScriptFile table.</td></row>
		<row><td>ISSQLConnectionScript</td><td>Order</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnAdditional</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnDatabase</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnDriver</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnNetLibrary</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnPassword</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnPort</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnServer</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnUserID</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoCxnWindowsSecurity</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>AdoDriverName</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>CreateDbCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>CreateTableCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>DsnODBCName</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>ISSQLDBMetaData</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular ISSQLDBMetaData record.</td></row>
		<row><td>ISSQLDBMetaData</td><td>InsertRecordCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>LocalInstanceNames</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>QueryDatabasesCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>ScriptVersion_Column</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>ScriptVersion_ColumnType</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>ScriptVersion_Table</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>SelectTableCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>SwitchDbCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>TestDatabaseCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>TestTableCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>TestTableCmd2</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>VersionBeginToken</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>VersionEndToken</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>VersionInfoCmd</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLDBMetaData</td><td>WinAuthentUserId</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLRequirement</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLRequirement</td><td>ISSQLConnectionDBServer_</td><td>Y</td><td/><td/><td>ISSQLConnectionDBServer</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLConnectionDBServer table.</td></row>
		<row><td>ISSQLRequirement</td><td>ISSQLConnection_</td><td>N</td><td/><td/><td>ISSQLConnection</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLConnection table.</td></row>
		<row><td>ISSQLRequirement</td><td>ISSQLRequirement</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular ISSQLRequirement record.</td></row>
		<row><td>ISSQLRequirement</td><td>MajorVersion</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLRequirement</td><td>ServicePackLevel</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptError</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptError</td><td>ErrHandling</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptError</td><td>ErrNumber</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptError</td><td>ISSQLScriptFile_</td><td>Y</td><td/><td/><td>ISSQLScriptFile</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLScriptFile table</td></row>
		<row><td>ISSQLScriptError</td><td>Message</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Custom end-user message. Reserved for future use.</td></row>
		<row><td>ISSQLScriptFile</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptFile</td><td>Comments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Comments</td></row>
		<row><td>ISSQLScriptFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing Component that controls the SQL script.</td></row>
		<row><td>ISSQLScriptFile</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>A conditional statement that will disable this script if the specified condition evaluates to the 'False' state. If a script is disabled, it will not be installed regardless of the 'Action' state associated with the component.</td></row>
		<row><td>ISSQLScriptFile</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Display name for the SQL script file.</td></row>
		<row><td>ISSQLScriptFile</td><td>ErrorHandling</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptFile</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path, the category is of Text instead of Path because of potential use of path variables.</td></row>
		<row><td>ISSQLScriptFile</td><td>ISSQLScriptFile</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>This is the primary key to the ISSQLScriptFile table</td></row>
		<row><td>ISSQLScriptFile</td><td>InstallText</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Feedback end-user text at install</td></row>
		<row><td>ISSQLScriptFile</td><td>Scheduling</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptFile</td><td>UninstallText</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Feedback end-user text at Uninstall</td></row>
		<row><td>ISSQLScriptFile</td><td>Version</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Schema Version (#####.#####.#####.#####)</td></row>
		<row><td>ISSQLScriptImport</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptImport</td><td>Authentication</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptImport</td><td>Database</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptImport</td><td>ExcludeTables</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptImport</td><td>ISSQLScriptFile_</td><td>N</td><td/><td/><td>ISSQLScriptFile</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLScriptFile table.</td></row>
		<row><td>ISSQLScriptImport</td><td>IncludeTables</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptImport</td><td>Password</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptImport</td><td>Server</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptImport</td><td>UserName</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptReplace</td><td>Attributes</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptReplace</td><td>ISSQLScriptFile_</td><td>N</td><td/><td/><td>ISSQLScriptFile</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSQLScriptFile table.</td></row>
		<row><td>ISSQLScriptReplace</td><td>ISSQLScriptReplace</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular ISSQLScriptReplace record.</td></row>
		<row><td>ISSQLScriptReplace</td><td>Replace</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSQLScriptReplace</td><td>Search</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISScriptFile</td><td>ISScriptFile</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>This is the full path of the script file. The path portion may be expressed in path variable form.</td></row>
		<row><td>ISSelfReg</td><td>CmdLine</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSelfReg</td><td>Cost</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSelfReg</td><td>FileKey</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key to the file table</td></row>
		<row><td>ISSelfReg</td><td>Order</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSetupFile</td><td>FileName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>This is the file name to use when streaming the file to the support files location</td></row>
		<row><td>ISSetupFile</td><td>ISSetupFile</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>This is the primary key to the ISSetupFile table</td></row>
		<row><td>ISSetupFile</td><td>Language</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Four digit language identifier.  0 for Language Neutral</td></row>
		<row><td>ISSetupFile</td><td>Path</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Link to the source file on the build machine</td></row>
		<row><td>ISSetupFile</td><td>Splash</td><td>Y</td><td/><td/><td/><td/><td>Short</td><td/><td>Boolean value indication whether his setup file entry belongs in the Splasc Screen section</td></row>
		<row><td>ISSetupFile</td><td>Stream</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>Binary stream. The bits to stream to the support location</td></row>
		<row><td>ISSetupPrerequisites</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSetupPrerequisites</td><td>ISReleaseFlags</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Release Flags that specify whether this prereq  will be included in a particular release.</td></row>
		<row><td>ISSetupPrerequisites</td><td>ISSetupLocation</td><td>Y</td><td/><td/><td/><td/><td/><td>0;1;2</td><td/></row>
		<row><td>ISSetupPrerequisites</td><td>ISSetupPrerequisites</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSetupPrerequisites</td><td>Order</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISSetupType</td><td>Comments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>User Comments.</td></row>
		<row><td>ISSetupType</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Longer descriptive text describing a visible feature item.</td></row>
		<row><td>ISSetupType</td><td>Display</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Numeric sort order, used to force a specific display ordering.</td></row>
		<row><td>ISSetupType</td><td>Display_Name</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>A string used to set the initial text contained within a control (if appropriate).</td></row>
		<row><td>ISSetupType</td><td>ISSetupType</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular feature record.</td></row>
		<row><td>ISSetupTypeFeatures</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Feature table.</td></row>
		<row><td>ISSetupTypeFeatures</td><td>ISSetupType_</td><td>N</td><td/><td/><td>ISSetupType</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISSetupType table.</td></row>
		<row><td>ISStorages</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Path to the file to stream into sub-storage</td></row>
		<row><td>ISStorages</td><td>Name</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Name of the sub-storage key</td></row>
		<row><td>ISString</td><td>Comment</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Comment</td></row>
		<row><td>ISString</td><td>Encoded</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Encoding for multi-byte strings.</td></row>
		<row><td>ISString</td><td>ISLanguage_</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>This is a foreign key to the ISLanguage table.</td></row>
		<row><td>ISString</td><td>ISString</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>String id.</td></row>
		<row><td>ISString</td><td>TimeStamp</td><td>Y</td><td/><td/><td/><td/><td>Time/Date</td><td/><td>Time Stamp. MSI's Time/Date column type is just an int, with bits packed in a certain order.</td></row>
		<row><td>ISString</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>real string value.</td></row>
		<row><td>ISSwidtagProperty</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Property name</td></row>
		<row><td>ISSwidtagProperty</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Property value</td></row>
		<row><td>ISTargetImage</td><td>Flags</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>relative order of the target image</td></row>
		<row><td>ISTargetImage</td><td>IgnoreMissingFiles</td><td>N</td><td/><td/><td/><td/><td/><td/><td>If true, ignore missing source files when creating patch</td></row>
		<row><td>ISTargetImage</td><td>MsiPath</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Path to the target image</td></row>
		<row><td>ISTargetImage</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of the TargetImage</td></row>
		<row><td>ISTargetImage</td><td>Order</td><td>N</td><td/><td/><td/><td/><td/><td/><td>relative order of the target image</td></row>
		<row><td>ISTargetImage</td><td>UpgradedImage_</td><td>N</td><td/><td/><td>ISUpgradedImage</td><td>1</td><td>Text</td><td/><td>foreign key to the upgraded Image table</td></row>
		<row><td>ISUpgradeMsiItem</td><td>ISAttributes</td><td>N</td><td/><td/><td/><td/><td/><td>0;1</td><td/></row>
		<row><td>ISUpgradeMsiItem</td><td>ISReleaseFlags</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>ISUpgradeMsiItem</td><td>ObjectSetupPath</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The path to the setup you want to upgrade.</td></row>
		<row><td>ISUpgradeMsiItem</td><td>UpgradeItem</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the Upgrade Item.</td></row>
		<row><td>ISUpgradedImage</td><td>Family</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the image family</td></row>
		<row><td>ISUpgradedImage</td><td>MsiPath</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Path to the upgraded image</td></row>
		<row><td>ISUpgradedImage</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of the UpgradedImage</td></row>
		<row><td>ISVirtualDirectory</td><td>Directory_</td><td>N</td><td/><td/><td>Directory</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Directory table.</td></row>
		<row><td>ISVirtualDirectory</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Property name</td></row>
		<row><td>ISVirtualDirectory</td><td>Value</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property value</td></row>
		<row><td>ISVirtualFile</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into File  table.</td></row>
		<row><td>ISVirtualFile</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Property name</td></row>
		<row><td>ISVirtualFile</td><td>Value</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property value</td></row>
		<row><td>ISVirtualPackage</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Property name</td></row>
		<row><td>ISVirtualPackage</td><td>Value</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property value</td></row>
		<row><td>ISVirtualRegistry</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Property name</td></row>
		<row><td>ISVirtualRegistry</td><td>Registry_</td><td>N</td><td/><td/><td>Registry</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Registry table.</td></row>
		<row><td>ISVirtualRegistry</td><td>Value</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property value</td></row>
		<row><td>ISVirtualRelease</td><td>ISProductConfiguration_</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Foreign key into ISProductConfiguration table.</td></row>
		<row><td>ISVirtualRelease</td><td>ISRelease_</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Foreign key into ISRelease table.</td></row>
		<row><td>ISVirtualRelease</td><td>Name</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property name</td></row>
		<row><td>ISVirtualRelease</td><td>Value</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property value</td></row>
		<row><td>ISVirtualShortcut</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Property name</td></row>
		<row><td>ISVirtualShortcut</td><td>Shortcut_</td><td>N</td><td/><td/><td>Shortcut</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Shortcut table.</td></row>
		<row><td>ISVirtualShortcut</td><td>Value</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Property value</td></row>
		<row><td>ISXmlElement</td><td>Content</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Element contents</td></row>
		<row><td>ISXmlElement</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td>Number</td><td/><td>Internal XML element attributes</td></row>
		<row><td>ISXmlElement</td><td>ISXmlElement</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized, internal token for Xml element</td></row>
		<row><td>ISXmlElement</td><td>ISXmlElement_Parent</td><td>Y</td><td/><td/><td>ISXmlElement</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISXMLElement table.</td></row>
		<row><td>ISXmlElement</td><td>ISXmlFile_</td><td>N</td><td/><td/><td>ISXmlFile</td><td>1</td><td>Identifier</td><td/><td>Foreign key into XmlFile table.</td></row>
		<row><td>ISXmlElement</td><td>XPath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>XPath fragment including any operators</td></row>
		<row><td>ISXmlElementAttrib</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td>Number</td><td/><td>Internal XML elementattib attributes</td></row>
		<row><td>ISXmlElementAttrib</td><td>ISXmlElementAttrib</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized, internal token for Xml element attribute</td></row>
		<row><td>ISXmlElementAttrib</td><td>ISXmlElement_</td><td>N</td><td/><td/><td>ISXmlElement</td><td>1</td><td>Identifier</td><td/><td>Foreign key into ISXMLElement table.</td></row>
		<row><td>ISXmlElementAttrib</td><td>Name</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Localized attribute name</td></row>
		<row><td>ISXmlElementAttrib</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Localized attribute value</td></row>
		<row><td>ISXmlFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Component table.</td></row>
		<row><td>ISXmlFile</td><td>Directory</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into Directory table.</td></row>
		<row><td>ISXmlFile</td><td>Encoding</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>XML File Encoding</td></row>
		<row><td>ISXmlFile</td><td>FileName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Localized XML file name</td></row>
		<row><td>ISXmlFile</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td>Number</td><td/><td>Internal XML file attributes</td></row>
		<row><td>ISXmlFile</td><td>ISXmlFile</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized,internal token for Xml file</td></row>
		<row><td>ISXmlFile</td><td>SelectionNamespaces</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Selection namespaces</td></row>
		<row><td>ISXmlLocator</td><td>Attribute</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>The name of an attribute within the XML element.</td></row>
		<row><td>ISXmlLocator</td><td>Element</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>XPath query that will locate an element in an XML file.</td></row>
		<row><td>ISXmlLocator</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td>0;1;2</td><td/></row>
		<row><td>ISXmlLocator</td><td>Parent</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The parent file signature. It is also a foreign key in the Signature table.</td></row>
		<row><td>ISXmlLocator</td><td>Signature_</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The Signature_ represents a unique file signature and is also the foreign key in the Signature,  RegLocator, IniLocator, ISXmlLocator, CompLocator and the DrLocator tables.</td></row>
		<row><td>Icon</td><td>Data</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>Binary stream. The binary icon data in PE (.DLL or .EXE) or icon (.ICO) format.</td></row>
		<row><td>Icon</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path to the ICO or EXE file.</td></row>
		<row><td>Icon</td><td>ISIconIndex</td><td>Y</td><td>-32767</td><td>32767</td><td/><td/><td/><td/><td>Optional icon index to be extracted.</td></row>
		<row><td>Icon</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key. Name of the icon file.</td></row>
		<row><td>IniFile</td><td>Action</td><td>N</td><td/><td/><td/><td/><td/><td>0;1;3</td><td>The type of modification to be made, one of iifEnum</td></row>
		<row><td>IniFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table referencing component that controls the installing of the .INI value.</td></row>
		<row><td>IniFile</td><td>DirProperty</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into the Directory table denoting the directory where the .INI file is.</td></row>
		<row><td>IniFile</td><td>FileName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The .INI file name in which to write the information</td></row>
		<row><td>IniFile</td><td>IniFile</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>IniFile</td><td>Key</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The .INI file key below Section.</td></row>
		<row><td>IniFile</td><td>Section</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The .INI file Section.</td></row>
		<row><td>IniFile</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The value to be written.</td></row>
		<row><td>IniLocator</td><td>Field</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The field in the .INI line. If Field is null or 0 the entire line is read.</td></row>
		<row><td>IniLocator</td><td>FileName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The .INI file name.</td></row>
		<row><td>IniLocator</td><td>Key</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Key value (followed by an equals sign in INI file).</td></row>
		<row><td>IniLocator</td><td>Section</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Section name within in file (within square brackets in INI file).</td></row>
		<row><td>IniLocator</td><td>Signature_</td><td>N</td><td/><td/><td>Signature</td><td>1</td><td>Identifier</td><td/><td>The table key. The Signature_ represents a unique file signature and is also the foreign key in the Signature table.</td></row>
		<row><td>IniLocator</td><td>Type</td><td>Y</td><td>0</td><td>2</td><td/><td/><td/><td/><td>An integer value that determines if the .INI value read is a filename or a directory location or to be used as is w/o interpretation.</td></row>
		<row><td>InstallExecuteSequence</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of action to invoke, either in the engine or the handler DLL.</td></row>
		<row><td>InstallExecuteSequence</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>Optional expression which skips the action if evaluates to expFalse.If the expression syntax is invalid, the engine will terminate, returning iesBadActionData.</td></row>
		<row><td>InstallExecuteSequence</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store MM Custom Action Types</td></row>
		<row><td>InstallExecuteSequence</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments on this Sequence.</td></row>
		<row><td>InstallExecuteSequence</td><td>Sequence</td><td>Y</td><td>-4</td><td>32767</td><td/><td/><td/><td/><td>Number that determines the sort order in which the actions are to be executed.  Leave blank to suppress action.</td></row>
		<row><td>InstallShield</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of property, uppercase if settable by launcher or loader.</td></row>
		<row><td>InstallShield</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>String value for property.</td></row>
		<row><td>InstallUISequence</td><td>Action</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of action to invoke, either in the engine or the handler DLL.</td></row>
		<row><td>InstallUISequence</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td>Optional expression which skips the action if evaluates to expFalse.If the expression syntax is invalid, the engine will terminate, returning iesBadActionData.</td></row>
		<row><td>InstallUISequence</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store MM Custom Action Types</td></row>
		<row><td>InstallUISequence</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments on this Sequence.</td></row>
		<row><td>InstallUISequence</td><td>Sequence</td><td>Y</td><td>-4</td><td>32767</td><td/><td/><td/><td/><td>Number that determines the sort order in which the actions are to be executed.  Leave blank to suppress action.</td></row>
		<row><td>IsolatedComponent</td><td>Component_Application</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Key to Component table item for application</td></row>
		<row><td>IsolatedComponent</td><td>Component_Shared</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Key to Component table item to be isolated</td></row>
		<row><td>LaunchCondition</td><td>Condition</td><td>N</td><td/><td/><td/><td/><td>Condition</td><td/><td>Expression which must evaluate to TRUE in order for install to commence.</td></row>
		<row><td>LaunchCondition</td><td>Description</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Localizable text to display when condition fails and install must abort.</td></row>
		<row><td>ListBox</td><td>Order</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>A positive integer used to determine the ordering of the items within one list..The integers do not have to be consecutive.</td></row>
		<row><td>ListBox</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A named property to be tied to this item. All the items tied to the same property become part of the same listbox.</td></row>
		<row><td>ListBox</td><td>Text</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The visible text to be assigned to the item. Optional. If this entry or the entire column is missing, the text is the same as the value.</td></row>
		<row><td>ListBox</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The value string associated with this item. Selecting the line will set the associated property to this value.</td></row>
		<row><td>ListView</td><td>Binary_</td><td>Y</td><td/><td/><td>Binary</td><td>1</td><td>Identifier</td><td/><td>The name of the icon to be displayed with the icon. The binary information is looked up from the Binary Table.</td></row>
		<row><td>ListView</td><td>Order</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>A positive integer used to determine the ordering of the items within one list..The integers do not have to be consecutive.</td></row>
		<row><td>ListView</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A named property to be tied to this item. All the items tied to the same property become part of the same listview.</td></row>
		<row><td>ListView</td><td>Text</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The visible text to be assigned to the item. Optional. If this entry or the entire column is missing, the text is the same as the value.</td></row>
		<row><td>ListView</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The value string associated with this item. Selecting the line will set the associated property to this value.</td></row>
		<row><td>LockPermissions</td><td>Domain</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Domain name for user whose permissions are being set. (usually a property)</td></row>
		<row><td>LockPermissions</td><td>LockObject</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into Registry or File table</td></row>
		<row><td>LockPermissions</td><td>Permission</td><td>Y</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Permission Access mask.  Full Control = 268435456 (GENERIC_ALL = 0x10000000)</td></row>
		<row><td>LockPermissions</td><td>Table</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td>Directory;File;Registry</td><td>Reference to another table name</td></row>
		<row><td>LockPermissions</td><td>User</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>User for permissions to be set.  (usually a property)</td></row>
		<row><td>MIME</td><td>CLSID</td><td>Y</td><td/><td/><td>Class</td><td>1</td><td>Guid</td><td/><td>Optional associated CLSID.</td></row>
		<row><td>MIME</td><td>ContentType</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Primary key. Context identifier, typically "type/format".</td></row>
		<row><td>MIME</td><td>Extension_</td><td>N</td><td/><td/><td>Extension</td><td>1</td><td>Text</td><td/><td>Optional associated extension (without dot)</td></row>
		<row><td>Media</td><td>Cabinet</td><td>Y</td><td/><td/><td/><td/><td>Cabinet</td><td/><td>If some or all of the files stored on the media are compressed in a cabinet, the name of that cabinet.</td></row>
		<row><td>Media</td><td>DiskId</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>Primary key, integer to determine sort order for table.</td></row>
		<row><td>Media</td><td>DiskPrompt</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Disk name: the visible text actually printed on the disk.  This will be used to prompt the user when this disk needs to be inserted.</td></row>
		<row><td>Media</td><td>LastSequence</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>File sequence number for the last file for this media.</td></row>
		<row><td>Media</td><td>Source</td><td>Y</td><td/><td/><td/><td/><td>Property</td><td/><td>The property defining the location of the cabinet file.</td></row>
		<row><td>Media</td><td>VolumeLabel</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The label attributed to the volume.</td></row>
		<row><td>MoveFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>If this component is not "selected" for installation or removal, no action will be taken on the associated MoveFile entry</td></row>
		<row><td>MoveFile</td><td>DestFolder</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of a property whose value is assumed to resolve to the full path to the destination directory</td></row>
		<row><td>MoveFile</td><td>DestName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Name to be given to the original file after it is moved or copied.  If blank, the destination file will be given the same name as the source file</td></row>
		<row><td>MoveFile</td><td>FileKey</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key that uniquely identifies a particular MoveFile record</td></row>
		<row><td>MoveFile</td><td>Options</td><td>N</td><td>0</td><td>1</td><td/><td/><td/><td/><td>Integer value specifying the MoveFile operating mode, one of imfoEnum</td></row>
		<row><td>MoveFile</td><td>SourceFolder</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of a property whose value is assumed to resolve to the full path to the source directory</td></row>
		<row><td>MoveFile</td><td>SourceName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the source file(s) to be moved or copied.  Can contain the '*' or '?' wildcards.</td></row>
		<row><td>MsiAssembly</td><td>Attributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Assembly attributes</td></row>
		<row><td>MsiAssembly</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Component table.</td></row>
		<row><td>MsiAssembly</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Feature table.</td></row>
		<row><td>MsiAssembly</td><td>File_Application</td><td>Y</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into File table, denoting the application context for private assemblies. Null for global assemblies.</td></row>
		<row><td>MsiAssembly</td><td>File_Manifest</td><td>Y</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the File table denoting the manifest file for the assembly.</td></row>
		<row><td>MsiAssemblyName</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into Component table.</td></row>
		<row><td>MsiAssemblyName</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name part of the name-value pairs for the assembly name.</td></row>
		<row><td>MsiAssemblyName</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The value part of the name-value pairs for the assembly name.</td></row>
		<row><td>MsiDigitalCertificate</td><td>CertData</td><td>N</td><td/><td/><td/><td/><td>Binary</td><td/><td>A certificate context blob for a signer certificate</td></row>
		<row><td>MsiDigitalCertificate</td><td>DigitalCertificate</td><td>N</td><td/><td/><td>MsiPackageCertificate</td><td>2</td><td>Identifier</td><td/><td>A unique identifier for the row</td></row>
		<row><td>MsiDigitalSignature</td><td>DigitalCertificate_</td><td>N</td><td/><td/><td>MsiDigitalCertificate</td><td>1</td><td>Identifier</td><td/><td>Foreign key to MsiDigitalCertificate table identifying the signer certificate</td></row>
		<row><td>MsiDigitalSignature</td><td>Hash</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>The encoded hash blob from the digital signature</td></row>
		<row><td>MsiDigitalSignature</td><td>SignObject</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Foreign key to Media table</td></row>
		<row><td>MsiDigitalSignature</td><td>Table</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Reference to another table name (only Media table is supported)</td></row>
		<row><td>MsiDriverPackages</td><td>Component</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Primary key used to identify a particular component record.</td></row>
		<row><td>MsiDriverPackages</td><td>Flags</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Driver package flags</td></row>
		<row><td>MsiDriverPackages</td><td>ReferenceComponents</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>MsiDriverPackages</td><td>Sequence</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>Installation sequence number</td></row>
		<row><td>MsiEmbeddedChainer</td><td>CommandLine</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td/></row>
		<row><td>MsiEmbeddedChainer</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Condition</td><td/><td/></row>
		<row><td>MsiEmbeddedChainer</td><td>MsiEmbeddedChainer</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td/></row>
		<row><td>MsiEmbeddedChainer</td><td>Source</td><td>N</td><td/><td/><td/><td/><td>CustomSource</td><td/><td/></row>
		<row><td>MsiEmbeddedChainer</td><td>Type</td><td>Y</td><td/><td/><td/><td/><td>Integer</td><td>2;18;50</td><td/></row>
		<row><td>MsiEmbeddedUI</td><td>Attributes</td><td>N</td><td>0</td><td>3</td><td/><td/><td>Integer</td><td/><td>Information about the data in the Data column.</td></row>
		<row><td>MsiEmbeddedUI</td><td>Data</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>This column contains binary information.</td></row>
		<row><td>MsiEmbeddedUI</td><td>FileName</td><td>N</td><td/><td/><td/><td/><td>Filename</td><td/><td>The name of the file that receives the binary information in the Data column.</td></row>
		<row><td>MsiEmbeddedUI</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>MsiEmbeddedUI</td><td>MessageFilter</td><td>Y</td><td>0</td><td>234913791</td><td/><td/><td>Integer</td><td/><td>Specifies the types of messages that are sent to the user interface DLL. This column is only relevant for rows with the msidbEmbeddedUI attribute.</td></row>
		<row><td>MsiEmbeddedUI</td><td>MsiEmbeddedUI</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The primary key for the table.</td></row>
		<row><td>MsiFileHash</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Primary key, foreign key into File table referencing file with this hash</td></row>
		<row><td>MsiFileHash</td><td>HashPart1</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Size of file in bytes (long integer).</td></row>
		<row><td>MsiFileHash</td><td>HashPart2</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Size of file in bytes (long integer).</td></row>
		<row><td>MsiFileHash</td><td>HashPart3</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Size of file in bytes (long integer).</td></row>
		<row><td>MsiFileHash</td><td>HashPart4</td><td>N</td><td/><td/><td/><td/><td/><td/><td>Size of file in bytes (long integer).</td></row>
		<row><td>MsiFileHash</td><td>Options</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Various options and attributes for this hash.</td></row>
		<row><td>MsiLockPermissionsEx</td><td>Condition</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Expression which must evaluate to TRUE in order for this set of permissions to be applied</td></row>
		<row><td>MsiLockPermissionsEx</td><td>LockObject</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into Registry, File, CreateFolder, or ServiceInstall table</td></row>
		<row><td>MsiLockPermissionsEx</td><td>MsiLockPermissionsEx</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token</td></row>
		<row><td>MsiLockPermissionsEx</td><td>SDDLText</td><td>N</td><td/><td/><td/><td/><td>FormattedSDDLText</td><td/><td>String to indicate permissions to be applied to the LockObject</td></row>
		<row><td>MsiLockPermissionsEx</td><td>Table</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td>CreateFolder;File;Registry;ServiceInstall</td><td>Reference to another table name</td></row>
		<row><td>MsiPackageCertificate</td><td>DigitalCertificate_</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A foreign key to the digital certificate table</td></row>
		<row><td>MsiPackageCertificate</td><td>PackageCertificate</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A unique identifier for the row</td></row>
		<row><td>MsiPatchCertificate</td><td>DigitalCertificate_</td><td>N</td><td/><td/><td>MsiDigitalCertificate</td><td>1</td><td>Identifier</td><td/><td>A foreign key to the digital certificate table</td></row>
		<row><td>MsiPatchCertificate</td><td>PatchCertificate</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A unique identifier for the row</td></row>
		<row><td>MsiPatchMetadata</td><td>Company</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Optional company name</td></row>
		<row><td>MsiPatchMetadata</td><td>PatchConfiguration_</td><td>N</td><td/><td/><td>ISPatchConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key to the ISPatchConfiguration table</td></row>
		<row><td>MsiPatchMetadata</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the metadata</td></row>
		<row><td>MsiPatchMetadata</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Value of the metadata</td></row>
		<row><td>MsiPatchOldAssemblyFile</td><td>Assembly_</td><td>Y</td><td/><td/><td>MsiPatchOldAssemblyName</td><td>1</td><td/><td/><td/></row>
		<row><td>MsiPatchOldAssemblyFile</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td/><td/><td/></row>
		<row><td>MsiPatchOldAssemblyName</td><td>Assembly</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>MsiPatchOldAssemblyName</td><td>Name</td><td>N</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>MsiPatchOldAssemblyName</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td/><td/><td/></row>
		<row><td>MsiPatchSequence</td><td>PatchConfiguration_</td><td>N</td><td/><td/><td>ISPatchConfiguration</td><td>1</td><td>Text</td><td/><td>Foreign key to the patch configuration table</td></row>
		<row><td>MsiPatchSequence</td><td>PatchFamily</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the family to which this patch belongs</td></row>
		<row><td>MsiPatchSequence</td><td>Sequence</td><td>N</td><td/><td/><td/><td/><td>Version</td><td/><td>The version of this patch in this family</td></row>
		<row><td>MsiPatchSequence</td><td>Supersede</td><td>N</td><td/><td/><td/><td/><td>Integer</td><td/><td>Supersede</td></row>
		<row><td>MsiPatchSequence</td><td>Target</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Target product codes for this patch family</td></row>
		<row><td>MsiServiceConfig</td><td>Argument</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Argument(s) for service configuration. Value depends on the content of the ConfigType field</td></row>
		<row><td>MsiServiceConfig</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Component Table that controls the configuration of the service</td></row>
		<row><td>MsiServiceConfig</td><td>ConfigType</td><td>N</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Service Configuration Option</td></row>
		<row><td>MsiServiceConfig</td><td>Event</td><td>N</td><td>0</td><td>7</td><td/><td/><td/><td/><td>Bit field:   0x1 = Install, 0x2 = Uninstall, 0x4 = Reinstall</td></row>
		<row><td>MsiServiceConfig</td><td>MsiServiceConfig</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>MsiServiceConfig</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Name of a service. /, \, comma and space are invalid</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>Actions</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>A list of integer actions separated by [~] delimiters: 0 = SC_ACTION_NONE, 1 = SC_ACTION_RESTART, 2 = SC_ACTION_REBOOT, 3 = SC_ACTION_RUN_COMMAND. Terminate with [~][~]</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>Command</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Command line of the process to CreateProcess function to execute</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Component Table that controls the configuration of the service</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>DelayActions</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>A list of delays (time in milli-seconds), separated by [~] delmiters, to wait before taking the corresponding Action. Terminate with [~][~]</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>Event</td><td>N</td><td>0</td><td>7</td><td/><td/><td/><td/><td>Bit field:   0x1 = Install, 0x2 = Uninstall, 0x4 = Reinstall</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>MsiServiceConfigFailureActions</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Name of a service. /, \, comma and space are invalid</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>RebootMessage</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Message to be broadcast to server users before rebooting</td></row>
		<row><td>MsiServiceConfigFailureActions</td><td>ResetPeriod</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>Time in seconds after which to reset the failure count to zero. Leave blank if it should never be reset</td></row>
		<row><td>MsiShortcutProperty</td><td>MsiShortcutProperty</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token</td></row>
		<row><td>MsiShortcutProperty</td><td>PropVariantValue</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>String representation of the value in the property</td></row>
		<row><td>MsiShortcutProperty</td><td>PropertyKey</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Canonical string representation of the Property Key being set</td></row>
		<row><td>MsiShortcutProperty</td><td>Shortcut_</td><td>N</td><td/><td/><td>Shortcut</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Shortcut table</td></row>
		<row><td>ODBCAttribute</td><td>Attribute</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of ODBC driver attribute</td></row>
		<row><td>ODBCAttribute</td><td>Driver_</td><td>N</td><td/><td/><td>ODBCDriver</td><td>1</td><td>Identifier</td><td/><td>Reference to ODBC driver in ODBCDriver table</td></row>
		<row><td>ODBCAttribute</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Value for ODBC driver attribute</td></row>
		<row><td>ODBCDataSource</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Reference to associated component</td></row>
		<row><td>ODBCDataSource</td><td>DataSource</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized.internal token for data source</td></row>
		<row><td>ODBCDataSource</td><td>Description</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Text used as registered name for data source</td></row>
		<row><td>ODBCDataSource</td><td>DriverDescription</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Reference to driver description, may be existing driver</td></row>
		<row><td>ODBCDataSource</td><td>Registration</td><td>N</td><td>0</td><td>1</td><td/><td/><td/><td/><td>Registration option: 0=machine, 1=user, others t.b.d.</td></row>
		<row><td>ODBCDriver</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Reference to associated component</td></row>
		<row><td>ODBCDriver</td><td>Description</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Text used as registered name for driver, non-localized</td></row>
		<row><td>ODBCDriver</td><td>Driver</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized.internal token for driver</td></row>
		<row><td>ODBCDriver</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Reference to key driver file</td></row>
		<row><td>ODBCDriver</td><td>File_Setup</td><td>Y</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Optional reference to key driver setup DLL</td></row>
		<row><td>ODBCSourceAttribute</td><td>Attribute</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of ODBC data source attribute</td></row>
		<row><td>ODBCSourceAttribute</td><td>DataSource_</td><td>N</td><td/><td/><td>ODBCDataSource</td><td>1</td><td>Identifier</td><td/><td>Reference to ODBC data source in ODBCDataSource table</td></row>
		<row><td>ODBCSourceAttribute</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Value for ODBC data source attribute</td></row>
		<row><td>ODBCTranslator</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Reference to associated component</td></row>
		<row><td>ODBCTranslator</td><td>Description</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>Text used as registered name for translator</td></row>
		<row><td>ODBCTranslator</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Reference to key translator file</td></row>
		<row><td>ODBCTranslator</td><td>File_Setup</td><td>Y</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Optional reference to key translator setup DLL</td></row>
		<row><td>ODBCTranslator</td><td>Translator</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized.internal token for translator</td></row>
		<row><td>Patch</td><td>Attributes</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Integer containing bit flags representing patch attributes</td></row>
		<row><td>Patch</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Primary key, non-localized token, foreign key to File table, must match identifier in cabinet.</td></row>
		<row><td>Patch</td><td>Header</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>Binary stream. The patch header, used for patch validation.</td></row>
		<row><td>Patch</td><td>ISBuildSourcePath</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Full path to patch header.</td></row>
		<row><td>Patch</td><td>PatchSize</td><td>N</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>Size of patch in bytes (long integer).</td></row>
		<row><td>Patch</td><td>Sequence</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Primary key, sequence with respect to the media images; order must track cabinet order.</td></row>
		<row><td>Patch</td><td>StreamRef_</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>External key into the MsiPatchHeaders table specifying the row that contains the patch header stream.</td></row>
		<row><td>PatchPackage</td><td>Media_</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Foreign key to DiskId column of Media table. Indicates the disk containing the patch package.</td></row>
		<row><td>PatchPackage</td><td>PatchId</td><td>N</td><td/><td/><td/><td/><td>Guid</td><td/><td>A unique string GUID representing this patch.</td></row>
		<row><td>ProgId</td><td>Class_</td><td>Y</td><td/><td/><td>Class</td><td>1</td><td>Guid</td><td/><td>The CLSID of an OLE factory corresponding to the ProgId.</td></row>
		<row><td>ProgId</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Localized description for the Program identifier.</td></row>
		<row><td>ProgId</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store Installshield custom properties of a component, like ExtractIcon, etc.</td></row>
		<row><td>ProgId</td><td>IconIndex</td><td>Y</td><td>-32767</td><td>32767</td><td/><td/><td/><td/><td>Optional icon index.</td></row>
		<row><td>ProgId</td><td>Icon_</td><td>Y</td><td/><td/><td>Icon</td><td>1</td><td>Identifier</td><td/><td>Optional foreign key into the Icon Table, specifying the icon file associated with this ProgId. Will be written under the DefaultIcon key.</td></row>
		<row><td>ProgId</td><td>ProgId</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The Program Identifier. Primary key.</td></row>
		<row><td>ProgId</td><td>ProgId_Parent</td><td>Y</td><td/><td/><td>ProgId</td><td>1</td><td>Text</td><td/><td>The Parent Program Identifier. If specified, the ProgId column becomes a version independent prog id.</td></row>
		<row><td>Property</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>User Comments.</td></row>
		<row><td>Property</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of property, uppercase if settable by launcher or loader.</td></row>
		<row><td>Property</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>String value for property.</td></row>
		<row><td>PublishComponent</td><td>AppData</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>This is localisable Application specific data that can be associated with a Qualified Component.</td></row>
		<row><td>PublishComponent</td><td>ComponentId</td><td>N</td><td/><td/><td/><td/><td>Guid</td><td/><td>A string GUID that represents the component id that will be requested by the alien product.</td></row>
		<row><td>PublishComponent</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table.</td></row>
		<row><td>PublishComponent</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Feature table.</td></row>
		<row><td>PublishComponent</td><td>Qualifier</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>This is defined only when the ComponentId column is an Qualified Component Id. This is the Qualifier for ProvideComponentIndirect.</td></row>
		<row><td>RadioButton</td><td>Height</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The height of the button.</td></row>
		<row><td>RadioButton</td><td>Help</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The help strings used with the button. The text is optional.</td></row>
		<row><td>RadioButton</td><td>ISControlId</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>A number used to represent the control ID of the Control, Used in Dialog export</td></row>
		<row><td>RadioButton</td><td>Order</td><td>N</td><td>1</td><td>32767</td><td/><td/><td/><td/><td>A positive integer used to determine the ordering of the items within one list..The integers do not have to be consecutive.</td></row>
		<row><td>RadioButton</td><td>Property</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A named property to be tied to this radio button. All the buttons tied to the same property become part of the same group.</td></row>
		<row><td>RadioButton</td><td>Text</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The visible title to be assigned to the radio button.</td></row>
		<row><td>RadioButton</td><td>Value</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The value string associated with this button. Selecting the button will set the associated property to this value.</td></row>
		<row><td>RadioButton</td><td>Width</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The width of the button.</td></row>
		<row><td>RadioButton</td><td>X</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The horizontal coordinate of the upper left corner of the bounding rectangle of the radio button.</td></row>
		<row><td>RadioButton</td><td>Y</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The vertical coordinate of the upper left corner of the bounding rectangle of the radio button.</td></row>
		<row><td>RegLocator</td><td>Key</td><td>N</td><td/><td/><td/><td/><td>RegPath</td><td/><td>The key for the registry value.</td></row>
		<row><td>RegLocator</td><td>Name</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The registry value name.</td></row>
		<row><td>RegLocator</td><td>Root</td><td>N</td><td>0</td><td>3</td><td/><td/><td/><td/><td>The predefined root key for the registry value, one of rrkEnum.</td></row>
		<row><td>RegLocator</td><td>Signature_</td><td>N</td><td/><td/><td>Signature</td><td>1</td><td>Identifier</td><td/><td>The table key. The Signature_ represents a unique file signature and is also the foreign key in the Signature table. If the type is 0, the registry values refers a directory, and _Signature is not a foreign key.</td></row>
		<row><td>RegLocator</td><td>Type</td><td>Y</td><td>0</td><td>18</td><td/><td/><td/><td/><td>An integer value that determines if the registry value is a filename or a directory location or to be used as is w/o interpretation.</td></row>
		<row><td>Registry</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table referencing component that controls the installing of the registry value.</td></row>
		<row><td>Registry</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store Installshield custom properties of a registry item.  Currently the only one is Automatic.</td></row>
		<row><td>Registry</td><td>Key</td><td>N</td><td/><td/><td/><td/><td>RegPath</td><td/><td>The key for the registry value.</td></row>
		<row><td>Registry</td><td>Name</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The registry value name.</td></row>
		<row><td>Registry</td><td>Registry</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>Registry</td><td>Root</td><td>N</td><td>-1</td><td>3</td><td/><td/><td/><td/><td>The predefined root key for the registry value, one of rrkEnum.</td></row>
		<row><td>Registry</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The registry value.</td></row>
		<row><td>RemoveFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key referencing Component that controls the file to be removed.</td></row>
		<row><td>RemoveFile</td><td>DirProperty</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of a property whose value is assumed to resolve to the full pathname to the folder of the file to be removed.</td></row>
		<row><td>RemoveFile</td><td>FileKey</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key used to identify a particular file entry</td></row>
		<row><td>RemoveFile</td><td>FileName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Name of the file to be removed.</td></row>
		<row><td>RemoveFile</td><td>InstallMode</td><td>N</td><td/><td/><td/><td/><td/><td>1;2;3</td><td>Installation option, one of iimEnum.</td></row>
		<row><td>RemoveIniFile</td><td>Action</td><td>N</td><td/><td/><td/><td/><td/><td>2;4</td><td>The type of modification to be made, one of iifEnum.</td></row>
		<row><td>RemoveIniFile</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table referencing component that controls the deletion of the .INI value.</td></row>
		<row><td>RemoveIniFile</td><td>DirProperty</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Foreign key into the Directory table denoting the directory where the .INI file is.</td></row>
		<row><td>RemoveIniFile</td><td>FileName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The .INI file name in which to delete the information</td></row>
		<row><td>RemoveIniFile</td><td>Key</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The .INI file key below Section.</td></row>
		<row><td>RemoveIniFile</td><td>RemoveIniFile</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>RemoveIniFile</td><td>Section</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The .INI file Section.</td></row>
		<row><td>RemoveIniFile</td><td>Value</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The value to be deleted. The value is required when Action is iifIniRemoveTag</td></row>
		<row><td>RemoveRegistry</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table referencing component that controls the deletion of the registry value.</td></row>
		<row><td>RemoveRegistry</td><td>Key</td><td>N</td><td/><td/><td/><td/><td>RegPath</td><td/><td>The key for the registry value.</td></row>
		<row><td>RemoveRegistry</td><td>Name</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The registry value name.</td></row>
		<row><td>RemoveRegistry</td><td>RemoveRegistry</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>RemoveRegistry</td><td>Root</td><td>N</td><td>-1</td><td>3</td><td/><td/><td/><td/><td>The predefined root key for the registry value, one of rrkEnum</td></row>
		<row><td>ReserveCost</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Reserve a specified amount of space if this component is to be installed.</td></row>
		<row><td>ReserveCost</td><td>ReserveFolder</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of a property whose value is assumed to resolve to the full path to the destination directory</td></row>
		<row><td>ReserveCost</td><td>ReserveKey</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key that uniquely identifies a particular ReserveCost record</td></row>
		<row><td>ReserveCost</td><td>ReserveLocal</td><td>N</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>Disk space to reserve if linked component is installed locally.</td></row>
		<row><td>ReserveCost</td><td>ReserveSource</td><td>N</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>Disk space to reserve if linked component is installed to run from the source location.</td></row>
		<row><td>SFPCatalog</td><td>Catalog</td><td>Y</td><td/><td/><td/><td/><td>Binary</td><td/><td>SFP Catalog</td></row>
		<row><td>SFPCatalog</td><td>Dependency</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Parent catalog - only used by SFP</td></row>
		<row><td>SFPCatalog</td><td>SFPCatalog</td><td>N</td><td/><td/><td/><td/><td>Filename</td><td/><td>File name for the catalog.</td></row>
		<row><td>SelfReg</td><td>Cost</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The cost of registering the module.</td></row>
		<row><td>SelfReg</td><td>File_</td><td>N</td><td/><td/><td>File</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the File table denoting the module that needs to be registered.</td></row>
		<row><td>ServiceControl</td><td>Arguments</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Arguments for the service.  Separate by [~].</td></row>
		<row><td>ServiceControl</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Component Table that controls the startup of the service</td></row>
		<row><td>ServiceControl</td><td>Event</td><td>N</td><td>0</td><td>187</td><td/><td/><td/><td/><td>Bit field:  Install:  0x1 = Start, 0x2 = Stop, 0x8 = Delete, Uninstall: 0x10 = Start, 0x20 = Stop, 0x80 = Delete</td></row>
		<row><td>ServiceControl</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Name of a service. /, \, comma and space are invalid</td></row>
		<row><td>ServiceControl</td><td>ServiceControl</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>ServiceControl</td><td>Wait</td><td>Y</td><td>0</td><td>1</td><td/><td/><td/><td/><td>Boolean for whether to wait for the service to fully start</td></row>
		<row><td>ServiceInstall</td><td>Arguments</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Arguments to include in every start of the service, passed to WinMain</td></row>
		<row><td>ServiceInstall</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Component Table that controls the startup of the service</td></row>
		<row><td>ServiceInstall</td><td>Dependencies</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Other services this depends on to start.  Separate by [~], and end with [~][~]</td></row>
		<row><td>ServiceInstall</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Description of service.</td></row>
		<row><td>ServiceInstall</td><td>DisplayName</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>External Name of the Service</td></row>
		<row><td>ServiceInstall</td><td>ErrorControl</td><td>N</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Severity of error if service fails to start</td></row>
		<row><td>ServiceInstall</td><td>LoadOrderGroup</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>LoadOrderGroup</td></row>
		<row><td>ServiceInstall</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Internal Name of the Service</td></row>
		<row><td>ServiceInstall</td><td>Password</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>password to run service with.  (with StartName)</td></row>
		<row><td>ServiceInstall</td><td>ServiceInstall</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>ServiceInstall</td><td>ServiceType</td><td>N</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Type of the service</td></row>
		<row><td>ServiceInstall</td><td>StartName</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>User or object name to run service as</td></row>
		<row><td>ServiceInstall</td><td>StartType</td><td>N</td><td>0</td><td>4</td><td/><td/><td/><td/><td>Type of the service</td></row>
		<row><td>Shortcut</td><td>Arguments</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The command-line arguments for the shortcut.</td></row>
		<row><td>Shortcut</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Component table denoting the component whose selection gates the the shortcut creation/deletion.</td></row>
		<row><td>Shortcut</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The description for the shortcut.</td></row>
		<row><td>Shortcut</td><td>DescriptionResourceDLL</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>This field contains a Formatted string value for the full path to the language neutral file that contains the MUI manifest.</td></row>
		<row><td>Shortcut</td><td>DescriptionResourceId</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The description name index for the shortcut.</td></row>
		<row><td>Shortcut</td><td>Directory_</td><td>N</td><td/><td/><td>Directory</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the Directory table denoting the directory where the shortcut file is created.</td></row>
		<row><td>Shortcut</td><td>DisplayResourceDLL</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>This field contains a Formatted string value for the full path to the language neutral file that contains the MUI manifest.</td></row>
		<row><td>Shortcut</td><td>DisplayResourceId</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The display name index for the shortcut.</td></row>
		<row><td>Shortcut</td><td>Hotkey</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The hotkey for the shortcut. It has the virtual-key code for the key in the low-order byte, and the modifier flags in the high-order byte.</td></row>
		<row><td>Shortcut</td><td>ISAttributes</td><td>Y</td><td/><td/><td/><td/><td/><td/><td>This is used to store Installshield custom properties of a shortcut.  Mainly used in pro project types.</td></row>
		<row><td>Shortcut</td><td>ISComments</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Author’s comments on this Shortcut.</td></row>
		<row><td>Shortcut</td><td>ISShortcutName</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>A non-unique name for the shortcut.  Mainly used by pro pro project types.</td></row>
		<row><td>Shortcut</td><td>IconIndex</td><td>Y</td><td>-32767</td><td>32767</td><td/><td/><td/><td/><td>The icon index for the shortcut.</td></row>
		<row><td>Shortcut</td><td>Icon_</td><td>Y</td><td/><td/><td>Icon</td><td>1</td><td>Identifier</td><td/><td>Foreign key into the File table denoting the external icon file for the shortcut.</td></row>
		<row><td>Shortcut</td><td>Name</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the shortcut to be created.</td></row>
		<row><td>Shortcut</td><td>Shortcut</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Primary key, non-localized token.</td></row>
		<row><td>Shortcut</td><td>ShowCmd</td><td>Y</td><td/><td/><td/><td/><td/><td>1;3;7</td><td>The show command for the application window.The following values may be used.</td></row>
		<row><td>Shortcut</td><td>Target</td><td>N</td><td/><td/><td/><td/><td>Shortcut</td><td/><td>The shortcut target. This is usually a property that is expanded to a file or a folder that the shortcut points to.</td></row>
		<row><td>Shortcut</td><td>WkDir</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of property defining location of working directory.</td></row>
		<row><td>Signature</td><td>FileName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The name of the file. This may contain a "short name|long name" pair.</td></row>
		<row><td>Signature</td><td>Languages</td><td>Y</td><td/><td/><td/><td/><td>Language</td><td/><td>The languages supported by the file.</td></row>
		<row><td>Signature</td><td>MaxDate</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The maximum creation date of the file.</td></row>
		<row><td>Signature</td><td>MaxSize</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The maximum size of the file.</td></row>
		<row><td>Signature</td><td>MaxVersion</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The maximum version of the file.</td></row>
		<row><td>Signature</td><td>MinDate</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The minimum creation date of the file.</td></row>
		<row><td>Signature</td><td>MinSize</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The minimum size of the file.</td></row>
		<row><td>Signature</td><td>MinVersion</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The minimum version of the file.</td></row>
		<row><td>Signature</td><td>Signature</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>The table key. The Signature represents a unique file signature.</td></row>
		<row><td>TextStyle</td><td>Color</td><td>Y</td><td>0</td><td>16777215</td><td/><td/><td/><td/><td>A long integer indicating the color of the string in the RGB format (Red, Green, Blue each 0-255, RGB = R + 256*G + 256^2*B).</td></row>
		<row><td>TextStyle</td><td>FaceName</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>A string indicating the name of the font used. Required. The string must be at most 31 characters long.</td></row>
		<row><td>TextStyle</td><td>Size</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The size of the font used. This size is given in our units (1/12 of the system font height). Assuming that the system font is set to 12 point size, this is equivalent to the point size.</td></row>
		<row><td>TextStyle</td><td>StyleBits</td><td>Y</td><td>0</td><td>15</td><td/><td/><td/><td/><td>A combination of style bits.</td></row>
		<row><td>TextStyle</td><td>TextStyle</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of the style. The primary key of this table. This name is embedded in the texts to indicate a style change.</td></row>
		<row><td>TypeLib</td><td>Component_</td><td>N</td><td/><td/><td>Component</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Component Table, specifying the component for which to return a path when called through LocateComponent.</td></row>
		<row><td>TypeLib</td><td>Cost</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The cost associated with the registration of the typelib. This column is currently optional.</td></row>
		<row><td>TypeLib</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td/></row>
		<row><td>TypeLib</td><td>Directory_</td><td>Y</td><td/><td/><td>Directory</td><td>1</td><td>Identifier</td><td/><td>Optional. The foreign key into the Directory table denoting the path to the help file for the type library.</td></row>
		<row><td>TypeLib</td><td>Feature_</td><td>N</td><td/><td/><td>Feature</td><td>1</td><td>Identifier</td><td/><td>Required foreign key into the Feature Table, specifying the feature to validate or install in order for the type library to be operational.</td></row>
		<row><td>TypeLib</td><td>Language</td><td>N</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>The language of the library.</td></row>
		<row><td>TypeLib</td><td>LibID</td><td>N</td><td/><td/><td/><td/><td>Guid</td><td/><td>The GUID that represents the library.</td></row>
		<row><td>TypeLib</td><td>Version</td><td>Y</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The version of the library. The major version is in the upper 8 bits of the short integer. The minor version is in the lower 8 bits.</td></row>
		<row><td>UIText</td><td>Key</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>A unique key that identifies the particular string.</td></row>
		<row><td>UIText</td><td>Text</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The localized version of the string.</td></row>
		<row><td>Upgrade</td><td>ActionProperty</td><td>N</td><td/><td/><td/><td/><td>UpperCase</td><td/><td>The property to set when a product in this set is found.</td></row>
		<row><td>Upgrade</td><td>Attributes</td><td>N</td><td>0</td><td>2147483647</td><td/><td/><td/><td/><td>The attributes of this product set.</td></row>
		<row><td>Upgrade</td><td>ISDisplayName</td><td>Y</td><td/><td/><td>ISUpgradeMsiItem</td><td>1</td><td/><td/><td/></row>
		<row><td>Upgrade</td><td>Language</td><td>Y</td><td/><td/><td/><td/><td>Language</td><td/><td>A comma-separated list of languages for either products in this set or products not in this set.</td></row>
		<row><td>Upgrade</td><td>Remove</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The list of features to remove when uninstalling a product from this set.  The default is "ALL".</td></row>
		<row><td>Upgrade</td><td>UpgradeCode</td><td>N</td><td/><td/><td/><td/><td>Guid</td><td/><td>The UpgradeCode GUID belonging to the products in this set.</td></row>
		<row><td>Upgrade</td><td>VersionMax</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The maximum ProductVersion of the products in this set.  The set may or may not include products with this particular version.</td></row>
		<row><td>Upgrade</td><td>VersionMin</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>The minimum ProductVersion of the products in this set.  The set may or may not include products with this particular version.</td></row>
		<row><td>Verb</td><td>Argument</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>Optional value for the command arguments.</td></row>
		<row><td>Verb</td><td>Command</td><td>Y</td><td/><td/><td/><td/><td>Formatted</td><td/><td>The command text.</td></row>
		<row><td>Verb</td><td>Extension_</td><td>N</td><td/><td/><td>Extension</td><td>1</td><td>Text</td><td/><td>The extension associated with the table row.</td></row>
		<row><td>Verb</td><td>Sequence</td><td>Y</td><td>0</td><td>32767</td><td/><td/><td/><td/><td>Order within the verbs for a particular extension. Also used simply to specify the default verb.</td></row>
		<row><td>Verb</td><td>Verb</td><td>N</td><td/><td/><td/><td/><td>Text</td><td/><td>The verb for the command.</td></row>
		<row><td>_Validation</td><td>Category</td><td>Y</td><td/><td/><td/><td/><td/><td>"Text";"Formatted";"Template";"Condition";"Guid";"Path";"Version";"Language";"Identifier";"Binary";"UpperCase";"LowerCase";"Filename";"Paths";"AnyPath";"WildCardFilename";"RegPath";"KeyFormatted";"CustomSource";"Property";"Cabinet";"Shortcut";"URL";"DefaultDir"</td><td>String category</td></row>
		<row><td>_Validation</td><td>Column</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of column</td></row>
		<row><td>_Validation</td><td>Description</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Description of column</td></row>
		<row><td>_Validation</td><td>KeyColumn</td><td>Y</td><td>1</td><td>32</td><td/><td/><td/><td/><td>Column to which foreign key connects</td></row>
		<row><td>_Validation</td><td>KeyTable</td><td>Y</td><td/><td/><td/><td/><td>Identifier</td><td/><td>For foreign key, Name of table to which data must link</td></row>
		<row><td>_Validation</td><td>MaxValue</td><td>Y</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Maximum value allowed</td></row>
		<row><td>_Validation</td><td>MinValue</td><td>Y</td><td>-2147483647</td><td>2147483647</td><td/><td/><td/><td/><td>Minimum value allowed</td></row>
		<row><td>_Validation</td><td>Nullable</td><td>N</td><td/><td/><td/><td/><td/><td>Y;N;@</td><td>Whether the column is nullable</td></row>
		<row><td>_Validation</td><td>Set</td><td>Y</td><td/><td/><td/><td/><td>Text</td><td/><td>Set of values that are permitted</td></row>
		<row><td>_Validation</td><td>Table</td><td>N</td><td/><td/><td/><td/><td>Identifier</td><td/><td>Name of table</td></row>
	</table>
</msi>
