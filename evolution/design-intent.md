# Design Intent — music-box rev A

- Master CAD: `cad/music-box.scad` (sha256: 42447cba881d705c038f09c067625c201e31f13fbec6c0252572c179f7568e0c), driven by `wolfram/music-box-wolfram-model.wl` (sha256: be43b661a247186a8062b97b8c770b607b48f50060893f0a507e8346d14bbf5f) estimate constants.
- Function: Pinned rotating cylinder (stored program) lifts and releases tuned steel comb teeth; a governor/escapement regulates cylinder speed. Sound comes from comb tooth vibration; perceived music depends on pin placement, release quality, governor stability, and damping (design.md "Design Thesis").
- Environment: mechanical, hand-crank or spring-driven; indoor instrument/mechanism.
- Target qty: 1 (comb coupon -> pin-release coupon -> registration mule -> speed-control mule -> integrated bench mule, per design.md "Prototype Sequence"). Deadline: TBD. Budget: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Tooth length/width/thickness | 35 / 2.5 / 0.8 mm (estimate) | measurement_required — comb coupon | sets tooth fundamental frequency | wolfram/music-box-wolfram-model.wl estimate constants |
| Cylinder pin-lane span (derived) | 45 mm (18 lanes x 2.5 mm, packed) | measurement_required | must span all comb lanes | cad/music-box.scad (derived, not an independent estimate) |
| Cylinder diameter | none — not estimated anywhere | measurement_required | sets circumference / event spacing | no source exists; explicitly out of scope |
| Event rows per revolution | 32 (estimate) | measurement_required | timing/tempo resolution | wolfram/music-box-wolfram-model.wl |
| Cylinder angular speed | 6.0 rad/s (estimate) | measurement_required — speed-control mule | playback tempo | wolfram/music-box-wolfram-model.wl |

## Incidental (free for DFM)

- Case cosmetic styling, crank handle shape, non-mating surface finish.

## Must-nots (DFM may never violate)

- Tooth-to-tooth tuning stays out of scope until a comb coupon exists — do not assign individual tooth lengths from this scaffold (design.md "Steel Comb": "Tooth tuning is intentionally not specified here").
- Do not treat `cad/music-box.scad`'s cylinder diameter as a real dimension — it is an explicit schematic placeholder with no source (see file header).
- Do not release pin coordinates, governor dimensions, or CAD/DXF as fabrication authority before comb, pin-release, registration, and speed-control mules pass (decision-record.md "Rejected For L2").
- Isolate the drive/gear train from the comb so gear noise is not mistaken for musical attack (design.md "Governor And Escapement").

## Material intent

- Comb: steel (density/E per wolfram model estimates). Case, cylinder, drive, and governor materials all TBD per bom.csv/sourcing.csv.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable. Remains L2 V5 build-packet candidate, not build-ready.
