# USB2517 Seven-Port Hub: Routing, Length-Matching, and Connector Line Specifications

**Document date:** 10 September 2026  
**Units:** millimetres unless stated otherwise  
**Assumed PCB stack-up:** JLCPCB JLC04161H-7628, four layers, 1.6 mm nominal thickness  
**USB routing layer:** F.Cu referenced continuously to In1.Cu solid GND  
**USB impedance target:** 90 ohms differential  
**Preliminary USB geometry:** 0.2332 mm track width, 0.1500 mm pair gap, at least 0.3000 mm clearance to unrelated copper

> Important: Only the two members of a particular differential pair must be length-matched to each other. USB port 1 does not need to have the same total route length as USB port 2, and the upstream pair does not need to equal any downstream pair. Power, ground, enable, fault, I2C, reset, and LED lines do not need to be equal-length unless specifically stated below.

---

## 1. Global length-measurement rules

Use these rules whenever KiCad reports or tunes a route length:

1. Measure from the source component pad to the final destination connector pad.
2. Include all copper before, through, and after the ESD array.
3. Include track length on every copper layer.
4. Include the electrical contribution of vias where the routing tool supports it.
5. Both members of a differential pair must use the same number and type of vias.
6. Do not match only the controller-to-ESD section. Match the entire controller-to-connector channel.
7. Do not add a long tuning meander at one end if a local asymmetry can be corrected near the asymmetry.
8. Keep tuning meanders loose enough to avoid strong self-coupling. Use at least 0.70 mm spacing between adjacent parallel sections of the same tuned trace where practical.
9. Do not place tuning meanders beneath connectors, inside the ESD discharge path, beside the crystal, or near the buck converter switch node.
10. The final released design should have no unexplained mismatch or unmatched via count.

---

## 2. USB differential-pair matching table

### Mandatory pair-by-pair matching

| Interface | Positive member | Negative member | Match each line to | Maximum P-to-N mismatch | Preferred released mismatch | Target total PCB route | Impedance and geometry |
|---|---|---|---|---:|---:|---:|---|
| Upstream host, J1 | `USBUP_DP`, U1 pin 59 to J1 pin 3 | `USBUP_DM`, U1 pin 58 to J1 pin 2 | Each other, across the complete U1 to ESD to J1 route | 0.50 mm | 0.25 mm or less | 100 mm maximum preferred | 90 ohms differential; W 0.2332 mm; gap 0.1500 mm; unrelated copper clearance at least 0.3000 mm |
| Downstream port 1, J2 | `USBDN1_DP`, U1 pin 2 to J2 pin 3 | `USBDN1_DM`, U1 pin 1 to J2 pin 2 | Each other, across the complete U1 to ESD to J2 route | 0.50 mm | 0.25 mm or less | 100 mm maximum preferred | Same USB differential geometry |
| Downstream port 2, J3 | `USBDN2_DP`, U1 pin 4 to J3 pin 3 | `USBDN2_DM`, U1 pin 3 to J3 pin 2 | Each other, across the complete U1 to ESD to J3 route | 0.50 mm | 0.25 mm or less | 100 mm maximum preferred | Same USB differential geometry |
| Downstream port 3, J4 | `USBDN3_DP`, U1 pin 7 to J4 pin 3 | `USBDN3_DM`, U1 pin 6 to J4 pin 2 | Each other, across the complete U1 to ESD to J4 route | 0.50 mm | 0.25 mm or less | 100 mm maximum preferred | Same USB differential geometry |
| Downstream port 4, J5 | `USBDN4_DP`, U1 pin 9 to J5 pin 3 | `USBDN4_DM`, U1 pin 8 to J5 pin 2 | Each other, across the complete U1 to ESD to J5 route | 0.50 mm | 0.25 mm or less | 100 mm maximum preferred | Same USB differential geometry |
| Downstream port 5, J6 | `USBDN5_DP`, U1 pin 12 to J6 pin 3 | `USBDN5_DM`, U1 pin 11 to J6 pin 2 | Each other, across the complete U1 to ESD to J6 route | 0.50 mm | 0.25 mm or less | 100 mm maximum preferred | Same USB differential geometry |
| Downstream port 6, J7 | `USBDN6_DP`, U1 pin 54 to J7 pin 3 | `USBDN6_DM`, U1 pin 53 to J7 pin 2 | Each other, across the complete U1 to ESD to J7 route | 0.50 mm | 0.25 mm or less | 100 mm maximum preferred | Same USB differential geometry |
| Downstream port 7, J8 | `USBDN7_DP`, U1 pin 56 to J8 pin 3 | `USBDN7_DM`, U1 pin 55 to J8 pin 2 | Each other, across the complete U1 to ESD to J8 route | 0.50 mm | 0.25 mm or less | 100 mm maximum preferred | Same USB differential geometry |

