echo(version=version());
// Base Config
base_W = 60; // Min Size < 10
base_H = 80; // Min Size < 40
base_T = 0.5; // Fix Size = 0.5 for Stapler
default_S = 12; // Fix Size = 12 for Stapler (Stapler size)
default_T = 2.0; // Fix Size = 2.0 for Stapler (base_T < default_T)
$fn = 60;

staple_base(base_T,base_W,base_H,default_S,default_T);

// Dummy object
# translate([base_W / 4, base_H / 4, 22]) rotate([45, 45, 45]) cube(base_W / 2);

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