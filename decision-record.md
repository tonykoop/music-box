<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Decision Record

## Decisions

- Readiness is `L1 concept packet`.
- The instrument is treated as a pinned-cylinder steel-comb idiophone with a
  regulated mechanical timing system.
- The first risks are tooth speech, pin release, cylinder-to-comb alignment,
  governor stability, escapement noise, and service access.
- The packet intentionally avoids pitch ranges, tooth geometry, pin
  coordinates, cylinder dimensions, governor dimensions, and CAD/DXF outputs.
- Every visual-output register row is `concept_only`; no artifact is
  fabrication authority.

## Open Questions

- Should the first test be a one-tooth coupon, a small comb coupon, or a simple
  hand-cranked cylinder strip?
- What comb steel and heat treatment can be tuned repeatably in the shop?
- How should pins lift and release teeth without scraping or fatigue damage?
- What governor style is quiet enough for a small acoustic instrument?
- Should the drive be spring-powered, crank-powered, weight-powered, or a bench
  test motor for early measurement only?
- How should the case support resonance without amplifying gear noise?
- What service access is needed for pin replacement and comb retuning?
- What validation log format should capture timing, speed stability, and tooth
  response?

## Rejected For L1

- No dimensions.
- No tuning table.
- No comb tooth lengths or pin coordinates.
- No governor speed targets or gear ratios.
- No CAD, DXF, G-code, or fabrication drawing.
- No claim that the concept is ready to build.

