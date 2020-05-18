/*
To Use by Step.

1. Chose type by comment out.
2. Render(F6)
3. Export STL(F7)

*/

// ------------------------------------------
// Select one for Joint Type!
// basic
// type="single";
// for Real Device Tap System
// type="frame_200";
// type="frame_100";
// type="frame_70";
// type="single_taphole";
// type="twin";
// type="twin_ex";
// type="triple_right";
// type="triple_left";
// type="plate_75";
// type="plate_90";
// type="plate_90_ex";
// type="back_plate";
// type="back_plate_0";
// type="shaft_holder";
// type="shaft_cap";
// type="shaft_cap2";
// for TPU fill
// type="ajaster";
// type="hole_twin";
// type="hole_single";
// for Option
// type="single_long";
// type="single_3hock";
// type="frame_200";
// type="alt_parts";
// type="moni_parts";
// type="moni_parts_top";
type="moni_parts_camera";

// ------------------------------------------

echo(version=version());
// Base Config
base_W = 14;
base_H = 14;
base_T = 5;
$fn = 60;

if (type=="single") {
    make_single_cap();
} else if (type=="twin") {
    make_single_cap(0);
    translate([0, -10, -10]) rotate([90, 180, 0]) make_single_cap(0);
    hull(){
        translate([0, 0, -3]) linear_extrude(height=1) make_2D_base();
        translate([0, -7, -10]) rotate([90, 180, 0]) linear_extrude(height=1) make_2D_base();
    }
} else if (type=="twin_ex") {
    make_single_cap(0);
    translate([0, -17, -10]) rotate([90, 180, 0]) make_single_cap(0);
    hull(){
        translate([0, 0, -3]) linear_extrude(height=1) make_2D_base();
        translate([0, -7, -10]) rotate([90, 180, 0]) linear_extrude(height=1) make_2D_base();
    }
    hull(){
        translate([0, -7, -10]) rotate([90, 180, 0]) linear_extrude(height=1) make_2D_base();
        #translate([0, -14, -10]) rotate([90, 180, 0]) linear_extrude(height=1) make_2D_base();
    }
} else if (type=="triple_right") {
    make_single_cap(0);
    translate([0, -10, -10]) rotate([90, 180, 0]) make_single_cap(0);
    translate([12.6, 0, -9.65]) rotate([0, -75, 180]) make_single_cap();
    hull(){
        translate([0, 0, -3]) linear_extrude(height=1) make_2D_base();
        translate([0, -7, -10]) rotate([90, 180, 0]) linear_extrude(height=1) make_2D_base();
        translate([9.5, 0, -10.5]) rotate([0, -75, 180]) linear_extrude(height=1) make_2D_base();
    }
} else if (type=="triple_left") {
    make_single_cap(0);
    translate([0, -10, -10]) rotate([90, 180, 0]) make_single_cap(0);
    translate([-12.6, 0, -9.65]) rotate([0, -75, 0]) make_single_cap();
    hull(){
        translate([0, 0, -3]) linear_extrude(height=1) make_2D_base();
        translate([0, -7, -10]) rotate([90, 180, 0]) linear_extrude(height=1) make_2D_base();
        translate([-9.5, 0, -10.5]) rotate([0, -75, 0]) linear_extrude(height=1) make_2D_base();
    }
} else if (type=="plate_75") {
    make_plate(75,-2.075,-4.225,-2.6,-0.3);
} else if (type=="plate_90") {
    make_plate(90);
} else if (type=="plate_90_ex") {
    make_plate(90,0,0,0,0,7);
} else if (type=="single_long") {
    make_single_cap(0,20,20,20);
} else if (type=="single_3hock") {
    make_single_cap(0);
} else if (type=="single_taphole") {
    difference(){
        make_single_cap(0, 15, 0, 15);
        translate([0, 0, -8]) cylinder(h=10, r=2.6);
        translate([0, 0, -8]) cylinder(h=5, r=4.6);
        hull(){
            translate([0, 0, -4]) cylinder(h=0.1, r=4.6);
            translate([0, 0, -5.1]) cylinder(h=0.1, r=5.6);
        }
    }

} else if (type=="back_plate") {
    union() {
        depth=7;
        translate([0, 0, depth]) difference(){
            cube([20, 70, 3]);
            union() {
                // holes
                translate([10, 10, -0.5]) cylinder(h=4, r=3.2);
                translate([10, 60, -0.5]) cylinder(h=4, r=3.2);
            }
        }
        translate([120, 0, depth]) difference(){
            cube([20, 70, 3]);
            union() {
                // holes
                translate([10, 10, -0.5]) cylinder(h=4, r=3.2);
                translate([10, 60, -0.5]) cylinder(h=4, r=3.2);
            }
        }

        translate([20, 0, 0]) cube([3, 70, 3+depth]);
        translate([117, 0, 0]) cube([3, 70, 3+depth]);

        difference(){
            // main body
            translate([20, 0, 0]) cube([100, 70, 3]);

            //pattern block
            translate([0, 0, 0]) make_hole_pattern(5);
            translate([10, 10, 0]) make_hole_pattern(4);
            translate([0, 20, 0]) make_hole_pattern(5);
            translate([10, 30, 0]) make_hole_pattern(4);
            translate([0, 40, 0]) make_hole_pattern(5);
        }
        // hock block
        translate([80, 0, 0]) make_hock();
        translate([32, 0, 0]) make_hock();
    }
} else if (type=="back_plate_0") {
    union() {
        depth=0;
        translate([0, 0, depth]) difference(){
            cube([20, 70, 3]);
            union() {
                // holes
                translate([10, 10, -0.5]) cylinder(h=4, r=3.2);
                translate([10, 60, -0.5]) cylinder(h=4, r=3.2);
            }
        }
        translate([120, 0, depth]) difference(){
            cube([20, 70, 3]);
            union() {
                // holes
                translate([10, 10, -0.5]) cylinder(h=4, r=3.2);
                translate([10, 60, -0.5]) cylinder(h=4, r=3.2);
            }
        }

        translate([20, 0, 0]) cube([3, 70, 3+depth]);
        translate([117, 0, 0]) cube([3, 70, 3+depth]);

        difference(){
            // main body
            translate([20, 0, 0]) cube([100, 70, 3]);

            //pattern block
            translate([0, 0, 0]) make_hole_pattern(5);
            translate([10, 10, 0]) make_hole_pattern(4);
            translate([0, 20, 0]) make_hole_pattern(5);
            translate([10, 30, 0]) make_hole_pattern(4);
            translate([0, 40, 0]) make_hole_pattern(5);
        }
    }
} else if (type=="shaft_holder") {
    union(){
        // main body
        translate([0, 0, -0.5]) difference(){
            union(){
                // base plate
                translate([0, 0, 0]) cube([39, 20, 1.5], center=true);
                // fill body
                hull() {
                    translate([0, 0, 9.8]) cube([22, 20, 0.1], center=true);
                    translate([0, 0, 0.5]) cube([16, 20, 0.1], center=true);
                }
                // shaft caps
                translate([-13.5, 0, 0]) union(){
                    make_shaft_cap();
                    translate([27, 0, 0]) make_shaft_cap();
                }
            }
            // center hole
            translate([0, 0, -3]) cylinder(h=22, r=3.4);
        }
        // dabo
        translate([-12, 0, -1]) make_DABO();
        translate([12, 0, -1]) make_DABO();
    }
} else if (type=="frame_70") {
    make_frame(height=70);
} else if (type=="frame_100") {
    make_frame(height=100);
} else if (type=="frame_200") {
    make_frame(height=200);
} else if (type=="ajaster") {
    make_ajaster();
} else if (type=="shaft_cap") {
    union(){
        difference() {
            union(){
                translate([0, 0, 0.7]) cube([20,15,13], center=true);
                translate([0, 13.5, 0]) difference() {
                    hull(){
                        translate([0, -6, 0.7]) cube([20,0.1,13], center=true);
                        translate([0, 0, 0]) rotate([90, 0, 90]) cylinder(h=17, r=5.8, center=true);
                    }
                    translate([0, 0, 0]) rotate([90, 0, 90]) cylinder(h=32, r=3.2, center=true);
                }
                translate([0, -13.5, 0]) difference() {
                    hull(){
                        translate([0, 6, 0.7]) cube([20,0.1,13], center=true);
                        translate([0, 0, 0]) rotate([90, 0, 90]) cylinder(h=17, r=5.8, center=true);
                    }
                    translate([0, 0, 0]) rotate([90, 0, 90]) cylinder(h=32, r=3.2, center=true);
                }
            }
            translate([0, 0, 0.7]) union(){
                cylinder(h=15, r=2.6, center=true);
                translate([0, 0, -2]) cylinder(h=11, r=7.7, center=true);
            }
        }
    }
} else if (type=="shaft_cap2") {
    union(){
        difference() {
            union(){
                translate([0, 0, 0.7]) cube([20,15,13], center=true);
                translate([0, 13.5, 0]) difference() {
                    hull(){
                        translate([0, -6, 0.7]) cube([20,0.1,13], center=true);
                        translate([0, 0, 0]) rotate([90, 0, 90]) cylinder(h=17, r=5.8, center=true);
                    }
                    translate([0, 0, 0]) rotate([90, 0, 90]) cylinder(h=32, r=3.4, center=true);
                }
                translate([0, -13.5, 0]) difference() {
                    hull(){
                        translate([0, 6, 0.7]) cube([20,0.1,13], center=true);
                        translate([0, 0, 0]) rotate([90, 0, 90]) cylinder(h=17, r=5.8, center=true);
                    }
                    translate([0, 0, 0]) rotate([90, 0, 90]) cylinder(h=32, r=3.4, center=true);
                }
                translate([0, 0, 5.7]) cube([10,24,3], center=true);
            }

                translate([0, 7, 0.7]) union(){
                    cylinder(h=15, r=2.8, center=true);
                    translate([0, 0, -6]) cylinder(h=2, r=7.7, center=true);
                }
                translate([0, -7, 0.7]) union(){
                    cylinder(h=15, r=2.8, center=true);
                    translate([0, 0, -6]) cylinder(h=2, r=7.7, center=true);
                }
                translate([0, 0, -5.8]) cube([15.4,15,3], center=true);
                translate([0, 0, 2]) cube([5.6,15,13], center=true);

        }
    }} else if (type=="hole_twin") {
    // twin type
    translate([0, 0, 0]) union(){
        difference() {
            // main body
            intersection(){
                translate([0, 0, 0]) cube([base_H*2-3, base_W, base_T], center=true);
                union(){
                    translate([6, 0, 0]) cylinder(r=8.5, h=7, center=true);
                    translate([-6, 0, 0]) cylinder(r=8.5, h=7, center=true);
                    translate([0, 0, 0]) cube([base_H+2, base_W+2, base_T+2], center=true);
                }
            }
            // hole
            translate([7, 0, -0.5]) padhole();
            translate([-6, -1.2, -0.5]) rotate([0, 0, 90]) padhole();
        }
        translate([0, 0, 2]) make_ajaster();
    }
} else if (type=="hole_single") {
    // single type
    translate([0, 0, 0]) union(){
        difference() {
            // main body
            intersection(){
                cube([base_H, base_W, base_T], center=true);
                cylinder(r=8.5, h=7, center=true);
            }
            // hole
            translate([0, 0, -0.5]) padhole();
        }
        translate([0, 0, 2]) make_ajaster();
    }
} else if (type=="moni_parts") {
    // monitor holder
    translate([14,20.5,-2.2]) rotate([-90,0,90]) linear_extrude(height=14){
        make_2D_tSlot_inner();
    }
    translate([0,17.7,7]) cube([14,5.6,2]);
    union(){
        difference(){
            cube([14,31,10]);
            rotate([-15,0,0]) translate([1,3,3]) cube([12,2,9]);
            translate([-1,10,-2]) cube([16,22,10]);
        }
        *translate([0,31,2]) cube([14,2,8]);
    }
} else if (type=="moni_parts_top") {
    // monitor holder
    translate([14,20.5,-2.2]) rotate([-90,0,90]) linear_extrude(height=14){
        make_2D_tSlot_inner();
    }
    translate([0,17.7,7]) cube([14,5.6,2]);
    // main body
    translate([0,10,8]) cube([14,21,2]);
    translate([0,8,2]) cube([14,2,8]);
    translate([0,31,2]) cube([14,2,8]);
    // sub body
    difference(){
        translate([0,5,10]) cube([14,12,4]);
        translate([1,4,11]) cube([12,12,2]);
    }
} else if (type=="moni_parts_camera") {
    union(){
        // monitor holder
        translate([32,20.5,-2.2]) rotate([-90,0,90]) linear_extrude(height=32){
            make_2D_tSlot_inner();
        }
        translate([0,17.7,7]) cube([32,5.6,2]);
        // main body
        translate([0,10,8]) cube([32,21,2]);
        translate([0,8,2]) cube([32,2,8]);
        translate([0,31,2]) cube([32,2,8]);
        // camera holder
        translate([0,5,17.5]) rotate([-90,0,0]) difference(){
            union(){
                translate([0,0,1]) cube([5,8,26]);
                translate([27,0,1]) cube([5,8,26]);
            }
            translate([3,2,3]) cube([26,2.5,29]);
        }
    }
} else {
    color("red",0.5) cube(10,center=true);
}




