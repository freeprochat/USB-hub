# USB2517 pin-level KiCad project

This package contains a normal legacy KiCad schematic with a custom cache library, a 64-pin USB2517 symbol, explicit pin-to-net connectivity matrix, a four-layer PCB with pads, named nets, differential routes, high-current power routes and GND/5V zones. KiCad 6-9 can open and convert the legacy `.sch` to modern `.kicad_sch`.

Important: The PCB is a complete connected engineering draft, not a production release. The Molex and TI footprints are dimensionally tagged but are not authenticated manufacturer ECAD downloads. Run ERC/DRC after conversion on a workstation with KiCad installed, confirm all footprint land patterns from the current drawings, tune USB impedance to the fab stackup, and perform power/thermal/USB compliance testing.
