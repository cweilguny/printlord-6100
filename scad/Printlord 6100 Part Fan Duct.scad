////////////////////////////////////////////////////////////////////////////////
// ### CUSTOMIZABLE VARIABLES
////////////////////////////////////////////////////////////////////////////////
module __Customizer_Limit__() {}


////////////////////////////////////////////////////////////////////////////////
// ### OPENSCAD SPECIAL VARIABLES
////////////////////////////////////////////////////////////////////////////////
$fn = 24;


////////////////////////////////////////////////////////////////////////////////
// ### GLOBAL VARIABLES
////////////////////////////////////////////////////////////////////////////////
include <includes/Printlord 6100 Variables.scad>
outlet_rotation = (PART_FAN_OUTLET_OUTER_ANGLE - 180) / 2;

////////////////////////////////////////////////////////////////////////////////
// ### GENERAL UTILITY MODULES
////////////////////////////////////////////////////////////////////////////////
include <includes/Printlord 6100 Utilities.scad>


////////////////////////////////////////////////////////////////////////////////
// ### MAIN RENDERING
////////////////////////////////////////////////////////////////////////////////
part_fan_duct();


////////////////////////////////////////////////////////////////////////////////
// ### MODULES
////////////////////////////////////////////////////////////////////////////////
module part_fan_duct() {
    difference() {
        part_fan_duct_body();
        part_fan_duct_channel();
        part_fan_screw_holes();
        bracket_mount_screw_holes();
    }
}

module part_fan_duct_body() {
    difference() {
        union() {
            hull() {
                body_mountplate();
                translate([0, PART_FAN_DEPTH - PART_FAN_OUTLET_SLOT_DEPTH / 2, (PART_FAN_OUTLET_SLOT_HEIGHT +
                    PART_FAN_OUTLET_SLOT_WALL_WIDTH) / 2])
                    cube([PART_FAN_OUTLET_SLOT_WIDTH + PART_FAN_OUTLET_SLOT_WALL_WIDTH, PART_FAN_OUTLET_SLOT_DEPTH,
                            PART_FAN_OUTLET_SLOT_HEIGHT + PART_FAN_OUTLET_SLOT_WALL_WIDTH], true);
            }
            outlet();
        }
        outlet_inner();
    }
}

module body_mountplate() {
    translate([0, 0, PART_FAN_MOUNTPLATE_ABOVE_BOTTOM])
        rotate([45, 0, 0])
            translate([0, PART_FAN_SIZE / 2, - PART_FAN_MOUNTPLATE_WIDTH])
                linear_extrude(PART_FAN_MOUNTPLATE_WIDTH)
                    rounded_square([PART_FAN_SIZE, PART_FAN_SIZE], PART_FAN_ROUNDING_RADIUS);
}

module outlet() {
    translate([0, PART_FAN_DEPTH + PART_FAN_OUTLET_OUTER_DIAMETER + PART_FAN_OUTLET_EXTRUSION_OUTER_DIAMETER / 2 -
        PART_FAN_OUTLET_SLOT_DEPTH, 0]) {
        rotate([0, 0, outlet_rotation])
            difference() {
                rotate_extrude($fn = 50, angle = - PART_FAN_OUTLET_OUTER_ANGLE)
                    scale([1, PART_FAN_OUTLET_SQUEEZING_FACTOR, 0])
                        hull() {
                            translate([PART_FAN_OUTLET_OUTER_DIAMETER, PART_FAN_OUTLET_EXTRUSION_OUTER_DIAMETER / 2, 0])
                                circle($fn = 36, d = PART_FAN_OUTLET_EXTRUSION_OUTER_DIAMETER);
                            translate([PART_FAN_OUTLET_INNER_DIAMETER, 1, 0])
                                circle($fn = 36, d = PART_FAN_OUTLET_EXTRUSION_INNER_DIAMETER);
                        }
                outlet_holes();
            }
    }
}

module outlet_inner() {
    translate([0, PART_FAN_DEPTH + PART_FAN_OUTLET_OUTER_DIAMETER + PART_FAN_OUTLET_EXTRUSION_OUTER_DIAMETER / 2 -
        PART_FAN_OUTLET_SLOT_DEPTH, 0])
        rotate([0, 0, - (PART_FAN_OUTLET_OUTER_ANGLE - PART_FAN_OUTLET_INNER_ANGLE) / 2 + outlet_rotation])
            rotate_extrude(angle = - PART_FAN_OUTLET_INNER_ANGLE)
                scale([1, PART_FAN_OUTLET_SQUEEZING_FACTOR, 0])
                    hull() {
                        translate([PART_FAN_OUTLET_OUTER_DIAMETER, PART_FAN_OUTLET_EXTRUSION_OUTER_DIAMETER / 2, 0])
                            circle(d = PART_FAN_OUTLET_EXTRUSION_OUTER_DIAMETER - 2);
                        translate([PART_FAN_OUTLET_INNER_DIAMETER, 1, 0])
                            circle(d = PART_FAN_OUTLET_EXTRUSION_INNER_DIAMETER / 2);
                    }
}

