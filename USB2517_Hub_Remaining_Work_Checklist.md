# USB2517 Seven-Port USB Hub: Complete Remaining-Work Checklist

**Document date:** 10 September 2026  
**Project status:** Engineering draft only. Not ready for fabrication, assembly, connection to a host, or application of power.

This checklist defines the remaining work required to turn the current USB2517 seven-port hub concept into a reviewed, schematic-linked, manufacturable, testable design.

---

## 1. Freeze the product specification

- [ ] Confirm seven vertical USB-A downstream receptacles.
- [ ] Confirm all seven downstream ports require USB 2.0 data.
- [ ] Confirm the intended standards-compliant charging mode.
- [ ] Recommended definition: seven BC1.2 Charging Downstream Ports advertising up to 1.5 A, with each electrical branch designed to tolerate 2 A continuously.
- [ ] Do not claim standards-compliant 2 A USB-A charging. USB 2.0 SDP and BC1.2 do not provide a standards-based 2 A data-port advertisement.
- [ ] Decide whether proprietary USB-A charging signatures are required.
- [ ] Decide whether charging continues while the upstream host is absent, asleep, suspended, or disconnected.
- [ ] Define maximum aggregate continuous load.
- [ ] Define maximum transient load.
- [ ] Define maximum ambient temperature.
- [ ] Define enclosure material, ventilation, airflow, and mounting.
- [ ] Define required LEDs and indicators.
- [ ] Define required regulatory markets and compliance claims.

---

## 2. Rebuild the schematic as a native modern KiCad project

- [ ] Use a supported production release of KiCad.
- [ ] Create a native `.kicad_sch`, not a legacy `.sch`.
- [ ] Create a hierarchical, multi-sheet schematic.
- [ ] Suggested sheets:
  1. System overview
  2. 12 V input protection
  3. 12 V-to-5 V converter
  4. 3.3 V regulator and power tree
  5. USB2517 hub controller
  6. Upstream USB interface
  7. Downstream ports 1 to 4
  8. Downstream ports 5 to 7
  9. Port power and charging control
  10. EEPROM, straps, LEDs, and test points
- [ ] Use real wires, junctions, buses, hierarchical labels, and power symbols.
- [ ] Do not use text labels as substitutes for electrical connections.
- [ ] Annotate every component.
- [ ] Assign a footprint to every populated component.

---

## 3. Complete the USB2517-JZX symbol and connections

- [ ] Create or import a complete 64-pin USB2517-JZX symbol.
- [ ] Add exposed pad as pin 65 and connect it to GND.
- [ ] Verify every pin number and name against the current manufacturer documentation.
- [ ] Verify upstream `USBUP_DP` and `USBUP_DM`.
- [ ] Verify all seven downstream D+/D- pairs.
- [ ] Verify all seven active-high `PRTPWR` outputs.
- [ ] Verify all seven active-low `OCS_N` inputs.
- [ ] Verify `VBUS_DET`.
- [ ] Verify `XTAL1/CLKIN` and `XTAL2`.
- [ ] Verify `RESET_N`.
- [ ] Verify `RBIAS`.
- [ ] Verify `VDD33`, `VDD33CR`, and `VDD33PLL`.
- [ ] Verify all four `VDDA33` pins.
- [ ] Verify `VDD18` and `VDD18PLL`.
- [ ] Verify EEPROM/SMBus and configuration pins.
- [ ] Verify all LED and port-swap multifunction pins.
- [ ] Assign correct electrical pin types for ERC.
- [ ] Add a pin-audit document recording source document revision and verification date.

---

## 4. Complete USB2517 power, reset, and bias circuitry

- [ ] Connect every 3.3 V supply pin.
- [ ] Add local 100 nF bypass capacitors at each supply pin or approved pin group.
- [ ] Add required bulk 3.3 V capacitance.
- [ ] Add at least 1 uF from `VDD18` to GND as specified.
- [ ] Add at least 1 uF from `VDD18PLL` to GND as specified.
- [ ] Do not power external circuitry from the internal 1.8 V outputs.
- [ ] Add a 12.0 kOhm, 1% RBIAS resistor to GND.
- [ ] Add a defined reset pull-up.
- [ ] Add optional reset supervision if the internal power-on reset is insufficient.
- [ ] Add reset and rail test points.
- [ ] Verify power sequencing under normal startup, brownout, and hot-plug conditions.

