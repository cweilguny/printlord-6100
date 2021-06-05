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
main();


////////////////////////////////////////////////////////////////////////////////
// ### MODULES
////////////////////////////////////////////////////////////////////////////////
module main() {
    rotate([PRINT_ORIENTATION ? - 90 : 0, 0, 0])
        difference() {
            union() {
                mount_plate();
                bracket_head();
                heatsink_fan_duct_body();
                heatsink_plate();
            }
            mount_top_screw_hole();
            bracket_screw_holes();
            heatsink_fan_duct_channel();
            heatsink_fan_duct_screw_holes();
            cr10_mountplate_screw_cutouts();
            cable_guide();
        }
}

module mount_plate() {
    mount_top();
    mount_foot(- 1);
    mount_foot(1);
}

module mount_top() {
    translate([- MOUNT_WIDTH / 2, PLATE_TO_NOZZLE_TIP - MOUNT_DEPTH, MOUNT_TOP_Z_CENTER - MOUNT_TOP_HEIGHT / 2])
        rounded_cube([MOUNT_WIDTH, MOUNT_DEPTH, MOUNT_TOP_HEIGHT], ROUNDING_RADIUS);
    translate([- HEX_NUT_M3_BOX_SIZE / 2, PLATE_TO_NOZZLE_TIP - MOUNT_DEPTH - HEX_NUT_M3_HEIGHT + ROUNDING_RADIUS,
            MOUNT_TOP_Z_CENTER - HEX_NUT_M3_BOX_SIZE / 2])
        rounded_cube([HEX_NUT_M3_BOX_SIZE, HEX_NUT_M3_HEIGHT, HEX_NUT_M3_BOX_SIZE], ROUNDING_RADIUS);
}

module mount_foot(xDirection) {
    translate([xDirection * (MOUNT_WIDTH / 2 - MOUNT_FOOT_WIDTH / 2), PLATE_TO_NOZZLE_TIP - MOUNT_DEPTH, 0])
        difference() {
            translate([- MOUNT_FOOT_WIDTH / 2, 0, 0])
                rounded_cube([MOUNT_FOOT_WIDTH, MOUNT_DEPTH, MOUNT_FOOT_HEIGHT + ROUNDING_RADIUS * 2],
                ROUNDING_RADIUS);
            translate([0, 0, MOUNT_FOOT_SCREW_HOLE_INSET])
                rotate([- 90, 0, 0])
                    cylinder(d = MOUNT_SCREW_HOLE_TOP_DIAMETER, h = MOUNT_DEPTH);
        }
}

module bracket_head() {
    translate([0, 0, MOUNT_FOOT_HEIGHT]) {
        difference() {
            translate([- MOUNT_WIDTH / 2, - ROUNDING_RADIUS, 0])
                rounded_cube([MOUNT_WIDTH, PLATE_TO_NOZZLE_TIP + ROUNDING_RADIUS, BRACKET_HEIGHT], ROUNDING_RADIUS);
            translate([- MOUNT_WIDTH / 2, - ROUNDING_RADIUS, 0])
                cube([MOUNT_WIDTH, ROUNDING_RADIUS, BRACKET_HEIGHT]);
            bracket_half();
        }
    }
}

module heatsink_fan_duct_channel() {
    xOffset = - MOUNT_WIDTH / 2;
    yOffset = - HEATSINK_FAN_SIZE / 2 + PLATE_TO_NOZZLE_TIP - ROUNDING_RADIUS * 2;
    zOffset = HEATSINK_FAN_DUCT_Z_OFFSET;
    translate([xOffset, yOffset, zOffset])
        mirror([1, 0, 0])
            rotate([0, - 90, 0])
                hull() {
                    translate([0, HEATSINK_FAN_DUCT_MOUNTPLATE_Y_OFFSET, 0])
                        cylinder(d = HEATSINK_FAN_DUCT_CHANNEL_DIAMETER, h = HEATSINK_FAN_MOUNTPLATE_WIDTH);
                    translate([HEATSINK_FAN_DUCT_BOTTOM_OFFSET, 0, HEATSINK_FAN_DUCT_LENGTH -
                            HEATSINK_FAN_MOUNTPLATE_WIDTH / 2])
                        cube([HEATSINK_FAN_SLOT_HEIGHT, HEATSINK_FAN_SLOT_WIDTH, HEATSINK_FAN_MOUNTPLATE_WIDTH], true);
                }
}

module heatsink_fan_duct_screw_holes() {
    translate([0, HEATSINK_FAN_DUCT_MOUNTPLATE_Y_OFFSET - ROUNDING_RADIUS, HEATSINK_FAN_DUCT_MOUNTPLATE_XZ_OFFSET -
            HEATSINK_FAN_DUCT_SCREW_HOLE_INSET / 2 + ROUNDING_RADIUS]) {
        t = HEATSINK_FAN_SIZE / 2 - HEATSINK_FAN_DUCT_SCREW_HOLE_INSET;
        translate([0, t, t])
            heatsink_fan_duct_screw_hole(0.9);
        translate([0, t, - t])
            heatsink_fan_duct_screw_hole(2);
        translate([0, - t, - t])
            heatsink_fan_duct_screw_hole(2);
        translate([0, - t, t])
            heatsink_fan_duct_screw_hole(2);
    }
}

