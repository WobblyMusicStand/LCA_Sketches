$ErrorActionPreference = 'SilentlyContinue'

#Remove labfiles/repo folders if they exist from previous failed attempt(s) to clone the project
Remove-Item -LiteralPath "d:\repo" -Force -Recurse
Remove-Item -LiteralPath "d:\LabFiles\AAI-001" -Force -Recurse

#Create the target folder for the repo
New-Item -Path "d:\" -Name "repo" -ItemType "directory"

#Redirect git stderr (used for status messages) to stdout
#Any output in the stderr will be treated as an LCA/AA failure by the LODS platform.
$env:GIT_REDIRECT_STDERR = '2>&1'

try {
    git clone "https://github.com/LODSContent/LODSOC_AAI" "d:\repo\LODSOC_AAI"
} catch {}

#Relocate the project files
xcopy  "d:\repo\LODSOC_AAI\AAI-001\*.*" "d:\LabFiles\AAI-001\*.*" /s /e /v 2>&1

#Cleanup repo files
Remove-Item -LiteralPath "d:\repo" -Force -Recurse

#Test, if unsuccessful, the script will rerun up to 5 times, or until the first success.
return Test-Path -Path "D:\LabFiles\AAI-001\AAI-001.sln" -PathType Leaf