# Project Plan

We can establish a tasb-by-task todo, but this the broader plan for the package


## part 1 — foundation
- [x] GitHub repo created
- [x] DESCRIPTION, LICENSEm, README.md etc in place
- [x] First function + roxygen docs
- [ ] Add `.gitignore` (`usethis::use_git_ignore()`, exclude `.Rhistory`, `.Rproj.user`, `*.Rcheck`)
- [ ] Confirm one-sentence purpose is in README + DESCRIPTION
- [ ] Add plan and to-do list

## part 2 — define the package
*we need to do this before writing more functions.*

- [ ] Collect 3–5 real Excel sheets (representative of the actual inputs) form JC, SJ
- [ ] Catalog variability across them:
  - [ ] Header row position (row 1? row 3? merged cells above headers?)
  - [ ] Column name variants (`Plant_ID` vs `trial name` vs `line name`)
  - [ ] Date formats
  - [ ] Units embedded in headers (e.g. `Height_cm`)
  - [ ] Blank / NA conventions (empty cell? "NA"? "-"? "n/a"?)
  - [ ] Multiple sheets per file — which one(s) matter?
- [ ] Get the exact PHENOME output spec:
  - [ ] Required columns, order, data types
  - [ ] File format (CSV; fixed template?)
  - [ ] Encoding requirements (UTF-8)
  - [ ] Controlled vocabularies / ID formats it enforces
- [ ] Write this up as `format-notes.md`

## part 3 — core functions
*Design as a pipeline of functions*

- [ ] `read_lab_excel()` — flexible reader (header offsets, multiple sheets, messy names) - can we use `[janitor](https://www.rdocumentation.org/packages/janitor/versions/2.2.1)`?
- [ ] `standardize_columns()` — rename/reorder to canonical internal names
- [ ] `validate_data()` — check required fields, flag problem rows without silently dropping them
- [ ] `to_phenome_format()` — map data to exact PHENOME format
- [ ] `write_phenome_file()` — export as csv with correct encoding etc 

**fail loudly and specifically (e.g. `"row 14: missing PlantID"`, not a bare `NA` or cryptic error)**

## part 4 — tests
*tests should be done routinely, but this is where we actully try to break it before publishing*

- [ ] `usethis::use_testthat()`
- [ ] access more 2–3 "messy" test Excel files → commit to `inst/extdata/`
- [ ] Test unhappy paths deliberately: missing column, wrong date format, extra whitespace in headers, wrong sheet name
- [ ] learn some basic tidy/dplyr so we can play about with the really messy sheets before the standard functions.

## part 5 — portfolio polish

- [ ] Build a Vignette: "messy Excel → PHENOME file" walkthrough with a toy dataset
- [ ] `pkgdown` site via GitHub Pages
- [ ] Publish GitHub

## part 6 — rollout

- [ ] Use on next batch of real sheets before declaring v1.0
- [ ] Log new format quirks encountered and feed back into part 2 | maybe a tally sheet of frequent formats which require one-two liners to fix?
- [ ] Tag v0.1.0 once it's handled several real files successfully



