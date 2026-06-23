(* Wolfram Language 14.3 source: parametric, estimate-only music-box model. *)

ClearAll["Global`*"];

musicBoxMetadata = <|
   "instrument" -> "Music Box",
   "packet" -> "music-box",
   "modelName" -> "Estimate-only symbolic comb tooth, pluck, and cylinder timing model",
   "authority" -> "reference_only",
   "measurementStatus" -> "Every physical number is an estimate placeholder pending measurement, not fabrication authority."
   |>;

toothLengthEstimate = Quantity[0.035, "Meters"]; (* estimate -- pending measurement, not fabrication authority *)
toothWidthEstimate = Quantity[0.0025, "Meters"]; (* estimate -- pending measurement, not fabrication authority *)
toothThicknessEstimate = Quantity[0.0008, "Meters"]; (* estimate -- pending measurement, not fabrication authority *)
steelDensityEstimate = Quantity[7850, "Kilograms"/"Meters"^3]; (* estimate -- pending measurement, not fabrication authority *)
steelYoungModulusEstimate = Quantity[200*^9, "Pascals"]; (* estimate -- pending measurement, not fabrication authority *)
firstModeBetaEstimate = 1.875; (* estimate -- pending measurement, not fabrication authority *)
pluckDeflectionEstimate = Quantity[0.0015, "Meters"]; (* estimate -- pending measurement, not fabrication authority *)
pinLiftEstimate = Quantity[0.002, "Meters"]; (* estimate -- pending measurement, not fabrication authority *)
cylinderAngularSpeedEstimate = Quantity[6.0, "Radians"/"Seconds"]; (* estimate -- pending measurement, not fabrication authority *)
toothLaneCountEstimate = 18; (* estimate -- pending measurement, not fabrication authority *)
eventRowsPerRevolutionEstimate = 32; (* estimate -- pending measurement, not fabrication authority *)
toothDampingRatioEstimate = 0.02; (* estimate -- pending measurement, not fabrication authority *)
lowerFactorEstimate = 0.5; (* estimate -- pending measurement, not fabrication authority *)
upperFactorEstimate = 2.0; (* estimate -- pending measurement, not fabrication authority *)
dampingMinimumEstimate = 0.001; (* estimate -- pending measurement, not fabrication authority *)
dampingMaximumEstimate = 0.10; (* estimate -- pending measurement, not fabrication authority *)
dampingStepEstimate = 0.001; (* estimate -- pending measurement, not fabrication authority *)
integerStepEstimate = 1; (* estimate -- pending measurement, not fabrication authority *)

toothArea[width_, thickness_] := width*thickness;

toothSecondMoment[width_, thickness_] := width*thickness^3/12;

cantileverToothFrequency[length_, width_, thickness_, youngModulus_, density_, beta_] :=
  UnitConvert[
   (beta^2/(2*Pi*length^2))*Sqrt[(youngModulus*toothSecondMoment[width, thickness])/
      (density*toothArea[width, thickness])],
   "Hertz"
   ];

tipStiffness[length_, width_, thickness_, youngModulus_] :=
  UnitConvert[3*youngModulus*toothSecondMoment[width, thickness]/length^3, "Newtons"/"Meters"];

pluckEnergy[length_, width_, thickness_, youngModulus_, deflection_] :=
  UnitConvert[(1/2)*tipStiffness[length, width, thickness, youngModulus]*deflection^2, "Joules"];

eventRate[angularSpeed_, rowsPerRevolution_] :=
  Quantity[
   rowsPerRevolution*QuantityMagnitude[UnitConvert[angularSpeed, "Radians"/"Seconds"]]/(2*Pi),
   "Hertz"
   ];

decayTimeConstant[frequency_, dampingRatio_] :=
  UnitConvert[1/(2*Pi*dampingRatio*frequency), "Seconds"];

estimateInputs = <|
   "toothLengthEstimate" -> toothLengthEstimate,
   "toothWidthEstimate" -> toothWidthEstimate,
   "toothThicknessEstimate" -> toothThicknessEstimate,
   "steelDensityEstimate" -> steelDensityEstimate,
   "steelYoungModulusEstimate" -> steelYoungModulusEstimate,
   "firstModeBetaEstimate" -> firstModeBetaEstimate,
   "pluckDeflectionEstimate" -> pluckDeflectionEstimate,
   "pinLiftEstimate" -> pinLiftEstimate,
   "cylinderAngularSpeedEstimate" -> cylinderAngularSpeedEstimate,
   "toothLaneCountEstimate" -> toothLaneCountEstimate,
   "eventRowsPerRevolutionEstimate" -> eventRowsPerRevolutionEstimate,
   "toothDampingRatioEstimate" -> toothDampingRatioEstimate
   |>;