---

## 5. Finalize hub configuration and EEPROM options

- [ ] Select one configuration method: internal defaults, I2C EEPROM, or SMBus.
- [ ] Define every sampled strap state.
- [ ] Ensure no configuration input floats during reset.
- [ ] Configure individual rather than ganged port power.
- [ ] Enable all seven downstream ports.
- [ ] Define normal or swapped USB data polarity for each port.
- [ ] Define PHY boost settings.
- [ ] Define removable/non-removable port settings.
- [ ] Define local self-power status.
- [ ] Define LED mode.
- [ ] If using EEPROM, select an exact compatible EEPROM part.
- [ ] Add pull-ups, bypassing, write protection, and programming pads.
- [ ] Generate and version-control the EEPROM image.
- [ ] Define VID, PID, device revision, strings, self-powered descriptors, current declarations, power-on delay, and over-current filtering.
- [ ] Define behavior when the EEPROM is absent, blank, corrupt, or incorrectly programmed.

---

## 6. Complete the 24 MHz oscillator

- [ ] Select an exact 24 MHz crystal part number.
- [ ] Verify tolerance, stability, ESR, drive level, shunt capacitance, and operating-temperature range.
- [ ] Calculate load capacitors from the selected crystal load capacitance and estimated stray capacitance.
- [ ] Do not retain generic 18 pF capacitors without calculation.
- [ ] Add optional damping or drive-control footprints if recommended.
- [ ] Place the crystal and capacitors immediately adjacent to the controller.
- [ ] Route without vias.
- [ ] Keep crystal nets away from USB pairs, SW, BOOT, and the inductor.
- [ ] Add oscillator startup and frequency verification to the prototype test plan.

---

## 7. Complete the upstream USB interface

- [ ] Replace the hand-created Molex footprint with an official or dimensionally recreated 480370001 footprint based on the current `SD-48037-001` drawing.
- [ ] Verify four signal-hole dimensions and positions.
- [ ] Verify both shield/retention-hole dimensions and positions.
- [ ] Verify PCB-edge datum and connector overhang.
- [ ] Add pin-1 identification.
- [ ] Add accurate fabrication, assembly, silkscreen, and courtyard outlines.
- [ ] Add mechanical and board-edge keep-outs.
- [ ] Connect upstream VBUS only to sensing/protection.
- [ ] Prevent any local 5 V backfeed into upstream VBUS.
- [ ] Add the required VBUS divider or protection network.
- [ ] Add upstream USB ESD protection directly behind the connector.
- [ ] Define shield-to-chassis or shield-to-ground treatment.
- [ ] Add shield stitching vias where appropriate.
- [ ] Verify connector insertion and extraction strength.

---

## 8. Complete all seven downstream USB interfaces

For each port:

- [ ] Use the exact GCT USB1086-GF-B symbol and manufacturer land pattern.
- [ ] Confirm vertical, top-mount orientation.
- [ ] Verify nine contact holes and two shell holes.
- [ ] Connect pins 1 to 4 for USB 2.0.
- [ ] Place explicit no-connect markers on SuperSpeed pins 5 to 9.
- [ ] Connect shield stakes to the approved shield network.
- [ ] Add one USB ESD array per data pair.
- [ ] Place the ESD array immediately adjacent to the receptacle.
- [ ] Minimize connector-to-ESD and ESD-to-route stubs.
- [ ] Add local VBUS bulk and high-frequency capacitance.
- [ ] Verify port inrush and discharge requirements.
- [ ] Add VBUS, fault, and enable test points without creating USB stubs.
- [ ] Add connector and plug-access mechanical keep-outs.

---

## 9. Complete ESD, EMC, and shield protection

