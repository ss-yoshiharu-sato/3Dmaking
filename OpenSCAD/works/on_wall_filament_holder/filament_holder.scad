echo(version=version());

include <threads.scad>

// Base Config for staple_base
base_W = 60;
base_H = 80;
base_T = 0.5;
default_T = 2.0;
default_S = 12;
$fn = 80;

// for Nezi
translate([25, 110, 0]){
    translate([0, 0, 8]) metric_thread (diameter=33, pitch=8, length=60);
    difference(){
        cylinder(h=8, r=25);
        translate([0, 26, -1])cylinder(h=10, r=6);
        translate([0, -26, -1])cylinder(h=10, r=6);
        translate([26, 0, -1])cylinder(h=10, r=6);
        translate([-26, 0, -1])cylinder(h=10, r=6);
        translate([-18, 18, -1])cylinder(h=10, r=6);
        translate([18, -18, -1])cylinder(h=10, r=6);
        translate([18, 18, -1])cylinder(h=10, r=6);
        translate([-18, -18, -1])cylinder(h=10, r=6);
    }
}

// for holder main pole
translate([30, 40, 2]){
    difference() {
        cylinder(h=60, r=20);
        translate([0, 0, -10])metric_thread (diameter=34, pitch=8, length=80, internal=true);
        translate([0, 0, 55]) cylinder(h=10, r=17);
    }
}

staple_base(base_T,base_W,base_H,default_S,default_T);

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