// ------------------------------------------
// module block
// ------------------------------------------
// 2D module

module make_2D_tSlot_inner() {
    translate([0, -7.5, 0]) square([5.6,5],center=true);
    hull(){
        translate([4.6, -7.35, 0]) circle(0.45);
        translate([-4.6, -7.35, 0]) circle(0.45);
        translate([4.75, -6.95, 0]) circle(0.3);
        translate([-4.75, -6.95, 0]) circle(0.3);
        translate([2.42, -4.6, 0]) circle(0.3);
        translate([-2.42, -4.6, 0]) circle(0.3);
    }
}

module make_2D_diff_inner() {
    make_2D_tSlot_inner();
    rotate([0, 0, 90]) make_2D_tSlot_inner();
    rotate([0, 0, 180]) make_2D_tSlot_inner();
    rotate([0, 0, -90]) make_2D_tSlot_inner();
}

module make_2D_base() {
    translate([0, 0, 0]) square([20,18],center=true);
    translate([0, 9.1, 0]) rotate([0, 0, 90]) square([1.8,18],center=true);
    translate([0, -9.1, 0]) rotate([0, 0, 90]) square([1.8,18],center=true);
    translate([9.1, 0, 0]) square([1.8,18],center=true);
    translate([9.1, 0, 0]) square([1.8,18],center=true);
    translate([9, 9, 0]) circle(1);
    translate([-9, -9, 0]) circle(1);
    translate([9, -9, 0]) circle(1);
    translate([-9, 9, 0]) circle(1);
}

