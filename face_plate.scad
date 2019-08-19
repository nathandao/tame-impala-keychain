$center = false;

include <variables.scad>
include <face.scad>;
include <face_2.scad>;

module face(h) {
     difference() {
          translate([0, 0, h/2]) {
               cube([confetti_w, confetti_h, h], center=true);
          }
          translate([0, 0, -1]) {
               scale([1.3, 1.3, 1]) {
                    face_wave(h+5);
               }
          }
     }
}

module face_plate_negative(h) {
     difference() {
          translate([0, 0, h/2]) {
               cube([confetti_w, confetti_h, h], center=true);
          }
          translate([0, 0, -1]) {
               face(h*2);
          }
     }
}

union() {
     translate([0, 0, 0.5]) {
          face(1.5);
     }
     difference() {
          translate([0, 0, 0.75]) {
               cube([plate_w, plate_h, 1.5], center=true);
          }
          translate([0, 0, -1]) {
               face_plate_negative(5);
          }
     }
     // cube([plate_w, plate_h, 0.5], center=true);
}
