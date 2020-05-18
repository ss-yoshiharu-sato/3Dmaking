// Base Config
base_W = 23.5;
base_H = 24;
base_T = 0.5;
default_T = 2.0;
default_S = 12;
// $fn = 60; // When this line comment out, my pc was stoped.
// Ring Config
ring_H = 10;
ring_base_R = 24;
ring_base_W = 6;
minkowski_R = 2;

difference() {
    hull(){
        translate([0, 0, 0]) cube([68, 68, 0.1]);
        translate([1, 1, 3]) cube([66, 66, 0.1]);
    }
    hull(){
        translate([3, 10.5, 0.5]) cube([63, 14, 0.1]);
        translate([2, 9.5, 3.1]) cube([65, 16, 0.1]);
    }
}

difference() {
    translate([-2, 30, 0]) cube([72, 40, 27]);
    translate([1, 27, 3]) cube([66, 40, 21]);
    #translate([23, 28, -2]) cube([20, 80, 30]);
    #translate([-10, 47, -2]) cube([20, 40, 30]);
    #translate([57, 47, -2]) cube([20, 40, 30]);
}

*translate([1, 1, 0]) cube([30, 3, 30.5]);
*translate([1, 4, 30]) rotate([0, 90, 0]) cylinder(h=30, r=1, center=false, $fn=3);
*translate([1, 1, 30]) cube([30, 8, 2]);

*translate([1, 73, 0]) cube([30, 3, 30.5]);
*translate([1, 73, 30]) rotate([0, 90, 0]) cylinder(h=30, r=1, center=false, $fn=3);
*translate([1, 68, 30]) cube([30, 8, 2]);

*translate([28, 35, 0]) cube([60, 25, 3]);
*translate([88, 35, -10]) cube([3, 25, 20]);

// base block
//staple_base(base_T,base_W,base_H,default_S,default_T);
// hull(){
//     translate([1, 16, default_T]) cube([base_W - 2, 26, default_T]);
//     translate([1, 17, default_T * 2]) cube([base_W - 2, 20, default_T]);
// }
// Ring block
// translate([11.75, 32, 35]) {
//     rotate([90, 180, 0]) {
//         // Ring part
//         translate([0, 0, minkowski_R]) {
//             minkowski() {
//                 difference() {
//                     cylinder(h = ring_H, r = ring_base_R + ring_base_W);
//                     union() {
//                         cylinder(h = ring_H, r1 = ring_base_R, r2 = ring_base_R + (ring_base_W / 2));
//                         translate([-12.5, -33, 0]) cube(25);
//                     }
//                 }
//                 sphere(minkowski_R);
//             }
//         }
//     }
// }

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