module make_2D_tSlot() {
    translate([0, -7.5, 0]) square([6.4,5],center=true);
    hull(){
        translate([5, -7.75, 0]) circle(0.45);
        translate([-5, -7.75, 0]) circle(0.45);
        translate([5.15, -6.55, 0]) circle(0.3);
        translate([-5.15, -6.55, 0]) circle(0.3);
        translate([2.82, -4.2, 0]) circle(0.3);
        translate([-2.82, -4.2, 0]) circle(0.3);
    }
}

module make_2D_diff() {
    circle(2.5);
    make_2D_tSlot();
    rotate([0, 0, 90]) make_2D_tSlot();
    rotate([0, 0, 180]) make_2D_tSlot();
    rotate([0, 0, -90]) make_2D_tSlot();
}

module make_2D_frame() {
    difference(){
        make_2D_base();
        make_2D_diff();
    }
}

// ------------------------------------------
// 3D module

module make_frame(height=10) {
    linear_extrude(height=height) {
        make_2D_frame();
    }
}

module make_single_cap(p1=7,p2=7,p3=7,p4=7,ch=3) {
    linear_extrude(height=p1) make_2D_tSlot_inner();
    linear_extrude(height=p2)  rotate([0, 0, 90]) make_2D_tSlot_inner();
    linear_extrude(height=p3)  rotate([0, 0, 180]) make_2D_tSlot_inner();
    linear_extrude(height=p4)  rotate([0, 0, -90]) make_2D_tSlot_inner();
    translate([0, 0, -3])
        hull(){
            linear_extrude(3) make_2D_base();
            translate([0, 0, -2]) scale(0.8) linear_extrude(1) make_2D_base();
        }
}