- [ ] Select exact USB ESD-array manufacturer parts.
- [ ] Verify USB 2.0 high-speed insertion loss and line capacitance.
- [ ] Verify IEC 61000-4-2 ratings.
- [ ] Use flow-through footprints where possible.
- [ ] Give ESD current a short, direct return path.
- [ ] Prevent ESD return current from flowing through controller reference paths.
- [ ] Select and calculate the 12 V input TVS diode.
- [ ] Verify standoff, breakdown, clamp voltage, and pulse rating.
- [ ] Decide whether common-mode choke footprints are required.
- [ ] Establish the final enclosure shield and chassis strategy.
- [ ] Add perimeter and connector-area ground stitching as appropriate.
- [ ] Plan conducted-emissions, radiated-emissions, immunity, and ESD testing.

---

## 10. Complete seven port-power channels

For each port:

- [ ] Add a complete AP22653W6-7 symbol or selected equivalent.
- [ ] Verify active-high enable compatibility with USB2517 `PRTPWR`.
- [ ] Connect `PRTPWRx` to the matching enable.
- [ ] Connect fault output to the matching `OCSx_N` input.
- [ ] Calculate the exact current-limit resistor.
- [ ] Set the hardware threshold above the intended 2 A continuous electrical load while remaining within component limits.
- [ ] Verify continuous-current rating at actual copper area and ambient temperature.
- [ ] Calculate RDS(on) loss and port voltage drop at 2 A.
- [ ] Verify reverse-current behavior.
- [ ] Verify startup into the selected port capacitance.
- [ ] Add local input/output bypass capacitors.
- [ ] Add enable and fault test points.
- [ ] Select constant-current or latch-off behavior.
- [ ] Verify automatic recovery behavior against USB hub requirements.

---

## 11. Select and complete charging-port controllers

- [ ] Select a genuine BC1.2 Charging Downstream Port controller that preserves USB data.
- [ ] Do not use a DCP-only controller on a data port.
- [ ] Confirm compatibility with 480 Mbps USB 2.0 traffic.
- [ ] Determine whether the charging controller integrates a power switch.
- [ ] Avoid duplicate or conflicting power switches.
- [ ] Verify BC1.2 detection while the device is enumerated.
- [ ] Verify charging behavior during suspend and resume.
- [ ] Verify required VBUS discharge timing.
- [ ] Verify recovery after over-current.
- [ ] Define SDP/CDP mode selection.
- [ ] Add charging-detection test points.
- [ ] Advertise no more than 1.5 A using BC1.2.
- [ ] Document that the electrical branch may tolerate 2 A but does not standards-advertise 2 A.

---

## 12. Complete the 12 V input protection

- [ ] Use the official Phoenix Contact 1715721 land pattern.
- [ ] Verify 5.08 mm pitch and 1.3 mm plated holes.
- [ ] Verify body outline, wire-entry direction, and screwdriver access.
- [ ] Mark `+12V` and `GND` clearly on silkscreen.
- [ ] Specify acceptable wire gauge and ferrule.
- [ ] Select and coordinate the input fuse.
- [ ] Verify fuse resistance, derating, and interrupt rating.
- [ ] Add reverse-polarity protection.
- [ ] Calculate reverse-protection losses at full input current.
- [ ] Add gate protection where required.
- [ ] Add a 12 V TVS diode.
- [ ] Add ceramic and bulk input capacitance.
- [ ] Calculate hot-plug and inrush current.
- [ ] Add controlled inrush if required.
- [ ] Verify terminal, wire, copper, and fuse temperatures at maximum load.
- [ ] Provide mechanical support against screw-tightening forces.

---

## 13. Build a complete 40-pin TPS548B22 schematic section

- [ ] Create or import a complete 40-pin TPS548B22RVFR symbol.
- [ ] Represent every PVIN, PGND, SW, BOOT, VDD, BP, control, sense, and configuration pin.
- [ ] Include documented no-connect pins.
- [ ] Assign correct ERC electrical pin types.
- [ ] Verify every pin against the current data sheet.
- [ ] Select switching frequency.
- [ ] Select D-CAP3 and FCCM or skip mode.
- [ ] Select VSEL/reference configuration.
- [ ] Set output voltage to maintain compliant voltage at the USB connectors.
- [ ] Calculate inductor value, ripple, RMS current, peak current, DCR loss, and core loss.
- [ ] Calculate input capacitance and ripple-current requirement.
- [ ] Calculate output capacitance for stability, ripple, load insertion, load release, and startup.
- [ ] Derate all ceramic capacitors for DC bias and temperature.
- [ ] Calculate current-limit resistor.
- [ ] Select hiccup or latch-off protection.
- [ ] Calculate UVLO and startup timing.
- [ ] Add bootstrap, BP, VDD, and high-frequency bypass capacitors.
- [ ] Add initial RC snubber and tuning provision.
- [ ] Add PGOOD pull-up and test point.
- [ ] Add enable and Kelvin-sense test points.
- [ ] Add safe, low-inductance switch-node measurement provision.

