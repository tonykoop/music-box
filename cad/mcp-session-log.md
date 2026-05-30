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

