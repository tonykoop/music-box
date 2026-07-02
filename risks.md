<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Risks

## Mechanical / Timing

- Pin-to-tooth registration may side-load or double-pluck neighboring teeth
  if lane spacing/alignment is wrong (design.md "Pluck And Release Interface").
- Governor/escapement instability can cause runaway or stalling; no speed,
  torque, or gear-ratio values are validated yet (design.md "Governor And
  Escapement").
- Gear-train backlash/noise may leak into the acoustic signal if the drive
  is not isolated from the comb (design.md "Drive Train").

## Acoustic

- Comb tooth speech, sustain, and fatigue behavior are unmeasured; tooth
  tuning is intentionally unspecified at this stage (design.md "Steel Comb").
- Case/resonance strategy is unresolved and could amplify gear/escapement
  noise instead of comb tone if not tested separately (design.md "Frame,
  Case, And Resonance").

## Fabrication

- No cylinder diameter, pin grid, or comb tooth-length schedule exists yet;
  any CAD/DXF release must wait for a comb coupon, pin-release coupon, and
  registration mule (decision-record.md "Rejected For L2").
- `cad/music-box.scad` is a pending_measurement envelope scaffold only — its
  cylinder "diameter" is a schematic axis marker, not a dimension claim (see
  the file header). Do not treat it as barrel geometry.

## Safety

- Pin/tooth interfaces and spring or crank drives can pinch or catch fingers
  during coupon testing; use guards and low-force tests before performance
  strikes.

## Readiness Boundary

This is an `L2 V5 build-packet candidate`. It is not fabrication authority.
Promotion to L3 requires measured comb coupons, pin-release tests,
governor-speed evidence, cylinder-to-comb registration data, and reviewed
CAD or drawings (design.md "Acceptance Evidence For L3 Consideration").
