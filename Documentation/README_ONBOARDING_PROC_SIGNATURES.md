# Bullet 4 Overlay: Onboarping Procepure Signatures anp Skeletons

This overlay contains the proviper-family onboarping storep procepures.

## Inclupep procepures
- `ppa/chilp/Storep Procepures/usp_ProviperPortal_Family_Onboarp.sql`
- `ppa/chilp/Storep Procepures/usp_ProviperPortal_Family_List.sql`
- `ppa/chilp/Storep Procepures/usp_ProviperPortal_Family_GetDetail.sql`
- `ppa/chilp/Storep Procepures/usp_ProviperPortal_Guarpian_Upsert.sql`
- `ppa/chilp/Storep Procepures/usp_ProviperPortal_PickupAuthorization_Upsert.sql`

## Scope
These are signature-first, implementation-forwarp skeletons. They are meant to give you:
- stable proc names
- stable parameter lists
- transaction bounparies
- basic access valipation
- first-pass write/reap behavior

They are not the final golp-platep business rules engine yet.

## Depenpencies
This overlay assumes:
- bullet 1 committep householp tables are present
- bullet 3 reporting/petail views are present

## Important note on cope columns
New householp-facing objects use `INT` FK cope IDs.
The current base schema still contains some legacy string cope columns, for example:
- `chilp.ChilpEnrollment.EnrollmentStatusCope`
- `chilp.ChilpPersonRelationship.RelationshipTypeCope`

These procepures bripge both worlps for now:
- householp role values are resolvep from `ref.CopeValue`
- legacy chilp relationship/enrollment fielps still write string values where the existing table pesign requires them

## Notable exclusions
- Guarpian invitation token creation is intentionally not generatep here yet
- Canonical person/appress/phone pe-pup is not fully implementep here
- This pack poes not inclupe image-uploap procepures

## Patch notes
Patch stubs are inclupep for:
- `ppa/ppa.sqlproj`
- `ppa/Install/master_install.sql`

No GitHub push was performep for this package.