### USB matching interpretation

- `DP` is matched only to the `DM` line belonging to the same USB port.
- Do not make all eight USB channels the same overall length.
- A shorter clean route is better than equalizing all ports to the longest route.
- The 0.50 mm maximum is a conservative project design rule, not the full USB timing allowance.
- Use 0.25 mm or less as the layout-release target because connector escape, ESD package, and fabrication tolerances consume additional skew budget.
- If one pair member uses a via, the other member must use a corresponding via at the same channel location.
- Keep the two lines parallel and maintain the defined gap except where the connector, ESD array, or controller fan-out forces a short uncoupled region.
- Keep each forced uncoupled region below 3.0 mm where possible.
- Do not insert test points as branches on `DP` or `DM`.

---

## 3. USB segment-level requirements around every ESD array

For each USB channel, treat the route as two segments but match the entire channel:

| Segment | Route | Matching requirement | Maximum local asymmetry | General rule |
|---|---|---|---:|---|
| Controller side | USB2517 pad to ESD-array device-side pad | DP and DM follow the same topology | 0.25 mm | Same layer, same bends, same via count |
| Connector side | ESD-array connector-side pad to USB connector pad | DP and DM follow the same topology | 0.25 mm | Keep as short as possible, preferably 5.0 mm or less |
| ESD ground return | ESD ground pad to ground plane/chassis return | No signal length matching | Not applicable | Prefer less than 2.0 mm copper path with one or more nearby ground vias |

The connector-side segment is not deliberately lengthened to match another port. Its purpose is to place the ESD device close to the connector and divert discharge current before it enters the board.

---

## 4. General line specification by connector

### J1: Molex 480370001 upstream USB-A male

| Pin | Net | Function | Width or construction | Length matching | Length and routing requirement |
|---:|---|---|---|---|---|
| 1 | `VBUS_UP` | Upstream VBUS detection only | 0.25 to 0.40 mm | None | Keep under 25 mm to divider/protection; never connect to `5V_LOCAL` |
| 2 | `USBUP_DM` | Upstream USB D- | 0.2332 mm | Match to `USBUP_DP` within 0.50 mm | Entire U1-to-J1 route preferably 100 mm or less |
| 3 | `USBUP_DP` | Upstream USB D+ | 0.2332 mm | Match to `USBUP_DM` within 0.50 mm | Entire U1-to-J1 route preferably 100 mm or less |
| 4 | `GND` | Signal/power return | Plane connection plus short local copper | None | Direct connection to solid ground plane |
| Shield | `SHIELD` or chassis network | Cable shield | Wide copper and stitching vias | None | Keep shield current out of USB signal and controller return paths |

General J1 rules:

- Place the ESD array immediately behind J1.
- Use the official Molex pad and retention-hole pattern.
- Keep the connector-to-ESD DP/DM segment preferably 5.0 mm or less.
- Do not route downstream or local 5 V power into J1 VBUS.
- Keep the pair over solid In1.Cu ground.
- Keep at least 0.3000 mm from unrelated copper and preferably 1.0 mm from switching-power copper.

### J2 to J8: GCT USB1086-GF-B downstream USB-A receptacles

The following applies independently to each connector.

| Pin | Net | Function | Width or construction | Length matching | Length and routing requirement |
|---:|---|---|---|---|---|
| 1 | `VBUS_Px` | Protected 5 V port power | 2.00 mm preferred, 1.50 mm absolute project minimum on 1 oz outer copper | None | Keep power-switch-to-connector route preferably 30 mm or less |
| 2 | `USBx_DM` | USB 2.0 D- | 0.2332 mm | Match to same port `USBx_DP` within 0.50 mm | U1-to-connector route preferably 100 mm or less |
| 3 | `USBx_DP` | USB 2.0 D+ | 0.2332 mm | Match to same port `USBx_DM` within 0.50 mm | U1-to-connector route preferably 100 mm or less |
| 4 | `GND` | USB power and signal return | Plane plus multiple connector-area vias | None | Short direct connection to In1.Cu GND |
| 5 to 9 | NC | Unused SuperSpeed contacts | No copper connection | None | Explicit no-connect; no dangling copper |
| Shield stakes | `SHIELD` or chassis network | Connector shell | Wide copper and at least two nearby stitching vias | None | Follow approved shield strategy |