module heatsink_fan_duct_screw_hole(lengthFactor) {
    xOffset = - (MOUNT_WIDTH / 2 + RENDER_HELPER);
    yOffset = - HEATSINK_FAN_SIZE / 2 + PLATE_TO_NOZZLE_TIP - ROUNDING_RADIUS;
    zOffset = HEATSINK_BOTTOM + HEATSINK_FAN_OUTLET_SIZE / 2 - 3;
    translate([xOffset, yOffset, zOffset])
        rotate([0, 90, 0])
            cylinder(d = HEATSINK_FAN_DUCT_SCREW_HOLE_DIAMETER, h = HEATSINK_FAN_DUCT_SCREW_HOLE_LENGTH * lengthFactor +
                RENDER_HELPER);
}

module bracket_screw_holes() {
    translate([0, 0, MOUNT_FOOT_HEIGHT]) {
        bracket_screw_hole(- 1);
        bracket_screw_hole(1);
    }
}

module bracket_screw_hole(xDirection) {
    translate([xDirection * BRACKET_SCREW_HOLE_X_OFFSET, 0, BRACKET_HEIGHT / 2])
        rotate([- 90, 0, 0])
            cylinder(d = BRACKET_SCREW_HOLE_DIAMETER, h = PLATE_TO_NOZZLE_TIP);
    translate([xDirection * BRACKET_SCREW_HOLE_X_OFFSET, PLATE_TO_NOZZLE_TIP - HEX_NUT_M3_HEIGHT * 2, BRACKET_HEIGHT / 2
        ])
        rotate([- 90, 0, 0])
            cylinder($fn = 6, d = HEX_NUT_M3_DIAMETER, h = HEX_NUT_M3_HEIGHT * 2);
}

module mount_top_screw_hole() {
    hexNutHoleHeight = PLATE_TO_NOZZLE_TIP - MOUNT_DEPTH;
    translate([0, 0, MOUNT_TOP_Z_CENTER]) {
        rotate([- 90, 30, 0]) {
            cylinder(d = MOUNT_SCREW_HOLE_BOTTOM_DIAMETER, h = PLATE_TO_NOZZLE_TIP);
            translate([0, 0, PLATE_TO_NOZZLE_TIP - MOUNT_DEPTH - hexNutHoleHeight])
                cylinder($fn = 6, d = HEX_NUT_M3_DIAMETER, h = hexNutHoleHeight);
        }
    }
}

module heatsink_plate() {
    difference() {
        hull() {
            translate([- MOUNT_WIDTH / 2, PLATE_TO_NOZZLE_TIP - ROUNDING_RADIUS * 2, HEATSINK_PLATE_BOTTOM])
                rounded_cube([MOUNT_WIDTH, ROUNDING_RADIUS, HEATSINK_PLATE_HEIGHT],
                ROUNDING_RADIUS);
            translate([- MOUNT_WIDTH / 5, PLATE_TO_NOZZLE_TIP - HEATSINK_PLATE_DEPTH, HEATSINK_PLATE_BOTTOM])
                rounded_cube([HEATSINK_PLATE_FRONT_WIDTH, ROUNDING_RADIUS, HEATSINK_PLATE_HEIGHT],
                ROUNDING_RADIUS);
        }
        translate([0, 0, HEATSINK_PLATE_BOTTOM])
            cylinder($fn = 50, d = HEATSINK_BOTTOM_DIAMETER + HEATSINK_BOTTOM_TOLERANCE, h = HEATSINK_PLATE_HEIGHT);
    }
}

module cr10_mountplate_screw_cutouts() {
    translate([CR10_MOUNTPLATE_SCREW_CUTOUT_X1, PLATE_TO_NOZZLE_TIP, MOUNT_TOP_Z_CENTER +
        CR10_MOUNTPLATE_SCREW_CUTOUT_Y_OFFSET])
        rotate([90, 0, 0])
            cylinder(d = CR10_MOUNTPLATE_SCREW_CUTOUT_DIAMETER, h = CR10_MOUNTPLATE_SCREW_CUTOUT_HEIGHT);
    translate([CR10_MOUNTPLATE_SCREW_CUTOUT_X2, PLATE_TO_NOZZLE_TIP, MOUNT_TOP_Z_CENTER +
        CR10_MOUNTPLATE_SCREW_CUTOUT_Y_OFFSET])
        rotate([90, 0, 0])
            cylinder(d = CR10_MOUNTPLATE_SCREW_CUTOUT_DIAMETER, h = CR10_MOUNTPLATE_SCREW_CUTOUT_HEIGHT);
}

module cable_guide() {
    translate([MOUNT_WIDTH / 2 - CABLE_GUIDE_WIDTH / 2, CABLE_GUIDE_DEPTH / 2 + CABLE_GUIDE_INSET, MOUNT_FOOT_HEIGHT + CABLE_GUIDE_HEIGHT / 2])
        cube([CABLE_GUIDE_WIDTH + ROUNDING_RADIUS, CABLE_GUIDE_DEPTH, CABLE_GUIDE_HEIGHT], center = true);
}