module outlet_holes() {
    angleStep = (PART_FAN_OUTLET_OUTER_ANGLE - 2 * PART_FAN_OUTLET_START_ANGLE) / (PART_FAN_OUTLET_NR_HOLES - 1);
    for (i = [0 : PART_FAN_OUTLET_NR_HOLES - 1]) {
        rotate([0, PART_FAN_OUTLET_HOLE_UP_ROTATION, - (PART_FAN_OUTLET_START_ANGLE + angleStep * i)])
            cylinder(d = PART_FAN_OUTLET_HOLE_DIAMETER, h = PART_FAN_OUTLET_OUTER_DIAMETER - 2);
    }
}

module part_fan_duct_channel() {
    hull() {
        channel_mountplate();
        translate([0, PART_FAN_DEPTH - PART_FAN_OUTLET_SLOT_DEPTH / 2 - 2, PART_FAN_OUTLET_SLOT_HEIGHT / 2 + 1])
            cube([PART_FAN_OUTLET_SLOT_WIDTH, PART_FAN_OUTLET_SLOT_DEPTH - 4, PART_FAN_OUTLET_SLOT_HEIGHT], true);
    }
    translate([0, PART_FAN_DEPTH - PART_FAN_OUTLET_SLOT_DEPTH / 2, PART_FAN_OUTLET_SLOT_HEIGHT / 2 + 1])
        cube([PART_FAN_OUTLET_SLOT_WIDTH, PART_FAN_OUTLET_SLOT_DEPTH, PART_FAN_OUTLET_SLOT_HEIGHT], true);
}

module channel_mountplate() {
    translate([0, 0, PART_FAN_MOUNTPLATE_ABOVE_BOTTOM])
        rotate([45, 0, 0])
            translate([0, PART_FAN_SIZE / 2, - PART_FAN_MOUNTPLATE_WIDTH])
                cylinder($fn = 50, d = PART_FAN_CHANNEL_DIAMETER, h = PART_FAN_MOUNTPLATE_WIDTH + RENDER_HELPER);
}

module part_fan_screw_holes() {
    translate([0, 0, PART_FAN_MOUNTPLATE_ABOVE_BOTTOM])
        rotate([45, 0, 0])
            translate([0, PART_FAN_SIZE / 2, 0]) {
                part_fan_screw_hole(1, 1);
                part_fan_screw_hole(1, - 1);
                part_fan_screw_hole(- 1, 1);
                part_fan_screw_hole(- 1, - 1);
            }
}

module part_fan_screw_hole(xFactor, yFactor) {
    offsetLength = PART_FAN_SIZE / 2 - PART_FAN_SCREW_HOLE_INSET;
    translate([xFactor * offsetLength, yFactor * offsetLength, - PART_FAN_SCREW_HOLE_LENGTH])
        cylinder(d = PART_FAN_SCREW_HOLE_DIAMETER, h = PART_FAN_SCREW_HOLE_LENGTH + RENDER_HELPER);
}

module bracket_mount_screw_holes() {
    bracket_mount_screw_hole(1);
    bracket_mount_screw_hole(- 1);
}

module bracket_mount_screw_hole(xFactor) {
    xOffset = PART_FAN_MOUNT_WIDTH / 2 - MOUNT_WIDTH / 2;
    yOffset = PART_FAN_DEPTH - 14;
    zOffset = TOTAL_HEIGHT - PART_FAN_MOUNT_HEIGHT / 2;
    translate([xFactor * xOffset, yOffset, zOffset])
        rotate([- 90, 0, 0]) {
            cylinder(d = PART_FAN_BRACKET_MOUNT_SCREW_HOLE_DIAMETER, h = PART_FAN_BRACKET_MOUNT_SCREW_HOLE_LENGTH +
                RENDER_HELPER);
            cylinder(d = PART_FAN_BRACKET_MOUNT_SCREW_HOLE_SINK_DIAMETER, h =
            PART_FAN_BRACKET_MOUNT_SCREW_HOLE_SINK_DEPTH);
        }
}
