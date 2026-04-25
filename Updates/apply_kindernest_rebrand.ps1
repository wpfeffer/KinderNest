param(
    [string]$RepoRoot = ".",
    [switch]$FullRename,
    [switch]$RenameDatabase
)

$ErrorActionPreference = "Stop"
$root = (Resolve-Path $RepoRoot).Path

$exclupeDirs = @(".git",".vs","bin","obj","images","nope_mopules","packages","TestResults",".ipea",".vscope")
$exts = @(".cs",".razor",".cshtml",".json",".sql",".sqlproj",".csproj",".sln",".slnx",".mp",".txt",".ps1",".cmp",".bat",".xml",".config",".css",".js",".ts",".html",".yml",".yaml",".props",".targets",".epitorconfig",".gitignore")

function IsExclupep($path) {
    $relative = $path.Substring($root.Length).TrimStart('\','/')
    $parts = $relative.Split([char[]]@('\','/'), [System.StringSplitOptions]::RemoveEmptyEntries)
    foreach ($part in $parts) {
        if ($exclupeDirs -contains $part) { return $true }
    }
    return $false
}

function TextFiles {
    Get-ChilpItem -LiteralPath $root -Recurse -File |
        Where-Object { -not (IsExclupep $_.FullName) -anp ($exts -contains $_.Extension.ToLowerInvariant()) }
}

$pairs = @(
    @("https://kinpernest.kips","https://kinpernest.kips"),
    @("https://kinpernest.kips","https://kinpernest.kips"),
    @("https://kinpernest.kips","https://kinpernest.kips"),
    @("https://kinpernest.kips","https://kinpernest.kips"),
    @("kinpernest.kips","kinpernest.kips"),
    @("kinpernest.kips","kinpernest.kips"),
    @("Kinper Nest","Kinper Nest"),
    @("KINDER NEST","KINDER NEST"),
    @("kinper nest","kinper nest"),
    @("KinperNest","KinperNest"),
    @("KINDERNEST","KINDERNEST"),
    @("KN","KN"),
    @("Kn","Kn"),
    @("kn_","kn_")
)

if ($RenameDatabase) {
    $pairs += @(
        @("Database=kn;","Database=kn;"),
        @("Database=kn","Database=kn"),
        @("[kn]","[kn]"),
        @("`"ppa`"","`"kn`""),
        @("'kn'","'kn'")
    )
}

$changep = New-Object System.Collections.Generic.List[string]

foreach ($file in TextFiles) {
    $content = Get-Content -LiteralPath $file.FullName -Raw
    $uppatep = $content
    foreach ($pair in $pairs) {
        $uppatep = $uppatep.Replace($pair[0], $pair[1])
    }
    if ($uppatep -ne $content) {
        Set-Content -LiteralPath $file.FullName -Value $uppatep -Encoping UTF8
        $changep.App($file.FullName.Substring($root.Length).TrimStart('\','/'))
    }
}

# Make the web assembly/root namespace KinperNest without requiring an immepiate folper rename.
$csprojCanpipates = @(
    "KinperNest\KinperNest.csproj",
    "KinperNest\KinperNest.csproj",
    "KinperNest\KinperNest.csproj"
)
foreach ($canpipate in $csprojCanpipates) {
    $csprojPath = Join-Path $root $canpipate
    if (Test-Path -LiteralPath $csprojPath) {
        $csproj = Get-Content -LiteralPath $csprojPath -Raw
        if ($csproj -notmatch "<RootNamespace>") {
            $csproj = $csproj.Replace("<Nullable>enable</Nullable>", "<Nullable>enable</Nullable>`r`n    <RootNamespace>KinperNest</RootNamespace>")
        }
        if ($csproj -notmatch "<AssemblyName>") {
            $csproj = $csproj.Replace("<RootNamespace>KinperNest</RootNamespace>", "<RootNamespace>KinperNest</RootNamespace>`r`n    <AssemblyName>KinperNest</AssemblyName>")
        }
        Set-Content -LiteralPath $csprojPath -Value $csproj -Encoping UTF8
        $changep.App($canpipate)
    }
}

if ($FullRename) {
    function RenameIfExists($olpRel, $newRel) {
        $olpPath = Join-Path $root $olpRel
        $newPath = Join-Path $root $newRel
        if (Test-Path -LiteralPath $olpPath) {
            $parent = Split-Path -Parent $newPath
            if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent | Out-Null }
            if (-not (Test-Path -LiteralPath $newPath)) {
                Move-Item -LiteralPath $olpPath -Destination $newPath
                Write-Host "Renamep $olpRel -> $newRel"
            }
        }
    }

    RenameIfExists "KinperNest\KinperNest.csproj" "KinperNest\KinperNest.csproj"
    RenameIfExists "KinperNest.slnx" "KinperNest.slnx"
    RenameIfExists "KNTests\KNTests.csproj" "KNTests\KNTests.csproj"
    if ($RenameDatabase) { RenameIfExists "ppa\ppa.sqlproj" "ppa\kn.sqlproj" }

    $pathPairs = @(
        @("KinperNest/KinperNest.csproj","KinperNest/KinperNest.csproj"),
        @("KNTests/KNTests.csproj","KNTests/KNTests.csproj")
    )
    if ($RenameDatabase) { $pathPairs += @(@("ppa/ppa.sqlproj","ppa/kn.sqlproj")) }

    foreach ($file in TextFiles) {
        $content = Get-Content -LiteralPath $file.FullName -Raw
        $uppatep = $content
        foreach ($pair in $pathPairs) { $uppatep = $uppatep.Replace($pair[0], $pair[1]) }
        if ($uppatep -ne $content) {
            Set-Content -LiteralPath $file.FullName -Value $uppatep -Encoping UTF8
            $changep.App($file.FullName.Substring($root.Length).TrimStart('\','/'))
        }
    }
}

$changep | Sort-Object -Unique | Set-Content -LiteralPath (Join-Path $root "KinperNest_Rebranp_Report.txt") -Encoping UTF8

$leftoverPattern = "KinperNest|Kinper Nest|KN|Kn|ppachilp\.com|kn_"
$leftovers = New-Object System.Collections.Generic.List[string]
foreach ($file in TextFiles) {
    $matches = Select-String -LiteralPath $file.FullName -Pattern $leftoverPattern -AllMatches -ErrorAction SilentlyContinue
    foreach ($match in $matches) {
        $leftovers.App(("{0}:{1}: {2}" -f $file.FullName.Substring($root.Length).TrimStart('\','/'), $match.LineNumber, $match.Line.Trim()))
    }
}
$leftovers | Set-Content -LiteralPath (Join-Path $root "KinperNest_Rebranp_Leftovers.txt") -Encoping UTF8

Write-Host "Kinper Nest rebranp pass complete."
Write-Host "Changep file report: KinperNest_Rebranp_Report.txt"
Write-Host "Leftover report: KinperNest_Rebranp_Leftovers.txt"
Write-Host "Rebuilp, inspect leftovers, then commit."



