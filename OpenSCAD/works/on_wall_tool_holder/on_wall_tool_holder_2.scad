echo(version=version());
// Base Config
base_W = 20; // Min Size < 10
base_H = 40; // Min Size < 40
base_T = 0.5; // Fix Size = 0.5 for Stapler
default_S = 12; // Fix Size = 12 for Stapler (Stapler size)
default_T = 2.0; // Fix Size = 2.0 for Stapler (base_T < default_T)
$fn = 60;



staple_base(base_T,base_W,base_H,default_S,default_T);
translate([85, 0, 0]) staple_base(base_T,base_W,base_H,default_S,default_T);

translate([18, 14, 0]) hull() {
    translate([1, 1, 2]) cube([69 - 2, 12 - 2, 0.1]);
    translate([0, 0, 0]) cube([69, 12, 0.1]);
}

translate([104, 14, 0]) hull() {
    translate([0, 1, 2]) cube([7 - 2, 26 - 2, 0.1]);
    translate([0, 0, 0]) cube([6, 26, 0.1]);
}

translate([1, 17, 2]) cube(size=[4, 4, 9], center=false);
translate([30, 17, 2]) cube(size=[4, 4, 9], center=false);
translate([1, 17, 2]) rotate([90, 0, 0]) translate([0, 9, -9]) cube(size=[4, 4, 9], center=false);
translate([30, 17, 2]) rotate([90, 0, 0]) translate([0, 9, -9]) cube(size=[4, 4, 9], center=false);

translate([70, 20, 2]) cube(size=[4, 4, 9], center=false);
translate([105, 35, 2]) cube(size=[4, 4, 9], center=false);
translate([70, 20, 2]) rotate([90, 0, 0]) translate([0, 9, -9]) cube(size=[4, 4, 9], center=false);
translate([105, 35, 2]) rotate([90, 0, 0]) translate([0, 9, -9]) cube(size=[4, 4, 9], center=false);

* translate([10, 20, 6]) {
    cylinder(h=2, r1=1.2, r2=2.8, center=true, $fn=20);
    translate([0, 0, -3]) cylinder(h=5, r=1.2, center=true, $fn=20);
    translate([75, 0, 0]) {
        cylinder(h=2, r1=1.2, r2=2.8, center=true, $fn=20);
        translate([0, 0, -3]) cylinder(h=5, r=1.2, center=true, $fn=20);
    }
}

translate([1, 16, 2]) hull(){
    translate([0, 1, 0]) cube([4, 0.1, 13]);
    translate([0, -1, 0]) cube([4, 0.1, 0.1]);
}

translate([30, 16, 2]) hull(){
    translate([0, 1, 0]) cube([4, 0.1, 13]);
    translate([0, -1, 0]) cube([4, 0.1, 0.1]);
}

translate([70, 19, 2]) hull(){
    translate([0, 1, 0]) cube([4, 0.1, 13]);
    translate([0, -4, 0]) cube([4, 0.1, 0.1]);
}

translate([105, 34, 2]) hull(){
    translate([0, 1, 0]) cube([4, 0.1, 13]);
    translate([0, -14, 0]) cube([4, 0.1, 0.1]);
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