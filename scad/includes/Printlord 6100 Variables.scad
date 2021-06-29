RENDER_HELPER = 0.2;
ROUNDING_RADIUS = 1;
HEX_NUT_M3_DIAMETER = 7.2;
HEX_NUT_M3_HEIGHT = 4.5;
HEX_NUT_M3_BOX_SIZE = 8.5;

BRACKET_INNER_DIAMETER = 12;
BRACKET_INNER_RADIUS = BRACKET_INNER_DIAMETER / 2;
BRACKET_OUTER_DIAMETER = BRACKET_INNER_DIAMETER + 4.2;
BRACKET_OUTER_RADIUS = BRACKET_OUTER_DIAMETER / 2;
BRACKET_INNER_CHAMFER = 0.5;
BRACKET_OUTER_CIRCLE_TOP_HEIGHT = 3.8;
BRACKET_OUTER_CIRCLE_BOTTOM_HEIGHT = 3.1;
BRACKET_INNER_CIRCLE_HEIGHT = 5.8;
BRACKET_HEIGHT = BRACKET_OUTER_CIRCLE_TOP_HEIGHT + BRACKET_INNER_CIRCLE_HEIGHT + BRACKET_OUTER_CIRCLE_BOTTOM_HEIGHT;
BRACKET_HALF_TIGHTENING_TOLERANCE = 0.5;

MOUNT_SCREW_HOLES_V_DIFF = 39;
MOUNT_TOP_HEIGHT = 10;
MOUNT_FOOT_HEIGHT = 39.5;
MOUNT_TOP_Z_CENTER = MOUNT_FOOT_HEIGHT + BRACKET_HEIGHT - 5.5;
MOUNT_FOOT_WIDTH = 10;
MOUNT_FOOT_SCREW_HOLE_INSET = MOUNT_TOP_Z_CENTER - MOUNT_SCREW_HOLES_V_DIFF;
MOUNT_HOLES_BOTTOM_DISTANCE = 42;

MOUNT_WIDTH = MOUNT_HOLES_BOTTOM_DISTANCE + MOUNT_FOOT_WIDTH;
MOUNT_DEPTH = 8;
PLATE_TO_NOZZLE_TIP = 28;
MOUNT_SCREW_HOLE_TOP_DIAMETER = 3.5;
MOUNT_SCREW_HOLE_BOTTOM_DIAMETER = 2.8;
MOUNT_SCREW_HOLE_SINK_DIAMETER = 6;

BRACKET_SCREW_HOLE_DIAMETER = 2.8;
BRACKET_SCREW_HOLE_X_OFFSET = BRACKET_OUTER_RADIUS + 3;

BRACE_DEPTH = PLATE_TO_NOZZLE_TIP;
BRACE_SCREW_HOLE_DIAMETER = 3.5;
BRACE_SCREW_HOLE_SINK_DIAMETER = 7;
BRACE_SCREW_HOLE_SINK_DEPTH = 5;

HEATSINK_BOTTOM_DIAMETER = 22.3;
HEATSINK_BOTTOM_RADIUS = HEATSINK_BOTTOM_DIAMETER / 2;
HEATSINK_BOTTOM_TOLERANCE = 0.4;
HEATSINK_FAN_SIZE = 40;
HEATSINK_FAN_SIZE_MOUNTHELPER = 3;
HEATSINK_FAN_OUTLET_SIZE = 30;
HEATSINK_FAN_MOUNTPLATE_WIDTH = 3;
HEATSINK_FAN_MOUNTPLATE_ROUNDING_RADIUS = 5;
HEATSINK_FAN_DUCT_LENGTH = 15;
HEATSINK_FAN_DUCT_BOTTOM_OFFSET = 0.25;
HEATSINK_FAN_DUCT_TOP = 50;
HEATSINK_BOTTOM = 9.5;
HEATSINK_FAN_DUCT_CHANNEL_DIAMETER = 36;
HEATSINK_FAN_SLOT_WIDTH = 18;
HEATSINK_FAN_SLOT_HEIGHT = 25.5;
HEATSINK_FAN_DUCT_BRACE_CUTOUT_FACTOR = 1.02;
HEATSINK_FAN_DUCT_SCREW_HOLE_DIAMETER = 2.8;
HEATSINK_FAN_DUCT_SCREW_HOLE_RADIUS = HEATSINK_FAN_DUCT_SCREW_HOLE_DIAMETER / 2;
HEATSINK_FAN_DUCT_SCREW_HOLE_LENGTH = 20;
HEATSINK_FAN_DUCT_SCREW_HOLE_INSET = 4;
HEATSINK_FAN_DUCT_MOUNTPLATE_Y_OFFSET = -2;
HEATSINK_FAN_DUCT_MOUNTPLATE_XZ_OFFSET = 3;
HEATSINK_FAN_DUCT_Z_OFFSET = HEATSINK_FAN_OUTLET_SIZE / 2 + HEATSINK_BOTTOM - ROUNDING_RADIUS;

