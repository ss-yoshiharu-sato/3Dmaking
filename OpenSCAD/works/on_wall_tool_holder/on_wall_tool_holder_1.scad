echo(version=version());
// Base Config
base_W = 75;
base_H = 52;
base_T = 0.5;
default_T = 2.0;
default_S = 12;
$fn = 60;

staple_base(base_T,base_W,base_H,default_S,default_T);

translate([1, 16, default_T]) {
    difference() {
        cube([base_W - 2, 20, 10]);
        rotate([90, 90, 0]) {
            translate([-9, 5, -25]) cube([8, 20, 30]);
            translate([-8, 60, -25]) cube([6, 10, 30]);
            translate([-13, -1, -25]) cube([12, 26, 13]);
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


