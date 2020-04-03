# stores values in local secrets store for development environment
# run this script from the root folder in this repository
# & ./scripts/set-secrets-local.ps1

Param(
	[Parameter(Mandatory = $true)][string] $B2cInstance,
	[Parameter(Mandatory = $true)][string] $ClientId,
	[Parameter(Mandatory = $true)][string] $CallbackPath,
	[Parameter(Mandatory = $true)][string] $Domain,
	[Parameter(Mandatory = $true)][string] $SignUpSignInPolicyId,
	[Parameter(Mandatory = $true)][string] $ResetPasswordPolicyId,
	[Parameter(Mandatory = $true)][string] $EditProfilePolicyId
)

Function Convert-ToUnsecureString {
	Param(
		[Parameter(Mandatory = $true)][securestring]$secureString
	)

	$Ptr = [System.Runtime.InteropServices.Marshal]::SecureStringToCoTaskMemUnicode($secureString)
	$result = [System.Runtime.InteropServices.Marshal]::PtrToStringUni($Ptr)
	[System.Runtime.InteropServices.Marshal]::ZeroFreeCoTaskMemUnicode($Ptr)

	return $result;
}

Function Set-LocalUserSecrets {
	# b2c configuration
	dotnet user-secrets set "AzureAdB2C:Instance" $B2cInstance;
	dotnet user-secrets set "AzureAdB2C:ClientId" $ClientId;
	dotnet user-secrets set "AzureAdB2C:CallbackPath" $CallbackPath;
	dotnet user-secrets set "AzureAdB2C:Domain" $Domain;
	dotnet user-secrets set "AzureAdB2C:SignUpSignInPolicyId" $SignUpSignInPolicyId;
	dotnet user-secrets set "AzureAdB2C:ResetPasswordPolicyId" $ResetPasswordPolicyId;
	dotnet user-secrets set "AzureAdB2C:EditProfilePolicyId" $EditProfilePolicyId;
}

# switch to where csproj exists
Set-Location -Path "src/RF.ServerApp/";

# only run this command first time
# dotnet user-secrets init

# load the secrets
Set-LocalUserSecrets;

# switch back to script directory
Set-Location -Path "../../";