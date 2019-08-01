// Base Config
base_W = 23.5;
base_H = 60;
base_T = 0.5;
default_T = 2.0;
default_S = 12;
// $fn = 60; // When this line comment out, my pc was stoped.
// Ring Config
ring_H = 10;
ring_base_R = 24;
ring_base_W = 6;
minkowski_R = 2;

// base block
staple_base(base_T,base_W,base_H,default_S,default_T);
hull(){
    translate([1, 16, default_T]) cube([base_W - 2, 26, default_T]);
    translate([1, 17, default_T * 2]) cube([base_W - 2, 20, default_T]);
}
// Ring block
translate([11.75, 32, 35]) {
    rotate([90, 180, 0]) {
        // Ring part
        translate([0, 0, minkowski_R]) {
            minkowski() {
                difference() {
                    cylinder(h = ring_H, r = ring_base_R + ring_base_W);
                    union() {
                        cylinder(h = ring_H, r1 = ring_base_R, r2 = ring_base_R + (ring_base_W / 2));
                        translate([-12.5, -33, 0]) cube(25);
                    }
                }
                sphere(minkowski_R);
            }
        }
    }
}

module stapler_area(bt,bw,ds,dt) {
    hull() {
        translate([0, 0, dt - bt]) cube([bw - dt, ds + 2, 0.1]);
        translate([1, 1, 0]) cube([bw - dt * 2, ds, 0.1]);
    }
}

module staple_base(bt,bw,bh,ds,dt) {
    union() {
        // Base1(Bottom)
        cube([bw, bh, bt]);
        // Base2(Top)
        translate([0, 0, bt]) {
            difference() {
                // Base2_body
                hull() {
                    translate([1, 1, dt - bt]) cube([bw - 2, bh - 2, 0.1]);
                    translate([0, 0, 0]) cube([bw, bh, 0.1]);
                }
                // Base2_stapler_area1(Top)
                # translate([dt - 1, dt - 1, 0]) stapler_area(bt,bw,ds,dt);
                // Base2_stapler_area2(Bottom)
                # translate([dt - 1, bh - ds - dt - 1, 0]) stapler_area(bt,bw,ds,dt);
            }
        }
    }
}