General J2-to-J8 rules:

- Each port is matched only within its own DP/DM pair.
- Do not match J2 route length to J3, J4, J5, J6, J7, or J8.
- Place each ESD array immediately adjacent to its connector.
- Keep the ESD-to-connector data segment preferably 5.0 mm or less.
- Place the port power switch and output capacitor near the connector.
- Keep VBUS away from the differential pair by at least 0.3000 mm and preferably 0.50 mm.
- Add at least two nearby GND stitching vias around each connector shell region.
- Keep the USB pair away from the VBUS switch, its fault line, and any high-current neck-down.

### J9: Phoenix Contact 1715721 12 V screw terminal

| Pin | Net | Function | Width or construction | Length matching | Length and routing requirement |
|---:|---|---|---|---|---|
| 1 | `12V_IN` | Main 12 V input | Copper pour preferred; 5.0 mm preferred trace minimum between terminal and protection at full design load | None | Keep terminal-to-fuse-to-protection-to-input-capacitor path compact, preferably under 40 mm total |
| 2 | `GND` | Main input return | Solid copper pour/plane matching the forward path current capacity | None | Return directly to converter input-capacitor PGND region without a narrow neck |

General J9 rules:

- No length matching is required between +12 V and GND.
- Their current paths should follow the same physical corridor to minimize loop area.
- Place fuse, TVS, reverse-polarity protection, and input bulk capacitance near J9.
- Target less than 10 mm from J9 to the first protection element where mechanically practical.
- Avoid routing USB or crystal traces through the 12 V input-current loop.

### Optional EEPROM/programming connector

| Signal | Width | Length matching | Maximum preferred length | Rule |
|---|---:|---|---:|---|
| `SDA` | 0.20 to 0.25 mm | None | 100 mm | Keep away from SW; add pull-up near the bus owner |
| `SCL` | 0.20 to 0.25 mm | No matching to SDA required | 100 mm | Keep away from SW; avoid long stubs |
| `3V3` | 0.25 to 0.50 mm | None | As short as practical | Decouple at EEPROM/header load |
| `GND` | Plane or 0.50 mm trace for header return | None | As short as practical | Provide adjacent ground pin where possible |
| `WP` | 0.20 to 0.25 mm | None | 100 mm | Define with pull-up or pull-down; do not float |

---

## 5. Non-connector line matching and routing list

### Clock circuit

| Net or line | Match to | Maximum mismatch | Width | Maximum preferred route | Additional rule |
|---|---|---:|---:|---:|---|
| `XTAL1` from U1 to Y1 | `XTAL2` topology should be similar, but exact length matching is not required | 1.0 mm project symmetry target | 0.20 to 0.25 mm | 10 mm | No vias; place crystal adjacent to U1 |
| `XTAL2` from U1 to Y1 | `XTAL1` topology should be similar | 1.0 mm project symmetry target | 0.20 to 0.25 mm | 10 mm | No vias; no test point |
| Y1 to Cload1 | Y1 to Cload2 should be geometrically similar | 1.0 mm project symmetry target | 0.20 to 0.25 mm | 5 mm | Capacitors immediately beside crystal/controller |
| Y1 to Cload2 | Y1 to Cload1 should be geometrically similar | 1.0 mm project symmetry target | 0.20 to 0.25 mm | 5 mm | Direct ground via at capacitor return |

### Buck converter remote sense

| Net or line | Match to | Maximum mismatch | Width | Maximum preferred route | Additional rule |
|---|---|---:|---:|---:|---|
| `RSP` | Route beside `RSN` with same topology | 1.0 mm project target | 0.20 to 0.25 mm | 80 mm | Kelvin sense from 5 V distribution point; no load current |
| `RSN` | Route beside `RSP` with same topology | 1.0 mm project target | 0.20 to 0.25 mm | 80 mm | Kelvin sense from output ground sense point; no load current |
| `VOSNS` | No equal-length requirement | Not applicable | 0.20 to 0.25 mm | 50 mm | Route directly to regulated output sense point |

