<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Music Box

Status: L1 concept packet

This repository is a V5 L1 concept packet for a cylinder music box: a pinned
rotating cylinder plucks tuned teeth on a steel comb while a governor and
escapement regulate playback speed. The design focus is the mechanical timing
chain from barrel pins to comb teeth, plus speed control, damping, and service
access.

This packet is not a build-ready plan. It contains no released dimensions, no
tuning table, no comb tooth lengths, no cylinder diameter, no pin coordinates,
no governor speed target, no DXF coordinates, no CAD geometry, and no
fabrication instructions. All physical claims are concept-only or pending
measurement.

## Packet Map

- `design.md` - mechanism study, subsystem interfaces, and measurement gates.
- `bom.csv` - estimated part classes and unresolved procurement decisions.
- `decision-record.md` - decisions, assumptions, and open questions.
- `visual-output-register.csv` - V5 authority register; every row is
  `concept_only`.
- `cad/mcp-session-log.md` - QMD Step 0 and tool provenance.

## Mechanism Summary

- A rotating pinned cylinder is the stored program.
- Pins or bumps lift and release individual comb teeth.
- The steel comb carries the tuned vibrating teeth.
- The governor and escapement control playback speed and prevent runaway.
- The drive train, spring or crank input, bearings, stop/start control, case,
  and resonance path are all pending measurement and prototype review.

## Readiness Boundary

L1 means this repo captures mechanism intent, risks, and first test questions
only. Promotion to L2 requires reviewed parameter names, a measurement plan,
and a clear separation between comb authority, cylinder authority, governor
authority, and any future CAD or visual artifacts.

