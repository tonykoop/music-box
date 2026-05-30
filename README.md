<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Music Box

Status: L2 V5 build-packet candidate

This repository is a V5 L2 build-packet candidate for a cylinder music box: a
pinned rotating cylinder plucks tuned teeth on a steel comb while a governor
and escapement regulate playback speed. The design focus is the mechanical
timing chain from barrel pins to comb teeth, plus speed control, damping, and
service access.

This packet is not a build-ready plan. It contains no released dimensions, no
tuning table, no comb tooth lengths, no cylinder diameter, no pin coordinates,
no governor speed target, no DXF coordinates, no CAD geometry, and no
fabrication instructions. All physical claims are concept-only or pending
measurement.

## Packet Map

- `design.md` - mechanism study, subsystem interfaces, prototype sequence, and
  measurement gates.
- `bom.csv` - estimated part classes, review needs, and unresolved procurement
  decisions.
- `cut-list.csv` - L2 planning cut categories only; no released dimensions.
- `decision-record.md` - decisions, L2 uplift notes, open questions, and
  measurement plan.
- `visual-output-register.csv` - V5 authority register; every row is
  `concept_only` or `pending_measurement`.
- `cad/mcp-session-log.md` - QMD Step 0 and tool provenance.

## Mechanism Summary

- A rotating pinned cylinder is the stored program.
- Pins or bumps lift and release individual comb teeth.
- The steel comb carries the tuned vibrating teeth.
- The governor and escapement control playback speed and prevent runaway.
- The drive train, spring or crank input, bearings, stop/start control, case,
  and resonance path are all pending measurement and prototype review.

## L2 Readiness Boundary

L2 means this repo now separates the major subsystems, names the unresolved
interfaces, and provides planning tables for review. It still is not L3:
promotion requires measured comb coupons, pin-release tests, governor-speed
evidence, cylinder-to-comb registration data, and reviewed CAD or drawings.
