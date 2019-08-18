echo(version=version());
include <threads.scad>
// Base Config
base_W = 120; // Min Size < 10
base_H = 40; // Min Size < 40
base_T = 0.5; // Fix Size = 0.5 for Stapler
default_S = 12; // Fix Size = 12 for Stapler (Stapler size)
default_T = 3.0; // Fix Size = 2.0 for Stapler (base_T < default_T)
$fn = 60;
minkowski_R = 2;
outR=14;
pitchN=4;
interR=9;
bladehuckR=0;

translate([2, 2, 2]) {
    // main body
    *union() {
        difference(){
            union() {
                intersection() {
                    union() {
                            translate([0, 30.25, -7.75]) cube([18.75, 4.75, 17.75]);
                            translate([0, 8, -7.75]) cube([8.5, 23, 7.5]);
                            translate([10.25, 8, 2.5]) cube([8.5, 23, 7.5]);
                    }
                    translate([9.5, 36, 1.25]) rotate([90, 0, 0]) cylinder(h=30, r=interR, center=false);
                }
                // body screw
                translate([9.5, 35, 1.25]) rotate([90, 0, 0]) metric_thread (diameter=23, pitch=pitchN, length=13);
            }
            translate([-9.7, 8, -0.3]) cube([20, 22, 20]);
            translate([8.5, 8, -17.5]) cube([20, 22, 20]);
        }
        // body
        difference(){
                translate([9.5, 65, 1.25]) rotate([90, 0, 0]) cylinder(h=33, r=outR, center=false);
                translate([9.5, 65, 1.25]) rotate([90, 0, 0]) metric_thread (diameter=24, pitch=pitchN, length=10, internal=true);
                translate([9.5, 65, 1.25]) rotate([90, 0, 0]) cylinder(h=29, r=10.5, center=false);
        }
        // body plate
        translate([-2.5, 33, 0]) cube([24, 21.8, 2]);
        // suport parts
        * translate([-0.5, 54.8, 1]) {
            hull() {
                translate([0, 5.2, 1]) cube([20, 5, 0.1]);
                translate([0, 0, 0]) cube([20, 10.2, 0.1]);
                translate([0, 5.2, -1]) cube([20, 5, 0.1]);
            }
        }
    }
    // blade holder
    *difference(){
        union() {
            intersection() {
                union() {
                    union() {
                        translate([0, 8, 0]) difference(){
                            cube([10, 22, 10]);
                            translate([8.8, 0, 0]) cube([5, 11.5, 11]);
                            translate([0, 0, 0]) cube([11, 11.5, 1.2]);
                        }
                        translate([5, 11, 5.5]) rotate([0, 90, 0]) cylinder(h=5, r=1.4, center=false, $fn=20);
                        translate([4.5, 11, 0]) rotate([0, 0, 0]) cylinder(h=5, r=1.4, center=false, $fn=20);
                    }
                    translate([8.7, 0, -7.7]) rotate([0, 90, 0]) mirror([1,0,0]) union() {
                        translate([0, 8, 0]) difference(){
                            cube([10, 22, 10]);
                            translate([8.8, 0, 0]) cube([5, 11.5, 11]);
                            translate([0, 0, 0]) cube([11, 11.5, 1.2]);
                        }
                        translate([5, 11, 5.5]) rotate([0, 90, 0]) cylinder(h=5, r=1.4, center=false, $fn=20);
                        translate([4.5, 11, 0]) rotate([0, 0, 0]) cylinder(h=5, r=1.4, center=false, $fn=20);
                    }
                }
                translate([9.5, 36, 1.25]) rotate([90, 0, 0]) cylinder(h=30, r=interR, center=false);
            }
            // body screw
            translate([9.5, 35, 1.25]) rotate([90, 0, 0]) metric_thread (diameter=23, pitch=pitchN, length=13);
        }
        translate([10, 8, 2.3]) cube([20, 22, 20]);
        translate([-11.2, 8, -20]) cube([20, 22, 20]);
        translate([-5, 30, -15]) cube([30, 10, 30]);
    }

    // cap
    *union() {
        translate([9.5, 85, 1.25]) rotate([90, 0, 0]) cylinder(h=8, r=outR, center=false);
        translate([9.5, 80, 1.25]) rotate([90, 0, 0]) metric_thread (diameter=23, pitch=pitchN, length=9.5);
    }

    // main cap
    *difference(){
        translate([9.5, 0, 1.25]) rotate([90, 0, 0]) cylinder(h=43, r=outR, center=false);
        translate([9.5, 5, 1.25]) rotate([90, 0, 0]) metric_thread (diameter=24, pitch=pitchN, length=45, internal=true);
    }

    // stopper ring
    *difference(){
        translate([9.5, 0, 1.25]) rotate([90, 0, 0]) cylinder(h=43, r=outR, center=false);
        translate([9.5, 5, 1.25]) rotate([90, 0, 0]) metric_thread (diameter=24.3, pitch=pitchN, length=45, internal=true);
        translate([-10, -45, -20]) cube([40, 40, 40]);
    }



}