---

## 14. Recreate or import the official TPS548B22 RVF footprint

- [ ] Use the current RVF0040 package drawing.
- [ ] Reproduce every signal land and clipped power land.
- [ ] Reproduce thermal and ground land geometry.
- [ ] Reproduce solder-mask openings.
- [ ] Reproduce recommended paste apertures.
- [ ] Add correct pin-1 marker.
- [ ] Add fabrication, assembly, silkscreen, and courtyard outlines.
- [ ] Add thermal vias following TI layout guidance.
- [ ] Verify drill and finished-hole sizes.
- [ ] Confirm paste thickness with the assembler.
- [ ] Confirm acceptable voiding.
- [ ] Compare the footprint 1:1 with the current manufacturer drawing.
- [ ] Record source drawing number, revision, and verification date.

---

## 15. Correct and verify the USB2517-JZX footprint

- [ ] Obtain manufacturer-confirmed exposed-pad dimensions.
- [ ] Verify all peripheral pad dimensions and 0.5 mm pitch.
- [ ] Verify package tolerances and solder-fillet allowances.
- [ ] Determine solder-mask-defined versus non-solder-mask-defined treatment.
- [ ] Set solder-mask expansion from the official land pattern.
- [ ] Set the exposed-pad mask opening from the official land pattern.
- [ ] Confirm permitted thermal-via arrangement.
- [ ] Agree via filling, capping, or tenting with the assembler.
- [ ] Segment the exposed-pad paste aperture.
- [ ] Target approximately 50 to 70 percent total paste coverage initially.
- [ ] Calculate and document the actual percentage.
- [ ] Record every paste-window dimension and spacing.
- [ ] Confirm stencil thickness and paste type.
- [ ] Connect all thermal vias to GND.
- [ ] Prevent solder wicking through untreated vias.
- [ ] Define X-ray acceptance criteria for voiding.
- [ ] Record source drawing number, revision, and verification date.

---

## 16. Assign exact manufacturer parts and footprints

Every item must include:

- [ ] Manufacturer
- [ ] Manufacturer part number
- [ ] Description and value
- [ ] Tolerance
- [ ] Voltage and power rating
- [ ] Temperature range
- [ ] Dielectric or material
- [ ] Package
- [ ] Lifecycle status
- [ ] Supplier reference
- [ ] Approved alternatives
- [ ] Exact KiCad footprint
- [ ] Populate or DNP status

This applies to the hub controller, buck regulator, port switches, charging controllers, ESD arrays, LDO, crystal, EEPROM, TVS diode, reverse-polarity device, fuse, inductor, all passives, connectors, test points, LEDs, and mounting hardware.

---

## 17. Configure the four-layer PCB stack-up

Default proposed stack-up: JLCPCB `JLC04161H-7628`, subject to final fabricator confirmation.

- [ ] F.Cu: 35 um outer copper, components and high-speed signals.
- [ ] Dielectric 1: 0.2104 mm 7628 prepreg.
- [ ] In1.Cu: 15.2 um uninterrupted GND plane.
- [ ] Core: 1.065 mm.
- [ ] In2.Cu: 15.2 um power distribution.
- [ ] Dielectric 3: 0.2104 mm 7628 prepreg.
- [ ] B.Cu: 35 um outer copper, low-speed signals.
- [ ] Finished thickness: approximately 1.6 mm.
- [ ] Add solder-mask thickness and dielectric properties.
- [ ] Add dielectric constant and loss tangent.
- [ ] Specify controlled impedance in fabrication notes.
- [ ] Confirm the final copper weight.
- [ ] Recalculate current-carrying copper for the selected finished copper weight.

---

## 18. Impedance-tune every USB pair

Starting geometry for the proposed stack-up:

