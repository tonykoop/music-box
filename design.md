<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Music Box Design Study

## Design Thesis

A music box is a timing instrument as much as an idiophone. The sound comes from
steel comb teeth, but the perceived music depends on pin placement, tooth
release, governor stability, escapement behavior, damping, and the stiffness of
the frame that holds the comb and cylinder in alignment.

This L1 packet treats the project as a sequence of coupled mechanisms rather
than a decorative case with a comb inside.

## Mechanism Overview

A cylinder rotates under controlled drive. Raised pins on the cylinder engage
comb teeth in sequence. Each tooth is lifted, released, and allowed to vibrate.
The comb turns stored mechanical timing into sound. A governor and escapement
control the rate of cylinder rotation so the melody does not speed up or stall.

This packet does not choose final tooth count, pitch set, cylinder diameter,
pin grid, governor type, spring motor, crank drive, case geometry, or resonance
strategy. Those values require measured or reviewed authority before any build
packet can advance.

## Subsystems

### Pinned Cylinder

- The cylinder stores note timing and tooth selection.
- Pin placement must align with comb teeth without side-loading or double
  plucking neighboring teeth.
- Pin height, pin profile, retention, and cylinder material are pending
  measurement.
- A future layout must distinguish musical timing from fabrication coordinates.

### Steel Comb

- The comb is the primary sound generator.
- Tooth material, profile, root relief, heat treatment, tuning method, and
  mounting stiffness are unresolved.
- Tooth tuning is intentionally not specified here.
- A first test should use a small comb coupon before any full melody cylinder is
  designed.

### Pluck And Release Interface

- Pins must lift each tooth enough to speak, then release without scraping,
  jamming, or over-bending the tooth.
- The release point controls attack noise and tooth stress.
- Clearance, tooth tip shape, and pin surface finish are first prototype
  questions.
- The mechanism needs a way to test one tooth and one pin before scaling.

### Governor And Escapement

- The speed-control system prevents runaway and stabilizes tempo.
- Candidate approaches include fan governor, flyball-style governor, friction
  governor, escapement, or hybrid control.
- No speed, torque, spring force, or gear ratio values are claimed here.
- The first prototype should measure speed stability, audible mechanism noise,
  and recovery after load changes.

### Drive Train

- A spring motor, hand crank, or weight drive are all concept options.
- Gear train noise, backlash, lubrication, service access, and stop/start
  control are unresolved.
- The drive should be isolated from the comb so gear noise does not dominate the
  tone.

### Frame, Case, And Resonance

- The frame must hold the cylinder and comb in stable alignment.
- The case may act as a resonator, protector, and service enclosure.
- Resonance strategy is intentionally unresolved: wood soundboard, box cavity,
  contact pickup, or hybrid amplification all remain concept options.
- Access for tuning, pin service, governor adjustment, and cleaning is a core
  design requirement.

## Parametric Intent

Future work should name parameters before assigning values:

- `estimate_tooth_count_pending_measurement`
- `estimate_cylinder_pin_grid_pending_measurement`
- `estimate_comb_material_pending_measurement`
- `estimate_tooth_profile_pending_measurement`
- `estimate_pin_height_pending_measurement`
- `estimate_governor_architecture_pending_measurement`
- `estimate_drive_train_ratio_pending_measurement`
- `estimate_case_resonance_strategy_pending_measurement`

These names are placeholders only. They are not dimensions, tuning values, or
performance targets.

## First Measurement Gates

- Comb coupon: verify tooth speech, sustain, stress, and tuning workflow.
- Pin coupon: test lift, release, scraping, and repeatability on one tooth.
- Alignment test: verify cylinder-to-comb registration without side loading.
- Governor test: measure speed stability and mechanical noise under changing
  load.
- Drive test: compare crank, spring, or other drive options before committing
  to a case layout.
- Damping/noise test: separate comb tone from gear, escapement, and case noise.
- Service test: confirm that pins, comb teeth, governor, and drive train can be
  adjusted without destroying the assembly.

## L1 Boundary

This design study is a concept map. It does not define a scale, melody, tuning
system, tooth geometry, pin coordinates, governor dimensions, CAD model, DXF, or
fabrication release.

