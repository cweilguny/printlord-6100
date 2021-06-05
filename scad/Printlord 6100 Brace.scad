////////////////////////////////////////////////////////////////////////////////
// ### CUSTOMIZABLE VARIABLES
////////////////////////////////////////////////////////////////////////////////
PRINT_ORIENTATION = false;

module __Customizer_Limit__() {}


////////////////////////////////////////////////////////////////////////////////
// ### OPENSCAD SPECIAL VARIABLES
////////////////////////////////////////////////////////////////////////////////
$fn = 24;


////////////////////////////////////////////////////////////////////////////////
// ### GLOBAL VARIABLES
////////////////////////////////////////////////////////////////////////////////
include <includes/Printlord 6100 Variables.scad>


////////////////////////////////////////////////////////////////////////////////
// ### GENERAL UTILITY MODULES
////////////////////////////////////////////////////////////////////////////////
include <includes/Printlord 6100 Utilities.scad>


////////////////////////////////////////////////////////////////////////////////
// ### MAIN RENDERING
////////////////////////////////////////////////////////////////////////////////
e3dv6_brace();


////////////////////////////////////////////////////////////////////////////////
// ### MODULES
////////////////////////////////////////////////////////////////////////////////
module e3dv6_brace() {
    rotate([PRINT_ORIENTATION ? - 90 : 0, 0, 0])
        difference() {
            body();
            screw_holes();
            heatsink_fan_duct_cutout();
        }
}

module body() {
    difference() {
        translate([- MOUNT_WIDTH / 2, - ROUNDING_RADIUS, 0])
            rounded_cube([MOUNT_WIDTH, BRACE_DEPTH + ROUNDING_RADIUS, BRACKET_HEIGHT], ROUNDING_RADIUS);
        translate([- MOUNT_WIDTH / 2, - ROUNDING_RADIUS, 0])
            cube([MOUNT_WIDTH, ROUNDING_RADIUS, BRACKET_HEIGHT]);
        bracket_half();
    }
    part_fan_duct_mounts();
}

module part_fan_duct_mounts() {
    part_fan_duct_mount(1);
    part_fan_duct_mount(- 1);
}

module part_fan_duct_mount(xFactor) {
    xOffset = PART_FAN_MOUNT_WIDTH / 2 - MOUNT_WIDTH / 2;
    yOffset = BRACE_DEPTH - PART_FAN_MOUNT_DEPTH / 2;
    zOffset = BRACKET_HEIGHT + PART_FAN_MOUNT_HEIGHT / 2 - ROUNDING_RADIUS;
    dimensions = [PART_FAN_MOUNT_WIDTH, PART_FAN_MOUNT_DEPTH, PART_FAN_MOUNT_HEIGHT + ROUNDING_RADIUS * 2];
    translate([xFactor * xOffset, yOffset, zOffset])
        difference() {
            rounded_cube(dimensions, ROUNDING_RADIUS, true);
            translate([0, - (PART_FAN_MOUNT_DEPTH / 2 + RENDER_HELPER), 0])
                rotate([- 90, 0, 0]) {
                    cylinder(d = PART_FAN_MOUNT_SCREW_HOLE_DIAMETER, h = PART_FAN_MOUNT_DEPTH + 2 * RENDER_HELPER);
                    cylinder($fn = 6, d = HEX_NUT_M3_DIAMETER, h = HEX_NUT_M3_HEIGHT);
                }
        }
}

module screw_holes() {
    screw_hole(- 1);
    screw_hole(1);
}

module screw_hole(xDirection) {
    translate([xDirection * BRACKET_SCREW_HOLE_X_OFFSET, 0, BRACKET_HEIGHT / 2])
        rotate([- 90, 0, 0])
            cylinder(d = BRACE_SCREW_HOLE_DIAMETER, h = BRACE_DEPTH);
    translate([xDirection * BRACKET_SCREW_HOLE_X_OFFSET, BRACE_DEPTH - BRACE_SCREW_HOLE_SINK_DEPTH, BRACKET_HEIGHT / 2])
        rotate([- 90, 0, 0])
            cylinder(d = BRACE_SCREW_HOLE_SINK_DIAMETER, h = BRACE_SCREW_HOLE_SINK_DEPTH);
}

module heatsink_fan_duct_cutout() {
    xOffset = 1.2;
    yOffset = 10;
    zOffset = - MOUNT_FOOT_HEIGHT + 1;
    translate([xOffset, yOffset, zOffset])
        mirror([1, 0, 0])
            scale(HEATSINK_FAN_DUCT_BRACE_CUTOUT_FACTOR)
                heatsink_fan_duct_body();
}