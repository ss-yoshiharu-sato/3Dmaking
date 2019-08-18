echo(version=version());


// Base Config
base_W = 50; // Min Size < 10
base_H = 80; // Min Size < 40
default_S = 12; // Fix Size = 12 for Stapler (Stapler size)
default_T = 5; // Fix Size = 2.0 for Stapler (base_T < default_T)
$fn = 60;

difference() {
    translate([-17.5, -20.5, 0]) rotate([90, 0, 30]) import_stl("MountGoogleHomeMiniV1-1_Flat.stl", convexity = 5);
    translate([27, -53, 0.5]) stapler_area(base_T,base_W,default_S,default_T);
}


module stapler_area(bt,bw,ds,dt) {
    hull() {
        translate([0, 0, 5]) cube([bw - dt, ds + 10, 0.1]);
        translate([3, 4.5, 0]) cube([bw - 11, ds, 0.1]);
    }
}
