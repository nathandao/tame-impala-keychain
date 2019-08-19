include <variables.scad>

$fn=60;

w = plate_w + 4;
h = plate_h + 4;

difference() {
     translate([0, 0, thickness/2]) {
          union() {
               cube([w, h, thickness], center=true);
               translate([-(w/2), 0, 0]) {
                    linear_extrude(height=thickness, center=true) {
                         difference() {
                              circle(h/2);
                              translate([-h/4, 0, 0]) {
                                   circle(h/8);
                              }
                         }
                    }
               }
          }
     }
     translate([0, 0, thickness]) cube([plate_w, plate_h, thickness], center=true);
}