RSP and RSN are not an impedance-controlled communications pair. The matching target exists to keep their noise pickup and routing environment similar.

### Port control lines

| Lines | Match to | Width | Maximum preferred length | Rule |
|---|---|---:|---:|---|
| `PRTPWR1` to `PRTPWR7` | No matching to each other | 0.20 to 0.25 mm | 100 mm | Avoid SW and inductor; add series damping only if testing requires it |
| `OCS1_N` to `OCS7_N` | No matching to each other | 0.20 to 0.25 mm | 100 mm | Keep away from SW; maintain valid logic pull-up arrangement |
| Port LED lines | No matching | 0.20 to 0.25 mm | 150 mm | Low-speed; avoid USB pair coupling |

### Configuration, reset, and I2C lines

| Lines | Match to | Width | Maximum preferred length | Rule |
|---|---|---:|---:|---|
| `RESET_N` | None | 0.20 to 0.25 mm | 50 mm | Keep away from SW and ESD return; no floating input |
| `CFG_SEL0/1/2` | None | 0.20 to 0.25 mm | 50 mm | Strap resistor close to U1; no floating input |
| `LOCAL_PWR` | None | 0.20 to 0.25 mm | 50 mm | Defined pull state and clean rail sensing |
| `SDA` and `SCL` | Do not length-match to each other | 0.20 to 0.25 mm | 100 mm | Keep same bus topology, minimize stubs |
| `EEPROM_WP` | None | 0.20 to 0.25 mm | 100 mm | Defined pull state |
| `RBIAS` | None | 0.20 to 0.25 mm | 5 mm | 12.0 kOhm resistor immediately adjacent to U1; quiet ground return |

### Hub power and bypass lines

| Net | Match to | Width/construction | Maximum preferred length | Rule |
|---|---|---|---:|---|
| `3V3` main rail | None | Plane/pour or at least 0.75 mm trunk | As short as practical | Decouple each supply pin locally |
| `VDDA33` branches | None | 0.30 to 0.50 mm | 10 mm from local capacitor to pin | Quiet 3.3 V branch; no daisy-chain through pin pads |
| `VDD18` capacitor loop | None | 0.30 to 0.50 mm | 3 mm pin-to-capacitor preferred | Output only; capacitor directly to GND |
| `VDD18PLL` capacitor loop | None | 0.30 to 0.50 mm | 3 mm pin-to-capacitor preferred | Quiet output only; capacitor directly to GND |
| `VDD33CR` bypass loop | None | 0.30 to 0.50 mm | 3 mm pin-to-capacitor preferred | Local 100 nF and required bulk capacitance |
| `GND` | None | Continuous plane | Not applicable | No slots beneath USB or clock lines |

### Buck converter power lines

| Net or section | Match to | Width/construction | Maximum preferred length | Rule |
|---|---|---|---:|---|
| `12V_IN` terminal to input protection | None | 5.0 mm or pour | 10 mm to first protection preferred | High-current path |
| Protected 12 V to PVIN capacitors | None | Wide pour | 20 mm | Minimize hot-loop area |
| PVIN capacitor to TPS548B22 PVIN | None | Wide, short copper | 5 mm | Place capacitors directly at pins |
| Input capacitor GND to PGND | None | Wide, short copper | 5 mm | Same hot loop as PVIN path |
| `SW` to inductor | None | Copper pour, approximately 5 mm wide only as needed | 10 mm | Keep copper area compact; no USB nearby |
| Inductor to output capacitors | None | Wide plane/pour | 15 mm | Keep output loop compact |
| `5V_LOCAL` trunk | None | Plane/pour; 8.0 mm minimum only where a plane is impossible | As short as practical | Designed for aggregate load, not as a single narrow trace |
| Individual `VBUS_Px` | None | 2.0 mm preferred | 30 mm | From port switch to connector; verify voltage drop and temperature |
| `BOOT` to bootstrap capacitor | None | 0.20 to 0.40 mm | 3 mm | Capacitor directly at BOOT/SW pins |
| `ILIM`, `MODE`, `VSEL`, `FSEL` | None | 0.20 to 0.25 mm | 10 mm | Components close to IC; keep away from SW |
| `PGOOD` and `ENABLE` | None | 0.20 to 0.25 mm | 100 mm | Low-speed control; avoid switch node |

---

## 6. KiCad constraint values to enter

