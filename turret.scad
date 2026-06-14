/*
  Automated Animal Deterrent Turret - Internal Mechanics
  Modified: 
  - Barrel diameter reduced (radius back to 12).
  - Attached components (motors, hopper, sensors) repositioned to sit flush.
  - Central shooting rod (inner cylinder) remains removed.
  - Removed the two servo blocks from the hopper/cone assembly.
  - ESP32-CAM under the barrel on the pan disc.
  - Internal spring hidden.
*/

$fn = 60; // Sets the smoothness of cylinders and spheres
overall_scale = 0.75; // Adjust this value to make the top cuboidal turret structure smaller

// --- Modules ---

module stool_base() {
    // Square Base Plate
    color("DarkSlateGray") translate([-60, -60, 0]) cube([120, 120, 5]);

    // 4 Cuboid Legs (Length 100, square profile 10x10)
    color("DimGray") {
        translate([-55, -55, -100]) cube([10, 10, 100]); // Front-Left
        translate([45, -55, -100]) cube([10, 10, 100]);  // Front-Right
        translate([-55, 45, -100]) cube([10, 10, 100]);  // Back-Left
        translate([45, 45, -100]) cube([10, 10, 100]);   // Back-Right
    }
}

module turret_assembly() {
    // --- Components on Pan Platform ---

    // Heavy 360-degree servo on top of stool base plate
    color("DimGray") translate([-15, -20, 5]) cube([30, 40, 35]);

    // Rotating upper platform connected to the servo (pan plate)
    color("DarkSlateGray") translate([0, 0, 40]) cylinder(h=5, r=50);

    // ESP32-CAM board (Under the barrel)
    color("black") translate([25, -12, 45]) cube([5, 24, 35]);
    // Camera Lens pointing forward
    color("silver") translate([30, 0, 60]) rotate([0, 90, 0]) cylinder(h=5, r=6);

    // Vertical Column 
    color("silver") translate([0, 0, 45]) cylinder(h=70, r=8);

    // Tilt Servos 
    // Left and Right 180-degree heavy servos
    color("DimGray") translate([-30, -10, 100]) cube([15, 20, 35]); // Left
    color("DimGray") translate([15, -10, 100]) cube([15, 20, 35]);  // Right

    // Horizontal pivot joint connecting the servos
    color("silver") translate([-35, 0, 115]) rotate([0, 90, 0]) cylinder(h=70, r=4);

    // --- Barrel Assembly ---

    // Position and tilt the barrel assembly to show action
    translate([0, 0, 115])
        rotate([0, -15, 0]) // Tilt upwards 15 degrees
        translate([-60, 0, 0])
        barrel_assembly_details();
}

module barrel_assembly_details() {
    // Main outer barrel (Radius reduced to 12)
    color("DarkSlateGray") rotate([0, 90, 0]) cylinder(h=160, r=12);

    // Rear DC Motors for the firing mechanism (Moved inward to match new radius)
    color("silver") translate([-25, 15, -10]) cube([35, 20, 20]); // Left Motor
    color("silver") translate([-25, -35, -10]) cube([35, 20, 20]); // Right Motor

    // Custom-bent actuating cams on the motors (Moved inward)
    color("silver") translate([10, 25, 0]) cylinder(h=25, r=2);
    color("silver") translate([10, -25, 0]) cylinder(h=25, r=2);

    // Magazine / Hopper System (Lowered to Z=12 to sit flush on the barrel)
    translate([100, 0, 12]) {
        // Feed tube
        color("DarkSlateGray", 0.6) cylinder(h=35, r=7);
        // Main pellet funnel
        color("DarkSlateGray", 0.6) translate([0, 0, 35]) cylinder(h=40, r1=7, r2=30);

        // Single spherical pellet dropping into the chamber
        color("gold") translate([0, 0, 5]) sphere(r=4.5);
    }

    // Sensory/Alert Elements (Adjusted to new radius)
    color("red") translate([130, 12, 5]) sphere(r=3); // LED
    color("black") translate([130, -12, 5]) cylinder(h=5, r=4); // Piezo Buzzer
}

// --- Main Assembly Execution ---

// Render stool base at normal scale
stool_base();

// Render and scale all top components (turret assembly)
scale([overall_scale, overall_scale, overall_scale]) {
    turret_assembly();
}