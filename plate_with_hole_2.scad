$fn=60;

confetti_w = 55;
confetti_h = 16;

margin = 3;

plate_w = confetti_w + margin;
plate_h = confetti_h + margin;

thickness = 2;

bottom_plate_thickness = thickness;
circle_radius = plate_h / 8;

gap_offset = 0.5;

module key_ring(h) {
     linear_extrude(height=h, center=true) {
          difference() {
               circle(plate_h/2);
               translate([-plate_h / 4, 0, 0]) {
                    circle(circle_radius);
               }
          }
     }
}

difference() {
     union() {
          translate([gap_offset / 2, 0, bottom_plate_thickness / 2 + 0.1]) {
               cube([plate_w + gap_offset, plate_h, bottom_plate_thickness], center=true);
          }
          translate([-plate_w / 2, 0, thickness + 0.1]) {
               key_ring(thickness * 2);
          }
     }
     translate([0, 0, bottom_plate_thickness * 1.5 + 0.5]) cube([plate_w + 1, plate_h + 2, bottom_plate_thickness + 1], center=true);
}