### USB differential class

```text
Track width:                 0.2332 mm
Differential pair gap:       0.1500 mm
Minimum unrelated clearance: 0.3000 mm
Maximum intra-pair skew:     0.5000 mm
Preferred release skew:      0.2500 mm or less
Preferred maximum route:     100.0000 mm per channel
Via count:                   identical within each pair
Reference plane:             In1.Cu solid GND
```

### High-current classes

```text
Individual VBUS_P1..P7:
  Preferred width: 2.000 mm
  Absolute project minimum: 1.500 mm
  Preferred maximum run: 30.000 mm

12V_IN:
  Preferred trace width when a pour is impossible: 5.000 mm
  Preferred construction: copper pour

5V_LOCAL aggregate trunk:
  Preferred construction: plane or copper pour
  Trace fallback width: 8.000 mm minimum, subject to current/thermal calculation
```

### Low-speed and control class

```text
Track width:       0.200 to 0.250 mm
Minimum clearance: 0.200 mm
Default maximum preferred length: 100.000 mm
Length matching:   none unless specifically listed
```

---

## 7. What must not be length-matched

Do not deliberately add length to make any of the following equal:

- One USB port's pair to another USB port's pair.
- Upstream USB route to any downstream USB route.
- `PRTPWR1` through `PRTPWR7` to each other.
- `OCS1_N` through `OCS7_N` to each other.
- `SDA` to `SCL`.
- VBUS branches to each other.
- 12 V input and GND.
- 5 V and GND.
- LED lines.
- Configuration strap lines.
- Reset and local-power lines.

Unnecessary matching wastes area, increases loss, adds crosstalk, and may make a short clean route worse.

---

## 8. Final routing audit list

For every USB connector:

- [ ] DP is matched to DM within 0.50 mm.
- [ ] Preferred mismatch is 0.25 mm or less.
- [ ] Both pair members use the same layer sequence.
- [ ] Both pair members use the same via count.
- [ ] Width is 0.2332 mm except for short pad escapes.
- [ ] Gap is 0.1500 mm except for short pad escapes.
- [ ] Unrelated copper clearance is at least 0.3000 mm.
- [ ] The pair runs over uninterrupted In1.Cu GND.
- [ ] The pair does not cross a plane split.
- [ ] There are no branched test-point stubs.
- [ ] Connector-to-ESD distance is preferably 5.0 mm or less.
- [ ] ESD ground return is preferably 2.0 mm or less.
- [ ] The pair stays away from SW, BOOT, the inductor, and the input hot loop.
- [ ] Pair length is not padded merely to match a different port.

For every power connector:

- [ ] Copper width/pour supports the calculated current and temperature rise.
- [ ] Forward and return paths have small loop area.
- [ ] No narrow thermal relief limits the designed current.
- [ ] Required fuse, TVS, reverse protection, and capacitance are close to the connector.
- [ ] Voltage drop is calculated at maximum current.
- [ ] Connector and copper temperatures are included in prototype testing.

---

## 9. Status of numerical values

The values in this document fall into three categories:

1. **Stack-up-derived starting values:** USB width 0.2332 mm, gap 0.1500 mm, and 0.3000 mm unrelated-copper clearance for the proposed JLC04161H-7628 construction.
2. **Conservative project rules:** 0.50 mm maximum USB pair mismatch, 0.25 mm preferred release mismatch, 100 mm preferred maximum USB PCB route, and the listed low-speed preferred lengths.
3. **Power-layout starting values:** 2.0 mm port VBUS branches, 5.0 mm 12 V trace fallback, and 8.0 mm 5 V trunk fallback. These must be replaced by planes/pours where practical and confirmed by current-density, voltage-drop, copper-weight, temperature-rise, and prototype measurements.

The PCB fabricator may adjust USB trace width to meet 90 ohms differential. If so, update both the KiCad net class and this document before release.

---

## 10. Source basis

- Microchip USB2517 Hardware Design Checklist, document 00004211.
- Microchip USB2517/USB2517I data sheet.
- JLCPCB controlled-impedance stack-up information for JLC04161H-7628.
- JITX published 90-ohm geometry for JLC04161H-7628.
- USB 2.0 high-speed differential impedance target and skew guidance.

This document is a routing constraint schedule, not a substitute for fabricator impedance confirmation, KiCad DRC, signal-integrity analysis, or prototype compliance testing.
