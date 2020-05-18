echo(version=version());
// Base Config
base_W = 24;
base_H_short = 55;
base_H_long = 75;
base_H_margin = 4;
base_T = 0.1;
default_r_x = 180;
default_r_y = 90;
default_dif_h = 50;
stapler_area_dep = -1.8;
stapler_area_len = 12;
stapler_area_W = 21;
stapler_area_T = 0;
pole_diameter = 16;
pole_r = pole_diameter / 2;
out_r = pole_r + 3;
$fn = 180;

// When you do rendering model, I sugest comment out(*) by model.
// ex) translate([-40, 0, 0]) uni... => *translate([-40, 0, 0]) uni...

// Standad model
translate([-40, 0, 0]) union(){
    // Base part
    difference() {
        // main object
        hull(){
            cube([base_W, base_H_short, base_T]);
            translate([0, 2, 2])cube([base_W, base_H_short - base_H_margin, base_T]);
        }
        // stapler_area
        rotate([default_r_x, 0, 0]) translate([0.6, -52.5, -0.8]) stapler_area(stapler_area_T,stapler_area_W,stapler_area_len,stapler_area_dep);
    }
    // holder part
    difference() {
        // main object
        hull(){
            translate([0, 2, 2]) cube([base_W, 36, base_T]);
            translate([0, 18, 11]) rotate([0, default_r_y, 0]) cylinder(h=base_W, r=out_r, center=false);
        }
        // pole hole
        translate([-5, 18, 11]) rotate([0, default_r_y, 0]) cylinder(h=default_dif_h, r=pole_r, center=false);
    }
}

// Large model
translate([0, 0, 0]) union(){
    // Base part
    difference() {
        // main object
        hull(){
            translate([0, -20, 0]) cube([base_W, base_H_long, base_T]);
            translate([0, -18, 2]) cube([base_W, base_H_long - base_H_margin, base_T]);
        }
        // stapler_areas
        rotate([default_r_x, 0, 0]) translate([0.6, -52.5, -0.8]) stapler_area(stapler_area_T,stapler_area_W,stapler_area_len,stapler_area_dep);
        rotate([default_r_x, 0, 0]) translate([0.6, 3.5, -0.8]) stapler_area(stapler_area_T,stapler_area_W,stapler_area_len,stapler_area_dep);
    }
    // holder part
    difference() {
        // main object
        hull(){
            translate([0, 2, 2])cube([base_W, 36, base_T]);
            translate([0, 18, 91]) rotate([0, default_r_y, 0]) cylinder(h=base_W, r=out_r, center=false);
        }
        // pole hole
        translate([-5, 18, 91]) rotate([0, default_r_y, 0]) cylinder(h=default_dif_h, r=pole_r, center=false);
        // weight saving hole
        translate([-5, 18.5, 70]) rotate([0, default_r_y, 0]) cylinder(h=default_dif_h, r=pole_r+1, center=false);
        translate([-5, 19, 48]) rotate([0, default_r_y, 0]) cylinder(h=default_dif_h, r=pole_r+2, center=false);
        translate([-5, 19.5, 23]) rotate([0, default_r_y, 0]) cylinder(h=default_dif_h, r=pole_r+4, center=false);
    }
}

// Twin model
translate([40, 0, 0]) union(){
    // Base part
    difference() {
        // main object
        hull(){
            translate([0, -20, 0]) cube([base_W, base_H_long, base_T]);
            translate([0, -18, 2]) cube([base_W, base_H_long - base_H_margin, base_T]);
        }
        // stapler_areas
        rotate([default_r_x, 0, 0]) translate([0.6, -52.5, -0.8]) stapler_area(stapler_area_T,stapler_area_W,stapler_area_len,stapler_area_dep);
        rotate([default_r_x, 0, 0]) translate([0.6, 3.5, -0.8]) stapler_area(stapler_area_T,stapler_area_W,stapler_area_len,stapler_area_dep);
    }
    // holder part
    difference() {
        // main object
        hull(){
            translate([0, 2, 2])cube([base_W, 36, base_T]);
            translate([0, 18, 91]) rotate([0, default_r_y, 0]) cylinder(h=base_W, r=out_r, center=false);
        }
        // pole hole
        translate([-5, 18, 91]) rotate([0, default_r_y, 0]) cylinder(h=default_dif_h, r=pole_r, center=false);
        // weight saving hole
        translate([-5, 18.5, 70]) rotate([0, default_r_y, 0]) cylinder(h=default_dif_h, r=pole_r+1, center=false);
        // pole hole
        translate([-5, 18, 48]) rotate([0, default_r_y, 0]) cylinder(h=default_dif_h, r=pole_r, center=false);
        // weight saving hole
        translate([-5, 19.5, 23]) rotate([0, default_r_y, 0]) cylinder(h=default_dif_h, r=pole_r+4, center=false);
    }
}

module stapler_area(bt,bw,ds,dt) {
    hull() {
        translate([0, 0, -1.8]) cube([bw - dt, ds + 2, 0.1]);
        translate([1, 1, 0]) cube([bw, ds, 0.1]);
    }
}
