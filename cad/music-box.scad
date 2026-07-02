// Music Box — parametric comb + cylinder ENVELOPE master.
// SPDX-License-Identifier: CC-BY-4.0
//
// Authority: pending_measurement. NOT fabrication authority. L2 V5
// build-packet candidate — decision-record.md explicitly rejects CAD/DXF
// release at this stage; this file is a pending_measurement scaffold only
// (register row "future-cad" in visual-output-register.csv anticipates it).
//
// Dimension sources (do not edit values without updating the source record):
//   - tooth length/width/thickness, steel E/rho, cantilever beta, tooth lane
//     count, event rows per revolution, cylinder angular speed: ALL taken
//     verbatim from wolfram/music-box-wolfram-model.wl's *Estimate constants,
//     each explicitly labeled there "estimate — pending measurement, not
//     fabrication authority". No new numeric values are introduced here.
//   - cantilever tooth-frequency formula: wolfram/music-box-wolfram-model.wl
//     cantileverToothFrequency[] (standard clamped-free beam formula,
//     beta_1 = 1.875 is the textbook first-mode eigenvalue, not invented).
//
// Scope boundary: this master models the COMB (18 identical representative
// teeth — tooth-to-tooth TUNING is explicitly out of scope per design.md
// "Tooth tuning is intentionally not specified here") and a CYLINDER
// ENVELOPE. The cylinder's LENGTH is derived from the tooth-lane count and
// tooth width (a mechanical constraint: the barrel must span the comb's
// lanes) — this is a derived relationship, not a new invented dimension.
// The cylinder's DIAMETER has NO estimate anywhere in this repo (bom.csv /
// cut-list.csv / decision-record.md all mark cylinder dimensions
// `no_released_dimensions` / "cylinder dimensions" as explicitly avoided) —
// it is drawn as a thin schematic axis rod only, NOT a claimed barrel
// diameter. Pin grid/coordinates, governor, escapement, drive train, and
// case/resonance geometry are entirely out of scope (design.md "Parametric
// Intent").
//
// Units: millimeters.

/* [Comb tooth — wolfram/music-box-wolfram-model.wl *Estimate constants] */
tooth_length_mm    = 35;     // toothLengthEstimate = 0.035 m
tooth_width_mm      = 2.5;    // toothWidthEstimate = 0.0025 m
tooth_thickness_mm  = 0.8;    // toothThicknessEstimate = 0.0008 m
tooth_lane_count    = 18;     // toothLaneCountEstimate — uniform, tuning out of scope

/* [Material reference — wolfram model, first-order model only] */
steel_density_kg_m3     = 7850;    // steelDensityEstimate
steel_youngs_modulus_pa = 200e9;   // steelYoungModulusEstimate
first_mode_beta         = 1.875;   // firstModeBetaEstimate (cantilever beam, textbook constant)

/* [Cylinder — timing/program envelope only] */
event_rows_per_revolution = 32;    // eventRowsPerRevolutionEstimate
cylinder_angular_speed_rad_s = 6.0; // cylinderAngularSpeedEstimate

// ---------------------------------------------------------------------------
// Derived geometry (formulas, not baked values)
// ---------------------------------------------------------------------------

// Cantilever tooth fundamental frequency (mirrors cantileverToothFrequency[]):
//   f = (beta^2 / (2*pi*L^2)) * sqrt(E*I / (rho*A)),  I = w*t^3/12,  A = w*t
function tooth_second_moment_m4(w_m, t_m) = w_m * pow(t_m, 3) / 12;
function tooth_area_m2(w_m, t_m) = w_m * t_m;

function cantilever_tooth_freq_hz(l_m, w_m, t_m, e_pa, rho, beta) =
  (pow(beta, 2) / (2 * PI * pow(l_m, 2))) *
  sqrt((e_pa * tooth_second_moment_m4(w_m, t_m)) / (rho * tooth_area_m2(w_m, t_m)));

// Cylinder event rate (mirrors eventRate[]): rows/rev * (angular speed / 2pi)
function cylinder_event_rate_hz(omega_rad_s, rows_per_rev) =
  rows_per_rev * (omega_rad_s / (2 * PI));

// Cylinder envelope LENGTH: minimum span to address every comb lane, packed
// edge-to-edge (no service clearance modeled — envelope only).
cylinder_length_mm = tooth_lane_count * tooth_width_mm;

// Cylinder envelope "diameter": NOT a dimension claim. No cylinder diameter
// estimate exists anywhere in this repo. Drawn as a thin reference rod only.
cylinder_axis_rod_dia_mm = 3;

// ---------------------------------------------------------------------------
// Modules
// ---------------------------------------------------------------------------

module comb_tooth(length_mm, width_mm, thickness_mm) {
  color("Silver")
    cube([length_mm, width_mm, thickness_mm]);
}

module steel_comb(lane_count, length_mm, width_mm, thickness_mm) {
  // Uniform representative teeth — tooth-to-tooth tuning is out of scope.
  for (i = [0 : lane_count - 1])
    translate([0, i * width_mm, 0])
      comb_tooth(length_mm, width_mm, thickness_mm);
}

module cylinder_axis_rod(length_mm, dia_mm) {
  // Schematic axis marker only — NOT a claimed barrel diameter (see header).
  color("Gray", 0.5)
    rotate([0, 90, 0])
      cylinder(h = length_mm, d = dia_mm, $fn = 24);
}

module music_box_envelope() {
  comb_length = tooth_length_mm;
  comb_span = tooth_lane_count * tooth_width_mm;
  // Comb sits above the cylinder axis, mount root at x=0.
  translate([0, 0, 10])
    steel_comb(tooth_lane_count, tooth_length_mm, tooth_width_mm, tooth_thickness_mm);
  // Cylinder axis runs the length of the comb's lane span, offset below.
  translate([comb_length * 0.3, 0, 0])
    cylinder_axis_rod(cylinder_length_mm, cylinder_axis_rod_dia_mm);
}

music_box_envelope();

// Echo derived values so `openscad` doubles as a cross-check against
// wolfram/music-box-wolfram-model.wl.
echo(str("tooth_freq_hz=",
  cantilever_tooth_freq_hz(tooth_length_mm / 1000, tooth_width_mm / 1000,
    tooth_thickness_mm / 1000, steel_youngs_modulus_pa, steel_density_kg_m3, first_mode_beta)));
echo(str("cylinder_event_rate_hz=",
  cylinder_event_rate_hz(cylinder_angular_speed_rad_s, event_rows_per_revolution)));
echo(str("cylinder_length_mm (derived, tooth_lane_count * tooth_width_mm)=", cylinder_length_mm));
echo("cylinder_axis_rod_dia_mm is a schematic placeholder ONLY — no diameter estimate exists in this repo.");
