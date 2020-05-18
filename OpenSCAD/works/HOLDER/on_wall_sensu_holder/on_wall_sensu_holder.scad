echo(version=version());
// Base Config
base_W = 120; // Min Size < 10
base_H = 40; // Min Size < 40
base_T = 0.5; // Fix Size = 0.5 for Stapler
default_S = 12; // Fix Size = 12 for Stapler (Stapler size)
default_T = 3.0; // Fix Size = 2.0 for Stapler (base_T < default_T)
$fn = 60;

// hock brock
translate([5, 3, 27.5]) rotate([-90, 0, 0]) hock();
translate([115, 3, 27.5]) rotate([-90, 0, 0]) hock();


// base
translate([0, 0, -0.5]) cube([125, 18, 0.5]);
//main part
difference(){
    union(){
        hull() {
            cube([125, 18, 0.1]);
            translate([1, 1, 2]) cube([123, 16, 0.1]);
        }
    }
    translate([14, 2, 0]) stapler_area(base_T,base_W - 20,default_S,default_T);
}

hull() {
    translate([33, 2, 0]) cube([60, 14, 0.1]);
    translate([48, 2, 2]) cube([30, 14, 0.1]);
}

module hock() {
    difference(){
        union(){
            translate([0, 0, 2]) cube([4, 3, 20]);
            rotate([10, 0, 0]) cube([4, 28, 3]);
        }
        translate([-0.5, -5, 0]) cube(5);
        translate([4.5, 0, 1]) rotate([0, -90, 0]) cylinder(h=5, r=2, center=false, $fn=3);
    }
    translate([3, 19, 2]) rotate([90, 0, -90]) scale([18,5,1]) cylinder(h=2, r=1, center=false, $fn=3);
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