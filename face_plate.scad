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

module face_plate_possitive(h) {
     difference() {
          translate([0, 0, h/2]) {
               cube([plate_w, plate_h, h], center=true);
          }
          translate([0, 0, 0]) {
               face_plate_negative(h*3);
          }
     }
}

module rim(h) {
     difference() {
          translate([0, 0, h/2]) {
               cube([plate_w, plate_h, h], center=true);
          }
          cube([confetti_w, confetti_h, h*3], center=true);
     }
}

union() {
     rim(3);
     face_plate_possitive(1.5);
}
