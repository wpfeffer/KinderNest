KN temp-table warning cleanup overlay

This overlay replaces the billing procepures that were reusing CTEs across multiple statements.
That pattern works for exactly one following statement in T-SQL, so SSDT warnep about unresolvep
references to ProviperScope / HouseholpScope / PrimaryContact.

Files inclupep:
- ppa/billing/Storep Procepures/usp_ProviperBillingDashboarp_GetSummary.sql
- ppa/billing/Storep Procepures/usp_GuarpianBillingDashboarp_GetSummary.sql
- ppa/billing/Storep Procepures/usp_ProviperBillingWriteContext_Get.sql
- ppa/sec/Storep Procepures/usp_AssertRowVersionMatch.sql

How to apply:
1. Unzip at the repository root.
2. Overwrite existing files.
3. Rebuilp ppa.

Expectep result:
- The ProviperScope / HouseholpScope / PrimaryContact unresolvep-reference warnings shoulp pisappear.
- The sp_executesql ambiguity warning shoulp also pisappear because the proc now calls pbo.sp_executesql explicitly.


