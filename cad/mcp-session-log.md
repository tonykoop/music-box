<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# MCP Session Log

No MCP, CAD, rendering, image-generation, or creative-tool session was run for
this L1 packet. No geometry was generated. No dimensions, tuning numbers,
pressure values, DXF coordinates, G-code, or fabrication outputs are claimed.

## QMD Step 0

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-05-30-qmd-query | qmd CLI | `qmd query "music box pinned rotating cylinder plucks tuned steel comb governor escapement controls speed"` | none | context_retrieval | concept_only | attempted | Query reached search/rerank, then crashed in Bun/node-llama-cpp with repeated segmentation faults before returning usable context. |
| 2026-05-30-qmd-search | qmd CLI | `qmd search "music-box" -c instrument-builds` | none | context_retrieval | concept_only | self_checked | Command completed with `No results found.` |
| 2026-05-30-local-authoring | Codex local edit | Real cylinder music-box mechanism knowledge plus the QMD Step 0 outcomes | `README.md`; `design.md`; `bom.csv`; `decision-record.md`; `visual-output-register.csv`; `cad/mcp-session-log.md` | concept_packet_authoring | concept_only | self_checked | Authored an L1 concept packet only. All fabrication-relevant claims remain pending measurement. |
| 2026-05-30-r8-music-box-wolfram | Codex CLI; local file editing | `docs/plans/2026-05-30-round8/_WOLFRAM_AUTHOR.md`; existing packet files | `music-box-starter.wl`; `wolfram/music-box-wolfram-model.wl`; `visual-output-register.csv`; `cad/mcp-session-log.md` | wolfram_source_authoring | reference_only | self_checked | No MCP or Wolfram Desktop session was run. Source was authored by hand as a parametric estimate-only model; physical numbers are placeholders pending measurement, not fabrication authority. |
| fable-v5-refresh-2026-07-01-cad | claude-code (Fable 5) + OpenSCAD CLI | `wolfram/music-box-wolfram-model.wl`; `design.md` | `cad/music-box.scad` | cad_authoring | pending_measurement | self_checked | First CAD master for this repo (register's "future-cad" placeholder row replaced). Comb (18 identical representative teeth; tooth-to-tooth tuning explicitly out of scope) using tooth L/W/T + material estimates copied verbatim from the Wolfram model; cylinder LENGTH derived from tooth-lane-count x tooth-width (a mechanical constraint, not a new number); cylinder "diameter" is an explicit non-dimension schematic axis marker — no diameter estimate exists anywhere in this repo. openscad render check: pass (openscad -o /tmp/music-box-check.stl cad/music-box.scad, exit 0). NOT fabrication authority; L2 candidate, not build-ready. |
| fable-v5-refresh-2026-07-01-baseline | claude-code (Fable 5) | design.md; bom.csv; decision-record.md | `risks.md`; `sourcing.csv`; `validation.csv`; `drawing-brief.md` | packet_refresh | concept_only | self_checked | Scaffolded the missing V5 baseline files (all TBD/measurement_required); no new dimensions or tuning values introduced. |