// ------------------------------------------
// other module

module plate() {
    difference(){
        translate([0, 0, 0]) cube([20, 3, 30],center=true);
        translate([0, 0, -6.5]) rotate([90, 0, 0]) cylinder(h=4, r=3.2, center=true);
    }
}

module make_plate(dig, offset_x=0, offset_z=0, hoffset_x=0, hoffset_z=0, ex=0) {
    translate([10, 0, -15-ex]) plate();
    translate([offset_x, 0, offset_z]) translate([-15, 0, 10]) rotate([0, dig, 0]) plate();
    hull() {
        translate([10, 0, 0]) cube([20,3,0.1], center=true);
        translate([0+hoffset_x, 0, 10+hoffset_z]) rotate([0, dig, 0]) cube([20,3,0.1], center=true);
    }
    if (ex>0) {
        translate([10, 0, -(ex/2)]) cube([20,3,ex], center=true);
    }
}

module make_hock() {
    translate([20, 0, 0]) cube([10, 3, 20]);
    translate([20, 0, 17]) cube([10, 13, 3]);
}

module make_hole_sq() {
    rotate([0, 0, 45]) cube([10, 10, 4], center=true);
}

module make_hole_pattern(num) {
    for ( i = [1 : num] ){
        x = 10 + (20 * i);
        translate([x, 15, 1.5]) make_hole_sq();
    }
}

module make_shaft_cap() {
    difference(){
        hull(){
            cube([12, 20, 0.1], center=true);
            translate([0, 0, 5]) rotate([90, 90, 0]) cylinder(h=20, r=6, center=true);
        }
        translate([0, 5, 5]) rotate([90, 90, 0]) cylinder(h=16, r=3.2);
        translate([0, 0, -1]) cube([25, 22, 3], center=true);
    }
}

module make_DABO() {
    hull(){
        translate([0, 0, 0]) cube([10, 5.4, 0.1], center=true);
        translate([0, 0, -2.5]) cube([8, 3.4, 0.1], center=true);
    }
}

module padhole() {
    cube([7.8, 11.3, 4.5], center=true);
}

module holderhock(){
    cylinder(r=4.8, h=3, center=false);
}

module make_ajaster(){
    difference(){
        hull(){
            translate([0, 0, 0]) cylinder(h=0.1, r=6.5);
            translate([0, 0, 1]) cylinder(h=6, r=7.5);
            translate([0, 0, 8]) cylinder(h=0.1, r=6.5);
        }
        translate([0, 0, 3]) cylinder(h=6, r=4.3);
    }
    cylinder(h=6.5, r=1.9, $fn = 6);
}