```text
Target differential impedance: 90 ohms
Trace width:                  0.2332 mm
Pair spacing:                 0.1500 mm
Reference plane:              In1.Cu solid GND
Clearance to unrelated copper: at least 0.3000 mm
```

- [ ] Confirm geometry with the selected fabricator.
- [ ] Create a USB differential net class.
- [ ] Assign all upstream and downstream pairs.
- [ ] Use KiCad-recognized `+` and `-` net names.
- [ ] Route on F.Cu over uninterrupted In1.Cu.
- [ ] Avoid vias where possible.
- [ ] If vias are unavoidable, use matched vias and adjacent return vias.
- [ ] Keep intrapair skew within the chosen limit, initially 0.5 mm maximum.
- [ ] Match routing through ESD components.
- [ ] Avoid stubs, asymmetric escapes, and test-point branches.
- [ ] Keep pairs away from board edges, crystal traces, SW, BOOT, and the inductor.
- [ ] Never cross a ground-plane split.
- [ ] Add 90 ohm differential impedance notes to fabrication outputs.
- [ ] Request controlled impedance in the fabrication order.
- [ ] Review and approve any fabricator-proposed geometry adjustment.
- [ ] Obtain impedance reports or use TDR coupons where required.

---

## 19. Complete PCB placement

- [ ] Place all USB connectors with adequate plug and cable access.
- [ ] Place ESD arrays immediately behind connectors.
- [ ] Place each port switch near its connector.
- [ ] Place local VBUS capacitors near each switch and receptacle.
- [ ] Place the USB2517 centrally to minimize route lengths.
- [ ] Place the crystal directly beside the controller.
- [ ] Place every bypass capacitor beside its pin.
- [ ] Place the 3.3 V regulator close to the hub controller.
- [ ] Physically separate the buck converter from USB routing and oscillator circuitry.
- [ ] Place buck input capacitors directly at PVIN/PGND.
- [ ] Place the inductor directly at SW.
- [ ] Place output capacitors directly after the inductor.
- [ ] Keep SW copper compact.
- [ ] Keep sensitive control components away from SW and BOOT.
- [ ] Route remote sense in Kelvin fashion.
- [ ] Add mounting holes and keep-outs.
- [ ] Verify screw-terminal access.
- [ ] Perform a complete 3D mechanical interference review.

---

## 20. Complete PCB routing

- [ ] Update the PCB directly from the final schematic.
- [ ] Route every schematic net.
- [ ] Ensure every track begins and ends on the correct pads.
- [ ] Route all USB pairs with the impedance-controlled geometry.
- [ ] Route 12 V using sufficient copper area.
- [ ] Route the shared 5 V rail as a substantial plane or pour.
- [ ] Route each port branch for 2 A electrical capability.
- [ ] Use calculated high-current via arrays for layer changes.
- [ ] Route fault and enable lines away from the converter switch node.
- [ ] Route remote sense as a tightly coupled Kelvin pair.
- [ ] Avoid shared impedance in remote-sense returns.
- [ ] Route crystal traces without vias.
- [ ] Add shield and ground stitching.
- [ ] Add return vias at signal layer changes.
- [ ] Select solid or thermal pad connections appropriately.
- [ ] Ensure thermal reliefs do not create excessive voltage drop.
- [ ] Add test points without affecting USB signal integrity.

---

## 21. Create and refill all copper zones

- [ ] In1.Cu: continuous GND plane.
- [ ] In2.Cu: defined 12 V, 5 V, and 3.3 V power regions.
- [ ] F.Cu: local high-current pours around the converter and port switches.
- [ ] B.Cu: low-speed routing and auxiliary ground as appropriate.
- [ ] Define zone priority, clearance, thermal settings, minimum neck width, and minimum island area.
- [ ] Remove isolated copper islands.
- [ ] Add ground stitching vias.
- [ ] Add controller and regulator thermal-via arrays.
- [ ] Ensure no power split lies beneath USB pairs.
- [ ] Keep SW copper no larger than necessary.
- [ ] Refill zones after every routing change.
- [ ] Save the released PCB with filled zones present.
- [ ] Inspect the filled result on every layer.

---

## 22. Resolve every intentional unconnected pin