HEATSINK_PLATE_HEIGHT = 10;
HEATSINK_PLATE_DEPTH = 11.3;
HEATSINK_PLATE_BOTTOM = 15;
HEATSINK_PLATE_FRONT_WIDTH = MOUNT_WIDTH / 2;

CR10_MOUNTPLATE_SCREW_CUTOUT_DIAMETER = 12;
CR10_MOUNTPLATE_SCREW_CUTOUT_HEIGHT = 4;
CR10_MOUNTPLATE_SCREW_CUTOUT_X1 = - 17;
CR10_MOUNTPLATE_SCREW_CUTOUT_X2 = 27;
CR10_MOUNTPLATE_SCREW_CUTOUT_Y_OFFSET = 3;

PART_FAN_ROUNDING_RADIUS = 2;
PART_FAN_SIZE = 60;
PART_FAN_CHANNEL_DIAMETER = 56;
PART_FAN_SCREW_HOLE_INSET = 5;
PART_FAN_SCREW_HOLE_LENGTH = 20;
PART_FAN_SCREW_HOLE_DIAMETER = 2.8;
PART_FAN_MOUNTPLATE_WIDTH = 3;
PART_FAN_MOUNTPLATE_HEIGHT = sqrt((PART_FAN_MOUNTPLATE_WIDTH * PART_FAN_MOUNTPLATE_WIDTH) / 2);
PART_FAN_HEIGHT = sqrt((PART_FAN_SIZE * PART_FAN_SIZE) / 2) + PART_FAN_MOUNTPLATE_HEIGHT;
PART_FAN_DEPTH = PART_FAN_HEIGHT;
PART_FAN_TO_HEATBLOCK_BOTTOM = 15;
PART_FAN_OUTLET_NR_HOLES = 11;
PART_FAN_OUTLET_START_ANGLE = 10;
PART_FAN_OUTLET_HOLE_UP_ROTATION = 85.2;
PART_FAN_OUTLET_HOLE_DIAMETER = 4;
PART_FAN_OUTLET_EXTRUSION_OUTER_DIAMETER = 10;
PART_FAN_OUTLET_EXTRUSION_INNER_DIAMETER = 2;
PART_FAN_OUTLET_SQUEEZING_FACTOR = 0.8;
PART_FAN_OUTLET_OUTER_ANGLE = 225;
PART_FAN_OUTLET_INNER_ANGLE = 210;
PART_FAN_OUTLET_OUTER_DIAMETER = 28;
PART_FAN_OUTLET_INNER_DIAMETER = 20;
PART_FAN_OUTLET_SLOT_WIDTH = 25;
PART_FAN_OUTLET_SLOT_DEPTH = 9;
PART_FAN_OUTLET_SLOT_HEIGHT = 4.6;
PART_FAN_OUTLET_SLOT_WALL_WIDTH = 3;
PART_FAN_BRACKET_MOUNT_SCREW_HOLE_DIAMETER = 3.5;
PART_FAN_BRACKET_MOUNT_SCREW_HOLE_LENGTH = 20;
PART_FAN_BRACKET_MOUNT_SCREW_HOLE_SINK_DIAMETER = 7;
PART_FAN_BRACKET_MOUNT_SCREW_HOLE_SINK_DEPTH = 10;

PART_FAN_MOUNT_WIDTH = 12;
PART_FAN_MOUNT_DEPTH = 10;
PART_FAN_MOUNT_HEIGHT = 10;
PART_FAN_MOUNT_SCREW_HOLE_DIAMETER = 2.8;

TOTAL_HEIGHT = MOUNT_FOOT_HEIGHT + BRACKET_HEIGHT + PART_FAN_MOUNT_HEIGHT;
PART_FAN_MOUNTPLATE_ABOVE_BOTTOM = TOTAL_HEIGHT - PART_FAN_HEIGHT + PART_FAN_MOUNTPLATE_HEIGHT + 3;

CABLE_GUIDE_WIDTH = 10;
CABLE_GUIDE_DEPTH = 10;
CABLE_GUIDE_HEIGHT = BRACKET_HEIGHT;
CABLE_GUIDE_INSET = (PLATE_TO_NOZZLE_TIP - CR10_MOUNTPLATE_SCREW_CUTOUT_HEIGHT - CABLE_GUIDE_DEPTH) / 2;