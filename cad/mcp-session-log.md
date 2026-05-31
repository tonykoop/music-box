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