Create a formal no-connect register containing reference, pin number, pin name, reason, data-sheet basis, ERC treatment, PCB treatment, and test implication.

Expected entries may include:

- [ ] Unused USB2517 LED outputs.
- [ ] Optional USB2517 EEPROM/SMBus functions, depending on configuration.
- [ ] USB2517 documented test or unused multifunction pins.
- [ ] TPS548B22 documented no-connect pins.
- [ ] GCT USB1086 SuperSpeed pins 5 to 9 on J2 to J8.
- [ ] Unused charging-controller pins.
- [ ] DNP configuration and tuning footprints.

No unused input may float unless the manufacturer explicitly documents a safe internal bias.

---

## 23. Run and clear schematic ERC

- [ ] Annotate references.
- [ ] Assign every footprint.
- [ ] Add power flags only where electrically correct.
- [ ] Add explicit no-connect flags.
- [ ] Resolve unpowered power inputs.
- [ ] Resolve output-to-output conflicts.
- [ ] Resolve unconnected pins.
- [ ] Resolve duplicate or inconsistent labels.
- [ ] Resolve hidden power-pin issues.
- [ ] Resolve hierarchical-label inconsistencies.
- [ ] Resolve incorrect differential net names.
- [ ] Run ERC with zero unexplained errors.
- [ ] Manually review every warning.
- [ ] Export and archive the ERC report.
- [ ] Record accepted exceptions with engineering justification.

---

## 24. Run and clear PCB DRC

- [ ] Update PCB from schematic.
- [ ] Verify all schematic and PCB references match.
- [ ] Verify every footprint is schematic-linked.
- [ ] Remove unjustified PCB-only items.
- [ ] Refill all zones.
- [ ] Resolve clearance violations.
- [ ] Resolve track-width violations.
- [ ] Resolve differential-gap and skew violations.
- [ ] Resolve unconnected pads.
- [ ] Resolve dangling tracks and vias.
- [ ] Resolve courtyard overlaps.
- [ ] Resolve silkscreen-over-pad errors.
- [ ] Resolve hole-to-hole and copper-to-edge errors.
- [ ] Resolve solder-mask slivers.
- [ ] Resolve zone and thermal-pad warnings.
- [ ] Run final DRC with zero unexplained errors.
- [ ] Export and archive the DRC report.
- [ ] Record the exact KiCad build used.

---

## 25. Complete pre-fabrication power-integrity analysis

- [ ] Model DC resistance from the terminal to converter input.
- [ ] Model the shared 5 V rail.
- [ ] Model each 2 A port branch.
- [ ] Include terminal, fuse, reverse protection, inductor, switch, via, plane, and connector resistance.
- [ ] Calculate worst-case VBUS at every connector.
- [ ] Verify compliant voltage at the receptacle.
- [ ] Analyze current crowding and plane neck-downs.
- [ ] Analyze seven-port simultaneous startup.
- [ ] Analyze worst-case downstream capacitance and inrush.
- [ ] Analyze host attach and detach.
- [ ] Analyze shorts and fault recovery.
- [ ] Simulate the regulator using a vendor model where available.
- [ ] Document assumptions, tolerances, and temperature effects.

---

## 26. Complete pre-fabrication thermal analysis

- [ ] Estimate buck high-side and low-side conduction loss.
- [ ] Estimate switching, gate-drive, and dead-time loss.
- [ ] Estimate inductor copper and core loss.
- [ ] Estimate reverse-protection loss.
- [ ] Estimate fuse and input-terminal heating.
- [ ] Estimate PCB plane and via heating.
- [ ] Estimate each port-switch loss at 2 A.
- [ ] Estimate USB connector contact heating at 2 A.
- [ ] Model worst-case ambient and enclosure temperature.
- [ ] Evaluate thermal-via effectiveness.
- [ ] Verify all junction and component temperatures remain below ratings with margin.
- [ ] Define thermal test points for prototype validation.

---

## 27. Complete pre-fabrication transient and stability analysis

