echo(version=version());
// Base Config
base_W = 60;
base_H = 84;
base_T = 0.5;
default_T = 2.0;
default_S = 12;
$fn = 60;
// Box Edge R
minkowski_R = 2;

scaleTimes = 8.13;

baseR = 6.7;
baseR2 = 8.1;


cylinder(h=2.8, r=baseR2, center=true);
translate([0, 0, 2.8]) cylinder(h=2.8, r=baseR, center=true);
translate([0, 0, 4.6]) cylinder(h=1.8, r=baseR2, center=true);
translate([0, 0, 5.9]) cylinder(h=0.8, r=baseR, center=true);
translate([0, 0, 8.2]) cylinder(h=3.8, r=baseR2, center=true);
translate([0, 0, 11.1]) cylinder(h=2, r1=baseR2, r2=baseR, center=true);
translate([0, 0, 24.5]) cylinder(h=24.8, r=baseR, center=true);
translate([0, 0, 37.2]) scale([1, 1, 0.8]) sphere(r=baseR);





* translate([63, 30, 80]) {
    rotate([90, 180, 0]) {
        union() {
            translate([0, -2, 0]) staple_base(base_T,base_W,base_H,default_S,default_T);
            translate([0, 14, default_T]) cube([base_W, 52, default_T + 2]);
        }
        difference() {
            translate([-1, 16, 4]) translate([0, 0, minkowski_R]) minkowski_box(62, 48, 22, minkowski_R);
            union() {
                translate([2, 4, 7]) translate([0, 0, minkowski_R]) minkowski_box(56, 55, 16, minkowski_R);
                translate([9, 6, 16]) translate([0, 0, minkowski_R]) minkowski_box(42, 35, 16, minkowski_R);
            }
        }
    }
}

module minkowski_box(x, y, z, r) {
    minkowski() {
        cube([x, y, z]);
        sphere(r);
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