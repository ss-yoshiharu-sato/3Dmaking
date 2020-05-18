// STAND PARTS OLD
*difference(){
    cube([10,60,10]);
    translate([-1,3,3]) cube([12,2,9]);
    translate([3,10,-1]) cube([4,45,12]);
}

// AJASTER BLOCK
*difference(){
    cube([20,20,28]);
    translate([2.5,-1,4]) cube([15,22,20]);
}

// STAND PARTS
*union(){
    difference(){
        cube([10,60,10]);
        rotate([-12,0,0]) translate([-1,3,3]) cube([12,2,9]);
        translate([3,10,-1]) cube([4,45,12]);
    }
    translate([-1,0,0]) cube([1,60,10]);
    translate([10,0,0]) cube([1,60,10]);
}

// BARCODE READER HOLDER
*union(){
    difference(){
        translate([0,0,-3]) cube([36,20,13]);
        rotate([-12,0,0]) translate([-1,3,-5]) cube([39,2.5,25]);
        translate([3,10,-4]) cube([4,8,18]);
        translate([11,10,-4]) cube([26,11,15]);
        translate([11,-1,1]) cube([22,12,15]);
        translate([7.8,10,1]) cube([20,12,2]);
    }
    translate([-1,0,-3]) cube([1,20,13]);
    translate([10,0,0]) cube([1,10,10]);
    translate([33,0,0]) cube([3,10,10]);
}

// TABLE SOCKS
*union(){
    cube([10,13,2], center=true);
    difference(){
        translate([0,-7.5,8]) cube([10,2,18], center=true);
        translate([0,-7.26,9.5]) hull(){
            cube([8,0.1,12], center=true);
            translate([0,-1.2,0]) cube([9,0.1,14], center=true);
        }
    }
    difference(){
        translate([0,7.5,8]) cube([10,2,18], center=true);
        translate([0,7.26,9.5]) hull(){
            cube([8,0.1,12], center=true);
            translate([0,1.2,0]) cube([9,0.1,14], center=true);
        }
    }
}

// CAMERA OLD
*union(){
    union(){
        difference(){
            translate([0,0,-3]) cube([32,10,10]);
            rotate([-12,0,0]) translate([-1,3,-5]) cube([39,2.5,25]);
            translate([3,-1,1]) cube([26,12,15]);
        }
        difference(){
            union(){
                translate([0,0,1]) cube([5,10,6]);
                translate([27,0,1]) cube([5,10,6]);
            }
            rotate([0,0,0]) translate([3,2,-5]) cube([26,2.5,25]);
        }
    }
}

// CAMERA
union(){
    union(){
        difference(){
            // MAIN BOX
            translate([0,0,-3]) cube([32,10,18]);
            // MIZO
            rotate([-12,0,0]) translate([-1,3,-5]) cube([39,2.5,10]);
            // MAIN SPACE
            translate([3,-1,1]) cube([26,12,15]);
            translate([5,10,1]) rotate([0,90,0]) cylinder(h=22, r=4, center=false, $fn=3);
        }
        difference(){
            union(){
                translate([0,0,1]) cube([5,10,16]);
                translate([27,0,1]) cube([5,10,16]);
            }
            rotate([0,0,0]) translate([5,2,-5]) cube([22,2.5,12]);
            rotate([0,0,0]) translate([3,2,7]) cube([26,2.5,13]);
        }
    }
}