- [ ] Calculate inductor ripple at minimum, nominal, and maximum input voltage.
- [ ] Calculate peak inductor current.
- [ ] Verify current limit against inductor saturation.
- [ ] Calculate input and output ripple.
- [ ] Calculate output capacitance for worst-case load insertion and release.
- [ ] Include capacitor ESR, ESL, DC-bias, tolerance, and temperature derating.
- [ ] Check D-CAP3 stability requirements.
- [ ] Verify mode, frequency, and soft-start strap values.
- [ ] Verify startup into the full output-capacitor bank.
- [ ] Verify startup with connected USB devices.
- [ ] Verify simultaneous port enabling.
- [ ] Verify fault-recovery behavior.
- [ ] Produce a calculation or simulation report.
- [ ] Define prototype load-step acceptance limits.

---

## 28. Prepare fabrication and assembly outputs

- [ ] Finalize board part number and revision.
- [ ] Add stack-up and controlled-impedance notes.
- [ ] Add copper-weight, material, thickness, surface-finish, and via-treatment requirements.
- [ ] Add QFN and LQFN stencil and assembly notes.
- [ ] Add impedance coupon requirements if used.
- [ ] Generate Gerbers and drill files.
- [ ] Generate IPC-2581 or ODB++ where supported.
- [ ] Generate pick-and-place files.
- [ ] Generate BOM and approved-vendor list.
- [ ] Generate fabrication and assembly drawings.
- [ ] Generate paste layers.
- [ ] Generate a 3D STEP board model.
- [ ] Review outputs in an independent Gerber viewer.
- [ ] Verify every drill, slot, cutout, and board edge.
- [ ] Verify connector orientation in assembly outputs.
- [ ] Print footprints at 1:1 scale and place physical components on the printout.
- [ ] Archive the complete release package.

---

## 29. Prototype bring-up

- [ ] Assemble a small prototype batch.
- [ ] X-ray USB2517 and TPS548B22 solder joints.
- [ ] Inspect all connector and terminal joints.
- [ ] Test for shorts before power application.
- [ ] Power from a current-limited laboratory supply.
- [ ] Verify 12 V, 5 V, 3.3 V, VDD18, and VDD18PLL.
- [ ] Verify reset timing.
- [ ] Verify 24 MHz oscillator startup and frequency.
- [ ] Verify USB enumeration.
- [ ] Verify all seven ports independently and simultaneously.
- [ ] Verify port enables and over-current reporting.
- [ ] Verify no upstream VBUS backfeed.
- [ ] Verify EEPROM contents and descriptors if fitted.
- [ ] Record measured voltages, currents, temperatures, and waveforms.

---

## 30. Hardware converter validation

### Power measurements

- [ ] Measure efficiency at representative loads from light load to full load.
- [ ] Measure input ripple.
- [ ] Measure 5 V ripple with a low-inductance probe.
- [ ] Measure each port at 0, 1, 1.5, and 2 A.
- [ ] Test seven simultaneous port loads.
- [ ] Measure cable and connector voltage drop.
- [ ] Test minimum and maximum 12 V input.
- [ ] Test supply hot-plug and simultaneous port startup.

### Transient measurements

- [ ] Apply load insertion and load-release steps.
- [ ] Measure undershoot, overshoot, and recovery time.
- [ ] Test simultaneous switching of port loads.
- [ ] Confirm the hub does not reset or disconnect.
- [ ] Verify port fault recovery.

### Stability measurements

- [ ] Perform Bode or loop-response measurement where practical.
- [ ] Verify stability across input, load, temperature, and capacitor tolerance.
- [ ] Check for subharmonic or multiple-pulsing operation.
- [ ] Test FCCM and skip mode if both are supported.

### Switch-node measurements

- [ ] Measure SW peak voltage and ringing.
- [ ] Tune the RC snubber.
- [ ] Recheck efficiency after tuning.
- [ ] Verify BOOT-to-SW voltage.
- [ ] Verify switch-node emissions are acceptable.

### Thermal measurements

- [ ] Soak at full aggregate load.
- [ ] Measure regulator, inductor, reverse protection, fuse, terminal, port switches, and USB connectors.
- [ ] Repeat at maximum ambient temperature.
- [ ] Repeat in the final enclosure.
- [ ] Confirm junction-temperature margin.

---

## 31. USB and charging validation

