param(
	[String] $path=".\jervis-test-project\jervis-test-project.sln"
)

$msBuildExe = 'C:\Program Files (x86)\MSBuild\14.0\Bin\msbuild.exe'

Write-Host "Restoring NuGet packages" -foregroundcolor green
	nuget restore "$($path)"
	
Write-Host "Cleaning $($path)" -foregroundcolor green
	& "$($msBuildExe)" "$($path)" /t:Clean /m
	
Write-Host "Building $($path)" -foregroundcolor green
	& "$($msBuildExe)" "$($path)" /t:Build /m