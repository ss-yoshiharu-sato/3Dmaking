echo(version=version());
// Base Config
$fn = 180;
main_H = 15;
main_R = 3;
main_C = false;
main_margin = 3;
def_rotate = [0, 90, 0];
min_margin = 0.5;
ConvexA_R = main_H/5;
ConvexA_H = main_margin+main_margin/3;
ConvexB_R = main_H/4;
ConvexB_H = main_margin/2;

// Recess part
difference() {
    union(){
        translate([0, 0, 0]) make_body(main_H,main_R,main_C,main_margin);
        translate([main_R, 0, main_H/2]) rotate(def_rotate) cylinder(h=main_margin+min_margin, r=main_H/4+min_margin+1.5, center=main_C);
    }
    union(){
        translate([main_R+main_margin/4-min_margin, 0, main_H/2]) {
            rotate(def_rotate) cylinder(h=ConvexA_H+min_margin+min_margin, r=ConvexA_R+min_margin, center=main_C);
            rotate(def_rotate) cylinder(h=ConvexB_H+min_margin+min_margin, r=ConvexB_R+min_margin, center=main_C);
        }
    }
}

// Convex part
translate([min_margin, 0, 0]) union(){
    translate([main_R*2+main_margin+main_margin+min_margin, 0, 0]) make_body(main_H,main_R,main_C,main_margin);
    translate([main_R+main_margin+min_margin, 0, main_H/2]) rotate(def_rotate) cylinder(h=main_margin, r=main_H/4+min_margin+1.5, center=main_C);
    translate([main_R+main_margin/4, 0, main_H/2]) {
        rotate(def_rotate) cylinder(h=ConvexA_H, r=ConvexA_R, center=main_C);
        rotate(def_rotate) cylinder(h=ConvexB_H, r=ConvexB_R, center=main_C);
    }
}


module make_body(height,radius,centerbool,margin) {
    difference() {
        cylinder(h=height, r=radius+margin, center=centerbool);
        translate([0, 0, -1]) cylinder(h=height+2, r=radius, center=centerbool);
    }
}