- [ ] Test low-speed, full-speed, and high-speed USB devices.
- [ ] Test seven simultaneous devices.
- [ ] Test hubs and composite devices downstream.
- [ ] Test suspend, resume, host sleep, and wake.
- [ ] Test connect and disconnect on every port.
- [ ] Verify over-current reporting.
- [ ] Verify BC1.2 primary and secondary detection.
- [ ] Verify CDP operation while retaining USB data.
- [ ] Verify devices do not exceed advertised current.
- [ ] Test representative phones, tablets, storage devices, and peripherals.
- [ ] Perform USB eye-diagram and signal-quality testing.
- [ ] Test representative cable combinations.
- [ ] Verify descriptors and power declarations.
- [ ] Perform USB-IF compliance testing if compliance will be claimed.
- [ ] Do not advertise unsupported standards-compliant 2 A USB-A charging.

---

## 32. EMC, ESD, and safety validation

- [ ] Conducted-emissions pre-scan.
- [ ] Radiated-emissions pre-scan.
- [ ] Immunity testing as applicable.
- [ ] ESD contact discharge at all connectors.
- [ ] ESD air discharge around the enclosure.
- [ ] EFT and surge testing if required by the use environment.
- [ ] Verify touch temperatures.
- [ ] Verify conductor, terminal, fuse, and connector ratings.
- [ ] Verify creepage, clearance, reverse-polarity protection, and single-fault behavior.
- [ ] Verify enclosure fire requirements.
- [ ] Complete required regulatory assessment and markings.

---

## 33. Production documentation and release control

- [ ] Assign formal product, board, and assembly part numbers.
- [ ] Assign hardware revision.
- [ ] Maintain schematic and PCB revision histories.
- [ ] Maintain an approved manufacturer list.
- [ ] Version the EEPROM image and programming tool.
- [ ] Create programming, manufacturing-test, bring-up, and fault-diagnosis procedures.
- [ ] Define production test limits.
- [ ] Archive power-integrity, thermal, transient, signal-integrity, USB, EMC, and ESD reports.
- [ ] Archive ERC and DRC reports.
- [ ] Obtain schematic sign-off.
- [ ] Obtain PCB-layout sign-off.
- [ ] Obtain manufacturing sign-off.
- [ ] Freeze and archive the exact source and output files used for production.

---

# Current status summary

## Partially complete

- [x] Seven-port architecture selected.
- [x] Preliminary USB2517 pin map identified.
- [x] Preliminary 12 V input and 5 V power architecture considered.
- [x] Preliminary four-layer concept considered.
- [x] Preliminary USB and high-current design rules considered.
- [x] Candidate connectors and power switches identified.
- [x] Preliminary converter calculations performed.
- [x] Preliminary BOM and placement concept created.

## Not complete

- [ ] Native production `.kicad_sch`.
- [ ] Full multi-sheet peripheral schematic.
- [ ] Complete 40-pin TPS548B22 implementation.
- [ ] Selected and verified CDP charging-controller circuit.
- [ ] Authenticated or fully verified manufacturer footprints.
- [ ] Manufacturer-confirmed USB2517 exposed-pad land pattern.
- [ ] Schematic-linked PCB synchronization.
- [ ] Fully pad-connected routing.
- [ ] Final filled and reviewed copper zones.
- [ ] ERC pass.
- [ ] DRC pass.
- [ ] Fabricator-approved impedance geometry.
- [ ] Power-integrity validation.
- [ ] Thermal validation.
- [ ] Transient and stability validation.
- [ ] USB compliance validation.
- [ ] EMC and ESD validation.
- [ ] Final fabrication outputs.
- [ ] Production release documentation.

---

# Release gate

**The design must not be fabricated or powered until all of the following are true:**

- [ ] Native schematic is complete and audited.
- [ ] Every part has an exact approved MPN and footprint.
- [ ] PCB is updated directly from the schematic.
- [ ] All routes terminate on the intended pads.
- [ ] Copper zones are filled and reviewed.
- [ ] ERC and DRC contain no unexplained errors.
- [ ] Impedance geometry is approved for the selected stack-up.
- [ ] Power, thermal, and transient calculations are approved.
- [ ] Manufacturing outputs pass independent review.
- [ ] Prototype testing confirms safe and stable operation.
- [ ] USB, charging, EMC, ESD, and regulatory requirements are satisfied.
