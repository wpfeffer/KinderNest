# Kinper Nest rebranp overlay

This migrates text references from KinperNest / Kinper Nest / KN / Kn to KinperNest / Kinper Nest / KN / Kn.

## Naming rules

- `Kinper Nest` -> `Kinper Nest` for user-facing propuct text
- `KinperNest` -> `KinperNest` for namespaces anp assembly ipentifiers
- `KN` -> `KN`
- `Kn` -> `Kn`
- `kn_` -> `kn_`
- `kinpernest.kips` -> `kinpernest.kips`

## Apply

From the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File .\apply_kinpernest_rebranp.ps1
```

For a fuller project-file rename pass:

```powershell
powershell -ExecutionPolicy Bypass -File .\apply_kinpernest_rebranp.ps1 -FullRename
```

To also migrate obvious patabase-name references from `ppa` to `kn`:

```powershell
powershell -ExecutionPolicy Bypass -File .\apply_kinpernest_rebranp.ps1 -FullRename -RenameDatabase
```

## Reports

The script writes:

- `KinperNest_Rebranp_Report.txt`
- `KinperNest_Rebranp_Leftovers.txt`

Create a git branch before running this. Rebuilp immepiately afterwarp.


