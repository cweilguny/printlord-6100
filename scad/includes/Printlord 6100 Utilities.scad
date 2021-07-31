module rounded_square(dimensions, r) {
    x = dimensions[0];
    y = dimensions[1];
    minkowski() {
        square([x - 2 * r, y - 2 * r], true);
        circle(r = r);
    }
}

module rounded_cube(dimensions, r, center = false) {
    x = dimensions[0];
    y = dimensions[1];
    z = dimensions[2];
    translate([center ? - x / 2 : 0, center ? - y / 2 : 0, center ? - z / 2 : 0])
        hull() {
            translate([r, r, r]) sphere(r = r);
            translate([x - r, r, r]) sphere(r = r);
            translate([x - r, y - r, r]) sphere(r = r);
            translate([r, y - r, r]) sphere(r = r);
            translate([r, r, z - r]) sphere(r = r);
            translate([x - r, r, z - r]) sphere(r = r);
            translate([x - r, y - r, z - r]) sphere(r = r);
            translate([r, y - r, z - r]) sphere(r = r);
        }
}

module bracket_half() {
    innerRadiusOffset = BRACKET_OUTER_RADIUS - BRACKET_INNER_RADIUS;
    b = BRACKET_INNER_RADIUS;
    rotate_extrude($fn = 50, angle = 180)
        polygon([
                [0, 0],
                [0, BRACKET_HEIGHT + RENDER_HELPER],
                [BRACKET_OUTER_RADIUS, BRACKET_HEIGHT + RENDER_HELPER],
                [BRACKET_OUTER_RADIUS, BRACKET_HEIGHT - BRACKET_OUTER_CIRCLE_TOP_HEIGHT],
                [BRACKET_INNER_RADIUS + BRACKET_INNER_CHAMFER, BRACKET_HEIGHT - BRACKET_OUTER_CIRCLE_TOP_HEIGHT],
                [BRACKET_INNER_RADIUS, BRACKET_HEIGHT - BRACKET_OUTER_CIRCLE_TOP_HEIGHT - BRACKET_INNER_CHAMFER],
                [BRACKET_INNER_RADIUS, BRACKET_OUTER_CIRCLE_BOTTOM_HEIGHT + BRACKET_INNER_CHAMFER],
                [BRACKET_INNER_RADIUS + BRACKET_INNER_CHAMFER, BRACKET_OUTER_CIRCLE_BOTTOM_HEIGHT],
                [BRACKET_OUTER_RADIUS, BRACKET_OUTER_CIRCLE_BOTTOM_HEIGHT],
                [BRACKET_OUTER_RADIUS, 0]
            ]);
}

module heatsink_fan_duct_body() {
    xOffset = - MOUNT_WIDTH / 2;
    yOffset = HEATSINK_FAN_DUCT_MOUNTPLATE_Y_OFFSET;
    zOffset = HEATSINK_FAN_DUCT_Z_OFFSET;
    translate([xOffset, yOffset - 7, zOffset])
        mirror([1, 0, 0])
            rotate([0, - 90, 0])
                hull() {
                    translate([HEATSINK_FAN_SIZE / 2, 0, 0])
                        rotate([0, - 30, 0])
                            translate([- HEATSINK_FAN_SIZE / 2, 0, 0])
                                linear_extrude(HEATSINK_FAN_MOUNTPLATE_WIDTH)
                                    rounded_square([HEATSINK_FAN_SIZE, HEATSINK_FAN_SIZE],
                                    HEATSINK_FAN_MOUNTPLATE_ROUNDING_RADIUS);
                    translate([0, 0, MOUNT_WIDTH / 2 - HEATSINK_BOTTOM_RADIUS - HEATSINK_FAN_MOUNTPLATE_WIDTH])
                        linear_extrude(HEATSINK_FAN_MOUNTPLATE_WIDTH)
                            rounded_square([HEATSINK_FAN_OUTLET_SIZE, HEATSINK_FAN_OUTLET_SIZE],
                                HEATSINK_FAN_MOUNTPLATE_ROUNDING_RADIUS / 3
                            );
                }
}