musicBoxSymbolicModel = <|
   "metadata" -> musicBoxMetadata,
   "inputs" -> estimateInputs,
   "combToothFrequency" -> cantileverToothFrequency[toothLengthEstimate, toothWidthEstimate,
     toothThicknessEstimate, steelYoungModulusEstimate, steelDensityEstimate, firstModeBetaEstimate],
   "pluckEnergy" -> pluckEnergy[toothLengthEstimate, toothWidthEstimate, toothThicknessEstimate,
     steelYoungModulusEstimate, pluckDeflectionEstimate],
   "cylinderEventRate" -> eventRate[cylinderAngularSpeedEstimate, eventRowsPerRevolutionEstimate]
   |>;

musicBoxExplorer = Manipulate[
 Module[
  {
   lengthQuantity = Quantity[length, "Meters"],
   widthQuantity = Quantity[width, "Meters"],
   thicknessQuantity = Quantity[thickness, "Meters"],
   youngQuantity = Quantity[youngModulus, "Pascals"],
   densityQuantity = Quantity[density, "Kilograms"/"Meters"^3],
   deflectionQuantity = Quantity[pluckDeflection, "Meters"],
   angularQuantity = Quantity[angularSpeed, "Radians"/"Seconds"],
   combFrequency,
   eventFrequency
   },
  combFrequency = cantileverToothFrequency[lengthQuantity, widthQuantity, thicknessQuantity,
    youngQuantity, densityQuantity, beta];
  eventFrequency = eventRate[angularQuantity, rowsPerRevolution];
  Column[{
    Style["Music-box estimate-only comb and cylinder relationships", Bold],
    "All controls are placeholders pending measurement, not fabrication authority.",
    Grid[{
      {"comb tooth fundamental relationship", combFrequency},
      {"tip stiffness relationship",
       tipStiffness[lengthQuantity, widthQuantity, thicknessQuantity, youngQuantity]},
      {"pluck energy relationship",
       pluckEnergy[lengthQuantity, widthQuantity, thicknessQuantity, youngQuantity, deflectionQuantity]},
      {"cylinder event-row rate", eventFrequency},
      {"lanes available per event row", laneCount},
      {"decay time relationship", decayTimeConstant[combFrequency, dampingRatio]}
      }, Alignment -> Left]
    }]
  ],
 {{length, QuantityMagnitude[toothLengthEstimate], "tooth length estimate (m)"},
  QuantityMagnitude[lowerFactorEstimate*toothLengthEstimate],
  QuantityMagnitude[upperFactorEstimate*toothLengthEstimate]},
 {{width, QuantityMagnitude[toothWidthEstimate], "tooth width estimate (m)"},
  QuantityMagnitude[lowerFactorEstimate*toothWidthEstimate],
  QuantityMagnitude[upperFactorEstimate*toothWidthEstimate]},
 {{thickness, QuantityMagnitude[toothThicknessEstimate], "tooth thickness estimate (m)"},
  QuantityMagnitude[lowerFactorEstimate*toothThicknessEstimate],
  QuantityMagnitude[upperFactorEstimate*toothThicknessEstimate]},
 {{youngModulus, QuantityMagnitude[steelYoungModulusEstimate], "Young's modulus estimate (Pa)"},
  QuantityMagnitude[lowerFactorEstimate*steelYoungModulusEstimate],
  QuantityMagnitude[upperFactorEstimate*steelYoungModulusEstimate]},
 {{density, QuantityMagnitude[steelDensityEstimate], "density estimate (kg/m^3)"},
  QuantityMagnitude[lowerFactorEstimate*steelDensityEstimate],
  QuantityMagnitude[upperFactorEstimate*steelDensityEstimate]},
 {{beta, firstModeBetaEstimate, "mode coefficient estimate"},
  lowerFactorEstimate*firstModeBetaEstimate, upperFactorEstimate*firstModeBetaEstimate},
 {{pluckDeflection, QuantityMagnitude[pluckDeflectionEstimate], "pluck deflection estimate (m)"},
  QuantityMagnitude[lowerFactorEstimate*pluckDeflectionEstimate],
  QuantityMagnitude[upperFactorEstimate*pluckDeflectionEstimate]},
 {{angularSpeed, QuantityMagnitude[cylinderAngularSpeedEstimate], "cylinder angular speed estimate (rad/s)"},
  QuantityMagnitude[lowerFactorEstimate*cylinderAngularSpeedEstimate],
  QuantityMagnitude[upperFactorEstimate*cylinderAngularSpeedEstimate]},
 {{rowsPerRevolution, eventRowsPerRevolutionEstimate, "event rows per revolution estimate"},
  integerStepEstimate, upperFactorEstimate*eventRowsPerRevolutionEstimate, integerStepEstimate},
 {{laneCount, toothLaneCountEstimate, "tooth lanes estimate"},
  integerStepEstimate, upperFactorEstimate*toothLaneCountEstimate, integerStepEstimate},
 {{dampingRatio, toothDampingRatioEstimate, "damping ratio estimate"},
  dampingMinimumEstimate, dampingMaximumEstimate, dampingStepEstimate}
 ]
